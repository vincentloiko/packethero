import 'package:flutter/material.dart';
import 'home_network_screen.dart';
class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'PacketHero',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
  width: 250,
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeNetworkScreen(),
        ),
      );
    },
    child: const Text('New Game'),
  ),
),
              const SizedBox(height: 16),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: null,
                  child: const Text('Continue'),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Settings'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}