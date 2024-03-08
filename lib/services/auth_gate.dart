import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:ment_her_app/pages/home_page.dart";
import "package:ment_her_app/pages/profile_creation_screen.dart";

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  void signupDoneConfirmation() {
    setState(() {
      signupDone = true;
    });
  }

  bool signupDone = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            if (signupDone == true) {
              return ProfileCreationScreen();
            } else {
              return const HomePage();
            }
          } else {
            // return LoginOrRegisterScreen(
            //   signupDoneConfirmation: signupDoneConfirmation,
            // );
            return ProfileCreationScreen();
          }
        }));
  }
}
