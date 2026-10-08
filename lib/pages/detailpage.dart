import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),


      body: Column(
      children: [
        Row(
          children: [
            Stack(
              children:[
                 Container(
                height:size.height/4.2,
                width: size.width,
                child:Image.network(
                    fit: BoxFit.cover,"https://gratisography.com/wp-content/uploads/2025/05/gratisography-moon-robot-800x525.jpg")
              ),
                Container(
                      height:size.height/4.2,
                      width: size.width,
                      color: Colors.black26,

                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: Icon(
                      Icons.arrow_back,
                    size: 30, color: Colors.white,
                    ),
                ),
                Positioned(
                  right: 5,
                  child: Padding(padding: EdgeInsets.all(10),
                    child: Icon(Icons.share, size: 30, color: Colors.white,),
                )
                ),
                Center(
                  child:Icon(Icons.play_circle_fill, size: 30,)

                )
      ]
            ),
            ]

        )
      ],
      ),
    );
  }
}
