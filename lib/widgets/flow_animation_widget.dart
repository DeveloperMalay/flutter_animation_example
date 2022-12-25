import 'package:flutter/material.dart';

const bottomSize = 50.0;

class FlowAnimationWidget extends StatefulWidget {
  const FlowAnimationWidget({super.key});

  @override
  State<FlowAnimationWidget> createState() => _FlowAnimationWidgetState();
}

class _FlowAnimationWidgetState extends State<FlowAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(controller: controller),
      children: <IconData>[
        Icons.menu,
        Icons.mail,
        Icons.call,
        Icons.notifications,
      ].map(buildItem).toList(),
    );
  }

  Widget buildItem(IconData icon) => SizedBox(
        height: bottomSize,
        width: bottomSize,
        child: FloatingActionButton(
          elevation: 0,
          splashColor: Colors.black,
          onPressed: () {
            controller.status == AnimationStatus.completed
                ? controller.reverse()
                : controller.forward();
          },
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
      );
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controller;

  FlowMenuDelegate({required this.controller}) : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width - bottomSize;
    final yStart = size.height - bottomSize;
    for (int i = context.childCount - 1; i >= 0; i--) {
      const margin = 8;
      final childSize = context.getChildSize(i)!.width;
      final dx = (childSize + margin) * i;
      final x = xStart - dx * 0.7 * controller.value;
      final y = yStart - dx * 0.7 * controller.value;
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) => false;
}
