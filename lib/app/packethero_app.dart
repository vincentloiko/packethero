import 'package:flutter/material.dart';
import '../screens/main_menu_screen.dart';

class PacketHeroApp extends StatelessWidget {
const PacketHeroApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'PacketHero',
debugShowCheckedModeBanner: false,
theme: ThemeData(
colorSchemeSeed: Colors.blue,
useMaterial3: true,
),
home: const MainMenuScreen(),
);
}
}
