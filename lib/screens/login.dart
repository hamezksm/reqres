// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:reqres/core/utils/constants.dart';
import 'package:reqres/screens/landing.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Constants constants = Constants();

  var client = Client();

  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void authenticate() async {
    try {
      var url = Uri.http(constants.api, 'auth-api/login');
      var response = await http.post(
        url,
        body: {
          'username': usernameController.text,
          'password': passwordController.text
        },
      );

      if (response.statusCode == 200) {
        print('data submitted successfully');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Landing(),
          ),
        );
      } else {
        print('Failed to submit data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error submitting data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.white70,
        elevation: 2.0,
      ),
      body: Container(
        margin: const EdgeInsets.all(5.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.shade400,
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [BoxShadow()],
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(3.0),
                  width: 300.0,
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      label: Text('Username'),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(3.0),
                  width: 300.0,
                  child: TextField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: 150.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey.shade200,
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
