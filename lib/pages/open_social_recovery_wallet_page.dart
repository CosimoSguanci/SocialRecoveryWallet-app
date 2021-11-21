import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_recovery_wallet_app/contracts/SocialRecoveryWallet.g.dart';
import 'package:social_recovery_wallet_app/global_state_manager.dart';
import 'package:social_recovery_wallet_app/utils/roles.dart';

class OpenSocialRecoveryWalletPage extends StatefulWidget {
  const OpenSocialRecoveryWalletPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OpenSocialRecoveryWalletPageState();
  }
}

class _OpenSocialRecoveryWalletPageState
    extends State<OpenSocialRecoveryWalletPage> {
  late GlobalStateManager _globalStateManager;
  late String _walletAddress;
  late Roles _role;
  bool _showRole = false;
  final TextEditingController contractAddressController =
      TextEditingController();

  @override
  void initState() {
    _globalStateManager = GlobalStateManager();
    contractAddressController.text = "0xcd2bd69e5d6ff124ce2785e599c13956ed4c658c"; // todo remove
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Open Social Recovery Wallet'),
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
                  margin: const EdgeInsets.only(
                      left: 10.0, top: 40.0, right: 10.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Expanded(
                        child: Center(
                            child: Text(
                          'Insert Social Recovery Wallet Contract Address: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      )
                    ],
                  )),
              Container(
                child: TextField(
                  controller: contractAddressController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Social Recovery Wallet Contract Address...'),
                ),
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
              ),
              _showRole
                  ? Container(
                      margin: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                  "Your role in this Social Recovery Wallet is ${_getRoleString(_role)}")),
                          Container(
                              margin: const EdgeInsets.only(top: 8.0),
                              child: ElevatedButton(
                                onPressed: ()  {
                                  switch(_role) {
                                    case Roles.spender:
                                      Navigator.pushNamed(
                                          context, '/spender_social_recovery_wallet_page');
                                      break;
                                    case Roles.guardian:
                                      Navigator.pushNamed(
                                          context, '/guardian_social_recovery_wallet_page');
                                      break;
                                    default:
                                      break;
                                  }
                                },
                                child: const Text('Open Wallet',
                                    style: TextStyle(color: Colors.white)),
                              )),
                        ],
                      ))
                  : Container(),
              ElevatedButton(
                onPressed: () async {
                  _globalStateManager
                      .openSocialRecoveryWallet(contractAddressController.text);
                  _role = await _globalStateManager.getRole(_walletAddress);

                  setState(() {
                    _showRole = true;
                  });
                },
                child: const Text('Check your Role',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        )));
  }

  String _getRoleString(Roles role) {
    switch (role) {
      case Roles.spender:
        return "Spender";
      case Roles.trustedAddress:
        return "Trusted Address";
      case Roles.guardian:
        return "Guardian";
      default:
        return "None";
    }
  }
}
