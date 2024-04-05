import 'package:flutter/material.dart';

enum StudentAction {
  profile,
  help,
  logout
}

class AvatarPopupMenu extends StatefulWidget {
  const AvatarPopupMenu({super.key});

  @override
  State<AvatarPopupMenu> createState() => _AvatarPopupMenuState();
}

class _AvatarPopupMenuState extends State<AvatarPopupMenu> with SingleTickerProviderStateMixin {
  StudentAction? selectedItem;

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.fastEaseInToSlowEaseOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      )),
      child: Material(
        type: MaterialType.card,
        surfaceTintColor: Colors.black,
        elevation: 4,
        child: PopupMenuButton<StudentAction>(
            constraints: BoxConstraints.tight(const Size(120, 160)),
            surfaceTintColor: Colors.white,
            iconColor: Colors.black,
            icon: CircleAvatar(
                maxRadius: 15,
                backgroundColor: Colors.deepOrange[900],
                child: const Text(
                  'J',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )),
            onSelected: (StudentAction item) {
              setState(() {
                selectedItem = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<StudentAction>>[
                  PopupMenuItem<StudentAction>(
                      value: StudentAction.profile,
                      child: Text(
                        'Your profile',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.lightBlue[300]),
                      )),
                  PopupMenuItem<StudentAction>(
                      value: StudentAction.help,
                      child: Text(
                        'Help & Support',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.lightBlue[300]),
                      )),
                  PopupMenuItem<StudentAction>(
                      value: StudentAction.logout,
                      child: Text(
                        'Logout',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.lightBlue[300]),
                      ))
                ]),
      ),

      // opacity: _fadeAnimation,
      // child: PopupMenuButton<StudentAction>(
      //     constraints: BoxConstraints.tight(const Size(120, 160)),
      //     surfaceTintColor: Colors.white,
      //     iconColor: Colors.black,
      //     icon: CircleAvatar(
      //         maxRadius: 15,
      //         backgroundColor: Colors.deepOrange[900],
      //         child: const Text(
      //           'J',
      //           style: TextStyle(fontSize: 18, color: Colors.black),
      //         )),
      //     // initialValue: selectedItem,
      //     onSelected: (StudentAction item) {
      //       setState(() {
      //         selectedItem = item;
      //       });
      //     },
      //     itemBuilder: (BuildContext context) => <PopupMenuEntry<StudentAction>>[
      //           PopupMenuItem<StudentAction>(
      //               value: StudentAction.profile,
      //               child: Text(
      //                 'Your profile',
      //                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.lightBlue[300]),
      //               )),
      //           PopupMenuItem<StudentAction>(
      //               value: StudentAction.help,
      //               child: Text(
      //                 'Help & Support',
      //                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.lightBlue[300]),
      //               )),
      //           PopupMenuItem<StudentAction>(
      //               value: StudentAction.logout,
      //               child: Text(
      //                 'Logout',
      //                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.lightBlue[300]),
      //               ))
      //         ]),
    );
  }
}
