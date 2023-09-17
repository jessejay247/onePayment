import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_payment/pages/edit_profile_page.dart';
import 'package:one_payment/utilities/elevated_button.dart';
import 'package:one_payment/utilities/text_input_decoration.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  final userStream =
      FirebaseFirestore.instance.collection('userProfile').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: StreamBuilder(
            stream: userStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('error');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Loading...');
              }
              var docs = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(height: 20.0),
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              NetworkImage(docs[index]['imageLink']),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          docs[index]['name'],
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          docs[index]['email'],
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          docs[index]['dateOfBirth'],
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          docs[index]['gender'],
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          docs[index]['phoneNumber'],
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          docs[index]['country'],
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          docs[index]['state'],
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          docs[index]['address'],
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
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
                      ],
                    );
                  });
            }),
      ),
    );
  }
}
