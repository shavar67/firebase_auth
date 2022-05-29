import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:sample/screens/feed.dart';

import '../authentication/auth.dart';
import '../authentication/authenticator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    logger.d('initState: HomePage');
  }

  @override
  Widget build(BuildContext context) {
    /**
     *TODO: Migrate from provider to riverpod..

    */
    final _authService = context.watch<AuthService>();
    return StreamBuilder<User?>(
        initialData: _authService.getUser,
        stream: _authService.authStatusChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeFeed();
          } else {
            return const Auth();
          }
        });
  }
}
