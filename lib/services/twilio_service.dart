import 'package:twilio_flutter/twilio_flutter.dart';

class TwilioService {
  late TwilioFlutter twilioFlutter;

  TwilioService() {
    twilioFlutter = TwilioFlutter(
      accountSid: "YOUR_TWILIO_ACCOUNT_SID",
      authToken: "YOUR_TWILIO_AUTH_TOKEN",
      twilioNumber: "YOUR TWILIO_NUMBER",
    );
  }

  Future<void> sendSms(String to, String message) async {
    try {
      await twilioFlutter.sendSMS(
        toNumber: to,
        messageBody: message,
      );
      print("SMS sent to $to successfully.");
    } catch (e) {
      // Handle trial account restrictions or other errors
      print("Failed to send SMS to $to: $e");
      print(
          "Reminder: On Twilio trial accounts, the recipient number must be verified.");
    }
  }
}
