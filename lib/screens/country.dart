import 'package:flutter/material.dart';

class Country extends StatefulWidget {
  const Country({super.key});

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Country',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
