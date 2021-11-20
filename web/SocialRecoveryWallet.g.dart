// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
import 'package:web3dart/web3dart.dart' as _i1;
import 'dart:typed_data' as _i2;

final _contractAbi = _i1.ContractAbi.fromJson(
    '[{"inputs":[{"internalType":"address","name":"_spender","type":"address"},{"internalType":"bytes32[]","name":"_guardians","type":"bytes32[]"},{"internalType":"address[]","name":"_trustedAddresses","type":"address[]"},{"internalType":"uint256","name":"_numConfirmationsRequired","type":"uint256"},{"internalType":"uint256","name":"_numConfirmationsRequiredToChangeSpender","type":"uint256"},{"internalType":"uint256","name":"_numConfirmationsRequiredToAddTrustedAddress","type":"uint256"}],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"guardian","type":"address"},{"indexed":true,"internalType":"uint256","name":"reqIndex","type":"uint256"},{"indexed":true,"internalType":"address","name":"newTrustedAddress","type":"address"}],"name":"ConfirmAddTrusted","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"guardian","type":"address"},{"indexed":true,"internalType":"uint256","name":"reqIndex","type":"uint256"},{"indexed":true,"internalType":"address","name":"newSpender","type":"address"}],"name":"ConfirmChangeSpender","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"guardian","type":"address"},{"indexed":true,"internalType":"uint256","name":"txIndex","type":"uint256"}],"name":"ConfirmTransaction","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"sender","type":"address"},{"indexed":false,"internalType":"uint256","name":"amount","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"balance","type":"uint256"}],"name":"Deposit","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"reqIndex","type":"uint256"},{"indexed":true,"internalType":"address","name":"newTrustedAddress","type":"address"}],"name":"ExecuteAddTrusted","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"reqIndex","type":"uint256"},{"indexed":true,"internalType":"address","name":"newSpender","type":"address"}],"name":"ExecuteChangeSpender","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"spender","type":"address"},{"indexed":true,"internalType":"uint256","name":"txIndex","type":"uint256"}],"name":"ExecuteTransaction","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"spender","type":"address"},{"indexed":true,"internalType":"address","name":"removedTrusted","type":"address"}],"name":"RemoveTrustedAddress","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"guardian","type":"address"},{"indexed":true,"internalType":"uint256","name":"reqIndex","type":"uint256"},{"indexed":true,"internalType":"address","name":"newTrustedAddress","type":"address"}],"name":"RevokeAddTrusted","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"guardian","type":"address"},{"indexed":true,"internalType":"uint256","name":"reqIndex","type":"uint256"},{"indexed":true,"internalType":"address","name":"newSpender","type":"address"}],"name":"RevokeChangeSpender","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"guardian","type":"address"},{"indexed":true,"internalType":"uint256","name":"txIndex","type":"uint256"}],"name":"RevokeTxConfirmation","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"spender","type":"address"},{"indexed":true,"internalType":"uint256","name":"reqIndex","type":"uint256"},{"indexed":true,"internalType":"address","name":"newTrustedAddress","type":"address"}],"name":"SubmitAddTrusted","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"guardian","type":"address"},{"indexed":true,"internalType":"uint256","name":"reqIndex","type":"uint256"},{"indexed":true,"internalType":"address","name":"newSpender","type":"address"}],"name":"SubmitChangeSpender","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"spender","type":"address"},{"indexed":true,"internalType":"uint256","name":"txIndex","type":"uint256"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"},{"indexed":false,"internalType":"bytes","name":"data","type":"bytes"}],"name":"SubmitTransaction","type":"event"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"addTrustedAddressRequests","outputs":[{"internalType":"address","name":"newTrustedAddress","type":"address"},{"internalType":"bool","name":"executed","type":"bool"},{"internalType":"uint256","name":"numConfirmations","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"changeSpenderRequests","outputs":[{"internalType":"address","name":"newSpender","type":"address"},{"internalType":"bool","name":"executed","type":"bool"},{"internalType":"uint256","name":"numConfirmations","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"address","name":"","type":"address"}],"name":"isAddTrustedAddressRequestConfirmed","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"address","name":"","type":"address"}],"name":"isChangeSpenderRequestConfirmed","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"address","name":"","type":"address"}],"name":"isConfirmed","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"name":"isGuardian","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"isTrustedAddress","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"numConfirmationsRequired","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"numConfirmationsRequiredToAddTrustedAddress","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"numConfirmationsRequiredToChangeSpender","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"spender","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"transactions","outputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"bool","name":"executed","type":"bool"},{"internalType":"uint256","name":"numConfirmations","type":"uint256"}],"stateMutability":"view","type":"function"},{"stateMutability":"payable","type":"receive"},{"inputs":[{"internalType":"address","name":"_to","type":"address"},{"internalType":"uint256","name":"_value","type":"uint256"},{"internalType":"bytes","name":"_data","type":"bytes"}],"name":"submitTransaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_txIndex","type":"uint256"}],"name":"confirmTransaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_txIndex","type":"uint256"}],"name":"executeTransaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_txIndex","type":"uint256"}],"name":"revokeConfirmation","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_newSpender","type":"address"}],"name":"submitChangeSpenderRequest","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_reqIndex","type":"uint256"}],"name":"confirmChangeSpenderRequest","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_reqIndex","type":"uint256"}],"name":"revokeChangeSpenderRequestConfirmation","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_newTrustedAddress","type":"address"}],"name":"submitAddTrustedAddressRequest","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_reqIndex","type":"uint256"}],"name":"confirmAddTrustedAddressRequest","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_trusted","type":"address"}],"name":"removeTrustedAddress","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_reqIndex","type":"uint256"}],"name":"revokeAddTrustedAddressRequestConfirmation","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"getTransactionCount","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_txIndex","type":"uint256"}],"name":"getTransaction","outputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"bool","name":"executed","type":"bool"},{"internalType":"uint256","name":"numConfirmations","type":"uint256"}],"stateMutability":"view","type":"function"}]',
    'SocialRecoveryWallet');

