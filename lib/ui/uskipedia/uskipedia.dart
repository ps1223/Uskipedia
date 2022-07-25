import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uskimuski/providers/menu_provider.dart';
import 'package:uskimuski/ui/common/BottomBar.dart';
import 'package:uskimuski/ui/uskipedia/menu_list.dart';
import 'package:uskimuski/ui/uskipedia/sample_expansion.dart';
import 'package:uskimuski/ui/utils/Util.dart';
import 'dart:math' as math;

class Uskipedia extends StatelessWidget {
  const Uskipedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: _buildDecoration(),
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      context.watch<MenuProvider>().selectedMenu != -1 ?
                        Util.rotateWidget(
                          IconButton(
                            onPressed: () => context.read<MenuProvider>().setSelectedMenu(-1),
                            icon: const Icon(
                              Icons.heart_broken_outlined,
                              color: Colors.white,
                            )
                          ), 90
                        ): IconButton(onPressed: () {}, icon: Container()),
                      const Text(
                        "USKIPEDIA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0
                        ),
                        key: Key('menuState'),
                      )
                    ]
                  )
                ),
                const SampleExpansion(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar()
    );
  }

  BoxDecoration _buildDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xffFF715E), Color(0xffF587DB), Color(0xffF688DB), Color(0xff9C72F4)],
          // stops: [0.0, 0.35, 0.56, 1.0]
        )
    );
  }

}
