// ignore_for_file: must_be_immutable, file_names, avoid_print

import 'package:chat_ui_project/screens/chatDetailPage.dart';
import 'package:flutter/material.dart';

//navedeni kod ispod definise ime, poruke, slike, seen opciju

class ConversationList extends StatefulWidget {
  String name;
  String messageContent; //promijeniti u messageText ako ne bude radilo
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationList(
      {Key key,
      @required
          this.name,
      @required
          this.messageContent, //promijeniti u messageText ako ne bude radilo
      @required
          this.imageUrl,
      @required
          this.time,
      @required
          this.isMessageRead})
      : super(key: key);
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    String ime = widget.name;
    print("Selam alejkum $ime");

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatDetailPage(
              widget.name, widget.imageUrl, widget.messageContent);
        }));
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget
                                .messageContent, //promijeniti u messageText ako ne bude radilo
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: widget.isMessageRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: widget.isMessageRead
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
