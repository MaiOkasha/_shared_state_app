import 'package:flutter/material.dart';
import 'package:vp12_shared_state_app/pref/shared_pref_controller.dart';

class LanguageProvider extends ChangeNotifier{


String language = SharedPrefController().language;
void changeLanguage(){
  language = language=='en'?'ar':'en';
  SharedPrefController().changeLanguage(language);
  notifyListeners();
}
}