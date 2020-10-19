import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_ticket/shared/shared_value.dart';
import 'package:movie_ticket/shared/shared_ui.dart';

import 'package:movie_ticket/ui/pages/movie_detail_page.dart';
import 'package:movie_ticket/bloc/movie_bloc.dart';
import 'package:movie_ticket/ui/widgets/card_stacked.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  double currentPage = 0.0;
  List<Color> colors = [];
  MovieLoaded movieLoaded;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 19; i++) {
      colors.add(Colors.blue);
    }
  }

  List<Widget> get dummyContainers {
    List<Widget> dummyContainers = [];
    this.colors.forEach((i) {
      dummyContainers.add(Container());
    });

    return dummyContainers;
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 13,
        ),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  "Movies",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "Series",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "TV Show",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  width: 12,
                  height: 12,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 12, top: 5),
                  decoration: BoxDecoration(
                    color: primaryBlue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: 10,
                ),
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: 10,
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
          if (state is MovieInitial) {
            return Center(
              child: Container(
                margin: EdgeInsets.all(50),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else {
            movieLoaded = state;
            return Container(
              margin: EdgeInsets.only(top: 20),
              height: 400,
              width: double.infinity,
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: <Widget>[
                  CardsStacked(currentPage, colors, movieLoaded.movies),
                  Positioned.fill(
                    child: PageView(
                      children: this.dummyContainers,
                      controller: controller,
                    ),
                  ),
                ],
              ),
            );
          }
        }),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: primaryBlue,
          onPressed: () {
              Get.to(MovieDetailPage(movieLoaded.movies[currentPage.toInt()]));
          },
          child: Text(
            "Select Movie",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
    );
  }
}
