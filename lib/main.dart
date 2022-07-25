import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uskimuski/MyApp.dart';
import 'package:uskimuski/providers/menu_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<MenuProvider>(create: (_) => MenuProvider()),
    ],
      child: const MyApp()
    )
  );
}
