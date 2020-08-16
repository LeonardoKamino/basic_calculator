import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({this.text, this.color, this.onPressed, this.flex, this.icon});
  final String text;
  final int flex;
  final Color color;
  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: FlatButton(
            onPressed: onPressed,
            child: text != null
                ? Text(
                    text,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  )
                : Icon(
                    icon,
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
