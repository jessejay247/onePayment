// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:one_payment/pages/bottom_nav_bar.dart';

import 'package:one_payment/pages/edit_profile_page.dart';

import 'package:one_payment/utilities/elevated_button.dart';
import 'package:one_payment/utilities/image_picker.dart';
import 'package:one_payment/utilities/store_data.dart';
import 'package:one_payment/utilities/text_input_decoration.dart';

class AddDetailsPage extends StatefulWidget {
  const AddDetailsPage({super.key});

  @override
  State<AddDetailsPage> createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  final formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  Uint8List _image = Uint8List(0);

  void selectedImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);

    setState(() {
      _image = img;
    });
  }

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userDatOfBirthController =
      TextEditingController();
  final TextEditingController userGenderController = TextEditingController();
  final TextEditingController userPhoneNumberController =
      TextEditingController();
  final TextEditingController userCountryController = TextEditingController();
  final TextEditingController userStateController = TextEditingController();
  final TextEditingController userAddressController = TextEditingController();
  final TextEditingController userCityController = TextEditingController();

  void saveProfile() async {
    String name = userNameController.text;
    String dateOfBirth = userDatOfBirthController.text;
    String gender = userGenderController.text;
    String country = userCountryController.text;
    String state = userStateController.text;
    String email = userEmailController.text;
    String phoneNumber = userPhoneNumberController.text;
    String address = userAddressController.text;

    // ignore: unused_local_variable
    String resp = await StoreData().saveData(
        name: name,
        dateOfBirth: dateOfBirth,
        gender: gender,
        country: country,
        state: state,
        email: email,
        phoneNumber: phoneNumber,
        address: address,
        file: _image);

    nextScreenReplace(context, const BottomNavBar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: Container(
                padding: const EdgeInsets.all(11),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: 65,
                                  backgroundImage: MemoryImage(_image),
                                )
                              : const CircleAvatar(
                                  radius: 65,
                                  backgroundImage: NetworkImage(
                                      'https://png.pngitem.com/pimgs/s/421-4212266_transparent-default-avatar-png-default-avatar-images-png.png')),
                          Positioned(
                            bottom: -9,
                            left: 77,
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
                        height: 20,
                      ),
                      MyFormField(
                          data: 'Name',
                          icon: Icons.person,
                          textFieldController: userNameController,
                          onTap: () {}),
                      const SizedBox(
                        height: 20,
                      ),
                      MyFormField(
                        onTap: () {
                          selectDate(context);
                        },
                        data: 'Date Of Birth',
                        icon: Icons.calendar_month,
                        textFieldController: userDatOfBirthController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyFormField(
                        onTap: () {},
                        data: 'Gender',
                        icon: Icons.people_outline,
                        textFieldController: userGenderController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      IntlPhoneField(
                        controller: userPhoneNumberController,
                        decoration: InputDecoration(
                          label: Text(
                            'Phone Number',
                            style: GoogleFonts.poppins(
                                color: Colors.green, fontSize: 20),
                          ),
                          suffixIcon: const Icon(
                            Icons.phone,
                            color: Colors.green,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.green,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                  color: Colors.green.shade200, width: 3)),
                          errorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyFormField(
                          data: 'Country',
                          icon: Icons.flag_circle,
                          textFieldController: userCountryController,
                          onTap: () {}),
                      const SizedBox(
                        height: 20,
                      ),
                      MyFormField(
                          data: 'State',
                          icon: Icons.place,
                          textFieldController: userStateController,
                          onTap: () {}),
                      MyFormField(
                        onTap: () {},
                        data: 'Address',
                        icon: Icons.home,
                        textFieldController: userAddressController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyFormField(
                        onTap: () {},
                        data: 'Email',
                        icon: Icons.email,
                        textFieldController: userEmailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButtonPage(
                          text: 'Save Details', onPressed: saveProfile),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        userDatOfBirthController.text =
            DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }
}
