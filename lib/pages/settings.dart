import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const <Widget>[
        Card(child:ListTile( title: Text("App Theme"),subtitle: Text("Switch between Light or Dark theme."),/*trailing: <<SWITCH>>  */ )),
        Card(child:ListTile( title: Text("Personal information"),subtitle: Text("Edit your data."),/*onTap: (){}*/)),
        Card(child:ListTile( title: Text("Export/Share Medical Record"),subtitle: Text("Save data locally or share to an app."),/*onTap: (){}*/)),
        Card(child:ListTile( title: Text("Sign Out"),subtitle: Text("Logout of your account or switch to another account."),/*onTap: (){}*/))
        ],
      ),
    );
  }
}
