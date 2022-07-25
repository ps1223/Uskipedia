
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uskimuski/providers/menu_provider.dart';
import 'package:uskimuski/routes.dart';
import 'package:uskimuski/ui/utils/Util.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MenuList extends StatelessWidget {

  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> menuList = context.watch<MenuProvider>().menuList;
    int selectedMenu = context.watch<MenuProvider>().selectedMenu;
    return ListView.builder(
      itemCount: menuList.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        dynamic menu = menuList[index];
        int id = menu['id'];
        String name = menu['name'];
        dynamic subMenus = menu['subMenus'];
        return Column(
          children: <Widget>[
            ListTile(
              title: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 5.0)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)))
                ),
                child: ListTile(
                  leading: Icon(
                      size: 30.0,
                      Icons.ac_unit_outlined
                  ),
                  title: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Util.rotateWidget(
                      Icon(
                          color: Colors.deepOrangeAccent,
                          Icons.heart_broken_outlined
                      ),
                      selectedMenu == id ? 90 : 360
                  ),
                ),
                onPressed: () {
                  context.read<MenuProvider>().setSelectedMenu(selectedMenu == id ? -1 : id);
                },
              ),
            ),
            selectedMenu == id ? _buildSubMenu(subMenus) : Container(),
          ]
        );
      }
    );
  }

  Widget _buildSubMenu(dynamic subMenus) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: subMenus.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          dynamic subMenu = subMenus[index];
          String name = subMenu['name'];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: -30.0,
              child: FadeInAnimation(
                child: ListTile(
                  title: OutlinedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(const BorderSide(
                        color: Colors.white,
                        width: 3.0
                      )),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 5.0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ))
                    ),
                    child: ListTile(
                      title: Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white
                        ),
                      ),
                      trailing: const Icon(
                        Icons.heart_broken_outlined,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      context.read<MenuProvider>().setSelectedTopic(name);
                      Navigator.of(context).pushNamed(Routes.photoGrid);
                    },
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }

}