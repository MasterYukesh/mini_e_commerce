import 'package:flutter/material.dart';
import 'package:verzeo_minor_project/model/firebasehelper.dart';
import 'package:verzeo_minor_project/model/user.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignupPage();
  }
}

class _SignupPage extends State<SignupPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  bool passwordInVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: username,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'UserName',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: number,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Number',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Mail',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  obscureText: passwordInVisibility,
                  controller: password,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
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
                      check();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    child: const Text('Signup')),
              ),
            ],
          )),
    );
  }

  void check() async {
    if (username.text.isEmpty ||
        number.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty) {
      alertbox('Please Make sure all the 4 fields are filled.');
    } else if (username.text.contains(RegExp(r'[0-9!@#$%^&*]'))) {
      alertbox('Name must contain only alphabets!');
    } else if (!RegExp(r'[6-9]{1}[0-9]{9}').hasMatch(number.text)) {
      alertbox('Enter a valid 10-digit Indian Mobile Number');
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text)) {
      alertbox('Enter a valid E-mail');
    } else {
      final user = await FireBaseHelper.readUser(username.text);
      if (user == null) {
        await FireBaseHelper.insertUser(User(
            id: username.text,
            mail: email.text,
            name: username.text,
            number: number.text,
            password: password.text));
        navigate();
      } else {
        alertbox('User with the same username already exists');
      }
    }
  }

  void navigate() {
    Navigator.pushNamed(context, '/tabpage');
  }

  void alertbox(String title) {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: Text(title),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('ok'))
              ],
            )));
  }
}
