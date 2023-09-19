// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:one_payment/pages/forget_password.dart';
import 'package:one_payment/pages/register_page.dart';
import 'package:one_payment/utilities/profile.dart';

import 'package:one_payment/utilities/text_input_decoration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    getPrefInstance();
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  String wrongEmail = 'Wrong email';
  String wrongPassword = 'Wrong Password';

  late SharedPreferences _pref;

  getPrefInstance() async {
    _pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.green),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 70),
                child: Form(
                  key: formKey,
                  // ignore: prefer_const_constructors
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Universal App',
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            letterSpacing: 1.5),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text('Login to make faster payments',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.greenAccent,
                              letterSpacing: 1.2)),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 180,
                        width: 180,
                        child: Image.asset('assets/images/applogo.jpg'),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Email',
                          labelStyle: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.grey[700]),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.green,
                          ),
                        ),
                        onChanged: (val) {
                          setState(() {});
                        },
                        validator: (val) {
                          return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(val!)
                              ? null
                              : "please enter a valid email";
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Password',
                          labelStyle: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.grey[700]),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.green,
                          ),
                        ),
                        validator: (val) {
                          if (val!.length < 6) {
                            return 'password must be at least 6 characters';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {},
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                          child: Text(
                            'Login',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });
                              try {
                                UserCredential userCredential =
                                    await auth.signInWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text);
                                user = userCredential.user;
                                if (user != null) {
                                  _pref.setString(
                                    'email',
                                    _emailController.text,
                                  );
                                  nextScreenReplace(context, const Profiles());
                                } else {}
                                setState(() {
                                  _isLoading = false;
                                });
                              } on FirebaseAuthException catch (e) {
                                if (e.code == wrongEmail) {
                                  ('No user found for that email.');
                                } else if (e.code == wrongPassword) {
                                  ('Wrong password.');
                                }

                                (e);
                                snackBar(context, Colors.red,
                                    ('Error Occured! Check your email and password, and try again making sure you are connected to an internet'));

                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'poppins',
                              fontSize: 15),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Register here",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  nextScreenReplace(
                                      context, const RegisterPage());
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          nextScreenReplace(context, const ForgetPassword());
                        },
                        child: Text(
                          'Forgot password?',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                              color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
