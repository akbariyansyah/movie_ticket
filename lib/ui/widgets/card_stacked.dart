import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/models/movie.dart';

class CardsStacked extends StatelessWidget {
  final double currentPage;
  final List<Color> colors;
  final List<Movie> movies;
  final padding = 20.0;
  final verticalInset = 20.0;
  String imageBaseURL = "https://image.tmdb.org/t/p/";
  CardsStacked(this.currentPage, this.colors, this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(

        builder: (ctx, constr) {
          List<Widget> cardList = [];
          var primaryCardHeight = constr.maxHeight * 0.9;
          var primaryCardWidth = primaryCardHeight * 0.75;

          for (int i = colors.length - 1; i > -1; i--) {
            var delta = i - currentPage;
            var isOnRight = delta >= 0;

            var item = Positioned(
              top: 10 * delta + 30,
              left: delta * (primaryCardWidth / 1) +
                  40 -
                  (isOnRight ? 0 : (600 * -delta)),
              child: Transform.scale(
                scale: math.min(1.0, -0.115 * delta + 1.00),
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                            colors: [Colors.black, Colors.transparent],
                            begin: Alignment.center,
                            end: Alignment.bottomCenter)
                            .createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imageBaseURL +
                                    "w780" +
                                    movies[i].backdropPath),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: colors[i]),
                        height: primaryCardHeight,
                        width: primaryCardWidth,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: primaryCardHeight - 30,left: 10),
                      child: Text(
                        (movies[i].title.length > 15) ? movies[i].title.substring(0,13) + "...": movies[i].title,
                        maxLines: 3,
                        style: TextStyle(fontSize: 30, color: Colors.black,fontFamily: "Lato"),
                      ),
                    )
                  ],
                ),
              ),
            );
            cardList.add(item);
          }

          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}
