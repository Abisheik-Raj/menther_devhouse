import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:ment_her_app/services/auth_service.dart";
import "package:provider/provider.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: GestureDetector(
          onTap: () {
            try {
              Provider.of<AuthService>(context, listen: false).logout();
            } catch (e) {
              print(e);
            }
          },
          child: const Text(
            "exit",
          ),
        ),
      ),
    );
  }
}
