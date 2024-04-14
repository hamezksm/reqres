import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reqres/constants.dart';
import 'package:reqres/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  Constants constants = Constants();

  Dio dio = Dio();

  bool _obscureText = true;
  final RegExp _emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );
  bool _isValidEmail = true;

  void signUp() async {
    String apiUrl = '${constants.api}/api/users';

    try {
      Response response = await dio.post(
        apiUrl,
        data: {
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
          'email': emailController.text,
          'username': usernameController.text,
          'password': passwordController.text
        },
      );

      if (response.statusCode == 200) {
        print('data submitted successfully');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      } else {
        print('Failed to submit data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error submitting data: $e');
    }
  }

  void _validateEmail(String email) {
    setState(() {
      _isValidEmail = _emailRegExp.hasMatch(email);
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool verifyPasswords() {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (password == confirmPassword) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Sign Up'),
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
        child: SingleChildScrollView(
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
              height: 520,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    width: 300.0,
                    child: TextField(
                      controller: firstNameController,
                      decoration: const InputDecoration(
                        label: Text('First name'),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    width: 300.0,
                    child: TextField(
                      controller: lastNameController,
                      decoration: const InputDecoration(
                        label: Text('Last name'),
                      ),
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
                      controller: emailController,
                      decoration: InputDecoration(
                        errorText: _isValidEmail ? null : 'Invalid email',
                        label: const Text('Email Address'),
                      ),
                      onChanged: _validateEmail,
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
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    width: 300.0,
                    child: TextField(
                      controller: confirmPasswordController,
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
                    onTap: () {
                      if (verifyPasswords()) {
                        signUp();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
