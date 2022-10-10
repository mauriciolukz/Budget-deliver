import 'dart:async';
import 'package:budgetdeliver/widgets/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../data/authentication_client.dart';
import '../utils/database_util.dart';
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
  int index = 0;
  String moduleName = "";
  BNavigator ?bNavigator;
  final _authenticationClient = GetIt.instance<AuthenticationClient>();
  final _databaseUtil = GetIt.instance<DatabaseUtil>();
  String username = "";

  @override
  void initState() {
    // TODO: implement initState
    bNavigator = BNavigator(
                    currentIndex: (i){
                      setState(() {
                        index = i;
                      });
                    },
                  );

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadInfoUser();
    });

  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: _AppBar(),
      backgroundColor: Colors.white,
      body: Routes(index: index),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(GlobalConstants.findMVA),
        icon: const Icon(Icons.add),
        backgroundColor: GlobalColors.backgroudColor,
      ),
      bottomNavigationBar: bNavigator/*const BNavigator()*/,
    );

  }

  PreferredSizeWidget? _AppBar(){

    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );

    return AppBar(
      title:  const Text(GlobalConstants.tittleHome),
      backgroundColor: GlobalColors.backgroudColor,
      actions: <Widget>[
        TextButton.icon(
          style: style,
          label: const Text(GlobalConstants.refresh),
          onPressed: () async {

          },
          icon: const Icon(Icons.refresh),
        ),
        TextButton.icon(
          style: style,
          label: Text('${GlobalConstants.exit} $username'),
          onPressed: () async {
            await _authenticationClient.signOut();
            await _databaseUtil.cleanDatase();
            Navigator.pushNamedAndRemoveUntil(context,LoginView.routeName,(_) => false);
          },
          icon: const Icon(Icons.exit_to_app),
        )
      ],
    );

  }

  Future<void> loadInfoUser() async {
    username = (await _authenticationClient.username)!;
    setState(() {});
  }


}