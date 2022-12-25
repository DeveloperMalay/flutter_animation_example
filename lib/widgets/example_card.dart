import 'package:flutter/material.dart';

class ExampleCard extends StatefulWidget {
  const ExampleCard({super.key});

  @override
  State<ExampleCard> createState() => _ExampleCardState();
}

class _ExampleCardState extends State<ExampleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      // margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
            'https://images.pexels.com/photos/3792581/pexels-photo-3792581.jpeg?auto=compress&cs=tinysrgb&w=600',
            fit: BoxFit.cover),
      ),
    );
  }
}
