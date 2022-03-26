import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vp12_shared_state_app/pref/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title:  Text(AppLocalizations.of(context)!.home,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(onPressed: ()async{
                  await _confirmLogout();
                   },
              icon: const Icon(Icons.logout)),

        ],
      ),
      body: Center(
        child: Text(
          SharedPrefController().email
        ),
      ),
    );
  }


  Future<void> _confirmLogout() async{
   bool? loggedOut= await showDialog <bool>(context: context, builder: (context){
      return AlertDialog(
        title: const Text('Log out'),
        content: const Text('Are you sure?'),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context, true);
          }, child: const Text('Yes')),
          TextButton(onPressed: (){
            Navigator.pop(context,false);
          }, child: const Text('No')),
        ],
      );
    },
    );
   if(loggedOut?? false){
     await logout();
   }
  }
  Future<void> logout() async {
    await SharedPrefController().clear();
    Navigator.pushReplacementNamed(context, '/login_screen');
  }
}
