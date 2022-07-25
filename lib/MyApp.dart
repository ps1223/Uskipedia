import 'package:flutter/material.dart';
import 'package:uskimuski/routes.dart';
import 'package:uskimuski/ui/common/top_bar.dart';
import 'package:uskimuski/ui/uskipedia/uskipedia.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UskiMiski',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
      ),
      routes: Routes.routes,
      home: Scaffold(
        backgroundColor: const Color(0xffFF715E),
        appBar: TopBar(title: "USKIMUSKI", appBar: AppBar(),),
        body: const Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Uskipedia()
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

}
