import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);
  @override
  State<register> createState() => _registerState();
}

final RegExp nameRegExp = RegExp("([a-zA-Z0-9_\\s]+)");
final RegExp numberRegExp = RegExp('^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\\s\\./0-9]*\$');
final RegExp passwordRegExp = RegExp("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}\$");

TextEditingController usernameController = TextEditingController();
TextEditingController userNumberController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

// to return value >> usernameController.text

final _formKey = GlobalKey<FormState>();
late SharedPreferences prefs;

saveData(String name, String number, String email, String password) async {
  prefs = await SharedPreferences.getInstance();
  prefs.setString("username", name);
  prefs.setString("usernumber", number);
  prefs.setString("useremail", email);
  prefs.setString("userpassword", (Crypt.sha256(password)).toString() );
}

late bool _passwordVisible;

class _registerState extends State<register> {

  @override
  void initState() {
    _passwordVisible = false;
  }

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

Widget form(BuildContext context)  {
  //bool ShowPassword ;
  return SingleChildScrollView( //ممكن تشيل الاسكرول فيو هنا
    child: Form(
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
            SizedBox(
              width:  MediaQuery.of(context).size.width-80,
              child: TextFormField(
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
                    hintText: "Type in your name",
                ),
              ),
            ),
        const SizedBox(height: 20.0),
            SizedBox(
              width:  MediaQuery.of(context).size.width-80,
              child: TextFormField(
                validator: (value) => value!.isEmpty
                    ? 'Enter Your Phone Number'
                    : (validator.phone(value)
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
                    hintText: "Type in your phone number",
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width:  MediaQuery.of(context).size.width-80,
              child: TextFormField(
                validator: (value) => value!.isEmpty
                    ? 'Enter Your E-Mail'
                    : (validator.email(value)
                    ? null
                    : 'Enter a Valid E-Mail'),
                controller: emailController,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  icon: const Icon(Icons.mail_outline_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintText: "Type in your E-Mail",
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width:  MediaQuery.of(context).size.width-80,
              child: TextFormField(
                validator: (value) => value!.isEmpty
                    ? 'Enter Your Password'
                    : (passwordRegExp.hasMatch(value)
                    ? null
                    : 'Enter a stronger password.'), //It should contain upper and lower case letters, special characters and numbers. At least 8 characters long
                controller: passwordController,
                obscureText: !_passwordVisible,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
         // --------------------------------
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      _passwordVisible = !_passwordVisible;
                      // Update the state i.e. toogle the state of passwordVisible variable
/*
                      _registerState().setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
*/
                    },
                  ),
// ----------------
                  icon: const Icon(Icons.password_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintText: "Type in your new password",
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width:  MediaQuery.of(context).size.width-80,
              child: TextFormField(
                validator: (value) => value!.isEmpty
                    ? 'Please Retype Your Password'
                    : (passwordController.text==value
                    ? null
                    : "Password Doesn't Match"),
                //controller: passwordController,
                obscureText: !_passwordVisible,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
       //  --------------------------------
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      _passwordVisible = !_passwordVisible;
                      // Update the state i.e. toogle the state of passwordVisible variable
/*
                      _registerState().setState(() {
                      _passwordVisible = !_passwordVisible;
                      });
*/

                    },
                  ),
// ----------------
                  icon: const Icon(Icons.password_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintText: "Retype your password",
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                       // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {

                      //               >>>>>>>>   call a server or save the information in a database. !!!!!!!!

                  saveData(usernameController.text, userNumberController.text,emailController.text,passwordController.text);

                      //      >>>>>>>>>>>>  navigate to emergency list/medical history page first !!!!!!!

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const home()));
                }
              },
              child: const Text('Register'),
            ),
          ],
        )
    ),
  );
}
