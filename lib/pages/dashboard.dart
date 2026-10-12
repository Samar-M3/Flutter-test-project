import 'package:bannerr/pages/detailpage.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => dashboardState();
}

class dashboardState extends State<dashboard> {

horizontallistcard( size, String title, url, date){
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => const Detailpage(),
          ),
      );
      },
  child: Stack(
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
  )
  );
}

static verticallistcard( size, String title, url,button, price){
  return  Row(
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
                (url),
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
                  child:Text(title)
              ),
            ],
          ),
          SizedBox(height: 10),

          SizedBox(
            width: 230,
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 8, bottom: 8),
                    child: Text(
                      button,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  child: Text(price),


                )
              ],
            ),
          ),
        ],
      ),


    ],

  );
}
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
                      horizontallistcard(size,
                          "Hello Wor",
                          "https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                          "02 14 2026"),
                      horizontallistcard(size,
                          "Hello World!!!",
                          "https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                          "02 14 2026"),
                      horizontallistcard(size,
                          "Hello World!!!",
                          "https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                          "02 14 2026"),
                      horizontallistcard(size,
                          "Hello World!!!",
                          "https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                          "02 14 2026"),
                      horizontallistcard(size,
                          "Hello World!!!",
                          "https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                          "02 14 2026"),
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  child: SingleChildScrollView(
                   child: Container(

                     child: Column(

                       children: [
                         verticallistcard(size,
                             "this is first",
                             "https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                             "Rs45000",
                         "BBC news"),
                         verticallistcard(size,
                             "this is first",
                             "https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                             "Rs45000",
                             "BBC news"),
                         verticallistcard(size,
                             "this is first",
                             "https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                             "Rs45000",
                             "BBC news"),
                         verticallistcard(size,
                             "this is first",
                             "https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                             "Rs45000",
                             "BBC news"),
                         verticallistcard(size,
                             "this is first",
                             "https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                             "Rs45000",
                             "BBC news"),

                       ],
                     ),
                   ),
                  ),
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