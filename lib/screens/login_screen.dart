
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vp12_shared_state_app/pref/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vp12_shared_state_app/provider/language_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }
  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:  Text(
          AppLocalizations.of(context)!.welcome,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Provider.of<LanguageProvider>(context,listen: false).changeLanguage();
        },
        child: const Icon(Icons.language),
      ),
      body: ListView(
        padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        children:  [
           Text(AppLocalizations.of(context)!.login_hint,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight:FontWeight.bold,
            ),
          ),
           Text(AppLocalizations.of(context)!.email,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 15,
              fontWeight:FontWeight.w300,
            ),
          ),
          const SizedBox(height: 20,),
           TextField(
            controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            decoration:  InputDecoration(
              hintText: AppLocalizations.of(context)!.email,
              prefixIcon: const Icon(Icons.email),
            )
          ),
          const SizedBox(height: 10,),
           TextField(
            controller: _passwordTextController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration:  InputDecoration(
                hintText: AppLocalizations.of(context)!.password,
                prefixIcon: const Icon(Icons.email),
              )
          ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: _performeLogin,
            child:  Text(AppLocalizations.of(context)!.login),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(0, 50),
            ),
          ),
        ],
      ),
    );
  }
  void _performeLogin(){
    if(_checkData()){
      login();
    }
  }
  bool _checkData(){
    if(_emailTextController.text.isNotEmpty&& _passwordTextController.text.isNotEmpty){
      return true;
    }{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Enter email & password'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,

      ),
      );
      return false;
    }
  }
  void login()async{
   await SharedPrefController().save(email: _emailTextController.text);
    Navigator.pushReplacementNamed(context, '/home_screen');
  }
}
