import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/responsive.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Hide AppBar on desktop (side menu visible)
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
        backgroundColor: bgColor,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          ),
        ),
      ),

      drawer: SideMenu(),  // Mobile drawer menu

      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Show side menu only on desktop
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 2,  // Takes 20% of width
                  child: SideMenu(),
                ),

              SizedBox(width: defaultPadding),

              // Main content area
              Expanded(
                flex: 7,  // Takes 70% of width
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...children,  // Dynamic content passed from HomeScreen
                      // Footer can be added here
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}