import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cards',
      home: Scaffold(
        backgroundColor: Colors.white12.withOpacity(0.85),
        body: Builder(
          builder: (context) => const MyCardApp(),
        ),
      ),
    );
  }
}

class MyCardApp extends StatefulWidget {
  const MyCardApp({super.key});

  @override
  State<MyCardApp> createState() => _MyCardAppState();
}

class _MyCardAppState extends State<MyCardApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'My Cards',
                style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 400,
              height: 240,
              margin: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 9, 56, 111),
                  Color.fromARGB(255, 10, 75, 141),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Stack(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Image(
                              image: AssetImage('assets/images/visa.png')),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    child: Text(
                      'CARD HOLDER NAME',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 1.5,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 45.0,
                    left: 16.0,
                    child: Text(
                      'Mark Rose',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          letterSpacing: 1.2,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 125.0,
                    left: 16.0,
                    child: Text(
                      'CARD NUMBER',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 1.0,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 145.0,
                    left: 16.0,
                    child: Text(
                      '**** **** **** 1234',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          letterSpacing: 1.8,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 190.0,
                    left: 16.0,
                    child: Text(
                      'EXPIRY DATE',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 1.0,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 210.0,
                    left: 16.0,
                    child: Text(
                      '08/25',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: 1.0,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 190.0,
                    right: 16.0,
                    child: Text(
                      'CVV',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                          letterSpacing: 1.5,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 210.0,
                    right: 16.0,
                    child: Text(
                      '123',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: 1.0,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
