import 'dart:async';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:budgetdeliver/app.dart';
import 'package:budgetdeliver/widgets/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../data/authentication_client.dart';
import '../service/transactions_api.dart';
import '../utils/database_util.dart';
import '../utils/global.color.dart';
import '../utils/global.constants.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/button_stand.dart';
import '../widgets/dialogs.dart';
import 'login.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int index = 0;
  int indexMenu = 0;
  String moduleName = "";
  BNavigator ?bNavigator;
  final _authenticationClient = GetIt.instance<AuthenticationClient>();
  final _databaseUtil = GetIt.instance<DatabaseUtil>();
  String username = "";
  late TextEditingController mvaController;
  String MVA = '';
  late Vehicles vehicle = Vehicles(0, "", "", "", "", "", "", 0, "", "", "", "", "", "", false);
  int showBarItem = -1;

  @override
  void initState() {
    // TODO: implement initState
    bNavigator = BNavigator(
                  currentIndex: (i){
                    setState(() {
                      index = i;
                    });
                  },
                  showBarItem:showBarItem
                );

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mvaController = TextEditingController();
      loadInfoUser();
    });

  }

  @override
  void dispose() {
    mvaController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    moduleName = MVA == '' ? '' : _databaseUtil.getNameMenuItemByIndex(index);
    indexMenu = _databaseUtil.getIdMenuItemByIndex(index);

    return  Scaffold(
      appBar: _AppBar(),
      body: Routes(index: indexMenu, moduleName:moduleName, vehicle:this.vehicle),
      floatingActionButton: _floatingActionButton(),
      bottomNavigationBar: _bottomNavigationBar(),
    );

  }

  PreferredSizeWidget? _AppBar(){

    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );

    return AppBar(
      backgroundColor: GlobalColors.backgroudColor,
      title:  const Text(GlobalConstants.tittleHome),
      actions: <Widget>[
        TextButton.icon(
          style: style,
          label: const Text(''),
          onPressed: () async {
            ProgressDialog.show(context);
            await _databaseUtil.cleanDatase(true);
            await _databaseUtil.PullData(context);
            ProgressDialog.dissmiss(context);
          },
          icon: const Icon(Icons.refresh),
        ),
        TextButton.icon(
          style: style,
          label: Text('$username'),
          onPressed: () async {
            await _authenticationClient.signOut();
            await _databaseUtil.cleanDatase(false);
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

  Future<String?> openDialog() {
      return showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title:
              Container(
                  child: Text(
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold
                      ),
                      "Codigo MVA"
                  )
              ),
              content: TextFormField(
                  controller: mvaController,
                  autofocus: true,
                  decoration: InputDecoration(
                    focusColor: Colors.orange,
                    fillColor: Colors.orange,
                    prefixIconColor: Colors.orange,
                    hintText: 'xxxxxxxxxxxxxxxx',
                    labelText: 'Codigo de barra',
                    suffixIcon: const Icon(Icons.qr_code),
                    labelStyle: const TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500
                    ),
                  )
              ),
              actions: [
                ButtonStand(text:'Buscar',onPressed: (){
                  Navigator.of(context).pop(mvaController.text);
                  mvaController.clear();
                },width: 100,height: 40),
                ButtonStand(text:'Camara',onPressed: () async {
                  var result = await BarcodeScanner.scan();
                  mvaController.text = result.rawContent;
                  //child: Icon(Icons.camera_alt_outlined)
                },width: 100,height: 40),
              ],
            ),
      );
    }

    _floatingActionButton() {
      String textFloating = MVA == '' ? GlobalConstants.findMVA : "Limpiar VMA";
      IconData iconFloating = MVA == '' ? Icons.search : Icons.remove;

      return FloatingActionButton.extended(
        onPressed: () async {
          if( MVA == ''){
            final mva = await openDialog();
            if (mva == null || (mva.isEmpty)) return;

            setState((){
              this.MVA = mva;
              this.vehicle = _databaseUtil.findVehicleByMVA(this.MVA);
              index = 0;
            });

          }else{
            setState((){
              this.MVA = '';
              vehicle = new Vehicles(0, "", "", "", "", "", "", 0, "", "", "", "", "", "", false);
            });
          }
        },
        label: Text(textFloating),
        icon: Icon(iconFloating),
        backgroundColor: GlobalColors.backgroudColor,
      );
    }

    _bottomNavigationBar() {
      return vehicle.mva != '' ? bNavigator : null;
    }

}