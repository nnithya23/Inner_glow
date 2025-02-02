import 'package:flutter/material.dart';
import 'package:mentalhealth/screens/SignInPage.dart';
import 'package:mentalhealth/services/firebase_auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SignUpService sus = SignUpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade200,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Welcome text
                Text(
                  "Welcome, Beautiful! 💖",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),

                // Name input field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter Your email",
                    prefixIcon: Icon(Icons.person, color: Colors.pink),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // Email input field
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter Your Password",
                    prefixIcon: Icon(Icons.email, color: Colors.pink),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter your email';
                  //   } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
                  //     return 'Please enter a valid email address';
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(height: 25),

                // Login button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {}
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => HomeScreen()),
                    // );
                    if (_emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty) {
                      sus.signIn(_emailController.text.trim(),
                          _passwordController.text.trim());
                    }
                  },
                  child: Text("Login 💕",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    backgroundColor: Colors.pink.shade400,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('''If you don't have an Account '''),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return SignInPage();
                          }));
                        },
                        child: Text('SignUP'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
