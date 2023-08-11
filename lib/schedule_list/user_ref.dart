import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfo11 extends StatefulWidget {
  const UserInfo11({Key? key, required this.userId});
  final String userId;

  @override
  State<UserInfo11> createState() => _UserInfo11State();
}

class _UserInfo11State extends State<UserInfo11> {
// Provide the userId from somewhere

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('Users')
          .doc(widget.userId)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Center(
            child: Text('User not found.'),
          );
        }

        var userData = snapshot.data!.data() as Map<String, dynamic>;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(214, 255, 105, 180),
                ),
                child: Column(
                  children: [
                    UserInfoRow(
                        title: 'Display Name',
                        value: userData['display_name'] ?? 'N/A'),
                    UserInfoRow(
                        title: 'Email', value: userData['email'] ?? 'N/A'),
                    UserInfoRow(
                        title: 'Phone Number',
                        value: userData['phone_number'] ?? 'N/A'),
                  ],
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }
}

class UserInfoRow extends StatelessWidget {
  final String title;
  final String value;

  const UserInfoRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
