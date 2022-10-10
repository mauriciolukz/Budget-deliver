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
       backgroundColor: Colors.white,
        body:
        ListView(
          padding: const EdgeInsets.symmetric(
            horizontal:40.0,
            vertical:90.0
          ),
          children:<Widget>[
            Column(
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
                        fontSize:35,
                        fontWeight: FontWeight.bold,
                         fontFamily: 'NerkoOne'
                    )
                ),
                const SizedBox(
                    width: 160.0,
                    height: 15.0,
                    child: Divider(
                        color: Colors.blueGrey
                    )
                ),
                Form(
                    key: _formKey,
                    child:
                    Column(
                      children: [
                         InputText(
                          keyboardType: TextInputType.emailAddress,
                          label:GlobalConstants.user,
                          onChanged: (text) => _user = text,
                           validator: (value) => value.isEmpty || value == null ? GlobalConstants.enterUser: null,
                        ),
                        const Divider(
                          height: 18.0,
                        ),
                         InputText(
                             validator: (value) => value.isEmpty || value == null ? GlobalConstants.enterPassword: null,
                             onChanged: (text) => _password = text,
                            obscureText:true,
                            label:GlobalConstants.password
                        ),
                        const Divider(
                          height: 15.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child:  TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(GlobalColors.buttonColor),
                              foregroundColor: MaterialStateProperty.all<Color>(GlobalColors.textColorButton),
                            ),
                            onPressed: () async {

                              if (_formKey.currentState!.validate()) {

                                ProgressDialog.show(context);
                                await login(_user,_password,context,true)
                                    .then((response) => successfulLogin(response));

                              }

                            },
                            child: const Text(GlobalConstants.entrar,style: TextStyle(fontSize:14))
                          )
                        )
                      ]
                    )
                )
              ],
            )
          ],
        )
    );

  }

  successfulLogin(Response response) async {

    if (response.statusCode == 201) {
      var res = json.decode(response.body);
      var appWindows = res['role']['appWindows'];

      U_User user = U_User.fromJson(res);

      await _databaseUtil.addMenu(appWindows);
      await _authenticationClient.saveSession(user);
      Navigator.pushNamedAndRemoveUntil(context,'HomeView',(_) => false);
    }

  }


}
