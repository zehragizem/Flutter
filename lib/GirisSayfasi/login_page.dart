import 'package:flutter/material.dart';
import 'package:flutter_project/GirisSayfasi/model/User.dart';
import 'package:flutter_project/GirisSayfasi/model/my_button.dart';
import 'package:flutter_project/GirisSayfasi/model/my_textfield.dart';
import 'package:flutter_project/main/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_project/GirisSayfasi/model/User_List.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool signUserIn(BuildContext context) {
    String ad = usernameController.text;
    String parola = passwordController.text;
    bool userFound = false;

    for (Kullanici kullanici in kullanicilarListesi.kListesi) {
      if (kullanici.kullaniciAdi == ad && kullanici.Sifre == parola) {
        userFound = true;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        return true;
      }
    }
    if (!userFound) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Hata'),
            content: const Text('Yanlış Kullanıcı adı veya Şifre!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Tamam'),
              ),
            ],
          );
        },
      );
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 254, 245, 255),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/logo.png",
                ),

                const SizedBox(height: 8),

                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [
                        Color.fromRGBO(197, 154, 250, 1),
                        Color.fromRGBO(147, 195, 249, 1.0)
                      ],
                      stops: [
                        0.0,
                        1.0
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: Text(
                    'THOR',
                    style: GoogleFonts.silkscreen(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 238, 224, 240),
                        fontWeight: FontWeight.normal,
                        fontSize: 55.0,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'kullanıcıadı@thor.com',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // Password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Şifre',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                MyButton(
                  onTap: () => signUserIn(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
