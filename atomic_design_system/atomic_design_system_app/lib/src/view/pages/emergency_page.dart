import 'package:flutter/material.dart';

import '../widgets/icon_header.dart';
import '../widgets/scrollable_vertical_list.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(backgroundColor: Colors.transparent, automaticallyImplyLeading: false, actions: [
          Column(children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            // const MoreVert(),
          ]),
        ]),
        body: const Stack(
          children: [
            ScrollableVerticalList(),
            IconHeader(
              subtitle: 'Esto es el subtítulo',
              title: 'Esto es el TÍTULO',
              icon: Icons.add,
            ),
          ],
        ),
      ),
    );
  }
}
