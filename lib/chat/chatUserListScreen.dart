// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'chatScreen.dart'; // Ensure this import path is correct

// class ChatUserListScreen extends StatefulWidget {
//   const ChatUserListScreen({Key? key}) : super(key: key);

//   @override
//   State<ChatUserListScreen> createState() => _ChatUserListScreenState();
// }

// class _ChatUserListScreenState extends State<ChatUserListScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Chat Users')),
//       body: _buildUserList(),
//     );
//   }

//   // Build a list of users except for the current logged-in user
//   Widget _buildUserList() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('user').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasError) {
//           return const Center(child: Text('Error loading users'));
//         }
//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return const Center(child: Text('No users found'));
//         }

//         List<DocumentSnapshot> userDocs = snapshot.data!.docs;
//         String currentUserEmail = _auth.currentUser?.email ?? '';

//         return ListView(
//           children: userDocs
//               .where((doc) => doc['email'] != currentUserEmail)
//               .map((doc) => _buildUserListItem(doc))
//               .toList(),
//         );
//       },
//     );
//   }

//   // Build individual user list items
//   Widget _buildUserListItem(DocumentSnapshot document) {
//     Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//     String userEmail = data['email'];
//     String userId = data['user'];

//     return ListTile(
//       title: Text(userEmail),
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ChatPage(
//               receiverUserEmail: userEmail,
//               receiverUserId: userId,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
