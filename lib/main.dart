import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:heart_care/pages/home.dart';
import 'package:heart_care/pages/notification_service.dart';
import 'package:heart_care/pages/registration.dart';
import 'package:heart_care/themes/appTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

  main() {
    runApp(HeartCare());
}

class HeartCare extends StatelessWidget {
  const HeartCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
       home: register_check==true?home():register(),
    );
  }
}

Future<bool> register_check() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs =await SharedPreferences.getInstance();
  var username =prefs.getString("username");
  bool checked = username!.isNotEmpty;
  return checked;
}
