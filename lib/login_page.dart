import 'package:flutter/material.dart';
import 'package:kuis_prak_pam/page1.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo atau gambar profil
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                  'assets/logo.png'),
            ),
            const SizedBox(height: 20),

            // Pendeklarasian
            _usernameField(),
            const SizedBox(height: 20),
            _passwordField(),
            const SizedBox(height: 20),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  // username
  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: false,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          labelText: 'Username',
          hintText: 'Username',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: (isLoginSuccess) ? Colors.blue : Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  //  Password
  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        //obscuringCharacter: '\*',
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          labelText: 'Password',
          hintText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: (isLoginSuccess) ? Colors.blue : Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  // Membuat button login
  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = "";
          if (username == "qwer" && password == "123") {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => page1(),
                ),
              );
              text = "Login Success";
              isLoginSuccess = true;
            });
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(text),
              backgroundColor: (isLoginSuccess) ? Colors.green : Colors.red,
            ),
          );
        },
        child: const Text('Login'),
        style: ElevatedButton.styleFrom(
          primary: (isLoginSuccess) ? Colors.blue : Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
