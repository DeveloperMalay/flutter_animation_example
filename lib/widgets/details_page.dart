import 'package:aniamtion_example/new_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'flow_animation_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const NewScreen();
                }));
              },
              child: Image.network(
                  'https://images.pexels.com/photos/3792581/pexels-photo-3792581.jpeg?auto=compress&cs=tinysrgb&w=600'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Details page title',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                ' Photos contain exif data that can give you useful information about the picture. Information such as shutter speed and focal length are stored inside an image. Likewise, you can find out where the photo was taken by looking at the location information .An online exif data reader can show you all these hidden information. ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
