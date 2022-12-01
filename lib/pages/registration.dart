import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);
  @override
  State<register> createState() => _registerState();
}

final RegExp nameRegExp = RegExp('[a-zA-Z]');
final RegExp numberRegExp = RegExp(r'\d');

TextEditingController usernameController = TextEditingController();
TextEditingController userNumberController = TextEditingController();
// to return value >> usernameController.text

final _formKey = GlobalKey<FormState>();
late SharedPreferences prefs;

saveData(String name, String number) async {
  prefs = await SharedPreferences.getInstance();
  prefs.setString("username", name);
  prefs.setString("usernumber", number);
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
        body: Center(
          child: SingleChildScrollView(
              child: Column(children:
                <Widget>[
                  form(context),
                  ]
              )
          ),
        )
    );
  }
}

Widget form(BuildContext context) {
  return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          /*const Text(
            "REGISTER",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 100.0)
          ,*/
          TextFormField(
            validator: (value) => value!.isEmpty
                ? 'Enter Your Name'
                : (nameRegExp.hasMatch(value) ? null : 'Enter a Valid Name'),
            controller: usernameController,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
                icon: const Icon(Icons.account_circle),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: const TextStyle(color: Colors.white),
                hintText: "Type in your name",
                fillColor: Colors.grey),
          ),
      SizedBox(height: 20.0),
          TextFormField(
            validator: (value) => value!.isEmpty
                ? 'Enter Your Phone Number'
                : (numberRegExp.hasMatch(value)
                    ? null
                    : 'Enter a Valid Phone Number'),
            controller: userNumberController,
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
                icon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: const TextStyle(color: Colors.white),
                hintText: "Type in your phone number",
                fillColor: Colors.grey),
          ),
          SizedBox(height: 100.0),
          ElevatedButton(
            onPressed: () {
                     // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                    //call a server or save the information in a database.
                saveData(usernameController.text, userNumberController.text);
                    //navigate to emergency list page first
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const home()));
              }
            },
            child: const Text('Register'),
          ),
        ],
      )
  );
}
