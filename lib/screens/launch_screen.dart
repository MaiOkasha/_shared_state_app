import 'package:flutter/material.dart';
import 'package:vp12_shared_state_app/pref/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      String route = SharedPrefController().loggedIn ? '/home_screen':'/login_screen';
      Navigator.pushReplacementNamed(context,route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade100,
            ]
          ),
        ),
        child:  Text(AppLocalizations.of(context)!.app_name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      )
    );
  }
}
