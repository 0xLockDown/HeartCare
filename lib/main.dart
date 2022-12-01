import 'package:flutter/material.dart';
import 'package:heart_care/pages/home.dart';
import 'package:heart_care/pages/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

  main() {
    runApp(HeartCare());
}

class HeartCare extends StatelessWidget {
  const HeartCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: FlexThemeData.light(
          colors: const FlexSchemeColor(
            primary: Color(0xff004881),
            primaryContainer: Color(0xffd0e4ff),
            secondary: Color(0xffac3306),
            secondaryContainer: Color(0xffffdbcf),
            tertiary: Color(0xff006875),
            tertiaryContainer: Color(0xff95f0ff),
            appBarColor: Color(0xffffdbcf),
            error: Color(0xffb00020),
          ),
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 9,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 10,
            blendOnColors: false,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          // To use the playground font, add GoogleFonts package and uncomment
          // fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
      darkTheme: FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xff9fc9ff),
          primaryContainer: Color(0xff00325b),
          secondary: Color(0xffffb59d),
          secondaryContainer: Color(0xff872100),
          tertiary: Color(0xff86d2e1),
          tertiaryContainer: Color(0xff004e59),
          appBarColor: Color(0xff872100),
          error: Color(0xffcf6679),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
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
