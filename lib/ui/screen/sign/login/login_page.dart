// ignore_for_file: sized_box_for_whitespace, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:garduationproject/ui/screen/sign/signup/signup-doctor/sign_up_doctor.dart';
import 'package:garduationproject/ui/screen/sign/signup/signup-parent/sign_up_parent.dart';
import 'package:garduationproject/ui/util/app_assets.dart';
import 'package:garduationproject/ui/util/build_elevated_button.dart';
import 'package:garduationproject/ui/util/build_text_field.dart';
import 'package:garduationproject/ui/widget/choosing_login.dart';

class LoginPage extends StatefulWidget {
  final String user;
  final Color color;

  const LoginPage({super.key, required this.user, required this.color});

  @override
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
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(0),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              AppAssets.backIcon,
              height: 30,
              width: 30,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xff5977d3),
                radius: 25,
                child: Image.asset(
                  color: Colors.white,
                  widget.user == 'Doctor'
                      ? AppAssets.doctorIcon
                      : AppAssets.userTickIcon,
                  width: 16,
                  height: 16,
                ),
              ),
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
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Together to provide a safe and loving environment\nfor growth and support.\nSign in as part of your child\'s support team',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              buildTextFiled(
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    AppAssets.cancelIcon,
                    width: 18,
                    height: 18,
                  ),
                ),
                'eneter your email please',
                BorderRadius.circular(10),
              ),
              const SizedBox(height: 10),
              buildTextFiled(
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          AppAssets.eyelIcon,
                          width: 22,
                          height: 22,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          AppAssets.cancelIcon,
                          width: 22,
                          height: 22,
                        ),
                      ],
                    ),
                  ),
                ),
                'eneter password please ',
                BorderRadius.circular(10),
              ),
              if (!isLogin) ...[
                const SizedBox(height: 10),
                buildTextFiled(
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      AppAssets.cancelIcon,
                      width: 18,
                      height: 18,
                    ),
                  ),
                  'enter your phone Number',
                  BorderRadius.circular(10),
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
              TextButton(
                onPressed: () {
                  if (widget.user == 'Doctor') {
                    Navigator.pushNamed(context, SignUpDoctor.routeName);
                  } else {
                    Navigator.pushNamed(context, SignUpParent.routeName);
                  }
                },
                child: const Text(
                  'haven`t account?',
                  style: TextStyle(
                    color: Color(0xffa7a6a6),
                  ),
                ),
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
              buildElevatedButton('login', const Color(0xff5c7ad4), 40, 350),
            ],
          ),
        ),
      ),
    );
  }
}
