import 'package:flutter/material.dart';
import 'package:watchit/utils/text.dart';
import '../description.dart';

class Recommended extends StatelessWidget {
  final List recom;

  const Recommended({Key key, this.recom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          modified_text(text:'For You', size:25,),
          SizedBox(height: 15,),
          Container(height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recom.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                id: recom[index]['id'].toString(),
                                name: recom[index]['title']!=null?
                                recom[index]['title']: recom[index]['name'],
                                bannerurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    recom[index]['backdrop_path'],
                                posterurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    recom[index]['poster_path'],
                                description: recom[index]['overview'],
                                vote: recom[index]['vote_average']
                                    .toString(),
                                launch_on: recom[index]
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
                                  'https://image.tmdb.org/t/p/w500/'+recom[index]['poster_path'],

                                )
                            )) ,
                          ),
                          SizedBox(height: 10,),
                          Container(child: modified_text(text: recom[index]['title']!=null?
                          recom[index]['title']: recom[index]['name']
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

