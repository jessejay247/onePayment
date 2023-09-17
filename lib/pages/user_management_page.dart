// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_payment/pages/bottom_nav_bar.dart';

import 'package:one_payment/pages/login_page.dart';
import 'package:one_payment/pages/profile_page.dart';
import 'package:one_payment/utilities/text_input_decoration.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  @override
  void initState() {
    super.initState();
    if (auth.currentUser != null) {
      user = auth.currentUser;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            nextScreen(context, const BottomNavBar());
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color.fromARGB(255, 10, 124, 16),
        ),
        title: Center(
          child: Text(
            'Account Management',
            style: GoogleFonts.montserrat(
                color: Colors.green, fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ProfileItem(
                  title: 'Change Transfer Pin',
                  icon: Icons.format_list_numbered,
                  onPress: () {},
                  textColor: const Color.fromARGB(255, 10, 124, 16),
                ),
                const SizedBox(
                  height: 35,
                ),
                ProfileItem(
                  title: 'Change Password',
                  icon: Icons.password,
                  onPress: () {},
                  textColor: const Color.fromARGB(255, 10, 124, 16),
                ),
                const SizedBox(
                  height: 35,
                ),
                ProfileItem(
                  title: 'User Profile',
                  icon: Icons.person,
                  onPress: () {
                    nextScreen(context, const ProfilePage());
                  },
                  textColor: const Color.fromARGB(255, 10, 124, 16),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: Colors.green),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      nextScreenReplace(context, const LoginPage());
                    },
                    child: Text(
                      'Log Out',
                      style: GoogleFonts.poppins(
                          fontSize: 28, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Customer Support',
                    style: GoogleFonts.montserrat(
                        fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text.rich(
                  TextSpan(
                    text: "onepayment@gmail.com",
                    style: GoogleFonts.montserrat(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text.rich(
                  TextSpan(
                    text: "08066363667",
                    style: GoogleFonts.montserrat(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text.rich(
                  TextSpan(
                    text: "Chat a customer service personel",
                    style: GoogleFonts.montserrat(
                        color: const Color.fromARGB(255, 10, 124, 16),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    recognizer: TapGestureRecognizer()..onTap = () {},
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
