import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../data/authentication_client.dart';
import '../utils/global.color.dart';
import '../utils/global.constants.dart';
import '../widgets/bottom_nav.dart';
import 'login.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final _authenticationClient = GetIt.instance<AuthenticationClient>();
  var username;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

        _initvar();

    });


  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        appBar: _AppBar(),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text('Bienvenido')
          ],
        )
      ,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Buscar MVA'),
        icon: const Icon(Icons.add),
        backgroundColor: GlobalColors.backgroudColor,
      ),
      bottomNavigationBar: BNavigator(),
    );

  }

  PreferredSizeWidget? _AppBar(){

    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );

    return AppBar(
      title:  Text("Budget Vehiculos"),
      backgroundColor: GlobalColors.backgroudColor,
      actions: <Widget>[
        TextButton.icon(
        style: style,
          label: Text('Refrescar'),
        onPressed: () async {

        },
        icon: const Icon(Icons.refresh),
        ),
        TextButton.icon(
          style: style,
          label: Text('Salir $username'),
          onPressed: () async {
            await _authenticationClient.signOut();
            Navigator.pushNamedAndRemoveUntil(context,LoginView.routeName,(_) => false);
          },
          icon: const Icon(Icons.exit_to_app),
        )
      ],
    );

  }

  Future<void> _initvar() async {
    username = (await _authenticationClient.username)!;
    setState(() {});
    print("mi alor $username");
  }

  Widget _buttons(String text){
    return StreamBuilder(
        builder:(BuildContext context,AsyncSnapshot snapshot){
          return SizedBox(
              width: double.infinity,
              child:
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(GlobalColors.buttonColor),
                    foregroundColor: MaterialStateProperty.all<Color>(GlobalColors.textColorButton),
                  ),
                  onPressed: ()  {},
                  child: Text(text,style: TextStyle(fontSize:14))
              )
          );
        }
    );
  }

}
