import 'package:flutter/material.dart';

import '../model/constant.dart';

class AlertDialogInfo extends StatelessWidget {
  int index;

  AlertDialogInfo(this.index);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Donor profile",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.55,
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Text(
                    'name: ${listOfProfile[index].name}',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    'phone number: ${listOfProfile[index].phoneNumber}',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    'address: ${listOfProfile[index].location}',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.teal[200],
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'OK',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
