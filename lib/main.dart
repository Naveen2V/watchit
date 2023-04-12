import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tmdb_api/tmdb_api.dart';
//import 'package:watchit/description.dart';
import 'package:watchit/utils/text.dart';
import 'package:watchit/widgets/incinimas.dart';
import 'package:watchit/widgets/popular.dart';
import 'package:watchit/widgets/toprated.dart';
//import 'dart:async';
import 'package:watchit/widgets/recom.dart';
// import 'package:watchit/widgets/tvlatest.dart';
// import 'package:watchit/widgets/tvpopular.dart';
// import 'package:watchit/widgets/tvtoday.dart';
import 'package:watchit/widgets/tvtoprated.dart';
import 'package:watchit/widgets/upcoming.dart';
import 'dart:math';



void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(brightness: Brightness.dark,
          primaryColor: Colors.lightBlueAccent),
    );
  }
}

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List popularmovies = [];
  List Trendingmovies = [];
  List topratedmovies = [];
  List recom = [];
  List upcomingmovies = [];
  List incinimasmovies = [];
  List tvlatest = [];
  List tvtoday = [];
  List tvpopular = [];
  List tvtoprated = [];

  final String apikey = 'f00b397119515ab1dd35e22f5f1000a2';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMDBiMzk3MTE5NTE1YWIxZGQzNWUyMmY1ZjEwMDBhMiIsInN1YiI6IjYzZmM0NWJjOTZlMzBiMDA4MzI2ZGQ2NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pR7LRhp3Q2Ua0nMwXlXVPM8KpEyvVsvoBap1eSGSq_Y';

  @override
  void initState(){
    loadmovies();
    super.initState();
  }
  loadmovies()async{
    final min = 1;
    final max = 3816;
    final random = Random();
    final int id = min + random.nextInt(max - min);

TMDB tmdbWithCoustenLogs = TMDB(ApiKeys(apikey, readaccesstoken),
   logConfig: ConfigLogger.recommended(
     //showLogs: true,
     //showErrorLogs: true
   ) );

Map popularmoviesresult = await tmdbWithCoustenLogs.v3.movies.getPopular();
Map topratedmoviesresult = await tmdbWithCoustenLogs.v3.movies.getTopRated();
Map upcomingmoviesresult = await tmdbWithCoustenLogs.v3.movies.getUpcoming();
Map incinimasmoviesresult = await tmdbWithCoustenLogs.v3.movies.getNowPlaying();
Map recomresult = await tmdbWithCoustenLogs.v3.movies.getRecommended(id);
Map tvlatestresult = await tmdbWithCoustenLogs.v3.tv.getLatest();
Map tvtodayresult = await tmdbWithCoustenLogs.v3.tv.getAiringToday();
Map tvpopularresult = await tmdbWithCoustenLogs.v3.tv.getPopular();
Map tvtopratedresult = await tmdbWithCoustenLogs.v3.tv.getTopRated();
setState((){
  popularmovies =  popularmoviesresult['results'];
  topratedmovies =  topratedmoviesresult['results'];
  recom = recomresult['results'];
  incinimasmovies = incinimasmoviesresult['results'];
  upcomingmovies = upcomingmoviesresult['results'];
  tvlatest = tvlatestresult['results'];
  tvtoday = tvtodayresult['results'];
  tvpopular = tvpopularresult['results'];
  tvtoprated = tvtopratedresult['results'];
}
);
//print(popularmovies);//print(Trendingmovies);//print(topratedmovies);//print(tvtoprated);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(backgroundColor: Colors.black12 ,
        title: modified_text(text:"Watchit"),),
      body: ListView(
        children: [
          Recommended (recom: recom,),
          TopRated (topratedmovies: topratedmovies,),
          PopularMovies (popularmovies:popularmovies,),
          InCinimas (incinimasmovies: incinimasmovies,),
          UpComing (upcomingmovies: upcomingmovies,),
          //TvToday (tvtoday: tvtoday,),
          //Tvpopular (tvpopular: tvpopular,),
          TvTopRated (tvtoprated: tvtoprated,),
          //TvLatest (tvlatest: tvlatest,),


        ],

          ),
      //floatingActionButton: FloatingActionButton(
       // onPressed: () {
            // Navigate back to the home page and reload the data
          //  Navigator.pop(context);
          //  loadmovies();
        //  },
     //  tooltip: 'Reload',
       // child: Icon(Icons.refresh),
    //  ),
      );
  }


}
