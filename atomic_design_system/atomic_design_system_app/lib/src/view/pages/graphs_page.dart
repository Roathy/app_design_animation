import 'package:flutter/material.dart';
import '../widgets/radial_progress.dart';

class GraphsPage extends StatefulWidget {
  const GraphsPage({super.key});

  @override
  State<GraphsPage> createState() => _GraphsPageState();
}

class _GraphsPageState extends State<GraphsPage> {
  double percent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          setState(() {
            percent += 5;
            if (percent > 100) {
              percent = 0.0;
            }
          });
        },
        child: const Icon(Icons.refresh_sharp),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(percent: percent, progressColor: Colors.blue),
              CustomRadialProgress(
                percent: percent,
                progressColor: Colors.pink,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                percent: percent,
                progressColor: Colors.green,
              ),
              CustomRadialProgress(
                percent: percent,
                progressColor: Colors.yellow,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final double percent;
  final Color progressColor;
  const CustomRadialProgress({
    super.key,
    required this.percent,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(color: Colors.white),
      child: RadialProgress(
        percent: percent,
        // circleColor: Colors.grey,
        progressColor: progressColor,
        // progressStrokeWidth: 4.5,
      ),
    );
  }
}
