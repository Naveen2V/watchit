import 'package:flutter/material.dart';
import 'package:watchit/utils/text.dart';

class Description extends StatelessWidget {
  final String id, name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key key,
        this.id,
        this.name,
        this.description,
        this.bannerurl,
        this.posterurl,
        this.vote,
        this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black12 ,
        title: modified_text(text:'Detailed Description',),),
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    child: Image.network(
                       bannerurl,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 10,
                    child: modified_text(
                         text: name != null ? name : 'Not Loaded', size: 30,)),
              ])),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(20),
              child: modified_text(
                  text: 'Average Rating - ' + vote)),
          Container(
              padding: EdgeInsets.only(left: 20),
              child:
              modified_text(text: 'Release - ' + launch_on, size: 14)),
          Row(
            children: [
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: modified_text(text: description, size: 18)),
              ),
            ],
          ),

        ]),
      ),
    );
  }
}