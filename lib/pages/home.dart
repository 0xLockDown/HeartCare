import 'package:flutter/material.dart';
import 'package:heart_care/pages/registration.dart';
import 'package:heart_care/pages/settings.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'learn.dart';
import 'vitals.dart';
import 'scan.dart';

                                    //    HOME IS VITALS VISUALIZATION !!!


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

String? name = prefs.getString("username");
String? passVal = prefs.getString("userpassword");

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: ScrollAppBar(
          controller: controller,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const settings()));
            },
            child: const Icon(
              Icons.settings,
            ),
          ),
          actions: <Widget>[
            // 2 widgets .. "learn" and "scan"
          ]
      ),
      body: Column(
        children: [
          SizedBox(height: 100.0),
          SizedBox( child:
                Text("Hello, $name this is your vitals visualization page. \n your passowrd hash is : \n $passVal ",
                    style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                  width: MediaQuery.of(context).size.width-80,
            ),
          SizedBox(height: 100.0),
          Center(
              child: Icon(Icons.monitor_heart, size: 150,)
          ),
        ],
      ),
    );
  }
}


