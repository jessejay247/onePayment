// ignore_for_file: use_build_context_synchronousl

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_payment/pages/login_page.dart';
import 'package:one_payment/utilities/profile.dart';
import 'package:one_payment/utilities/text_input_decoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final TextEditingController datOfBirthController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController userCityController = TextEditingController();

  bool _isLoading = false;

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final formKey = GlobalKey<FormState>();

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
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 40),
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
                        height: 10,
                      ),
                      SizedBox(
                        height: 20,
                        child: Text(
                          'Join now to make fast payments',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent,
                              letterSpacing: 1.2),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset('assets/images/applogo.jpg'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailController,
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
                        height: 20,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Full Name',
                          labelStyle: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.grey[700]),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.green,
                          ),
                        ),
                        onChanged: (val) {
                          setState(() {});
                        },
                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return "Full name cannot be empty";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
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
                              // ignore: deprecated_member_use
                              backgroundColor: Colors.green,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                          child: Text(
                            'Register',
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
                                    await auth.createUserWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text);

                                await FirebaseFirestore.instance
                                    .collection('user')
                                    .doc(userCredential.user?.email)
                                    .set({
                                  'name': nameController.text,
                                  'dateOfBirth': datOfBirthController.text,
                                  'gender': genderController.text,
                                  'phoneNumber': phoneNumberController.text,
                                  'country': countryController.text,
                                  'state': stateController.text,
                                  'address': addressController.text,
                                  'email': emailController.text,
                                });

                                if (context.mounted) {
                                  nextScreenReplace(context, const Profiles());
                                }

                                setState(() {
                                  _isLoading = false;
                                });
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'error') {}

                                (e);
                                // ignore: use_build_context_synchronously
                                snackBar(context, Colors.red, e);

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
                            text: "Alredy have an account? ",
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'poppins',
                                fontSize: 15),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Login here",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      nextScreenReplace(
                                          context, const LoginPage());
                                    }),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
