import 'dart:convert';
import 'package:budgetdeliver/utils/global.constants.dart';
import 'package:flutter/material.dart';
import 'package:budgetdeliver/utils/global.color.dart';
import 'package:get_it/get_it.dart';
import 'package:http/src/response.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../data/authentication_client.dart';
import '../models/user.dart';
import '../models/error.dart';
import '../service/user_api.dart';
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
  late bool passwordVisibility = true;
  final _formKey = GlobalKey<FormState>();
  final _authenticationClient = GetIt.instance<AuthenticationClient>();

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
                    GlobalConstants.iniciarSesion,
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
                          label:GlobalConstants.usuario,
                          onChanged: (text) => _user = text,
                           validator: (value) => value.isEmpty || value == null ? GlobalConstants.ingresarUsuario: null,
                        ),
                        const Divider(
                          height: 18.0,
                        ),
                         InputText(
                             validator: (value) => value.isEmpty || value == null ? GlobalConstants.ingresarContrasena: null,
                             onChanged: (text) => _password = text,
                            obscureText:true,
                            label:GlobalConstants.contrasena
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

  Widget _passwordTextField(){
    return StreamBuilder(
        builder:(BuildContext context,AsyncSnapshot snapshot){
          return TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return GlobalConstants.ingresarContrasena;
              }
              return null;
            },
              enableInteractiveSelection: false,
              autofocus: true,
              obscureText: passwordVisibility,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                labelText: 'Contraseña',
                suffixIcon: IconButton(
                  icon: Icon(
                      passwordVisibility ? Icons.visibility : Icons.visibility_off
                  ), onPressed: () {
                  setState(() {
                    passwordVisibility = !passwordVisibility;
                  });
                },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              ),
              onChanged: (v) => setState(() {
                _password = v;
              })
          );
        }
    );
  }

  successfulLogin(Response response) async {

    //ProgressDialog.dissmiss(context);
    if (response.statusCode == 201) {
      var res = json.decode(response.body);
      User user = User.fromJson(res);
      await _authenticationClient.saveSession(user);
      Navigator.pushNamedAndRemoveUntil(context,'HomeView',(_) => false);
    }

  }


}
