// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_payment/utilities/buttons.dart';
import 'package:one_payment/utilities/backgroundimage.dart';
import 'package:one_payment/utilities/currency_options.dart';
import 'package:one_payment/utilities/transaction_icon.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  @override
  void initState() {
    super.initState();
    if (auth.currentUser != null) {
      user = auth.currentUser;
    }
  }

  Currency? selectedCurrency;
  double amount = 100.0; // Replace with your actual amount

  String formatCurrency(double amount) {
    return '${selectedCurrency?.symbol}$amount';
  }

// page controller

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                                onTap: () {},
                                child: Icon(Icons.account_circle)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            'Hi',
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            ' ${user?.displayName} ',
                            style: GoogleFonts.montserrat(fontSize: 20),
                          ),
                        ),
                      ],
                    ),

                    // plus button
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                            onTap: () {}, child: Icon(Icons.notifications)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 160,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account Balance',
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 1.3),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                          value: selectedCurrency,
                          items: currencies.map((Currency currency) {
                            return DropdownMenuItem<Currency>(
                              value: currency,
                              child: Text('(${currency.code})'),
                            );
                          }).toList(),
                          onChanged: (Currency? newValue) {
                            setState(() {
                              selectedCurrency = newValue!;
                            });
                          }),
                      //    Text(
                      //    NumberFormat.simpleCurrency(
                      //           locale: 'en-ng', decimalDigits: 0)
                      //       .format(10000),
                      //      style: GoogleFonts.montserrat(
                      //        fontSize: 30,
                      //      fontWeight: FontWeight.w500,
                      //    color: Colors.white,
                      //             letterSpacing: 1.5),
                      //     )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 255,
                child: PageView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Background(imageData: 'assets/images/onlinepayments.jpeg'),
                    Background(imageData: 'assets/images/securee.jpeg'),
                    Background(imageData: 'assets/images/sendfunds.jpeg'),
                    Background(imageData: 'assets/images/cardpay.jpeg'),
                    Background(imageData: 'assets/images/moneychange.jpeg'),
                    Background(imageData: 'assets/images/onlinebank.jpeg'),
                    Background(imageData: 'assets/images/loan.jpeg'),
                    Background(imageData: 'assets/images/customer.png'),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 8,
                effect: ScrollingDotsEffect(
                    activeDotScale: 1.4,
                    activeDotColor: Colors.green,
                    dotColor: Colors.blueGrey,
                    dotHeight: 10,
                    dotWidth: 10),
              ),

              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Buttons(
                      iconImage: 'assets/images/add money.png',
                      iconText: 'Add',
                      iconText2: 'Money',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Buttons(
                      iconImage: 'assets/images/send payment.png',
                      iconText: 'Transfer',
                      iconText2: 'Money',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Buttons(
                      iconImage: 'assets/images/exchange.png',
                      iconText: 'Exchange',
                      iconText2: 'Money',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: TransactionIcons(
                  imageData: 'assets/images/statistics.png',
                  text1: 'Account Summary',
                  text2: 'Breakdown Of All Transactions',
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: TransactionIcons(
                    imageData: 'assets/images/transactions.png',
                    text1: 'Transaction',
                    text2: 'History'),
              ),

              // bottom appbar
            ],
          ),
        ),
      ),
    );
  }
}
