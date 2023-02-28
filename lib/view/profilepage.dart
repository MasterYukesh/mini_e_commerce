import 'package:flutter/material.dart';
import 'package:verzeo_minor_project/model/user.dart';
import 'package:verzeo_minor_project/model/firebasehelper.dart';
import 'package:verzeo_minor_project/model/sharedpreferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  TextEditingController name = TextEditingController();

  TextEditingController mail = TextEditingController();

  TextEditingController number = TextEditingController();
  bool readOnly = true;

  @override
  void initState() {
    getdata();

    name.text = "Yukeswaran M";
    mail.text = "Yukesh@Verzeo.com";
    number.text = "+91 9920407912";
    super.initState();
  }

  void getdata() async {
    String id = await Sharedpreferences.getUserId();
    user = await FireBaseHelper.readUser(id);
    setState(() {
      name.text = user!.name;
      mail.text = user!.mail;
      number.text = user!.number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode fcn = FocusScope.of(context);
        if (fcn.hasFocus) {
          fcn.unfocus();
        }
      },
      child: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Center(
            child: Icon(
              Icons.person,
              size: 60,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) => setState(() {
                      name.text = value;
                    }),
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.black))),
                    readOnly: readOnly,
                    controller: name,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 60,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) => setState(() {
                      mail.text = value;
                    }),
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.black))),
                    readOnly: readOnly,
                    controller: mail,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Number',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) => setState(() {
                      number.text = value;
                    }),
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.black))),
                    readOnly: readOnly,
                    controller: number,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      readOnly ? Colors.orange : Colors.green)),
              child: Text(readOnly ? 'Edit' : 'Save'),
              onPressed: () {
                setState(() {
                  String msg = "";
                  if (readOnly) {
                    msg = "You can edit your Info now!";
                  } else {
                    msg = "Saved Successfully";
                  }
                  readOnly = !readOnly;
                  ScaffoldMessenger.of(context).showSnackBar(snackbar(msg));
                });
              },
            ),
          )
        ],
      ),
    );
  }

  snackbar(String txt) {
    return SnackBar(
      content: Text(txt),
      duration: const Duration(seconds: 1),
    );
  }
}
