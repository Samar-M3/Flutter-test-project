import 'package:bannerr/pages/detailpage.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => dashboardState();
}

// Public (no underscore) so Detailpage can use dashboardState.verticallistcard
class dashboardState extends State<dashboard> {

  // Opens the detail page and passes the tapped card's data to it
  void openDetail(String title, String url, String date) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => Detailpage(
          title: title,
          imageUrl: url,
          date: date,
        ),
      ),
    );
  }

  // ---------- Horizontal card ----------
  Widget horizontallistcard(size, String title, String url, String date) {
    return GestureDetector(
      onTap: () => openDetail(title, url, date),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 8),
        width: size.width / 1.1,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                url,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Center(child: Icon(Icons.broken_image, color: Colors.white54)),
              ),
              Container(color: Colors.black26),
              Positioned(
                bottom: 40,
                left: 20,
                child: Container(
                  width: size.width / 2,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Container(
                  width: size.width / 2,
                  child: Text(
                    date,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Icon(Icons.play_circle, color: Colors.white, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Vertical card (static, also used by Detailpage) ----------
  static Widget verticallistcard(
      size, String title, String url, String button, String price) {
    return Row(
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
                  url,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Center(child: Icon(Icons.broken_image)),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: 230,
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
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
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 8, bottom: 8),
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
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Horizontal ListView.builder
          SizedBox(
            height: size.height / 4.5 + 8, // +8 for the card's top margin
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return horizontallistcard(
                  size,
                  "L5 pcps news news news happy dashian L5 pcps news news news happy dashian",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjZEcP2NkJQgEzAbBaG49jkD5TOG9hI9VALB1a_-vXlQ&s=10",
                  "Sept 30, 2026",
                );
              },
            ),
          ),

          // Vertical ListView.builder
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                const title = "this is first";
                const url =
                    "https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg";
                return GestureDetector(
                  onTap: () => openDetail(title, url, "Sept 30, 2026"),
                  child: verticallistcard(size, title, url, "BBC news", "Rs45000"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}