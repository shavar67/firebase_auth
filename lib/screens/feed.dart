import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../authentication/auth.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({Key? key}) : super(key: key);

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  var logger = Logger(
      printer: PrettyPrinter(
          methodCount: 8,
          lineLength: 180,
          printTime: false,
          printEmojis: true,
          colors: true));

  @override
  void initState() {
    super.initState();
    logger.d('initState: HomeFeed');
  }

  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.read<User?>();
    final _auth = context.read<AuthService>();
    return Scaffold(
      appBar: AppBar(
          actions: [
            GestureDetector(
                onTap: () async {
                  await _auth.signOut();
                },
                child: const Icon(Icons.logout))
          ],
          title: Consumer(
            builder: (BuildContext context, _, __) {
              return Text(
                '${_firebaseUser?.email}',
                style: const TextStyle(),
              );
            },
          )),
    );
  }
}
