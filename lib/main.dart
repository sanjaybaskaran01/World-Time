import 'package:flutter/material.dart';
import 'package:worldtime/screens/choose_location.dart';
import 'package:worldtime/screens/home.dart';
import 'package:worldtime/screens/loading.dart';

void main() {
  runApp(MaterialApp(
    title: "World Time App",
    // initialRoute: '/home',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location':(context) => const ChooseLocation(),
    },
  ));
}
