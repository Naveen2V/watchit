import 'package:flutter/material.dart';
import 'package:watchit/utils/text.dart';
import '../description.dart';

class TopRated extends StatelessWidget {
  final List topratedmovies;


  const TopRated({Key key, this.topratedmovies}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          modified_text(text:'Movies', size:30,),
          modified_text(text:'       ', size:30,),
          modified_text(text:'Top Rated', size:25,),
          SizedBox(height: 15,),
          Container(height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topratedmovies.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                id: topratedmovies[index]['id'].toString(),
                                name: topratedmovies[index]['title']!=null?
                                topratedmovies[index]['title']: topratedmovies[index]['name'],
                                bannerurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    topratedmovies[index]['backdrop_path'],
                                posterurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    topratedmovies[index]['poster_path'],
                                description: topratedmovies[index]['overview'],
                                vote: topratedmovies[index]['vote_average']
                                    .toString(),
                                launch_on: topratedmovies[index]
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
                                  'https://image.tmdb.org/t/p/w500/'+topratedmovies[index]['poster_path'],

                                )
                            )) ,
                          ),
                          SizedBox(height: 10,),
                          Container(child: modified_text(text: topratedmovies[index]['title']!=null?
                          topratedmovies[index]['title']: topratedmovies[index]['name'],
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

