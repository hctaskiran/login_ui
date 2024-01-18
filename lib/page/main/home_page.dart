import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/components/global/drawer.dart';
import 'package:login_ui/main.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bebek'),
      ),
      drawer: const CustomDrawer(),
      body: Center(
          child: Column(
        children: [
          Text(
            'Alo ${user.email}',
            style: const TextStyle(fontSize: 20),
          ),
          ElevatedButton(onPressed: () => authService.signOut(), child: const Text('Sign Out'))
        ],
      )),
    );
  }
}
