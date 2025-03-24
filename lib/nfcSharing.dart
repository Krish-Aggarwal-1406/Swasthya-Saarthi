import 'package:flutter/material.dart';

class NFCSharingPage extends StatefulWidget {
  const NFCSharingPage({Key? key}) : super(key: key);

  @override
  State<NFCSharingPage> createState() => _NFCSharingPageState();
}

class _NFCSharingPageState extends State<NFCSharingPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width  = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Medical ID",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Secure Medical ID Transfer in Progress... Tap device detected.",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(height: 5, color: Colors.black),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(height: 5, color: Colors.grey.shade300),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Center(
                child: Container(
                  height: height * 0.15,
                  width: height * 0.15,

                  child: Image.asset(
                    "assets/img_10.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              Text(
                "Medical ID successfully shared with Dr. Raj's device. Access granted. ",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 4),
              // Optional "verified" icon or star
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Access granted",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.verified, color: Colors.black, size: 20),
                ],
              ),
              SizedBox(height: height * 0.03),
              buildInfoSection("Name", "Krish Aggarwal"),
              buildInfoSection("Blood Type", "B+"),
              buildInfoSection("Allergies", "None"),
              buildInfoSection("Emergency Contacts", "Ayan Sharma, +911234567890"),
              SizedBox(height: height * 0.04),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: height * 0.06,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text(
                      "Close & Return back",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoSection(String heading, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
