import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {

  const TopBar({Key? key, required this.title, required this.appBar}) : super(key: key);

  final String title;
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          foreground: Paint()..shader = const LinearGradient(
              begin: Alignment.topCenter,
              colors: <Color>[
                Color(0xffFFA5A6),
                Color(0xffFF7C93),
              ],
              end: Alignment.bottomCenter
          ).createShader(const Rect.fromLTRB(0.0, 0.0, 0.0, 100.0)),
        ),
      ),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        ),
      ],
      backgroundColor: const Color(0xffFF715E),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

}
