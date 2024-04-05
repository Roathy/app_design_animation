import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text('PAGE ONE'),
      ),
      body: const Center(
        child: Text('THIS IS PAGE ONE'),
      ),
    );
  }
}
