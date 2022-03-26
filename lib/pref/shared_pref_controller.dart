import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys{email,loggedIn,language}

class SharedPrefController{
 static final SharedPrefController _instance = SharedPrefController._();
  SharedPrefController._();
  late SharedPreferences _sharedPreferences;

  factory SharedPrefController(){
    return _instance;
    }
 Future <void> initPref () async{
   _sharedPreferences = await SharedPreferences.getInstance();
 }
 Future <void> save ({required String email})async{
    await _sharedPreferences .setBool(PrefKeys.loggedIn.toString(), true);
    await _sharedPreferences.setString(PrefKeys.email.toString(), email);
 }
 bool get loggedIn=> _sharedPreferences.getBool(PrefKeys.loggedIn.toString())?? false;
  String get email => _sharedPreferences.getString(PrefKeys.email.toString())??'';

  Future<bool> changeLanguage(String language)async{
    return await _sharedPreferences.setString(PrefKeys.loggedIn.toString(), language);


  }

  String get language=> _sharedPreferences.getString(PrefKeys.language.toString())??'en';
  Future<bool> removeEmail()async{
    return await _sharedPreferences.remove(PrefKeys.email.toString());
  }
  Future<bool> clear ()async{
   return await _sharedPreferences.clear();
  }

  }

