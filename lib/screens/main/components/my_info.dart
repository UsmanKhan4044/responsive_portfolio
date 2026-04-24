import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: Color(0xFF242430),
        child: Column(
          children: [
            Spacer(flex: 3),

            // Profile Avatar
            CircleAvatar(
              radius: 60  ,
              backgroundImage: AssetImage("assets/images/IMG_7344.jpg"),
            ),

            Spacer( flex: 3),

            // Name
            Text(
              "USMAN KHAN",  // Change to your name
              style: Theme.of(context).textTheme.titleSmall,
            ),

            // Title
            Text(
              "Flutter Developer & Founder of\n Your Brand",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                height: 1.3,
                color: Colors.blue,
              ),
            ),
            Spacer(flex:3),
          ],
        ),
      ),
    );
  }
}