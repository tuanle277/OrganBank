import 'package:flutter/material.dart';

import '../model/constant.dart';

class AlertDialogDonate extends StatelessWidget {
  TextEditingController organController;
  TextEditingController bloodController;
  TextEditingController illController;
  Function submitData;

  AlertDialogDonate(
    this.organController,
    this.bloodController,
    this.illController,
    this.submitData,
  );
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Organ information",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.26,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
                showCursor: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Organ type',
                ),
                controller: organController,
                onSubmitted: (_) {}),
            TextField(
                showCursor: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Bloodtype',
                ),
                controller: bloodController,
                onSubmitted: (_) {}),
            TextField(
                showCursor: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Illness status',
                ),
                controller: illController,
                onSubmitted: (_) {}),
          ],
        ),
      ),
      backgroundColor: Colors.teal[200],
      actions: <Widget>[
        TextButton(
          onPressed: () {
            submitData();
            Navigator.pop(context);
          },
          child: const Text(
            'OK',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
