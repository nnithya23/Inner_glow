import 'package:flutter/material.dart';
import 'package:mentalhealth/screens/LoginPage.dart';
import 'package:mentalhealth/services/firebase_auth_service.dart';

class SignInPage extends StatelessWidget {
   final SignUpService sus = SignUpService();
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.pink.shade200,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign In 💖",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter Your Email",
                    prefixIcon: Icon(Icons.email, color: Colors.pink),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter Your Password",
                    prefixIcon: Icon(Icons.lock, color: Colors.pink),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
                      sus.signUp(_emailController.text.trim(), _passwordController.text.trim());
                    }
                  },
                  child: Text("Sign In 💖",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    backgroundColor: Colors.pink.shade400,
                  ),
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('''If you have an Account '''),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }));
                        },
                        child: Text('LogIn'))
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
