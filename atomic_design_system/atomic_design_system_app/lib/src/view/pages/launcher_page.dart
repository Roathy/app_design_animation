import 'package:flutter/material.dart';

import '../../repositories/route_button_repository.dart';
import '../../data/route_button.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Designs & Animations'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
                height: 210,
                width: double.infinity,
                padding: const EdgeInsets.all(21),
                child: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('JEVM', style: TextStyle(fontSize: 51, color: Colors.white)),
                )),
            Expanded(child: _OptionsList()),
            ListTile(
                leading: const Icon(Icons.lightbulb_outline_rounded, color: Colors.blue),
                title: const Text('Dark Mode'),
                trailing: Switch.adaptive(
                  activeColor: Colors.blue,
                  value: true,
                  onChanged: (value) {},
                ),
                onTap: () {}),
            SafeArea(
              bottom: true,
              top: false,
              child: ListTile(
                  leading: const Icon(Icons.dashboard_customize_outlined, color: Colors.blue),
                  title: const Text('Custom Theme'),
                  trailing: Switch.adaptive(
                    activeColor: Colors.blue,
                    value: false,
                    onChanged: (value) {},
                  ),
                  onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionsList extends StatelessWidget {
  final List<RouteButton> buttonDataList = RouteButtonRepository().getRouteButtons();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => ListTile(
        leading: Icon(buttonDataList[index].icon),
        title: Text(buttonDataList[index].title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return buttonDataList[index].page;
            },
          ));
        },
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: buttonDataList.length,
    );
  }
}
