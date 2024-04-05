import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: const Text('PAGE TWO'),
      ),
      body: const Center(
        child: Text('PAGE TWO'),
      ),
    );
  }
}
