import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClickableSeat extends StatefulWidget {
  @override
  _ClickableSeatState createState() => _ClickableSeatState();
}

class _ClickableSeatState extends State<ClickableSeat> {
  bool isSelected = false;
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          color = (isSelected) ? Colors.blue : Colors.white;
        });
      },
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}