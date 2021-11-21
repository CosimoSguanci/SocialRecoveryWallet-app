import 'package:flutter/material.dart';
import 'package:social_recovery_wallet_app/global_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SpenderSocialRecoveryWalletPage extends StatefulWidget {
  const SpenderSocialRecoveryWalletPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SpenderSocialRecoveryWalletPageState();
  }
}

class _SpenderSocialRecoveryWalletPageState
    extends State<SpenderSocialRecoveryWalletPage> {
  late GlobalStateManager _globalStateManager;
  late String _walletAddress;
  late String _socialRecoveryWalletAddress = "";
  final List<String> _guardians = <String>[];
  final List<String> _trustedAddresses = <String>[];
  bool _showProgressIndicator = false;
  bool _showTx = false;
  late String _txHash;
  final String etherscanBaseUrl = dotenv.env['CHAIN']
              .toString()
              .toLowerCase() !=
          "mainnet"
      ? "https://${dotenv.env['CHAIN'].toString().toLowerCase()}.etherscan.io/tx/"
      : "https://etherscan.io/tx/";

  final TextEditingController sendFundsController = TextEditingController();
  final TextEditingController submitTransactionEthController =
      TextEditingController();
  final TextEditingController destinationAddressController =
      TextEditingController();
  final TextEditingController executeTransactionIndexController =
      TextEditingController();

  @override
  void initState() {
    _globalStateManager = GlobalStateManager();
    _socialRecoveryWalletAddress =
        _globalStateManager.getCurrentSocialRecoveryWalletAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Social Recovery Wallet [SPENDER]'),
        ),
        body: SingleChildScrollView(
            child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder(
                        future: _globalStateManager.getWalletAddress(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          _walletAddress = snapshot.data.toString();
                          return Text("Wallet address: $_walletAddress");
                        })
                  ],
                ),
              ),
              _showTx
                  ? Container(
                      margin: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Tx Hash: $_txHash"),
                          Container(
                              margin: const EdgeInsets.only(top: 8.0),
                              child: ElevatedButton(
                                  onPressed: () async =>
                                      await launch("$etherscanBaseUrl$_txHash"),
                                  child: const Text('View on Etherscan',
                                      style: TextStyle(color: Colors.white))))
                        ],
                      ))
                  : Container(),
              Container(
                  margin:
                      const EdgeInsets.only(left: 10.0, top: 16.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: Text(
                          "Send Funds to your Social Recovery Wallet ($_socialRecoveryWalletAddress): ",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller: sendFundsController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Amount in ETH...'),
                        ),
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _showProgressIndicator = true;
                            });
                            var txHash = await _globalStateManager.sendEth(
                                _socialRecoveryWalletAddress,
                                double.parse(sendFundsController.text));
                            setState(() {
                              _showProgressIndicator = false;
                              _showTx = true;
                              _txHash = txHash;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Transaction sent"),
                            ));
                          },
                          child: const Text('SEND',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: const Text(
                          "Submit Transaction",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      // TODO ADD TOKENS
                      Container(
                        child: TextField(
                          controller: destinationAddressController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Destination Address...'),
                        ),
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                      ),
                      Container(
                        child: TextField(
                          controller: submitTransactionEthController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Amount in ETH...'),
                        ),
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _showProgressIndicator = true;
                            });
                            var txHash =
                                await _globalStateManager.submitTransaction(
                                    destinationAddressController.text,
                                    double.parse(
                                        submitTransactionEthController.text));
                            setState(() {
                              _showProgressIndicator = false;
                              _showTx = true;
                              _txHash = txHash;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Transaction sent"),
                            ));
                          },
                          child: const Text('Submit Transaction',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: const Text(
                          "Execute Transaction",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller: executeTransactionIndexController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Transaction index...'),
                        ),
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _showProgressIndicator = true;
                            });
                            var txHash = await _globalStateManager
                                .executeTransaction(int.parse(
                                    executeTransactionIndexController.text));
                            setState(() {
                              _showProgressIndicator = false;
                              _showTx = true;
                              _txHash = txHash;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Transaction sent"),
                            ));
                          },
                          child: const Text('Execute Transaction',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        )));
  }
}
