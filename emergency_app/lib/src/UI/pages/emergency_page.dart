import '../widgets/icon_header.dart';
import '../widgets/scrollable_vertical_list.dart';
import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconHeader(
              subtitle: 'esto es el subtítulo',
              title: 'Esto es el TÍTULO',
              icon: Icons.add,
            ),
            ScrollableVerticalList(),
          ],
        ),
      ),
    );
  }
}
