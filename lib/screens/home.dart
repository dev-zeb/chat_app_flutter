import 'package:chat_app_flutter/widgets/connection_card_widget.dart';
import 'package:flutter/material.dart';
import 'chatting_details_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> listOfNames;
  late List<String> listOfDescriptions;
  late List<Icon> listOfImagePaths;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() {
    /// Load Demo Data for now
    listOfNames = ["Friend 01", "Friend 02"];
    listOfDescriptions = ["Student", "Teacher"];
    listOfImagePaths = const [
      Icon(Icons.ac_unit),
      Icon(Icons.add_alarm_sharp)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return ConnectionCardWidget(
          userName: listOfNames[index],
          userDescription: listOfDescriptions[index],
          userImageIcon: listOfImagePaths[index],
          onClickHandler: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChattingDetailsScreen(
                  connectionUserName: listOfNames[index],
                  connectionUserIcon: listOfImagePaths[index],
                ),
              ),
            );
          },
          isUserActive: index == 0,
        );
      },
    );
  }
}
