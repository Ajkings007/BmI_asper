import 'constants.dart';
import 'package:flutter/material.dart';

class iconwithtext extends StatelessWidget {
  iconwithtext({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: lableText,
        )
      ],
    );
  }
}

class reuse_card extends StatelessWidget {
  reuse_card({required this.colour, this.cardchild, this.onpress});
  final Color colour;
  final Widget? cardchild;
  final void Function()? onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
        child: cardchild,
      ),
    );
  }
}
