import 'package:flutter/material.dart';

class DebugAssets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("ASSET DEBUG TEST", style: TextStyle(fontSize: 24)),

          Divider(),
          Text("Testing Images:", style: TextStyle(fontSize: 18)),

          // Test Background Image
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/images/bg.jpeg",
              height: 100,
              errorBuilder: (context, error, stackTrace) =>
                  Text("❌ bg.jpeg NOT FOUND", style: TextStyle(color: Colors.red)),
            ),
          ),

          // Test Profile Image
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/images/IMG_7344.jpg",
              height: 100,
              errorBuilder: (context, error, stackTrace) =>
                  Text("❌ IMG_7344.jpg NOT FOUND", style: TextStyle(color: Colors.red)),
            ),
          ),

          Divider(),
          Text("Testing SVG Icons:", style: TextStyle(fontSize: 18)),

          // Test SVG Icons Grid
          Wrap(
            children: [
              _testSvg('check.svg'),
              _testSvg('download.svg'),
              _testSvg('github.svg'),
              _testSvg('linkedin.svg'),
              _testSvg('twitter.svg'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _testSvg(String filename) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      color: Colors.grey[200],
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
      try {
      SvgPicture.asset("assets/icons/$filename", height: 30);
      } catch (e) {
    Text("❌ $filename");
    },
      Text(filename, style: TextStyle(fontSize: 10)),
      ],
    ),
    );
  }
}