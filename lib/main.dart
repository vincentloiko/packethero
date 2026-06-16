import 'package:flutter/material.dart';

void main() {
  runApp(const PacketHeroApp());
}

class PacketHeroApp extends StatelessWidget {
  const PacketHeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PacketHero',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PacketHero'),
        ),
        body: const Center(
          child: Text(
            'Welcome to PacketHero',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}