import 'dart:math';
import 'file:///D:/enigma/Flutter/flutter-basic/movie_ticket/lib/ui/pages/confirmation_page.dart';
import 'package:customtogglebuttons/customtogglebuttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_ticket/shared/shared_method.dart';
import 'package:movie_ticket/shared/shared_ui.dart';
import 'package:movie_ticket/ui/widgets/clickable_seat.dart';

class OrderTicketPage extends StatefulWidget {
  final String title;
  OrderTicketPage(this.title);
  @override
  _OrderTicketPageState createState() => _OrderTicketPageState(this.title);
}

class _OrderTicketPageState extends State<OrderTicketPage> {
  final String title;
  _OrderTicketPageState(this.title);

  List<Widget> scheduleList = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 20),
            child: Text(
              title,
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CustomToggleButtons(
                  spacing: 30,
                  isSelected: writeSelected(),
                  unselectedFillColor: Colors.grey.withOpacity(0.2),
                  disabledBorderColor: Colors.red,
                  borderRadius: 50,
                  selectedColor: Colors.white,
                  fillColor: Colors.blue,
                  onPressed: (index) {
                    var isSelected = writeSelected();
                    setState(() {
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = (i == index) ? true : false;
                      }
                    }
                    );
                  },
                  children: generateDate(),
                ),
              ],
            ),
          ),
          Container(
              child: Image.asset(
            "assets/images/screen.png",
            color: Colors.blue,
          )),
          Wrap(
            children: generateSeat(primaryWhite, primaryBlue),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: writeSeatStatus(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 300,
            height: 40,
            child: RaisedButton(
              elevation: 5,
              onPressed: () {
                Get.to(ConfirmationPage());
              },
              color: primaryBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Book Seats",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

