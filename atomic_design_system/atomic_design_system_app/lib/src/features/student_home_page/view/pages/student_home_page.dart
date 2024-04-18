import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/avatar_popup_menu.dart';
import '../widgets/vertical_sliver_list.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 1.0, leading: const Center(child: FaIcon(FontAwesomeIcons.cube)), shape: const Border(bottom: BorderSide(color: Colors.black12, width: 1.0)), actions: const [
        Icon(
          Icons.groups,
          color: Colors.black45,
        ),
        Row(children: [
          SizedBox(width: 12),
          Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          Text('Exp 999'),
          SizedBox(width: 12),
        ]),
        AvatarPopupMenu(),
        SizedBox(width: 12),
      ]),
      body: const SafeArea(
        child: Stack(children: [
          VerticalSliverList(),
        ]),
      ),
    );
  }
}
