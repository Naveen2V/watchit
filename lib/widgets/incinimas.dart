import 'package:flutter/material.dart';
import 'package:watchit/utils/text.dart';
import '../description.dart';

class InCinimas extends StatelessWidget {
  final List incinimasmovies;


  const InCinimas({Key key, this.incinimasmovies}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          modified_text(text:'InCinimas ', size:25,),
          SizedBox(height: 15,),
          Container(height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: incinimasmovies.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                id: incinimasmovies[index]['id'].toString(),
                                name: incinimasmovies[index]['title']!=null?
                                incinimasmovies[index]['title']: incinimasmovies[index]['name'],
                                bannerurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    incinimasmovies[index]['backdrop_path'],
                                posterurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    incinimasmovies[index]['poster_path'],
                                description: incinimasmovies[index]['overview'],
                                vote: incinimasmovies[index]['vote_average']
                                    .toString(),
                                launch_on: incinimasmovies[index]
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
                                      'https://image.tmdb.org/t/p/w500/'+incinimasmovies[index]['poster_path'],

                                    )
                                )) ,
                          ),
                          SizedBox(height: 10,),
                          Container(child: modified_text(text: incinimasmovies[index]['title']!=null?
                          incinimasmovies[index]['title']: incinimasmovies[index]['name']
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

