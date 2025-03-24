import 'package:flutter/material.dart';
import '../utils/switchTile.dart';

class SOSSettingsPage extends StatefulWidget {
  @override
  State<SOSSettingsPage> createState() => _SOSSettingsPageState();
}

class _SOSSettingsPageState extends State<SOSSettingsPage> {
  bool enableSOS = false;
  bool autoCall = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('SOS Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSwitchTile(
              title: 'Enable SOS',
              subtitle: 'When you press and hold the side button for 5 seconds this will automatically call emergency services.',
              value: enableSOS,
              onChanged: (val) {
                setState(() {
                  enableSOS = val;
                });
              },
            ),
            SizedBox(height: height * 0.02),
            CustomSwitchTile(
              title: 'Auto Call',
              subtitle: 'If you are unable to press the button, this will automatically call after a countdown.',
              value: autoCall,
              onChanged: (val) {
                setState(() {
                  autoCall = val;
                });
              },
            ),
            Spacer(),
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
                  'Customize Alert',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
