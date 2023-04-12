import 'package:flutter/material.dart';
import 'package:watchit/utils/text.dart';
import '../description.dart';

class PopularMovies extends StatelessWidget {
  final List popularmovies;


  const PopularMovies({Key key, this.popularmovies}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Container(
         padding: EdgeInsets.all(10),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children:[
             modified_text(text:'Popular', size:25,),
             SizedBox(height: 15,),
             Container(height: 270,
             child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: popularmovies.length,
                 itemBuilder: (context, index){
               return InkWell(
                 onTap: (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => Description(
                             id: popularmovies[index]['id'].toString(),
                             name: popularmovies[index]['title']!=null?
                             popularmovies[index]['title']: popularmovies[index]['name'],
                             bannerurl:
                             'https://image.tmdb.org/t/p/w500' +
                                 popularmovies[index]['backdrop_path'],
                             posterurl:
                             'https://image.tmdb.org/t/p/w500' +
                                 popularmovies[index]['poster_path'],
                             description: popularmovies[index]['overview'],
                             vote: popularmovies[index]['vote_average']
                                 .toString(),
                             launch_on: popularmovies[index]
                             ['release_date'],
                           )));
                 },
                 child: Container(
                   width: 160,
                   child: Column(
                     children:[
                       Container(
                         height:220,
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                             image: DecorationImage(
                           image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500/'+popularmovies[index]['poster_path'],

                           )
                         )) ,
                       ),
                       SizedBox(height: 10,),
                       Container(child: modified_text(text: popularmovies[index]['title']!=null?
                       popularmovies[index]['title']: popularmovies[index]['name']
                       ),)
                     ],
                   ),
                 ),
               );
                 }),)
           ],
         ) ,
    );
  }
}

