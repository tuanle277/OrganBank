import 'package:flutter/material.dart';

class DonationScreen extends StatefulWidget {
  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Text(
          "Donation screen",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
