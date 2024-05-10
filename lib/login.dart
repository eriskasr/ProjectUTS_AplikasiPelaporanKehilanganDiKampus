import 'package:flutter/material.dart';
import 'package:flutter_application_uts/signup.dart';
import 'package:flutter_application_uts/home.dart';
import 'package:flutter_application_uts/lupapassword.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginPage();
}

class _loginPage extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: null,
      ),
      body: SingleChildScrollView(
        // Menggunakan SingleChildScrollView di sini
        child: Center(
          child: Container(
            width: 300,
            height: 540,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 0, top: 50),
                  child: Image.asset(
                    'asset_media/gambar/icon/login.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                    top: 0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Login kuy!",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      TextFormGlobal(
                        controller: TextEditingController(),
                        text: 'Email',
                        textInputType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      SizedBox(height: 5),
                      TextFormGlobal(
                        controller: TextEditingController(),
                        text: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => lupaPassword()));
                        },
                        child: Text(
                          'Lupa Password?',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => homepage(),
                            ),
                          );
                        },
                        child: Text(
                          'Masuk',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.32, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => signUp(),
                            ),
                          );
                        },
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.32, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormGlobal extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscureText;

  const TextFormGlobal({
    Key? key,
    required this.controller,
    required this.text,
    required this.textInputType,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: text,
          border: OutlineInputBorder(),
        ),
        obscureText: obscureText,
        keyboardType: textInputType,
      ),
    );
  }
}
