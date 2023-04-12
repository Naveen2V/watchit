import 'package:flutter/material.dart';
import 'package:watchit/utils/text.dart';
import '../description.dart';

class UpComing extends StatelessWidget {
  final List upcomingmovies;


  const UpComing({Key key, this.upcomingmovies}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          modified_text(text:'Upcoming', size:25,),
          SizedBox(height: 15,),
          Container(height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: upcomingmovies.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                id: upcomingmovies[index]['id'].toString(),
                                name: upcomingmovies[index]['title']!=null?
                                upcomingmovies[index]['title']: upcomingmovies[index]['name'],
                                bannerurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    upcomingmovies[index]['backdrop_path'],
                                posterurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    upcomingmovies[index]['poster_path'],
                                description: upcomingmovies[index]['overview'],
                                vote: upcomingmovies[index]['vote_average']
                                    .toString(),
                                launch_on: upcomingmovies[index]
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
                                      'https://image.tmdb.org/t/p/w500/'+upcomingmovies[index]['poster_path'],

                                    )
                                )) ,
                          ),
                          SizedBox(height: 10,),
                          Container(child: modified_text(text: upcomingmovies[index]['title']!=null?
                          upcomingmovies[index]['title']: upcomingmovies[index]['name']
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

