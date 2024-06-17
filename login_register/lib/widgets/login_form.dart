// lib/widgets/login_form.dart

import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Implement login logic here
    // Example: Send HTTP request to backend for authentication
    // Update UI based on authentication result
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 12),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: login,
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
