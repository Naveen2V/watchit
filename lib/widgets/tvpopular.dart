import 'package:flutter/material.dart';
import 'package:watchit/utils/text.dart';
import '../description.dart';

class Tvpopular extends StatelessWidget {
  final List tvpopular;


  const Tvpopular({Key key, this.tvpopular}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          modified_text(text:'Popular TV', size:25,),
          SizedBox(height: 15,),
          Container(height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tvpopular.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                id: tvpopular[index]['id'].toString(),
                                name: tvpopular[index]['original_name']!=null?
                                tvpopular[index]['original_name']: tvpopular[index]['name'],
                                bannerurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    tvpopular[index]['backdrop_path'],
                                posterurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    tvpopular[index]['poster_path'],
                                description: tvpopular[index]['overview'],
                                vote: tvpopular[index]['vote_average']
                                    .toString(),
                                launch_on: tvpopular[index]
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
                                      'https://image.tmdb.org/t/p/w500/'+tvpopular[index]['poster_path'],

                                    )
                                )) ,
                          ),
                          SizedBox(height: 10,),
                          Container(child: modified_text(text: tvpopular[index]['original_name']!=null?
                          tvpopular[index]['original_name']: tvpopular[index]['name'],
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

