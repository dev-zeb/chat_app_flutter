import 'package:flutter/material.dart';

class ChattingDetailsScreen extends StatefulWidget {
  final String connectionUserName;
  final Icon connectionUserIcon;

  const ChattingDetailsScreen({
    Key? key,
    required this.connectionUserName,
    required this.connectionUserIcon,
  }) : super(key: key);

  @override
  State<ChattingDetailsScreen> createState() => _ChattingDetailsScreenState();
}

class _ChattingDetailsScreenState extends State<ChattingDetailsScreen> {
  late List<List<String>> _messages;
  late ScrollController _chatDetailsController;

  @override
  void initState() {
    _loadMessages();
    _chatDetailsController = ScrollController();
    super.initState();
  }

  _loadMessages() {
    /// Load some Demo Chat data
    /// Need to load the messages in reverse order since the ListView is reversed!!
    _messages = [
      ["Received", "As Salaamu'alaikum! How're you?'"],
      ["Sent", "Wa'alaikumus Salaam! AlHamdulillaah! How about you?"],
      [
        "Received",
        "Yeah, I'm fine too! AlHamdulillaah!\nSo, how's your Ramadan going?"
      ],
      [
        "Sent",
        "Hmm... Trying to overcome the shortcomings but not quite succeeding it seems!"
      ],
      ["Received", "Keep trying, it'll be okay in Sha'a Allaah!"],
      ["Sent", "How about your Ramadan?"],
      ["Received", "Quite good, AlHamdulillaah!"],
      ["Sent", "That's Great! Please make Du'a for me bro!"],
      [
        "Received",
        "Sure! And you too don't forget me in your Du'a!",
      ],
      ["Sent", "In Sha'a Allaah!"],
    ].reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          child: const Icon(
            Icons.keyboard_arrow_left,
            size: 24,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.connectionUserName,
          style: TextStyle(
            color: Colors.black.withOpacity(0.87),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              //TODO: Implement on click event handling
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                Icons.phone,
                color: Colors.black.withOpacity(0.87),
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _chatDetailsController,
                reverse: true,
                itemBuilder: (context, index) {
                  List<String> message = _messages[index];
                  return MessageItem(
                    messageType: message[0],
                    message: message[1],
                    messagingPersonImageIcon: widget.connectionUserIcon,
                  );
                },
                itemCount: _messages.length,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              height: 56,
              child: Row(
                children: [
                  SizedBox(
                    height: double.infinity,
                    child: Material(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        highlightColor: Colors.lightBlueAccent,
                        onTap: () {
                          //TODO: Implement message sending operation
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(Icons.camera, size: 32,),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Form(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                            BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: double.infinity,
                    child: Material(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        highlightColor: Colors.lightBlueAccent,
                        onTap: () {
                          //TODO: Implement message sending operation
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(Icons.send, size: 32,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final String messageType;
  final String message;
  final Icon messagingPersonImageIcon;

  const MessageItem({
    Key? key,
    required this.messageType,
    required this.message,
    required this.messagingPersonImageIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return messageType == "Sent"
        ? _sentMessageWidget(context)
        : _receivedMessageWidget(context);
  }

  _receivedMessageWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 26,
            width: 26,
            decoration: const BoxDecoration(
              color: Color(0xff7c94b6),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            child: messagingPersonImageIcon,
          ),
          const SizedBox(width: 8),
          Container(
            width: 290 / 390 * MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: Colors.blue,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _sentMessageWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 290 / 390 * MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: Colors.orange,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.54,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            clipBehavior: Clip.antiAlias,
            height: 26,
            width: 26,
            decoration: const BoxDecoration(
              color: Color(0xff7c94b6),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            child: Icon(Icons.account_box_outlined),
          ),
        ],
      ),
    );
  }
}
