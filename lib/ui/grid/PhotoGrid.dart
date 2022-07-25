
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uskimuski/providers/menu_provider.dart';
import 'package:uskimuski/ui/common/top_bar.dart';

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String selectedTopic = context.watch<MenuProvider>().selectedTopic;
    return Scaffold(
      appBar: TopBar(title: "USKIMUSKI", appBar: AppBar(),),
      body: Container(
        padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0,),
        child: Column(
          children: <Widget>[
            _buildTitle(selectedTopic),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String topic) {
    return Align(
      alignment: const Alignment(-0.9, -0.9),
      child: RichText(
        text: TextSpan(
            text: "Uskipedia ",
            style: const TextStyle(
                fontSize: 30.0,
                color: Colors.black
            ),
            children: <TextSpan>[
              TextSpan(
                  text: "\\ $topic",
                  style: const TextStyle(
                    fontSize: 16.0,
                  )
              )
            ]
        ),
      ),
    );
  }

}