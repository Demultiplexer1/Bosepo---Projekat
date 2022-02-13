// ignore_for_file: file_names, must_be_immutable

import 'package:chat_ui_project/widgets/conversationList.dart';
import 'package:flutter/material.dart';
import 'package:chat_ui_project/models/chatUsersModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  String get search => null;

  @override
  _ChatPageState createState() => _ChatPageState();
}

@override
void initState() {}

// FutureBuilder({
//   future = () {})
// List<String> a = [
//     'Jane Russel - Physical Education',
//     'Isabella Monner - Art',
//     'Jorge Henry - Sociology',
//     'Philip Fox - Philosophy',
//     'Debra Hawkins - Religion',
//     'Jacob Pena - Chemistry',
//     'Andrey Jones - Biology',
//     'Klara Johnson - Mathematics',
// ];

//  filterList(query) async {
//     return a.where((name) => name == query);
//   }
// });

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        text: "Jane Russel - Physical Education",
        secondaryText: "Awesome Setup",
        image: "images/userImage1.jpeg",
        time: "Now",
        imageURL:
            'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?size=626&ext=jpg&ga=GA1.1.2070450023.1642204800',
        messageText: 'Awesome Setup',
        name: 'Jane Russel - Physical Education'),
    ChatUsers(
        text: "Isabella Monner - Art",
        secondaryText: "That's Great",
        image: "images/userImage2.jpeg",
        time: "Yesterday",
        imageURL:
            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cG9ydHJhaXR8ZW58MHx8MHx8&w=1000&q=80',
        messageText: 'That\'s Great',
        name: 'Isabella Monner - Art'),
    ChatUsers(
        text: "Jorge Henry - Sociology",
        secondaryText: "Hey where are you?",
        image: "images/userImage3.jpeg",
        time: "31 Mar",
        imageURL:
            'https://t3.ftcdn.net/jpg/02/22/85/16/360_F_222851624_jfoMGbJxwRi5AWGdPgXKSABMnzCQo9RN.jpg',
        messageText: 'Hey where are you?',
        name: 'Jorge Henry - Sociology'),
    ChatUsers(
        text: "Philip Fox - Philosophy",
        secondaryText: "Busy! Call me in 20 mins",
        image: "images/userImage4.jpeg",
        time: "28 Mar",
        imageURL:
            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWVuJTIwcG9ydHJhaXR8ZW58MHx8MHx8&w=1000&q=80',
        messageText: 'Busy! Call me in 20 mins',
        name: 'Philip Fox - Philosophy'),
    ChatUsers(
        text: "Debra Hawkins - Religion",
        secondaryText: "Thank you, It's awesome",
        image: "images/userImage5.jpeg",
        time: "23 Mar",
        imageURL:
            'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg?size=626&ext=jpg&ga=GA1.2.1547513824.1641772800',
        messageText: 'Thank you, It\'s awesome',
        name: 'Debra Hawkins - Religion'),
    ChatUsers(
        text: "Jacob Pena - Chemistry",
        secondaryText: "will update you in evening",
        image: "images/userImage6.jpeg",
        time: "17 Mar",
        imageURL:
            'https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/366-mj-7703-fon-jj.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=d144b28b5ebf828b7d2a1bb5b31efdb6',
        messageText: 'will update you in evening',
        name: 'Jacob Pena - Chemistry'),
    ChatUsers(
        text: "Andrey Jones - Biology",
        secondaryText: "Can you please share the file?",
        image: "images/userImage7.jpeg",
        time: "24 Feb",
        imageURL:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEs8wOpBwSUNBxzMR0AMkGUcWYI653DG8q0Q&usqp=CAU',
        messageText: 'Can you please share the file?',
        name: 'Andrey Jones - Biology'),
    ChatUsers(
        text: "Klara Johnson - Mathematics",
        secondaryText: "How are you?",
        image: "images/userImage8.jpeg",
        time: "18 Feb",
        imageURL: 'https://jooinn.com/images/portrait-124.jpg',
        messageText: 'How are you?',
        name: 'Klara Johnson - Mathematics'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              // Future builder naknadno dodan
              // FutureBuilder(
              //   future: Future,
              //   initialData: InitialData,
              //   builder: (BuildContext context) {
              //     return ListView;
              //   },
              // ),
              //kod iznad
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageContent: chatUsers[index]
                      .messageText, //promijeniti u messageText ako ne bude radilo
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
            //Added search button with 'border', size
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                onChanged: (value) => filterlist(value), //HERE IS SEARCH
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            //Header of the application
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Conversations",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      // Added pink button 'Add New'
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.pink,
                            size: 20,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Add New",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

filterlist(String value) {}



// Navigator.push(context, MaterialPageRoute( builder: (BuildContext context) => search_appBar(suggestion),




 // @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   void main() {
//     List<String> a = [
//       'Jane Russel',
//       'Isabella Monner',
//       'Jorge Henry',
//       'Philip Fox',
//       'Debra Hawkins',
//       'Jacob Pena',
//       'Andrey Jones',
//       'Klara Johnson - Matematika'
//     ];
    
//     filterList(query) async {
//       return a.where((name) => name == query);
//     }
//   }
// }
