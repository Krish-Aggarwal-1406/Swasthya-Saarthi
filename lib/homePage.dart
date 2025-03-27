import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'First Aid',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_voice_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: height * 0.065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffe6ebf3),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Color(0xff47779b),
                    ),
                    SizedBox(width: width * 0.2),
                    Expanded(
                      child: Text(
                        "What's on your mind",
                        style: TextStyle(fontSize: 17, color: Color(0xff47779b)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Searches",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Wrap(
                spacing: 10,
                runSpacing: 15,
                children: [
                  "CPR",
                  "Bleeding",
                  "Burns",
                  "Choking",
                  "Fractures",
                  "Heart Attack",
                  "Heat Stroke",
                  "Hypothermia",
                ].map((item) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xffe6ebf3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: height * 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("CPR", style: TextStyle(color: Colors.black, fontSize: 20)),
                subtitle: Text("How to perform CPR", style: TextStyle(color: Color(0xff47779b), fontSize: 15)),
                trailing: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/img_5.png", fit: BoxFit.cover),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("Breathing", style: TextStyle(color: Colors.black, fontSize: 20)),
                subtitle: Text("How to check for breathing", style: TextStyle(color: Color(0xff47779b), fontSize: 15)),
                trailing: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/img_6.png", fit: BoxFit.cover),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("Choking", style: TextStyle(color: Colors.black, fontSize: 20)),
                subtitle: Text("How to treat choking", style: TextStyle(color: Color(0xff47779b), fontSize: 15)),
                trailing: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/img_8.png", fit: BoxFit.cover),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("Wounds", style: TextStyle(color: Colors.black, fontSize: 20)),
                subtitle: Text("How to treat wounds", style: TextStyle(color: Color(0xff47779b), fontSize: 15)),
                trailing: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/img_9.png", fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
