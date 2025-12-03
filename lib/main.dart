import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(),
    );
  }
}

// LoginPage
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = TextEditingController();
  final passController = TextEditingController();

  void _login() {
    const correctLogin = 'admin';
    const correctPassword = 'admin';

    if (loginController.text == correctLogin &&
        passController.text == correctPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error!'),
          content: const Text('Errors login or password'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ОК'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Login
              TextField(
                controller: loginController,
                decoration: const InputDecoration(
                  labelText: "Login",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // Password
              TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Button login
              ElevatedButton(
                onPressed: _login,
                child: const Text("Login"),
              ),
              const SizedBox(height: 10),

              // Button restore 
              TextButton(
                onPressed: () {},
                child: const Text("Forgot your password?"),
              ),

              // Button Register
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                child: const Text("Create account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// RegisterPage
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final loginController = TextEditingController();
  final passController = TextEditingController();
  final passRepeatController = TextEditingController();

  void _register() {
    if (passController.text != passRepeatController.text) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: const Text("Error password"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Ready"),
        content: const Text("Account created! You can login."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: loginController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Create a login",
                ),
              ),
              const SizedBox(height: 15),

              TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
              const SizedBox(height: 15),

              TextField(
                controller: passRepeatController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Repeat password",
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _register,
                child: const Text("Registers"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// WelcomePage
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome")),
      body: const Center(
        child: Text(
          "Welcome!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
