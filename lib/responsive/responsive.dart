import 'package:student_management/constants.dart';
import 'package:flutter/material.dart';

class Responsive extends StatefulWidget {
  final Widget mobileScreen;
  final Widget webScreen;

  const Responsive({super.key, required this.mobileScreen, required this.webScreen});

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder:(context,constraints)
           {
            if(constraints.maxWidth<900){
              isMobile=true;
              isWeb=false;
              return widget.mobileScreen;
            }
            else {
              isMobile=false;
              isWeb=true;
              return widget.webScreen;
            }
           }
    );
    }
}
