import 'package:flutter/material.dart';
import 'package:verzeo_minor_project/view/singuppage.dart';
import 'package:verzeo_minor_project/model/user.dart';
import 'package:verzeo_minor_project/model/firebasehelper.dart';
import 'package:verzeo_minor_project/model/sharedpreferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordInVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar contains the title
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      //Use List View instead of column because when we try to open the keyboard to enter our credentials
      // There would be a render overflow of pixels.
      body: GestureDetector(
        onTap: (() {
          FocusScopeNode f = FocusScope.of(context);
          if (f.hasFocus) {
            f.unfocus();
          }
        }),
        child: ListView(
          children: [
            const SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: 'UserName',
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                obscureText: passwordInVisibility,
                controller: password,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  suffixIcon: passwordInVisibility
                      ? IconButton(
                          icon: const Icon(Icons.visibility_off),
                          onPressed: (() => setState(() {
                                passwordInVisibility = !passwordInVisibility;
                              })),
                        )
                      : IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: (() => setState(() {
                                passwordInVisibility = !passwordInVisibility;
                              })),
                        ),
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    validatelogin();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: const Text('Login')),
            ),
            const SizedBox(
              height: 25,
            ),
            const Center(child: Text('Or')),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: const Text('Signup')),
            ),
          ],
        ),
      ),
    );
  }

  validatelogin() async{
    if (username.text.isEmpty || password.text.isEmpty) {
      showAlert('Make sure both the credentials are Entered.');
    } else {
      User? user = await FireBaseHelper.readUser(username.text);
      if (user != null) {
        if (user.password == password.text.trim()) {
          Sharedpreferences.setUserId(username.text.trim());
          navigate();
        } else {
          showAlert('Incorrect Password!');
        }
      } else {
        showAlert('Please Enter a valid ID');
      }
    }
  }

  void navigate() {
    Navigator.pushNamed(context,'/tabpage');
  }

  showAlert(String txt) {
    return showDialog(
      context: context,
      builder: ((context1) => AlertDialog(
            content: Text(txt),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context1);
                  },
                  child: const Text('ok'))
            ],
          )),
    );
  }
}
