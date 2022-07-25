
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {

  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      iconSize: 30,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
              color: Colors.white,
              Icons.home_outlined
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
              color: Colors.white,
              Icons.emoji_events_outlined
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
              color: Colors.white,
              Icons.person_add_alt_outlined
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
              color: Colors.white,
              Icons.gamepad_outlined
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
              color: Colors.white,
              Icons.chat_outlined
          ),
          label: "",
        ),
      ],
      backgroundColor: const Color(0xffFF715E),
    );
  }

}