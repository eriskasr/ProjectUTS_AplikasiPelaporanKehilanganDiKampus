import 'package:flutter/material.dart';
import 'package:flutter_application_uts/signup.dart';
import 'package:flutter_application_uts/login.dart';

class lupaPassword extends StatefulWidget {
  const lupaPassword({super.key});

  @override
  State<lupaPassword> createState() => _lupaPassword();
}

class _lupaPassword extends State<lupaPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: null,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 0, top: 20),
                  child: Image.asset(
                    'asset_media/gambar/icon/forgot.png',
                    width: 120,
                    height: 120,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Waduh Lupa Password",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
                TextFormGlobal(
                  controller: TextEditingController(),
                  text: 'NIM',
                  textInputType: TextInputType.text,
                  obscureText: false,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => signUp()));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 11.0),
                      child: Text(
                        'Cek NIM',
                        style: TextStyle(color: Colors.blue),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextFormGlobal(
                  controller: TextEditingController(),
                  text: 'Password Baru',
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 5),
                TextFormGlobal(
                  controller: TextEditingController(),
                  text: 'Konfirmasi Password Baru',
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 10),
                // === BUTTON SIGN UP START ===
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => login(),
                      ),
                    );
                  },
                  child: Text(
                    'Konfirmasi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
