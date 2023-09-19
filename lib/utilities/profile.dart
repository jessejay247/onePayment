// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_payment/utilities/image_picker.dart';
import 'package:one_payment/utilities/text_box.dart';

class Profiles extends StatefulWidget {
  const Profiles({super.key});

  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection('user');
  Future<String?> uploadProfileImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images/${DateTime.now()}.jpg');
      final uploadTask = storageRef.putFile(file);

      final TaskSnapshot uploadSnapshot =
          await uploadTask.whenComplete(() => null);

      if (uploadSnapshot.state == TaskState.success) {
        final downloadURL = await storageRef.getDownloadURL();
        return downloadURL;
      } else {
        // Handle image upload failure
        ('Image upload failed');
        return null;
      }
    }
    return null;
  }

  Uint8List _image = Uint8List(0);

  void selectedImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);

    setState(() {
      _image = img;
    });
  }

  Future<void> editField(String field) async {
    String newValue = '';
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit $field",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: GoogleFonts.poppins(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: GoogleFonts.poppins(color: Colors.grey),
          ),
          onChanged: (value) {
            setState(() {
              newValue = value;
            });
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () async {
              String formattedField = formatFieldName(field);
              log('formattedField $formattedField');
              if (newValue.trim().isNotEmpty) {
                await usersCollection
                    .doc(currentUser.email)
                    .update({formattedField: newValue});
                if (mounted) {
                  Navigator.of(context).pop();
                }
              }
            },
            child: Text(
              'Save',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  String formatFieldName(String input) {
    // Split the input string by spaces
    List<String> words = input.split(' ');

    // Capitalize the first word and convert the rest to lowercase
    String formatted = words[0].toLowerCase() +
        words
            .skip(1)
            .map((word) =>
                word[0].toUpperCase() + word.substring(1).toLowerCase())
            .join('');

    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('user')
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;

              return ListView(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: _image != null
                            ? CircleAvatar(
                                radius: 60.0,
                                backgroundImage: MemoryImage(_image),
                              )
                            : const CircleAvatar(
                                radius: 65.0,
                                backgroundImage: NetworkImage(
                                    'https://png.pngitem.com/pimgs/s/421-4212266_transparent-default-avatar-png-default-avatar-images-png.png'),
                              ),
                      ),
                      Positioned(
                        bottom: -6,
                        left: 218,
                        child: IconButton(
                            onPressed: selectedImage,
                            icon: const Icon(
                              Icons.add_a_photo,
                              color: Colors.green,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    currentUser.email!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 22),
                  ),
                  TextBox(
                      text: userData['name'],
                      sectionName: 'Name',
                      onPressed: () => editField('Name')),
                  TextBox(
                      text: userData['dateOfBirth'],
                      sectionName: 'DOB',
                      onPressed: () => editField('Date Of Birth')),
                  TextBox(
                      text: userData['gender'],
                      sectionName: 'Gender',
                      onPressed: () => editField('Gender')),
                  TextBox(
                      text: userData['country'],
                      sectionName: 'Country',
                      onPressed: () => editField('Country')),
                  TextBox(
                      text: userData['state'],
                      sectionName: 'State',
                      onPressed: () => editField('State')),
                  TextBox(
                      text: userData['address'],
                      sectionName: 'Address',
                      onPressed: () => editField('Address')),
                  TextBox(
                      text: userData['phoneNumber'],
                      sectionName: 'Phone Number',
                      onPressed: () => editField('Phone Number')),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('error${snapshot.error}'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class StoreData {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({
    required Uint8List file,
  }) async {
    String resp = "some error occured";
    try {
      if (file.isNotEmpty) {
        String imageUrl = await uploadImageToStorage('imageLink', file);
        ({'imageLink': imageUrl});
        resp = 'success';
      }
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
