import 'package:bannerr/controller/apicall.dart';
import 'package:bannerr/core/static.dart';
import 'package:bannerr/model/news.dart';
import 'package:bannerr/pages/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:smart_date_formatter/smart_date_formatter.dart';

class dashboard extends StatefulWidget {
  dashboard({super.key});

  @override
  State<dashboard> createState() => dashboardState();
}

class dashboardState extends State<dashboard> {
  // Used when the API returns a null urlToImage
  static const String fallbackImage =
      "https://gratisography.com/wp-content/uploads/2025/05/gratisography-moon-robot-800x525.jpg";

  horizontallistcard(size, String title, url, date, Articles art) {
    return GestureDetector(
      onTap: () {
        //store in static variable
        StaticFile.article = art;
        //route
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => detailpage(),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            height: size.height / 4.5,
            width: size.width / 1.2,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                url ?? fallbackImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Center(
                  child: Icon(Icons.broken_image, color: Colors.white54),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            height: size.height / 4.5,
            width: size.width / 1.2,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            bottom: 45,
            left: 30,
            child: Container(
              width: size.width / 2,
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 30,
            child: Container(
              width: size.width / 2,
              child: Text(
                DateTime.now().toReadable,
                style: TextStyle(color: Colors.white, fontSize: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            right: 30,
            child: Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 40,
            ),
          )
        ],
      ),
    );
  }

  // static so the detail page can reuse it; navigation is passed in via onTap
  static verticallistcard(size, title, url, date, source,
      {VoidCallback? onTap}) {
    var formatted = StaticFile.dateconverter(date);
    date = formatted;
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // taps on empty space also count
      onTap: onTap,
      child: Row(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 100,
                    width: 100,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        url ?? fallbackImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Center(
                          child:
                          Icon(Icons.broken_image, color: Colors.black38),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 40,
                    child: Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
            height: size.height / 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width / 1.6,
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: size.width / 1.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(3),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 8, bottom: 8),
                          child: Text(
                            source,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Text(date.split(",")[1]),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<news?>? futurenewsdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurenewsdata = Apicall.getnewsdata();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FutureBuilder(
              future: futurenewsdata,
              builder: (context, AsyncSnapshot<news?> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      //show ui
                      var data = snapshot.data;
                      return Column(
                        children: [
                          //horizontal list
                          Container(
                            height: size.height / 4,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.zero,
                                itemCount: data!.articles!.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return horizontallistcard(
                                      size,
                                      data.articles![index].title!,
                                      data.articles![index].urlToImage,
                                      data.articles![index].publishedAt,
                                      data.articles![index]);
                                }),
                          ),
                          //vertical list
                          Container(
                            height: size.height / 1.75,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.zero,
                                itemCount: data.articles!.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  var art = data.articles![index];
                                  return verticallistcard(
                                    size,
                                    art.title!,
                                    art.urlToImage,
                                    art.publishedAt!.split("T")[0],
                                    art.source!.name!.toString(),
                                    onTap: () {
                                      //store in static variable
                                      StaticFile.article = art;
                                      //route
                                      Navigator.of(context).push(
                                        MaterialPageRoute<void>(
                                          builder: (context) => detailpage(),
                                        ),
                                      );
                                    },
                                  );
                                }),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Text("No Data Available"),
                      );
                    }
                }
              }),
        ],
      ),
    );
  }
}