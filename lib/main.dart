import 'package:flutter/material.dart';

void main() => runApp(MyNewsApp());

class MyNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News UI',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NewsHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NewsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What’s New",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              //feeuillemort
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/2.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(12),
                child: Text(
                  "Brexit talks continue into the night as talks plagued by delays",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text("Recommend", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 12),
                  Text("Popular", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 12),
                  Text("New", style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    NewsItem(
                      image: "assets/4.jpeg",
                      title: "US makes China’s diplomats say where they’re going",
                      time: "1 hour ago",
                      views: "532",
                    ),
                    NewsItem(
                      image: "assets/3.png",
                      title: "US cities are losing 36 million trees a year",
                      time: "2 hours ago",
                      views: "32",
                    ),
                    NewsItem(
                      image: "assets/4.jpeg",
                      title: "Show you Europe’s most beautiful places",
                      time: "3 hours ago",
                      views: "1532",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final String image;
  final String title;
  final String time;
  final String views;

  const NewsItem({
    required this.image,
    required this.title,
    required this.time,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
                    SizedBox(width: 8),
                    Icon(Icons.remove_red_eye, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(views, style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
