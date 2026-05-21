import 'dart:convert';
import 'package:http/http.dart' as http;

class FirebaseService {
  final String projectId = "rockfall-prevention";
  final String apiKey = "AIzaSyB-QbQLxgY6zmQ-5YbqL25hyEoUbAy7jbQ";

  Future<void> addWorker(String name, String phone) async {
    final url = Uri.parse(
      "https://firestore.googleapis.com/v1/projects/$projectId/databases/(default)/documents/workers?key=$apiKey",
    );

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "fields": {
          "name": {"stringValue": name},
          "phone": {"stringValue": phone},
        }
      }),
    );

    print("Firestore Response: ${response.body}");
  }
}