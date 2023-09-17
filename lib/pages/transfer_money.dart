import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_payment/utilities/elevated_button.dart';

class TransferMoneyPage extends StatefulWidget {
  const TransferMoneyPage({super.key});

  @override
  State<TransferMoneyPage> createState() => _TransferMoneyPageState();
}

class _TransferMoneyPageState extends State<TransferMoneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.green,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Send Money',
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.history,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Select Bank',
                    labelStyle:
                        const TextStyle(color: Colors.green, fontSize: 18),
                    suffixIcon: GestureDetector(
                      child: const Icon(
                        Icons.search_rounded,
                        color: Colors.greenAccent,
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Account Number',
                    labelStyle:
                        const TextStyle(color: Colors.green, fontSize: 18),
                    suffixIcon: GestureDetector(
                      child: const Icon(
                        Icons.format_list_numbered_outlined,
                        color: Colors.greenAccent,
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Amount',
                    labelStyle:
                        const TextStyle(color: Colors.green, fontSize: 18),
                    suffixIcon: GestureDetector(
                      child: const Icon(
                        Icons.money,
                        color: Colors.greenAccent,
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Narration',
                    labelStyle:
                        const TextStyle(color: Colors.green, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButtonPage(text: 'Send', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
