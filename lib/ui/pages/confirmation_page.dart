import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:hexcolor/hexcolor.dart';
import 'package:movie_ticket/bloc/movie_bloc.dart';
import 'package:movie_ticket/shared/shared_ui.dart';

import 'main_page.dart';

class ConfirmationPage extends StatefulWidget {
  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  // bool isDone = false;
  // @override
  // void initState() {
  //   super.initState();
  //   Timer.periodic(Duration(milliseconds: 7500), (timer) {
  //     if (isDone || mounted) timer.cancel();
  //     setState(() {
  //       isDone = true;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    debugPrint("Context Confirmation Peage " + context.hashCode.toString());

    return Scaffold(
      backgroundColor: primaryWhite,
      body: Center(
            child: Container(
                    child: Image(
                    image: AssetImage("assets/images/success.gif"),
                  ))),
      );
  }
}
