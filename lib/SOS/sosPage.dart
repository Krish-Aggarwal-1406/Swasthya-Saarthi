import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_solution_challenge/SOS/sosSettingsPage.dart';

class SOSPage extends StatefulWidget {
  const SOSPage({Key? key}) : super(key: key);

  @override
  State<SOSPage> createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        centerTitle: true,
        title: const Text(
          'SOS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {Get.to(SOSSettingsPage());},
            icon: const Icon(Icons.settings_outlined, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.02),
        child: Column(

          children: [
            Text(
              'Emergency SOS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: height * 0.015),
            Text(
              "If you’re in an emergency, press the side button five times. Or, swipe the Emergency SOS slider to call local emergency services.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: height * 0.03),
            SizedBox(
              width: double.infinity,
              height: height * 0.06,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text(
                  'Set Up Emergency Contacts',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: height * 0.03),

            // Medical ID ListTile
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                contentPadding: EdgeInsets.all(height * 0.01),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue.shade50,
                  child: const Icon(Icons.health_and_safety_outlined, color: Colors.blue, size: 24),
                ),
                title: Text(
                  'Medical ID',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                subtitle: Text(
                  'In case of emergency, this information can be used to help medical responders.',
                  style: TextStyle(fontSize: 14, color: Color(0xff47779b)),
                ),
                trailing: Icon(Icons.star_border, color: Colors.black),
              ),
            ),

            SizedBox(height: height * 0.02),

            // Share Medical ID ListTile
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                contentPadding: EdgeInsets.all(height * 0.01),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue.shade50,
                  child: const Icon(Icons.nfc_outlined, color: Colors.blue, size: 24),
                ),
                title: Text(
                  'Share Medical ID with NFC',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                subtitle: Text(
                  'Tap your phone to another to share your Medical ID.',
                  style: TextStyle(fontSize: 14, color: Color(0xff47779b)),
                ),
                trailing: Icon(Icons.sync, color: Colors.black),
              ),
            ),

            SizedBox(height: height * 0.02),

            // First Aid Guide ListTile
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                contentPadding: EdgeInsets.all(height * 0.01),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue.shade50,
                  child: const Icon(Icons.volunteer_activism_outlined, color: Colors.blue, size: 24),
                ),
                title: Text(
                  'First Aid Guide',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                subtitle: Text(
                  'Step-by-step instructions for everyday first aid scenarios.',
                  style: TextStyle(fontSize: 14, color: Color(0xff47779b)),
                ),
                trailing: Icon(Icons.help_outline, color: Colors.black),
              ),
            ),

            SizedBox(height: height * 0.03),

            // Customize Settings Button
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFE6EBF3),
                  ),
                  child: Text(
                    "Customize Settings",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