class SocialRecoveryWallet extends _i1.GeneratedContract {
  SocialRecoveryWallet(
      {required _i1.EthereumAddress address,
      required _i1.Web3Client client,
      int? chainId})
      : super(_i1.DeployedContract(_contractAbi, address), client, chainId);

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<AddTrustedAddressRequests> addTrustedAddressRequests(BigInt $param0,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, '9df35ea4'));
    final params = [$param0];
    final response = await read(function, params, atBlock);
    return AddTrustedAddressRequests(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<ChangeSpenderRequests> changeSpenderRequests(BigInt $param1,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '697910a5'));
    final params = [$param1];
    final response = await read(function, params, atBlock);
    return ChangeSpenderRequests(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> isAddTrustedAddressRequestConfirmed(
      BigInt $param2, _i1.EthereumAddress $param3,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, 'e39a6ea3'));
    final params = [$param2, $param3];
    final response = await read(function, params, atBlock);
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> isChangeSpenderRequestConfirmed(
      BigInt $param4, _i1.EthereumAddress $param5,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, '1929dbe4'));
    final params = [$param4, $param5];
    final response = await read(function, params, atBlock);
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> isConfirmed(BigInt $param6, _i1.EthereumAddress $param7,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, '80f59a65'));
    final params = [$param6, $param7];
    final response = await read(function, params, atBlock);
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> isGuardian(_i2.Uint8List $param8,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, 'c42fe50a'));
    final params = [$param8];
    final response = await read(function, params, atBlock);
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> isTrustedAddress(_i1.EthereumAddress $param9,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, '0848a136'));
    final params = [$param9];
    final response = await read(function, params, atBlock);
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> numConfirmationsRequired({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[8];
    assert(checkSignature(function, 'd0549b85'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> numConfirmationsRequiredToAddTrustedAddress(
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[9];
    assert(checkSignature(function, '36f8ff6f'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> numConfirmationsRequiredToChangeSpender(
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[10];
    assert(checkSignature(function, 'a123d70f'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i1.EthereumAddress> spender({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[11];
    assert(checkSignature(function, 'e8edc816'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as _i1.EthereumAddress);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<Transactions> transactions(BigInt $param10,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[12];
    assert(checkSignature(function, '9ace38c2'));
    final params = [$param10];
    final response = await read(function, params, atBlock);
    return Transactions(response);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> submitTransaction(
      _i1.EthereumAddress _to, BigInt _value, _i2.Uint8List _data,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[13];
    assert(checkSignature(function, 'c6427474'));
    final params = [_to, _value, _data];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> confirmTransaction(BigInt _txIndex,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[14];
    assert(checkSignature(function, 'c01a8c84'));
    final params = [_txIndex];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> executeTransaction(BigInt _txIndex,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[15];
    assert(checkSignature(function, 'ee22610b'));
    final params = [_txIndex];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> revokeConfirmation(BigInt _txIndex,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[16];
    assert(checkSignature(function, '20ea8d86'));
    final params = [_txIndex];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> submitChangeSpenderRequest(_i1.EthereumAddress _newSpender,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[17];
    assert(checkSignature(function, '9d21b102'));
    final params = [_newSpender];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> confirmChangeSpenderRequest(BigInt _reqIndex,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[18];
    assert(checkSignature(function, 'b361e437'));
    final params = [_reqIndex];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> revokeChangeSpenderRequestConfirmation(BigInt _reqIndex,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[19];
    assert(checkSignature(function, 'd16d4419'));
    final params = [_reqIndex];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> submitAddTrustedAddressRequest(
      _i1.EthereumAddress _newTrustedAddress,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[20];
    assert(checkSignature(function, '5dac5b02'));
    final params = [_newTrustedAddress];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> confirmAddTrustedAddressRequest(BigInt _reqIndex,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[21];
    assert(checkSignature(function, 'add0def1'));
    final params = [_reqIndex];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> removeTrustedAddress(_i1.EthereumAddress _trusted,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[22];
    assert(checkSignature(function, 'f9f494ed'));
    final params = [_trusted];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> revokeAddTrustedAddressRequestConfirmation(BigInt _reqIndex,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[23];
    assert(checkSignature(function, 'ee3f02eb'));
    final params = [_reqIndex];
    return write(credentials, transaction, function, params);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> getTransactionCount({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[24];
    assert(checkSignature(function, '2e7700f0'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<GetTransaction> getTransaction(BigInt _txIndex,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[25];
    assert(checkSignature(function, '33ea3dc8'));
    final params = [_txIndex];
    final response = await read(function, params, atBlock);
    return GetTransaction(response);
  }

  /// Returns a live stream of all ConfirmAddTrusted events emitted by this contract.
  Stream<ConfirmAddTrusted> confirmAddTrustedEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('ConfirmAddTrusted');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return ConfirmAddTrusted(decoded);
    });
  }

  /// Returns a live stream of all ConfirmChangeSpender events emitted by this contract.
  Stream<ConfirmChangeSpender> confirmChangeSpenderEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('ConfirmChangeSpender');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return ConfirmChangeSpender(decoded);
    });
  }

  /// Returns a live stream of all ConfirmTransaction events emitted by this contract.
  Stream<ConfirmTransaction> confirmTransactionEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('ConfirmTransaction');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return ConfirmTransaction(decoded);
    });
  }

  /// Returns a live stream of all Deposit events emitted by this contract.
  Stream<Deposit> depositEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('Deposit');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return Deposit(decoded);
    });
  }

  /// Returns a live stream of all ExecuteAddTrusted events emitted by this contract.
  Stream<ExecuteAddTrusted> executeAddTrustedEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('ExecuteAddTrusted');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return ExecuteAddTrusted(decoded);
    });
  }

  /// Returns a live stream of all ExecuteChangeSpender events emitted by this contract.
  Stream<ExecuteChangeSpender> executeChangeSpenderEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('ExecuteChangeSpender');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return ExecuteChangeSpender(decoded);
    });
  }

  /// Returns a live stream of all ExecuteTransaction events emitted by this contract.
  Stream<ExecuteTransaction> executeTransactionEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('ExecuteTransaction');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return ExecuteTransaction(decoded);
    });
  }

  /// Returns a live stream of all RemoveTrustedAddress events emitted by this contract.
  Stream<RemoveTrustedAddress> removeTrustedAddressEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('RemoveTrustedAddress');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return RemoveTrustedAddress(decoded);
    });
  }

  /// Returns a live stream of all RevokeAddTrusted events emitted by this contract.
  Stream<RevokeAddTrusted> revokeAddTrustedEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('RevokeAddTrusted');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return RevokeAddTrusted(decoded);
    });
  }

  /// Returns a live stream of all RevokeChangeSpender events emitted by this contract.
  Stream<RevokeChangeSpender> revokeChangeSpenderEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('RevokeChangeSpender');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return RevokeChangeSpender(decoded);
    });
  }

  /// Returns a live stream of all RevokeTxConfirmation events emitted by this contract.
  Stream<RevokeTxConfirmation> revokeTxConfirmationEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('RevokeTxConfirmation');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return RevokeTxConfirmation(decoded);
    });
  }

  /// Returns a live stream of all SubmitAddTrusted events emitted by this contract.
  Stream<SubmitAddTrusted> submitAddTrustedEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('SubmitAddTrusted');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return SubmitAddTrusted(decoded);
    });
  }

  /// Returns a live stream of all SubmitChangeSpender events emitted by this contract.
  Stream<SubmitChangeSpender> submitChangeSpenderEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('SubmitChangeSpender');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return SubmitChangeSpender(decoded);
    });
  }

  /// Returns a live stream of all SubmitTransaction events emitted by this contract.
  Stream<SubmitTransaction> submitTransactionEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('SubmitTransaction');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return SubmitTransaction(decoded);
    });
  }
}

