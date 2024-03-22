import 'package:flutter/material.dart';

class MoreVert extends StatelessWidget {
  const MoreVert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: -3,
        right: -24,
        child: RawMaterialButton(
          onPressed: () {},
          shape: const CircleBorder(),
          // padding: const EdgeInsets.all(0),
          child: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ));
  }
}
