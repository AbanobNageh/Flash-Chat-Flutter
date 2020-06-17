import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String messageText;
  final String messageSender;
  final bool senderIsCurrentUser;

  MessageBubble({
    this.messageText,
    this.messageSender,
    this.senderIsCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: senderIsCurrentUser == true ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            messageSender,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: senderIsCurrentUser == true
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            elevation: 5.0,
            color: senderIsCurrentUser == true
                ? Colors.lightBlueAccent
                : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20.0,
              ),
              child: Text(
                messageText,
                style: TextStyle(
                  color: senderIsCurrentUser == true
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
