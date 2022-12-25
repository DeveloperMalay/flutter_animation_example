import 'package:aniamtion_example/widgets/example_card.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'widgets/details_page.dart';
import 'widgets/flow_animation_widget.dart';

class AnimationsExample extends StatefulWidget {
  const AnimationsExample({super.key});

  @override
  State<AnimationsExample> createState() => _AnimationsExampleState();
}

class _AnimationsExampleState extends State<AnimationsExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('animation example'),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3.05 / 4.9,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: OpenContainer(
                  // closedColor: Colors.blue,
                  // openColor: Color.fromARGB(255, 195, 192, 170),
                  closedElevation: 10.0,
                  openElevation: 15.0,
                  // closedShape: const RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  // ),
                  transitionType: ContainerTransitionType.fade,
                  transitionDuration: const Duration(milliseconds: 500),
                  openBuilder: (context, action) {
                    return const DetailPage();
                  },
                  closedBuilder: (context, action) {
                    return const ExampleCard();
                  },
                ),
              ),
            ),
          ),
        ],
      )),
      floatingActionButton: const FlowAnimationWidget(),
    );
  }
}
