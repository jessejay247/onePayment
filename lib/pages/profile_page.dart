import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:one_payment/pages/edit_profile_page.dart';
import 'package:one_payment/pages/user_management_page.dart';
import 'package:one_payment/utilities/elevated_button.dart';
import 'package:one_payment/utilities/text_input_decoration.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            nextScreen(context, const UserManagementPage());
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
          color: const Color.fromARGB(255, 10, 124, 16),
        ),
        title: Center(
          child: Text(
            'Profile',
            style: GoogleFonts.poppins(
                color: Colors.grey[900],
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
              padding: const EdgeInsets.all(11),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButtonPage(
                        text: 'Edit Profile',
                        onPressed: () {
                          nextScreen(context, const EditProfilePage());
                        }),
                    const SizedBox(
                      height: 50,
                    ),
                  ])),
        ),
      ),
    ));
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.grey[100]),
        child: Icon(
          icon,
          color: const Color.fromARGB(255, 10, 124, 16),
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 20, fontWeight: FontWeight.w500, color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey[100]),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                size: 20,
                color: Color.fromARGB(255, 10, 124, 16),
              ),
            )
          : null,
    );
  }
}
