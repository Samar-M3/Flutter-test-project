import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context)
  {

    var size=MediaQuery.of(context).size;

      return Scaffold(

        appBar: AppBar(),

        body: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                              margin: EdgeInsets.all(15),
                              height: size.height/4.5,
                              width: size.width/1.2,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network("https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                                  fit: BoxFit.cover,),
                              )
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            height: size.height/4.5,
                            width: size.width/1.2,
                            decoration: BoxDecoration(
                              color: Colors.black26
                              ,
                              borderRadius: BorderRadius.circular(20),
                            ),

                          ),
                          Positioned(
                            bottom: 45,
                            left: 30,
                            child: Text(
                              "Hello World!!!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 30,
                            child: Text(
                              "02 14 2026",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 20,
                            child: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                              margin: EdgeInsets.all(15),
                              height: size.height/4.5,
                              width: size.width/1.2,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network("https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                                  fit: BoxFit.cover,),
                              )
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            height: size.height/4.5,
                            width: size.width/1.2,
                            decoration: BoxDecoration(
                              color: Colors.black26
                              ,
                              borderRadius: BorderRadius.circular(20),
                            ),

                          ),
                          Positioned(
                            bottom: 45,
                            left: 30,
                            child: Text(
                              "Hello World!!!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 30,
                            child: Text(
                              "02 14 2026",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 20,
                            child: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                              margin: EdgeInsets.all(15),
                              height: size.height/4.5,
                              width: size.width/1.2,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network("https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                                  fit: BoxFit.cover,),
                              )
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            height: size.height/4.5,
                            width: size.width/1.2,
                            decoration: BoxDecoration(
                              color: Colors.black26
                              ,
                              borderRadius: BorderRadius.circular(20),
                            ),

                          ),
                          Positioned(
                            bottom: 45,
                            left: 30,
                            child: Text(
                              "Hello World!!!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 30,
                            child: Text(
                              "02 14 2026",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 20,
                            child: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                              margin: EdgeInsets.all(15),
                              height: size.height/4.5,
                              width: size.width/1.2,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network("https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                                  fit: BoxFit.cover,),
                              )
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            height: size.height/4.5,
                            width: size.width/1.2,
                            decoration: BoxDecoration(
                              color: Colors.black26
                              ,
                              borderRadius: BorderRadius.circular(20),
                            ),

                          ),
                          Positioned(
                            bottom: 45,
                            left: 30,
                            child: Text(
                              "Hello World!!!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 30,
                            child: Text(
                              "02 14 2026",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 20,
                            child: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(

                      children: [
                        Row(
                          children: [
                            Container(
                                color: Colors.black38,
                                child:Text("Recently a huge bom exploded boomm!!!")
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.red,
                          padding: EdgeInsets.all(3),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 8, bottom: 8),
                            child: Text(
                              "BBC news",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),


                    ],

                ),

                Row(
                  children: [

                    Column(

                    ),
                  ],
                ),
              ],
        ),
      );
  }
}