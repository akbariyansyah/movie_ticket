import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_ticket/models/movie.dart';
import 'package:movie_ticket/models/movie_detail.dart';
import 'package:movie_ticket/services/movie_services.dart';
import 'file:///D:/enigma/Flutter/flutter-basic/movie_ticket/lib/ui/pages/order_ticket_page.dart';
import 'package:movie_ticket/shared/shared_value.dart';
import 'package:movie_ticket/shared/shared_method.dart';
import 'package:movie_ticket/shared/shared_ui.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;

  MovieDetailPage(this.movie);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  MovieDetail movieDetail;
  @override
  void initState() {
    super.initState();
    fetchMovie();
  }

  void fetchMovie() async {
    movieDetail = await MovieServices.getDetails(widget.movie.id, widget.movie);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.25,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        imageBaseURL + "w1280" + widget.movie.backdropPath),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.movie.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, fontFamily: "Lato", fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: writeStar(primaryYellow, widget.movie.voteAverage),
          ),
          Flexible(
            flex: 3,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    widget.movie.overview,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Genre",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Minutes",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Language",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          (movieDetail == null)
              ? SizedBox(
                  width: 30, height: 30, child: CircularProgressIndicator())
              : Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        movieDetail.genre,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        movieDetail.runtime.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        movieDetail.language,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
          SizedBox(
            height: 20,
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: 300,
              height: 40,
              child: RaisedButton(
                elevation: 5,
                onPressed: () {
                  Get.to(OrderTicketPage(widget.movie.title));
                },
                color: primaryBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Book Ticket",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
