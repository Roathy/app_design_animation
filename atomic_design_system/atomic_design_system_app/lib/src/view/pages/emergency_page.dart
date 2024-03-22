import 'package:flutter/material.dart';

import '../widgets/more_vert.dart';
import '../widgets/icon_header.dart';
import '../widgets/scrollable_vertical_list.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ScrollableVerticalList(),
            IconHeader(
              subtitle: 'Esto es el subtítulo',
              title: 'Esto es el TÍTULO',
              icon: Icons.add,
            ),
            MoreVert(),
          ],
        ),
      ),
    );
  }
}
