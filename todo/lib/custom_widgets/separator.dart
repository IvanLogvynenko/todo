import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromRGBO(0xc2, 0xc2, 0xc2, 1.0),
          ),
          width: 2,
          height: constraints.maxHeight * 0.8,
        );
      },
    );
  }
}
