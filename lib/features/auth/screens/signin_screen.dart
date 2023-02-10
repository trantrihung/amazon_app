// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:amazon_app/constants/global_variable.dart';
import 'package:amazon_app/features/auth/screens/signup_screen.dart';
import 'package:amazon_app/features/auth/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  static const String routeName = "/SignIn-screen";
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthServices authServices = AuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signInUser() {
    authServices.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/amazon_in.png",
                fit: BoxFit.contain,
              ),
              //Hello Guy!
              Text(
                "Hello Guy!",
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                  // textStyle: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Welcome back, you've been missing",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 50),

              //Email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              //Password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: GlobalVariable.secondaryColor,
                  ),
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not a member? ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUp.routeName);
                    },
                    style: TextButton.styleFrom(),
                    child: const Text(
                      "Register now",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
