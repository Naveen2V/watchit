import 'package:flutter/material.dart';
import 'package:watchit/utils/text.dart';
import '../description.dart';

class TvToday extends StatelessWidget {
  final List tvtoday;


  const TvToday({Key key, this.tvtoday}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          modified_text(text:'TV Shows', size:30,),
          modified_text(text:'       ', size:30,),
          modified_text(text:'Ariving Today', size:25,),
          SizedBox(height: 15,),
          Container(height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tvtoday.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                id: tvtoday[index]['id'].toString(),
                                name: tvtoday[index]['original_name']!=null?
                                tvtoday[index]['original_name']: tvtoday[index]['name'],
                                bannerurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    tvtoday[index]['backdrop_path'],
                                posterurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    tvtoday[index]['poster_path'],
                                description: tvtoday[index]['overview'],
                                vote: tvtoday[index]['vote_average']
                                    .toString(),
                                launch_on: tvtoday[index]
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
                                      'https://image.tmdb.org/t/p/w500/'+tvtoday[index]['poster_path'],

                                    )
                                )) ,
                          ),
                          SizedBox(height: 10,),
                          Container(child: modified_text(text: tvtoday[index]['original_name']!=null?
                          tvtoday[index]['original_name']: tvtoday[index]['name'],
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

