import 'package:amazon_app/common/widgets/custom_button.dart';
import 'package:amazon_app/common/widgets/custom_textfield.dart';
import 'package:amazon_app/constants/global_variable.dart';
import 'package:amazon_app/features/auth/screens/signin_screen.dart';
import 'package:amazon_app/features/auth/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  static const String routeName = "/SignUp-screen";
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthServices authServices = AuthServices();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
    authServices.signUpUser(
      context: context,
      name: _nameController,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: ListView(
          children: [
            Column(
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

                //* FORM
                Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      // Name textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: CustomTextField(
                            controller: _nameController,
                            hintText: "Name",
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      //Email textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: CustomTextField(
                            controller: _emailController,
                            hintText: "Email",
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
                          child: CustomTextField(
                            controller: _passwordController,
                            hintText: "PassWord",
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      //Sign UP button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: CustomButton(
                          text: "Sign Up",
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signUpUser();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You have account? ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignIn.routeName);
                      },
                      style: TextButton.styleFrom(),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
