import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_ticket/ui/pages/main_page.dart';
import 'package:movie_ticket/bloc/movie_bloc.dart';
import 'package:movie_ticket/ui/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: BlocProvider<MovieBloc>(
            builder: (context) => MovieBloc()..add(MovieEvent()),
            child: MainPage()));
  }
}
