import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:vp12_shared_state_app/pref/shared_pref_controller.dart';
import 'package:vp12_shared_state_app/provider/language_provider.dart';
import 'package:vp12_shared_state_app/screens/home_screen.dart';
import 'package:vp12_shared_state_app/screens/launch_screen.dart';
import 'package:vp12_shared_state_app/screens/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    await SharedPrefController().initPref();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageProvider>(create:(context)=> LanguageProvider(), )
      ],
      child: const MyMaterialApp(),
    );


  }
}
class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //localizationsDelegates: AppLocalizations.localizationsDelegates,
      //supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(Provider.of<LanguageProvider>(context).language),
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen' : (context)=>const LaunchScreen(),
        '/login_screen' : (context)=> const LoginScreen(),
        '/home_screen' : (context)=> const HomeScreen(),
      },
    );
  }
}
