// ignore_for_file: file_names, missing_return, use_key_in_widget_constructors

import 'package:chat_ui_project/models/chatMessageModel.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  final String name;
  final String imageURL;
  final String messageContent1;
  const ChatDetailPage(
    this.name,
    this.imageURL,
    this.messageContent1,
  );

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final _titleController = TextEditingController();

  List<ChatMessage> messages = [
    // Code above is the chat message of every person's dm
    ChatMessage(messageContent: "Hello, teacher", messageType: "sender"),
    ChatMessage(messageContent: "I have a question.", messageType: "sender"),
    ChatMessage(
        messageContent: "Hello, what is the question?",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Can you help me to solve the equation  2 sin x + 1 = 0?",
        messageType: "sender"),
    ChatMessage(
        messageContent1:
            "Yes, sure I can. I will guide you through the process.",
        messageType: "receiver",
        messageContent:
            'Yes, sure I can. I will guide you through the process.'),
  ];

  _ChatDetailPageState();

  submitData(_titleController) {
    if (_titleController.text.isNotEmpty) {
      //ubacen title controller naknadno
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount =
        (_titleController.text); //ubacen title controller naknadno

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    String personImage = widget.imageURL;
    String personName = widget.name;
    // String messageText = widget.messageContent1;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(personImage),
                  maxRadius: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  // Code above is the added edited text of customers.
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        personName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      //body: Container(), Jel se ovo ovdje brise?
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                      alignment: (messages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].messageType == "receiver"
                              ? Colors.grey.shade200
                              : Colors.blue[200]),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Text(messages[index].messageContent),
                      )));
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                      controller: _titleController,
                      // onSubmitted: (_titleController) => submitData(_titleController),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: submitData(_titleController), //onPressed: () {},
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
