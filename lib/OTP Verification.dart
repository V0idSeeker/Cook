import 'package:cook/New%20Password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'), // Replace with your logo asset
            const SizedBox(height: 20),
            Text(
              'VERIFICATION',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Enter the OTP code that we send you via SMS',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter OTP code',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t receive code?',
                  style: GoogleFonts.roboto(fontSize: 14, color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend',
                    style: GoogleFonts.roboto(color: Colors.orange),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EnterNewPasswordScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('VERIFY'),
            ),
          ],
        ),
      ),
    );
  }
}
