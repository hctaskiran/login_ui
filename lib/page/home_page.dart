import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    void signOut() {
      FirebaseAuth.instance.signOut();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              const CircularProgressIndicator();
              signOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
          child: Text(
        'Welcome ${user.email}',
        style: const TextStyle(color: Colors.black),
      )),
    );
  }
}
