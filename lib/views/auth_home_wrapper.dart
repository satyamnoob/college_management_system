import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_views/phone_auth_view.dart';
import 'main_views/home_view.dart';

class AuthHomeWrapper extends StatelessWidget {
  const AuthHomeWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return const HomeView();
        } else {
          return PhoneAuthView();
        }
      },
    );
  }
}