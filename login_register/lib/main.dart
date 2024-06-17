import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & Register App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // Set initial route to login page
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: LoginForm(),
    );
  }
}

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

    // Example of sending credentials to a Python server
    _sendCredentials(email, password);
  }

  void _sendCredentials(String email, String password) async {
    String apiUrl =
        'http://localhost:5000/login'; // Replace with your Python server URL

    try {
      final response = await http.post(Uri.parse(apiUrl), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        // Handle successful login
        print('Login successful');
        Navigator.pushReplacementNamed(
            context, '/home'); // Navigate to home page
      } else {
        // Handle other status codes, e.g., show error message
        print('Failed to login');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
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
          SizedBox(height: 12),
          TextButton(
            onPressed: () {
              // Navigate to RegisterPage
              Navigator.pushNamed(context, '/register');
            },
            child: Text('Create an account'),
          ),
        ],
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void register() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Example of sending credentials to a Python server
    _sendCredentials(email, password);
  }

  void _sendCredentials(String email, String password) async {
    String apiUrl =
        'http://localhost:5000/register'; // Replace with your Python server URL

    try {
      final response = await http.post(Uri.parse(apiUrl), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        // Handle successful registration
        print('Registration successful');
        Navigator.pop(context); // Go back to the login screen
      } else {
        // Handle other status codes, e.g., show error message
        print('Failed to register');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
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
            onPressed: register,
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
