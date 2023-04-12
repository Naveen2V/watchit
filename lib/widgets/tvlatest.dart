import 'package:flutter/material.dart';
import 'package:watchit/utils/text.dart';
import '../description.dart';

class TvLatest extends StatelessWidget {
  final List tvlatest;


  const TvLatest({Key key, this.tvlatest}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          modified_text(text:'Latest TV', size:25,),
          SizedBox(height: 15,),
          Container(height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tvlatest.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                id: tvlatest[index]['id'].toString(),
                                name: tvlatest[index]['original_name']!=null?
                                tvlatest[index]['original_name']: tvlatest[index]['name'],
                                bannerurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    tvlatest[index]['backdrop_path'],
                                posterurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    tvlatest[index]['poster_path'],
                                description: tvlatest[index]['overview'],
                                vote: tvlatest[index]['vote_average']
                                    .toString(),
                                launch_on: tvlatest[index]
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
                                      'https://image.tmdb.org/t/p/w500/'+tvlatest[index]['poster_path'],

                                    )
                                )) ,
                          ),
                          SizedBox(height: 10,),
                          Container(child: modified_text(text: tvlatest[index]['original_name']!=null?
                          tvlatest[index]['original_name']: tvlatest[index]['name'],
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

