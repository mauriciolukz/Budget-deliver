import 'dart:convert';
import 'package:alert/alert.dart';
import 'package:flutter/material.dart';
import 'package:budgetdeliver/utils/global.color.dart';
import 'package:http/src/response.dart';
import '../models/user.dart';
import '../models/error.dart';
import '../service/user_api.dart';
import 'home.view.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  late String _user;
  late String _password;
  late bool passwordVisibility = true;
  final _formKey = GlobalKey<FormState>();

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
                const CircleAvatar(
                    radius: 100.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/images/budget-logo.png")
                ),
                const Text(
                    "Iniciar sesion",
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
                        _userTextField(),
                        const Divider(
                          height: 18.0,
                        ),
                        _passwordTextField(),
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {

                                login(_user,_password)
                                    .then((response) => successfulLogin(response))
                                    .catchError((er) => handleError(er));

                              }
                            },
                            child: const Text('Entrar',style: TextStyle(fontSize:14))
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

  Widget _userTextField(){
    return StreamBuilder(
        builder:(BuildContext context,AsyncSnapshot snapshot){
          return TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresar usuario';
                }
                return null;
              },
              enableInteractiveSelection: false,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Usuario',
                labelText: 'Usuario',
                suffixIcon: const Icon(
                    Icons.verified_user
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              ),
              onChanged: (v) => setState(() {
                _user = v;
              })
          );
        }
    );
  }

  Widget _passwordTextField(){
    return StreamBuilder(
        builder:(BuildContext context,AsyncSnapshot snapshot){
          return TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresar contraseña';
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

  successfulLogin(Response response) {

    if (response.statusCode == 201) {
      var res = json.decode(response.body);
      User user = User.fromJson(res);
      Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeView()));
    }

    if (response.statusCode == 404) {
      var res = json.decode(response.body);
      Error error = Error.fromJson(res);
      Alert(message: error.message, shortDuration: true).show();
    }

  }

  handleError(er) {
    Alert(message: er, shortDuration: true).show();
  }

}
