import 'package:flutter/material.dart';
import 'component/custom_button.dart';
import 'component/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String loginStatus = 'Not logged in';

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void message(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void login() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() => loginStatus = 'Not logged in');
      message('Please enter password and username');
    } else if (username != 'admin' || password != 'admin') {
      setState(() => loginStatus = 'Login failed'); 
      message('Invalid username or password');
    } else {
      setState(() => loginStatus = 'Logged in');
      message('Welcome back, $username!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(  
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'YouTube',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                MyTextfield(
                  myHint: 'Username',
                  txtController: usernameController,
                  radius: 4,
                  icon: Icons.person,
                ),
                const SizedBox(height: 16),
                MyTextfield(
                  myHint: 'Password',
                  txtController: passwordController,
                  radius: 4,
                  icon: Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 24),
                CustomButton(label: 'Sign in', onPressed: login),
                const SizedBox(height: 16),
                Text(
                  'Login status: $loginStatus',
                ),
              ],
            ),
        ),
      ),
    );
  }
}