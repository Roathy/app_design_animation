import '../../providers/floating_menu_provider.dart';
import '../pages/pinterest_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Button {
  final VoidCallback onPressed;
  final IconData icon;

  Button({required this.onPressed, required this.icon});
}

class FloatingMenu extends ConsumerWidget {
  FloatingMenu({
    super.key,
  });

  final List<Button> buttons = [
    Button(onPressed: () {}, icon: Icons.pie_chart),
    Button(onPressed: () {}, icon: Icons.search),
    Button(onPressed: () {}, icon: Icons.notifications),
    Button(onPressed: () {}, icon: Icons.supervised_user_circle),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool show = ref.watch(scrollDirectionProvider);
    return AnimatedOpacity(
      opacity: show ? 0.0 : 1.0,
      duration: const Duration(microseconds: 300),
      child: MenuBackground(buttons: buttons),
    );
  }
}

class MenuBackground extends StatelessWidget {
  const MenuBackground({
    super.key,
    required this.buttons,
  });

  final List<Button> buttons;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      height: 39,
      width: 210,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 15,
            spreadRadius: -6,
            offset: Offset(0, 3),
          ),
        ],
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: MenuBtnsBuilder(buttons: buttons),
    );
  }
}

class MenuBtnsBuilder extends StatelessWidget {
  const MenuBtnsBuilder({
    super.key,
    required this.buttons,
  });

  final List<Button> buttons;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        buttons.length,
        (index) => _Button(index, buttons[index]),
      ),
    );
  }
}

class _Button extends ConsumerWidget {
  final int index;
  final Button button;
  const _Button(this.index, this.button);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBtn = ref.watch(currentBtnProvider);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        ref.read(currentBtnProvider.notifier).setCurrentBtn(index);
        button.onPressed;
      },
      child: Icon(
        size: currentBtn == index ? 24 : 18,
        button.icon,
        color: currentBtn == index ? Colors.black : Colors.grey,
      ),
    );
  }
}
