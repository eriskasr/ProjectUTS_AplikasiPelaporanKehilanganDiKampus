import 'package:flutter/material.dart';
import 'package:flutter_application_uts/home.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _SignUp();
}

class _SignUp extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: null,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 600,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Daftar Dulu Gaes!",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormGlobal(
                  controller: TextEditingController(),
                  text: 'Nama Mahasiswa',
                  textInputType: TextInputType.name,
                  obscureText: false,
                ),
                SizedBox(height: 5),
                TextFormGlobal(
                  controller: TextEditingController(),
                  text: 'NIM',
                  textInputType: TextInputType.text,
                  obscureText: false,
                ),
                SizedBox(height: 5),
                TextFormGlobal(
                  controller: TextEditingController(),
                  text: 'Program Studi',
                  textInputType: TextInputType.text,
                  obscureText: false,
                ),
                SizedBox(height: 5),
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
                SizedBox(height: 5),
                TextFormGlobal(
                  controller: TextEditingController(),
                  text: 'Konfirmasi Password',
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 15),
                // === BUTTON SIGN UP START ===
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => homepage(),
                      ),
                    );
                  },
                  child: Text(
                    'Daftar',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.32, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                ),
                // === BUTTON SIGN UP END ===
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============ CLASS WIDGET START ============
// WIDGET FORM START
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
// WIDGET FORM START
// ============ CLASS WIDGET END ============
