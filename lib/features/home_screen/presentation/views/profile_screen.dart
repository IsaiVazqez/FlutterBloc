import 'package:flutter/material.dart';
import 'package:loginbloc/common/auth/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Auth();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 42,
            backgroundImage: user.currentUser!.photoURL != null
                ? NetworkImage(user.currentUser!.photoURL!)
                : null,
            child: user.currentUser!.photoURL == null
                ? const Icon(Icons.person)
                : null,
          ),
          Text(user.currentUser!.email!)
        ]),
      ),
    );
  }
}
