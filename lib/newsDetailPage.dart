import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget{
  final String title;
  final String image;
  final String time;
  final String views;

  const NewsDetailPage({
    required this.title,
    required this.image,
    required this.time,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(image, height: 250, width: double.infinity, fit: BoxFit.cover),
              Positioned(
                top: 40,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.account_circle, size: 18, color: Colors.grey),
                        SizedBox(width: 4),
                        Text("The Guardian", style: TextStyle(color: Colors.grey)),
                        Spacer(),
                        Text(time, style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 8),
                        Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(views, style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "The Brexit negotiations are to resume with Boris Johnson still hoping to bring the Democratic Unionists partly onboard with his deal...",
                      style: TextStyle(height: 1.5),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "The teams worked into the night and continue to make progress. They will meet again this morning.",
                      style: TextStyle(height: 1.5),
                    ),
                    // Tambahkan lebih banyak paragraf jika diperlukan
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
