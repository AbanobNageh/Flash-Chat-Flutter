import 'package:flutter/material.dart';
import 'message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesStream extends StatelessWidget {
  final Stream<QuerySnapshot> snapshotStream;
  final String loggedInUserEmail;

  MessagesStream({this.snapshotStream, this.loggedInUserEmail});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: snapshotStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }

        final messages = snapshot.data.documents.reversed;
        List<MessageBubble> messagesBubbles = [];
        for (var message in messages) {
          bool senderIsCurrentUser = message.data['sender'] == loggedInUserEmail ? true : false;

          messagesBubbles.add(MessageBubble(
            messageText: message.data['text'],
            messageSender: message.data['sender'],
            senderIsCurrentUser: senderIsCurrentUser,
          ));
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            children: messagesBubbles,
          ),
        );
      },
    );
  }
}
