import 'package:flutter/material.dart';
import 'package:reqres/login.dart';
import 'package:reqres/signup.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reqres'),
        centerTitle: true,
        backgroundColor: Colors.white70,
        elevation: 2.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: 150.0,
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5.0)),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUp(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: 150.0,
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5.0)),
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

