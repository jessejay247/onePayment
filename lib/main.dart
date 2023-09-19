// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:one_payment/pages/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utilities/profile.dart';

// import 'pages/homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    getPrefInstance();
    super.initState();
  }

  late SharedPreferences _pref;

  getPrefInstance() async {
    _pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startPage(),
    );
  }

  startPage() {
    final String? userEmail = _pref.getString('email');
    log('userEmail $userEmail');
    if (userEmail == null) {
      return RegisterPage();
    } else {
      return Profiles();
    }
  }
}
