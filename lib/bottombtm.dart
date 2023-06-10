import 'package:flutter/material.dart';

import 'constants.dart';

class Bottombtn extends StatelessWidget {
  const Bottombtn({super.key, this.ontaop, this.text});
  final Function()? ontaop;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontaop,
      child: Container(
        color: Colors.yellow,
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Center(
            child: Text(
          text!,
          style: bottom,
        )),
      ),
    );
  }
}
