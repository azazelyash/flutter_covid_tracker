import 'package:flutter/material.dart';

class Global extends StatefulWidget {
  const Global({super.key});

  @override
  State<Global> createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Global',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
