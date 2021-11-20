import 'dart:convert';
import 'dart:js' as js;
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class GlobalStateManager {
  static final GlobalStateManager _instance = GlobalStateManager._internal();
  late Client _httpClient;
  late Web3Client _ethClient;
  late EthPrivateKey _credentials;

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory GlobalStateManager() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  GlobalStateManager._internal() {
    String apiUrl = dotenv.env['RPC_ENDPOINT'].toString();
    _httpClient = Client();
    _ethClient = Web3Client(apiUrl, _httpClient);
  }

  void setPrivateKey(String privateKey) {
    _credentials = EthPrivateKey.fromHex(privateKey);
  }

  Future<String> getWalletAddress() async {
    EthereumAddress address = await _credentials.extractAddress();
    return address.hex;
  }

  bool checkAddressValidity(String address) {
    try {
      EthereumAddress.fromHex(address);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future deploySocialRecoverWallet(
      String spender,
      List<String> guardians,
      List<String> trustedAddresses,
      int numConfirmationsRequired,
      int numConfirmationsRequiredToChangeSpender,
      int numConfirmationsRequiredToAddTrustedAddress) async {
    var abiJson = await _loadJsonContractAbi();
    guardians = guardians.map((g) => _keccak256(g)).toList();
    var jsResponse = js.context.callMethod('deploy', [
      js.JsObject.jsify(abiJson),
      spender,
      js.JsObject.jsify(guardians),
      js.JsObject.jsify(trustedAddresses),
      numConfirmationsRequired,
      numConfirmationsRequiredToChangeSpender,
      numConfirmationsRequiredToAddTrustedAddress
    ]);
    Transaction transaction = Transaction(
      from: EthereumAddress.fromHex(spender),
      data: Uint8List.fromList(hex.decode(jsResponse.toString().substring(2))),
      value: EtherAmount.inWei(BigInt.from(0)),
      nonce: await _ethClient
          .getTransactionCount(EthereumAddress.fromHex(spender)),
    );

    var signedTx =
        await _ethClient.signTransaction(_credentials, transaction, chainId: int.parse(dotenv.env['CHAIN_ID'].toString()));
    var txResults = await _ethClient.sendRawTransaction(signedTx);
    return txResults;
  }

  String _keccak256(String data) {
    var jsResponse = js.context.callMethod('keccak256', [data]);
    return jsResponse;
  }

  Future _loadJsonContractAbi() async {
    var jsonText =
        await rootBundle.loadString('contracts/SocialRecoveryWallet.abi.json');
    return jsonDecode(jsonText);
  }
}
