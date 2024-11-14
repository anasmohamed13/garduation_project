import 'package:flutter/material.dart';
import 'package:garduationproject/ui/widget/choosing_login.dart';
import 'package:garduationproject/ui/widget/login_tabs.dart';

class LoginPage extends StatefulWidget {
  final String user;
  final Color color;

  const LoginPage({super.key, required this.user, required this.color});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true;

  void toggleLoginSignUp(bool isLoginSelected) {
    setState(() {
      isLogin = isLoginSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_circle_left_rounded)),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login or \nSign Up as a',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.user,
                style: TextStyle(
                    color: widget.color,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Together to provide a safe and loving environment\nfor growth and support.\nSign in as part of your child\'s support team',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              LoginTabs(
                isLogin: isLogin,
                onToggle: toggleLoginSignUp,
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'parentAgent@gmail.com',
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: const Icon(Icons.close),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'password',
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: const Icon(Icons.close),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: true,
              ),
              if (!isLogin) ...[
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: const Icon(Icons.close),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        hoverColor: const Color(0xffa7a6a6),
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text(
                        'Save login info',
                        style: TextStyle(
                          color: Color(0xffa7a6a6),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Color(0xffa7a6a6),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: const Color(0xffa7a6a6),
                    height: 1,
                    width: 120,
                  ),
                  const Text(
                    'or',
                    style: TextStyle(
                      color: Color(0xffa7a6a6),
                    ),
                  ),
                  Container(
                    color: const Color(0xffa7a6a6),
                    height: 1,
                    width: 120,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const ChoosingLogin(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: Text(isLogin ? 'Log in' : 'Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}