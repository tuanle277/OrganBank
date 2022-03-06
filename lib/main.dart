import 'package:flutter/material.dart';

import 'package:hacktechproject/widgets/screen/donationscreen.dart';
import 'package:hacktechproject/widgets/screen/infoscreen.dart';

import './model/constant.dart';
import './widgets/alertdialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    final wholeHeight = mediaQuery.height;
    final wholeWidth = mediaQuery.width;

    List<Widget> _listOfWidget = [
      SizedBox(
        height: wholeHeight,
        width: wholeWidth,
        child: Container(
          width: wholeWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: wholeHeight * 0.1,
                  ),
                  const Text(
                    "Hello (name)",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: wholeHeight * 0.1,
                  )
                ],
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: TextField(
                        showCursor: true,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          hintText: 'Find by keyword',
                          labelText: 'Search',
                          border: OutlineInputBorder(),
                        ),
                        controller: _searchController,
                        onSubmitted: (_) {},
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: const <Widget>[
                        //     Text(
                        //       'Task',
                        //       style: TextStyle(
                        //           fontSize: 30.0,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //     SizedBox(
                        //       width: 16,
                        //     ),
                        //     Text(
                        //       'Lists',
                        //       style: TextStyle(
                        //           fontSize: 28.0, color: Colors.grey),
                        //     )
                        //   ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: wholeHeight * 0.04,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: dummyListOfDonatedOrgan.length,
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 7,
                        ),
                        child: InkWell(
                          onTap: () => showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                AlertDialogInfo(index),
                          ),
                          child: Container(
                            height: wholeHeight * 0.3,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: wholeWidth * 0.05,
                                ),
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.teal[100],
                                  child: dummyListOfDonatedOrgan[index].icon,
                                ),
                                SizedBox(
                                  width: wholeWidth * 0.05,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Organ type: ${dummyListOfDonatedOrgan[index].organType}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Blood type: ${dummyListOfDonatedOrgan[index].bloodType}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Date issued: ${dummyListOfDonatedOrgan[index].date}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      InformationScreen(),
      DonationScreen(),
    ];

    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(
        () {
          _selectedIndex = index;
          print(_selectedIndex);
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'Information',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Donate',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[300],
        onTap: _onItemTapped,
      ),
      body: _listOfWidget.elementAt(
        _selectedIndex,
      ),
    );
  }
}
