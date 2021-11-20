import 'package:flutter/material.dart';
import 'package:social_recovery_wallet_app/global_state_manager.dart';

class CreateNewSocialRecoveryWalletPage extends StatefulWidget {
  const CreateNewSocialRecoveryWalletPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreateNewSocialRecoveryWalletPageState();
  }
}

class _CreateNewSocialRecoveryWalletPageState
    extends State<CreateNewSocialRecoveryWalletPage> {
  late GlobalStateManager _globalStateManager;
  late String _walletAddress;
  final List<String> _guardians = <String>[];

  final TextEditingController guardianController = TextEditingController();
  final TextEditingController numConfTxController = TextEditingController();
  final TextEditingController numConfChangeSpenderController =
      TextEditingController();
  final TextEditingController numConfAddTrustedAddressController =
      TextEditingController();

  @override
  void initState() {
    _globalStateManager = GlobalStateManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create New Social Recovery Wallet'),
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
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Current Guardians: ${_guardians.join(", ")}")
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: guardianController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Add Guardian...'),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    String address = guardianController.text;

                    if(_guardians.contains(address)) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Guardian already added"),
                      ));
                    }
                    else {
                      if(_globalStateManager.checkAddressValidity(address)) {
                        setState(() {
                          _guardians.add(address);
                        });
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Incorrect Ethereum Address"),
                        ));
                      }
                    }
                    guardianController.text = "";
                  },
                  child: const Text('Add Guardian',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: numConfTxController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText:
                          'Number of confirmations to execute transactions...'),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: numConfChangeSpenderController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Number of confirmations to change spender...'),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: numConfAddTrustedAddressController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText:
                          'Number of confirmations to add trusted addresses...'),
                ),
              ),

              Container(
                margin: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    _globalStateManager.deploySocialRecoverWallet("0x5C54CF7D1e5AC8636bD48D5812cf3C60eDD8f635", ["0x83aF2B2EE83f6726BF1B3274b1E44d112959E348", "0xDBB756C1a8695D97D795590d3755d732E61acBD4"], 1, 1, 1);
                  },
                  child: const Text('CREATE',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        )));
  }
}
