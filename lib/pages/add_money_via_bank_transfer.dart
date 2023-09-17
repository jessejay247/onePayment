import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_payment/utilities/elevated_button.dart';

class BankTransferAccountTopUp extends StatelessWidget {
  const BankTransferAccountTopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Add Money',
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.green),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 350,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200]),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      AddMoneyByBankTransfer(
                          icon: Icons.business,
                          text1: 'Bank Name',
                          text2: 'Universal App'),
                      SizedBox(
                        height: 15,
                      ),
                      AddMoneyByBankTransfer(
                          icon: Icons.format_list_numbered,
                          text1: 'Universal Account Number',
                          text2: '803948473'),
                      SizedBox(
                        height: 15,
                      ),
                      AddMoneyByBankTransfer(
                          icon: Icons.person,
                          text1: 'Account name',
                          text2: 'Mark luck')
                    ],
                  ),
                ),
              ),
              ElevatedButtonPage(text: 'Search', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class AddMoneyByBankTransfer extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String text2;
  const AddMoneyByBankTransfer({
    Key? key,
    required this.icon,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 20,
                    spreadRadius: -3)
              ],
            ),
            child: Icon(
              icon,
              color: const Color.fromARGB(255, 13, 141, 17),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
              child: Text(
                text1,
                style: GoogleFonts.poppins(
                    fontSize: 15, letterSpacing: 1, color: Colors.grey[800]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Text(
                text2,
                style: GoogleFonts.poppins(
                    fontSize: 20, color: Colors.grey[900], letterSpacing: 1),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
