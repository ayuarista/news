import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'newsDetailPage.dart';

void main() => runApp(MyNewsApp());

class MyNewsApp extends StatefulWidget {
  @override
  _MyNewsAppState createState() => _MyNewsAppState();
}

class _MyNewsAppState extends State<MyNewsApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News UI',
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: NewsHomePage(
        isDarkMode: isDarkMode,
        onThemeToggle: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NewsHomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  NewsHomePage({required this.isDarkMode, required this.onThemeToggle});

  @override
  _NewsHomePageState createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  String selectedCategory = 'All';

  final List<Map<String, dynamic>> categories = [
    {'label': 'All', 'value': 'All'},
    {'label': 'International', 'value': 'International'},
    {'label': 'Politics', 'value': 'Politics'},
    {'label': 'Health', 'value': 'Health'},
    {'label': 'Technology', 'value': 'Technology'},
    {'label': 'Sports', 'value': 'Sports'},
  ];

  final List<Map<String, String>> newsItems = [
    {
      'image': 'assets/4.jpeg',
      'title': 'US makes China’s diplomats say where they’re going',
      'time': '1 hour ago',
      'views': '532',
      'value': 'Technology',
    },
    {
      'image': 'assets/3.png',
      'title': 'US cities are losing 36 million trees a year',
      'time': '2 hours ago',
      'views': '32',
    },
    {
      'image': 'assets/4.jpeg',
      'title': 'Show you Europe’s most beautiful places',
      'time': '3 hours ago',
      'views': '1532',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/7.jpg"),
                  ),
                  Text(
                    "What’s New",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: widget.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Switch(
                        value: widget.isDarkMode,
                        onChanged: (value) {
                          widget.onThemeToggle();
                        },
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
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
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = selectedCategory == category['value'];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category['value'];
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          category['label'],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              // News List
              Expanded(
                child: ListView.builder(
                  itemCount: newsItems.length,
                  itemBuilder: (context, index) {
                    final item = newsItems[index];
                    return NewsItem(
                      image: item['image']!,
                      title: item['title']!,
                      time: item['time']!,
                      views: item['views']!,
                    );
                  },
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
  final String title;
  final String image;
  final String time;
  final String views;

  const NewsItem({
    required this.title,
    required this.image,
    required this.time,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => NewsDetailPage(
                  title: title,
                  image: image,
                  time: time,
                  views: views,
                ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
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
                      Text(
                        time,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.remove_red_eye, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        views,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
