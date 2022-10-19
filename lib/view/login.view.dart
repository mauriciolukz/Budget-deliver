import 'dart:convert';
import 'package:budgetdeliver/utils/global.constants.dart';
import 'package:flutter/material.dart';
import 'package:budgetdeliver/utils/global.color.dart';
import 'package:get_it/get_it.dart';
import 'package:http/src/response.dart';
import '../data/authentication_client.dart';
import '../models/user.dart';
import '../service/user_api.dart';
import '../utils/database_util.dart';
import '../widgets/button_stand.dart';
import '../widgets/dialogs.dart';
import '../widgets/input_text.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  static const routeName = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  late String _user;
  late String _password;
  final _formKey = GlobalKey<FormState>();
  final _authenticationClient = GetIt.instance<AuthenticationClient>();
  final _databaseUtil = GetIt.instance<DatabaseUtil>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
          child: SingleChildScrollView(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: GlobalColors.backgroudColor,
                  radius: 100.0,
                  child: CircleAvatar(
                    radius: 95.0,
                    child: Image.asset('assets/images/budget-logo.png',fit: BoxFit.contain),
                  ),
                ),
                const Text(
                    GlobalConstants.signIn,
                    style: TextStyle(
                        fontSize:24,
                        fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(
                  width: 400,
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical:10.0),
                            child: InputText(
                              keyboardType: TextInputType.emailAddress,
                              label:GlobalConstants.user,
                              onChanged: (text) => _user = text,
                              validator: (value) => value.isEmpty || value == null ? GlobalConstants.enterUser: null,
                              icon: Icons.verified_user,
                            ),
                          ),
                           InputText(
                                validator: (value) => value.isEmpty || value == null ? GlobalConstants.enterPassword: null,
                                onChanged: (text) => _password = text,
                                obscureText:true,
                                label:GlobalConstants.password,
                                icon: Icons.password,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical:15.0),
                                child:ButtonStand(text:'Continuar',onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    ProgressDialog.show(context);
                                    await login(_user,_password,context,true)
                                        .then((response) => successfulLogin(response));
                                  }
                                },width: 300,height: 50),
                              ),
                            )
                        ],
                      )
                  ),
                ),
              ],
            ),
          )),
        )
    );

  }

  successfulLogin(Response response) async {

    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      var appWindows = res['role']['appWindows'];

      U_User user = U_User.fromJson(res);

      await _authenticationClient.saveSession(user);
      await _databaseUtil.addMenu(appWindows);
      await loadDataApi();
      Navigator.pushNamedAndRemoveUntil(context,'HomeView',(_) => false);
    }

  }

  Future<void> loadDataApi() async {

    await _databaseUtil.PullData(context);

  }


}
