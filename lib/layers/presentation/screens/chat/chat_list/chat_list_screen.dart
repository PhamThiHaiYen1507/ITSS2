import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:translate_app/layers/presentation/screens/chat/chat_detail_screen.dart';

class ChatListScreen extends StatelessWidget {
  final int currentUserId;

  const ChatListScreen({super.key, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat List'),
      ),
      body: StreamBuilder(
        stream: firestore
            .collection('userChats')
            .where('users', arrayContains: currentUserId)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot chat = snapshot.data!.docs[index];
              List<int> users = List<int>.from(chat['users']);
              int chatWithUserId =
                  users.firstWhere((id) => id != currentUserId);

              return ListTile(
                title: Text('Chat with $chatWithUserId'),
                subtitle: Text(chat['lastMessage'] ?? ''),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        currentUserId: currentUserId,
                        chatWithUserId: chatWithUserId,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
