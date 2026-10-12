import 'package:bannerr/pages/dashboard.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
                  Positioned.fill(
              child:Align(
                alignment: Alignment.center,
                  child:Icon(Icons.play_circle_fill, size: 30,)

              )

                  )
        ]
              ),
              ]

          ),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Happy Dashain everyone" "jaljsldfja alsdjfsd",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),maxLines: 2,),


              ),
              Container(
                width: size.width/1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Author Name", style: TextStyle(fontSize: 18),),
                    Text("Date 2026", style: TextStyle(fontSize: 18),)
                    ]
                )
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                child: Text("Happy Dashain Everyone Lorem23 jjasfla lasdjflasd alskjfal sdlkjasd falsd",style:
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    overflow: TextOverflow.visible,
                  ),),

              ),

              Padding(
                  padding: const EdgeInsets.only(left:15, right:15),
                child: Divider(),
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Related Video",style:
                      TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    )
                    ,)
                ],
              ),

              Container(
                height: 900,



                  child: Column(
                    children: [
                    dashboardState.verticallistcard(size, "DASHAIN AAYO BARI LAI", "https://static.vecteezy.com/system/resources/thumbnails/083/933/835/small/beautiful-and-inspiring-picture-detailing-a-bright-hot-air-balloon-over-river-pure-cozy-perfect-for-creatives-moods-stock-image-free-photo.jpeg","Click", "1500"),
                    dashboardState.verticallistcard(size, "DASHAIN AAYO BARI LAI", "https://static.vecteezy.com/system/resources/thumbnails/083/933/835/small/beautiful-and-inspiring-picture-detailing-a-bright-hot-air-balloon-over-river-pure-cozy-perfect-for-creatives-moods-stock-image-free-photo.jpeg","Click", "1500"),
                    dashboardState.verticallistcard(size, "DASHAIN AAYO BARI LAI", "https://static.vecteezy.com/system/resources/thumbnails/083/933/835/small/beautiful-and-inspiring-picture-detailing-a-bright-hot-air-balloon-over-river-pure-cozy-perfect-for-creatives-moods-stock-image-free-photo.jpeg","Click", "1500"),
                    dashboardState.verticallistcard(size, "DASHAIN AAYO BARI LAI", "https://static.vecteezy.com/system/resources/thumbnails/083/933/835/small/beautiful-and-inspiring-picture-detailing-a-bright-hot-air-balloon-over-river-pure-cozy-perfect-for-creatives-moods-stock-image-free-photo.jpeg","Click", "1500"),
                  ]
                ),

              )

            ],
          )
        ],
        ),
      ),
    );
  }
}
