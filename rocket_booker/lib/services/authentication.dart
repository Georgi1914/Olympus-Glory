import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication {
  static Future<dynamic> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;
    await user!.updateDisplayName(name);
    await user.reload();
    await user.sendEmailVerification();
    user = auth.currentUser;

    return user;
  }

  static Future<dynamic> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;

    return user;
  }

  static User getCurrentUser()  {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    user = auth.currentUser as User;
    return user;
  }
}