class AddTrustedAddressRequests {
  AddTrustedAddressRequests(List<dynamic> response)
      : newTrustedAddress = (response[0] as _i1.EthereumAddress),
        executed = (response[1] as bool),
        numConfirmations = (response[2] as BigInt);

  final _i1.EthereumAddress newTrustedAddress;

  final bool executed;

  final BigInt numConfirmations;
}

class ChangeSpenderRequests {
  ChangeSpenderRequests(List<dynamic> response)
      : newSpender = (response[0] as _i1.EthereumAddress),
        executed = (response[1] as bool),
        numConfirmations = (response[2] as BigInt);

  final _i1.EthereumAddress newSpender;

  final bool executed;

  final BigInt numConfirmations;
}

class Transactions {
  Transactions(List<dynamic> response)
      : to = (response[0] as _i1.EthereumAddress),
        value = (response[1] as BigInt),
        data = (response[2] as _i2.Uint8List),
        executed = (response[3] as bool),
        numConfirmations = (response[4] as BigInt);

  final _i1.EthereumAddress to;

  final BigInt value;

  final _i2.Uint8List data;

  final bool executed;

  final BigInt numConfirmations;
}

class GetTransaction {
  GetTransaction(List<dynamic> response)
      : to = (response[0] as _i1.EthereumAddress),
        value = (response[1] as BigInt),
        data = (response[2] as _i2.Uint8List),
        executed = (response[3] as bool),
        numConfirmations = (response[4] as BigInt);

