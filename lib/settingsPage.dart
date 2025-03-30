import 'package:flutter/material.dart';
import 'utils/switchTile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool voiceover = false;
  bool liveloction = false;
  bool instantsos = false;
  bool prerecorded = false;
  bool emergencymode = false;
  bool sleepmode = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false, // Removes the back arrow
        title: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Medical ID Section
              Text(
                'Medical ID',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit medical ID",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.black),
                ],
              ),
              SizedBox(height: 30),

              // Emergency Contacts Section
              Text(
                'Emergency Contacts',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add emergency contacts",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Icon(Icons.add, color: Colors.black),
                ],
              ),
              SizedBox(height: 30),

              // Sound Haptics Section
              Text(
                'Sound Haptics',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Alert sounds",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Siren",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Accessibility Section
              Text(
                'Accessibility',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              CustomSwitchTile(
                title: "Voice Over",
                value: voiceover,
                onChanged: (value) => setState(() => voiceover = value),
              ),
              SizedBox(height: 10),
              CustomSwitchTile(
                title: "Live Location Sharing",
                value: liveloction,
                onChanged: (value) => setState(() => liveloction = value),
              ),
              SizedBox(height: 10),
              CustomSwitchTile(
                title: "Instant SOS voice recording",
                value: instantsos,
                onChanged: (value) => setState(() => instantsos = value),
              ),
              SizedBox(height: 10),
              CustomSwitchTile(
                title: "Pre-recorded emergency messages",
                value: prerecorded,
                onChanged: (value) => setState(() => prerecorded = value),
              ),
              SizedBox(height: 30),

              // Modes Section
              Text(
                'Modes',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              CustomSwitchTile(
                title: "Sleep mode",
                value: sleepmode,
                onChanged: (value) => setState(() => sleepmode = value),
              ),
              SizedBox(height: 10),
              CustomSwitchTile(
                title: "Emergency mode",
                value: emergencymode,
                onChanged: (value) => setState(() => emergencymode = value),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
