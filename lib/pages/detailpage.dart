import 'package:bannerr/controller/apicall.dart';
import 'package:bannerr/core/static.dart';
import 'package:bannerr/model/news.dart';
import 'package:bannerr/pages/dashboard.dart';
import 'package:flutter/material.dart';

class detailpage extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String date;

  // All optional, so `detailpage()` still works
  const detailpage({
    super.key,
    this.title = "Happy Dashain everyone",
    this.imageUrl =
    "https://gratisography.com/wp-content/uploads/2025/05/gratisography-moon-robot-800x525.jpg",
    this.date = "Date 2026",
  });

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  Future<news?>? futurenewsdata;

  @override
  void initState() {
    super.initState();
    futurenewsdata = Apicall.getnewsdata();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // Article selected on the dashboard (falls back to constructor defaults)
    Articles? art = StaticFile.article;
    String title = art?.title ?? widget.title;
    String imageUrl = art?.urlToImage ?? widget.imageUrl;
    String date = art?.publishedAt?.split("T")[0] ?? widget.date;
    String author = art?.author ?? "Author Name";
    String description =
        art?.description ?? art?.content ?? "No description available";

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: size.height / 4.2,
                      width: size.width,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Center(
                          child:
                          Icon(Icons.broken_image, color: Colors.white54),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height / 4.2,
                      width: size.width,
                      color: Colors.black26,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.share,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.play_circle_fill,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: size.width / 1.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          author,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Text(date, style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Divider(),
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Related Video",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),

                // Related list loaded from the API using a Future
                FutureBuilder(
                  future: futurenewsdata,
                  builder: (context, AsyncSnapshot<news?> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if (snapshot.hasData &&
                            snapshot.data!.articles != null) {
                          var data = snapshot.data;
                          int total = data!.articles!.length;
                          int count = total > 4 ? 4 : total;

                          // shrinkWrap + NeverScrollableScrollPhysics lets the
                          // page's SingleChildScrollView scroll as one.
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: count,
                            itemBuilder: (BuildContext context, int index) {
                              var item = data.articles![index];
                              return dashboardState.verticallistcard(
                                size,
                                item.title ?? "",
                                item.urlToImage,
                                item.publishedAt?.split("T")[0] ?? "",
                                item.source?.name ?? "News",
                                onTap: () {
                                  // open the tapped related article
                                  StaticFile.article = item;
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute<void>(
                                      builder: (context) => detailpage(),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(child: Text("No Data Available")),
                          );
                        }
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}