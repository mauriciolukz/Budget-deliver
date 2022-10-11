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
  late TextEditingController controller;
  String mva = '';

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
      controller = TextEditingController();
      loadInfoUser();
    });

  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    moduleName = _databaseUtil.getNameMenuItemByIndex(index);

    return  Scaffold(
      appBar: _AppBar(),
      backgroundColor: Colors.white,
      body: Routes(index: index, moduleName:moduleName),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
            final mva = await openDialog();
            if (mva == null || (mva.isEmpty)) return;
            setState(() => this.mva = mva);
        },
        label:  Text(GlobalConstants.findMVA),
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

  Future<String?> openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:
        Expanded(
            child: Text(
                style: TextStyle(
                    //backgroundColor: Colors.blue,
                    fontSize:35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NerkoOne'
                ),
                "Codigo MVA"
            )
        ),
        content:TextFormField(
            enableInteractiveSelection: false,
            autofocus: true,
            decoration: InputDecoration(
              focusColor: Colors.orange,
              fillColor: Colors.orange,
              prefixIconColor: Colors.orange,
              hintText: 'xxxxxxxxxxxxxxxx',
              labelText: 'Codigo de barra',
              suffixIcon: const Icon(
                  Icons.qr_code
              ),
              labelStyle: const TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w500
              ),
            )
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white
              ),
              onPressed: (){
            Navigator.of(context).pop(controller.text);
            controller.clear();
          }, child: Text('Buscar')),
          TextButton(
              style:  TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white
              ),
              onPressed: (){}, child: Icon(Icons.camera))
        ],
      ),
  );

}