  final _i1.EthereumAddress to;

  final BigInt value;

  final _i2.Uint8List data;

  final bool executed;

  final BigInt numConfirmations;
}

class ConfirmAddTrusted {
  ConfirmAddTrusted(List<dynamic> response)
      : guardian = (response[0] as _i1.EthereumAddress),
        reqIndex = (response[1] as BigInt),
        newTrustedAddress = (response[2] as _i1.EthereumAddress);

  final _i1.EthereumAddress guardian;

  final BigInt reqIndex;

  final _i1.EthereumAddress newTrustedAddress;
}

class ConfirmChangeSpender {
  ConfirmChangeSpender(List<dynamic> response)
      : guardian = (response[0] as _i1.EthereumAddress),
        reqIndex = (response[1] as BigInt),
        newSpender = (response[2] as _i1.EthereumAddress);

  final _i1.EthereumAddress guardian;

  final BigInt reqIndex;

  final _i1.EthereumAddress newSpender;
}

class ConfirmTransaction {
  ConfirmTransaction(List<dynamic> response)
      : guardian = (response[0] as _i1.EthereumAddress),
        txIndex = (response[1] as BigInt);

  final _i1.EthereumAddress guardian;

  final BigInt txIndex;
}

class Deposit {
  Deposit(List<dynamic> response)
      : sender = (response[0] as _i1.EthereumAddress),
        amount = (response[1] as BigInt),
        balance = (response[2] as BigInt);

