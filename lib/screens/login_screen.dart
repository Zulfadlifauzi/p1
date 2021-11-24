import 'package:flutter/material.dart';
import 'package:project1/screens/store.dart';
import 'package:project1/services/apiservice.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController nameController =
      TextEditingController(text: "mor_2314");
  TextEditingController passController = TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hood Login'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Username', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                  labelText: 'Password', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  final getToken = await APIservice()
                      .userLogin(nameController.text, passController.text);
                  if (getToken['token'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'SUCCESS ! your token id is ${getToken['token']}'),
                      backgroundColor: Colors.green,
                    ));
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StoreHome()));
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('username or password incorrect'),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
