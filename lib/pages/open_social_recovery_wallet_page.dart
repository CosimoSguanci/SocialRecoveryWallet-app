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

class _OpenSocialRecoveryWalletPageState extends State<OpenSocialRecoveryWalletPage> {
  late GlobalStateManager _globalStateManager;
  final TextEditingController contractAddressController = TextEditingController();

  @override
  void initState() {
    _globalStateManager = GlobalStateManager();
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
                          border: InputBorder.none, hintText: 'Social Recovery Wallet Contract Address...'),
                    ),
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Roles role = await _globalStateManager.getRole(contractAddressController.text);
                    },
                    child:
                    const Text('Open', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            )));
  }
}
