import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/floating_menu.dart';

final scrollDirectionProvider = StateProvider<bool>((ref) => false);

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ))
            ],
          ),
          body: const Stack(children: [
            PinterestGrid(),
            _BottomCenterMenu(),
          ])),
    );
  }
}

class PinterestGrid extends ConsumerStatefulWidget {
  const PinterestGrid({super.key});

  @override
  ConsumerState<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends ConsumerState<PinterestGrid> {
  final ScrollController controller = ScrollController();

  final List<int> items = List.generate(201, (index) => index);

  @override
  void initState() {
    controller.addListener(() {
      // ScrollDirection.reverse is down || ScrollDirection.forward is up
      ref.read(scrollDirectionProvider.notifier).state = controller.position.userScrollDirection == ScrollDirection.reverse;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: MasonryGridView.count(
        controller: controller,
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _Tile(
            index: index,
            extent: (index % 3 + 1) * 100,
          );
        },
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.index,
    required this.extent,
  });
  final int index;
  final double extent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: extent,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(9),
        ),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _BottomCenterMenu extends StatelessWidget {
  const _BottomCenterMenu({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: FloatingMenu(),
        ));
  }
}