  final _i1.EthereumAddress sender;

  final BigInt amount;

  final BigInt balance;
}

class ExecuteAddTrusted {
  ExecuteAddTrusted(List<dynamic> response)
      : reqIndex = (response[0] as BigInt),
        newTrustedAddress = (response[1] as _i1.EthereumAddress);

  final BigInt reqIndex;

  final _i1.EthereumAddress newTrustedAddress;
}

class ExecuteChangeSpender {
  ExecuteChangeSpender(List<dynamic> response)
      : reqIndex = (response[0] as BigInt),
        newSpender = (response[1] as _i1.EthereumAddress);

  final BigInt reqIndex;

  final _i1.EthereumAddress newSpender;
}

class ExecuteTransaction {
  ExecuteTransaction(List<dynamic> response)
      : spender = (response[0] as _i1.EthereumAddress),
        txIndex = (response[1] as BigInt);

  final _i1.EthereumAddress spender;

  final BigInt txIndex;
}

class RemoveTrustedAddress {
  RemoveTrustedAddress(List<dynamic> response)
      : spender = (response[0] as _i1.EthereumAddress),
        removedTrusted = (response[1] as _i1.EthereumAddress);

  final _i1.EthereumAddress spender;

  final _i1.EthereumAddress removedTrusted;
}

class RevokeAddTrusted {
  RevokeAddTrusted(List<dynamic> response)
      : guardian = (response[0] as _i1.EthereumAddress),
        reqIndex = (response[1] as BigInt),
        newTrustedAddress = (response[2] as _i1.EthereumAddress);

  final _i1.EthereumAddress guardian;

  final BigInt reqIndex;

  final _i1.EthereumAddress newTrustedAddress;
}

class RevokeChangeSpender {
  RevokeChangeSpender(List<dynamic> response)
      : guardian = (response[0] as _i1.EthereumAddress),
        reqIndex = (response[1] as BigInt),
        newSpender = (response[2] as _i1.EthereumAddress);

  final _i1.EthereumAddress guardian;

  final BigInt reqIndex;

  final _i1.EthereumAddress newSpender;
}

class RevokeTxConfirmation {
  RevokeTxConfirmation(List<dynamic> response)
      : guardian = (response[0] as _i1.EthereumAddress),
        txIndex = (response[1] as BigInt);

  final _i1.EthereumAddress guardian;

  final BigInt txIndex;
}

class SubmitAddTrusted {
  SubmitAddTrusted(List<dynamic> response)
      : spender = (response[0] as _i1.EthereumAddress),
        reqIndex = (response[1] as BigInt),
        newTrustedAddress = (response[2] as _i1.EthereumAddress);

  final _i1.EthereumAddress spender;

  final BigInt reqIndex;

  final _i1.EthereumAddress newTrustedAddress;
}

class SubmitChangeSpender {
  SubmitChangeSpender(List<dynamic> response)
      : guardian = (response[0] as _i1.EthereumAddress),
        reqIndex = (response[1] as BigInt),
        newSpender = (response[2] as _i1.EthereumAddress);

  final _i1.EthereumAddress guardian;

  final BigInt reqIndex;

  final _i1.EthereumAddress newSpender;
}

class SubmitTransaction {
  SubmitTransaction(List<dynamic> response)
      : spender = (response[0] as _i1.EthereumAddress),
        txIndex = (response[1] as BigInt),
        to = (response[2] as _i1.EthereumAddress),
        value = (response[3] as BigInt),
        data = (response[4] as _i2.Uint8List);

  final _i1.EthereumAddress spender;

  final BigInt txIndex;

  final _i1.EthereumAddress to;

  final BigInt value;

  final _i2.Uint8List data;
}
