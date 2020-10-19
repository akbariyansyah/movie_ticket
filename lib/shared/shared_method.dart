import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_ticket/shared/shared_ui.dart';
import 'package:movie_ticket/ui/widgets/clickable_seat.dart';

List<Icon> writeStar(HexColor color, double rate) {
  List<Icon> stars = [];
  for (var i = 1; i <= rate.toInt() / 1.5; i++) {
    stars.add(Icon(
      Icons.star,
      color: color,
      size: 40,
    ));
  }
  return stars;
}

List<Widget> generateSeat(HexColor white, HexColor blue) {
  List<Widget> seats = [];
  Random random = Random();
  for (int i = 1; i < 25; i++) {
    seats.add(
      (i < random.nextInt(26)
          ? Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.all(15),
              color: Colors.grey,
            )
          : ClickableSeat()),
    );
  }
  return seats;
}

List<Widget> generateDate() {
  List<Widget> dates = [];
  for (int i = 0; i < 7; i++) {
    dates.add(
      Container(
        margin: EdgeInsets.all(5),
        width: 50,
        height: 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
        child: Text(
          (10 + i).toString() + " Nov " + (1 + i).toString() + ".00 PM",
          maxLines: 2,
        ),
      ),
    );
  }
  return dates;
}

List<Widget> writeSeatStatus() {
  List<Widget> seatStatus = [
    Container(
      height: 10,
      width: 10,
      color: Colors.grey,
    ),
    Text("Booked"),
    Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: primaryWhite,
        border: Border.all(color: Colors.grey),
      ),
    ),
    Text("available"),
    Container(
      height: 10,
      width: 10,
      color: Colors.blue,
    ),
    Text("Selected"),
  ];
  return seatStatus;
}