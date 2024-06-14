import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  final int currentUserId;
  final int chatWithUserId;

  const ChatScreen(
      {super.key, required this.currentUserId, required this.chatWithUserId});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await _firestore.collection('chats').add({
        'text': messageController.text,
        'senderId': widget.currentUserId,
        'receiverId': widget.chatWithUserId,
        'timestamp': FieldValue.serverTimestamp(),
      });
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.chatWithUserId}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('chats')
                  .where('senderId',
                      whereIn: [widget.currentUserId, widget.chatWithUserId])
                  .where('receiverId',
                      whereIn: [widget.currentUserId, widget.chatWithUserId])
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot chat = snapshot.data!.docs[index];
                    return ListTile(
                      title: Text(chat['text']),
                      subtitle: Text(chat['senderId']),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      labelText: 'Enter your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
