import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:one_payment/pages/profile_page.dart';
import 'package:one_payment/utilities/elevated_button.dart';
import 'package:one_payment/utilities/text_input_decoration.dart';
import 'package:intl/intl.dart';
import 'package:country_picker/country_picker.dart';
import 'package:country_picker_plus/country_picker_plus.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final formKey = GlobalKey<FormState>();

  final userFullNameController = TextEditingController();
  final userDatOfBirthController = TextEditingController();
  final userGenderController = TextEditingController();
  final userPhoneNumberController = TextEditingController();
  final userCountryController = TextEditingController();
  final userStateController = TextEditingController();
  final userAddressController = TextEditingController();
  final userEmailController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  late Country selectedCountry;

  void onSubmit() {
    if (formKey.currentState?.validate() == true) {
      formKey.currentState?.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            nextScreen(context, const ProfilePage());
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
          color: Colors.green,
        ),
        title: Center(
          child: Text(
            'Profile',
            style: GoogleFonts.montserrat(
                color: Colors.grey[900],
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(11),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(
                              image:
                                  AssetImage('assets/images/profilepic.jpg')),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green[400]),
                          child: Icon(
                            LineAwesomeIcons.camera,
                            size: 20,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    child: Column(
                      children: [
                        MyFormField(
                          onTap: () {},
                          data: 'Full Name',
                          icon: Icons.person,
                          textFieldController: userFullNameController,
                        ),
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
                        CountryPickerPlus(
                          isRequired: true,
                          onCountrySelected: (value) {
                            (value);
                          },
                          onCountrySaved: (value) {
                            (value);
                          },
                          countrySearchHintText: 'Search Country',
                          countryHintText: "Country",
                          stateHintText: 'State',
                          cityHintText: "City",
                          onStateSelected: (value) {
                            (value);
                          },
                          onStateSaved: (value) {
                            (value);
                          },
                          onCitySaved: (value) {
                            (value);
                          },
                          onCitySelected: (value) {
                            (value);
                          },
                          decoration: CPPFDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.green)),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.green,
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 3),
                              ),
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 20, color: Colors.green),
                              suffixColor: Colors.green,
                              margin: const EdgeInsets.only(bottom: 20)),
                          bottomSheetDecoration: CPPBSHDecoration(
                            closeColor: Colors.blue,
                            itemDecoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.03),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            itemsPadding: const EdgeInsets.all(8),
                            itemsSpace: const EdgeInsets.symmetric(vertical: 4),
                            itemTextStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.grey.withOpacity(0.1)),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
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
                      ],
                    ),
                  ),
                  ElevatedButtonPage(
                      text: 'Save',
                      onPressed: () {
                        onSubmit();
                        nextScreenReplace(context, const ProfilePage());
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(19),
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

// ignore: must_be_immutable
class MyFormField extends StatefulWidget {
  MyFormField({
    Key? key,
    required this.data,
    required this.icon,
    required this.textFieldController,
    required this.onTap,
  }) : super(key: key);
  final String data;
  final IconData icon;
  TextEditingController textFieldController = TextEditingController();
  final Function() onTap;

  @override
  State<MyFormField> createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        if (val!.isNotEmpty) {
          return null;
        } else {
          return "Field cannot be empty";
        }
      },
      onTap: widget.onTap,
      controller: widget.textFieldController,
      decoration: InputDecoration(
        label: Text(
          widget.data,
          style: GoogleFonts.poppins(color: Colors.green, fontSize: 20),
        ),
        suffixIcon: Icon(
          widget.icon,
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
            borderSide: BorderSide(color: Colors.green.shade200, width: 3)),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 3),
        ),
      ),
    );
  }

  String? validator(String? value) {
    return null;
  }
}
