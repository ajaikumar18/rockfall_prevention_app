import 'package:flutter/material.dart';
import 'services/twilio_service.dart';
import 'services/firebase_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rockfall Prevention System',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  final twilio = TwilioService();
  final firebase = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rockfall Prevention System")),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(20),
        children: [
          Card(
            child: InkWell(
              onTap: () => twilio.sendSms(
                "+91XXXXXXXXXX",
                "⚠ Rockfall detected! Please evacuate immediately.",
              ),
              child: Center(child: Text("📨 Send SMS Alert")),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () => firebase.addWorker("John Doe", "+911234567890"),
              child: Center(child: Text("👷 Add Worker to Database")),
            ),
          ),
          Card(
            child: Center(child: Text("📷 Real-time Drone Feed (Next Step)")),
          ),
          Card(
            child: Center(child: Text("📡 Sensor Data (Next Step)")),
          ),
        ],
      ),
    );
  }
}