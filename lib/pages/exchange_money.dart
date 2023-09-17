import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_payment/utilities/elevated_button.dart';

class ExchangeMoneyPage extends StatefulWidget {
  const ExchangeMoneyPage({super.key});

  @override
  State<ExchangeMoneyPage> createState() => _ExchangeMoneyPageState();
}

class _ExchangeMoneyPageState extends State<ExchangeMoneyPage> {
  String? _selected;
  String? selected;
  final List<Map> _currency = [
    {'id': '1', 'name': 'USD'},
    {'id': '2', 'name': 'EUR'},
    {'id': '3', 'name': 'GBP'},
    {'id': '4', 'name': 'AUS'},
    {'id': '5', 'name': 'AUD'},
    {'id': '6', 'name': 'JPY'},
    {'id': '7', 'name': 'CHF'},
    {'id': '8', 'name': 'CAD'},
    {'id': '9', 'name': 'HKD'},
    {'id': '10', 'name': 'NZD'},
    {'id': '11', 'name': 'SGD'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    'Exchange Currency',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                        letterSpacing: 1.5),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                    color: Colors.grey[200],
                    height: 150,
                    width: 150,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'From',
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.green),
                          ),
                        ),
                        Center(
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                value: _selected,
                                onChanged: (value) {
                                  setState(() {
                                    _selected = value;
                                  });
                                },
                                hint: Center(
                                  child: Text('Currency',
                                      style: GoogleFonts.montaga(fontSize: 15)),
                                ),
                                items: _currency.map((currencyItem) {
                                  return DropdownMenuItem(
                                    value: currencyItem['id'].toString(),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(currencyItem['name']),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: const Icon(Icons.swap_horiz),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                    color: Colors.grey[200],
                    height: 150,
                    width: 150,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'To',
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.green),
                          ),
                        ),
                        Center(
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                value: selected,
                                onChanged: (value) {
                                  setState(() {
                                    selected = value;
                                  });
                                },
                                hint: Center(
                                  child: Text('Currency',
                                      style: GoogleFonts.montaga(fontSize: 15)),
                                ),
                                items: _currency.map((currencyItem) {
                                  return DropdownMenuItem(
                                    value: currencyItem['id'].toString(),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(currencyItem['name']),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Amount To Change',
                  labelStyle: TextStyle(color: Colors.grey[900], fontSize: 18),
                  suffixIcon: const Icon(
                    Icons.money,
                    color: Colors.green,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Changed Value ',
                  labelStyle: TextStyle(color: Colors.grey[900], fontSize: 18),
                  suffixIcon: const Icon(
                    Icons.money,
                    color: Colors.green,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButtonPage(text: 'Exchange', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
