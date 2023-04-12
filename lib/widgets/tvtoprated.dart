import 'package:flutter/material.dart';
import 'package:watchit/utils/text.dart';
import '../description.dart';

class TvTopRated extends StatelessWidget {
  final List tvtoprated;


  const TvTopRated({Key key, this.tvtoprated}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          modified_text(text:'Top Rated TV', size:25,),
          SizedBox(height: 15,),
          Container(height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tvtoprated.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      //sh(
                      //
                      //PageRoute(
                      //der: (context) => Description(
                      //: tvtoprated[index]['id'].toString(),
                      //me: tvtoprated[index]['name']!=null?
                      //toprated[index]['name']: tvtoprated[index]['original_name'],
                      //nnerurl:
                      //ttps://image.tmdb.org/t/p/w500' +
                      //  tvtoprated[index]['backdrop_path'],
                      //sterurl:
                      //ttps://image.tmdb.org/t/p/w500' +
                      //  tvtoprated[index]['poster_path'],
                      //scription: tvtoprated[index]['overview'],
                      //te: tvtoprated[index]['vote_average']
                      //  .toString(),
                      //unch_on: tvtoprated[index]
                      //release_date'],
                      //
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
                                      'https://image.tmdb.org/t/p/w500/'+tvtoprated[index]['poster_path'],

                                    )
                                )) ,
                          ),
                          SizedBox(height: 10,),
                          Container(child: modified_text(text: tvtoprated[index]['name']!=null?
                          tvtoprated[index]['name']: tvtoprated[index]['original_name'],
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

