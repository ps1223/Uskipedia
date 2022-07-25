
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uskimuski/providers/menu_provider.dart';
import 'package:uskimuski/routes.dart';
import 'package:uskimuski/ui/utils/Util.dart';
import 'package:uskimuski/ui/common/app_expansion_panel.dart';

class SampleExpansion extends StatelessWidget {
  const SampleExpansion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> menuList = context.watch<MenuProvider>().menuList;
    int selectedMenu = context.watch<MenuProvider>().selectedMenu;
    return AppExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        if(isExpanded) {
          context.read<MenuProvider>().setSelectedMenu(-1);
        } else {
          context.read<MenuProvider>().setSelectedMenu(index + 1);
        }
      },
      elevation: 0,
      dividerColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 600),
      expandedHeaderPadding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      children: menuList.map<ExpansionPanel>((menu) {
        int id = menu['id'];
        String name = menu['name'];
        dynamic subMenus = menu['subMenus'];
        return ExpansionPanel(
          backgroundColor: Colors.transparent,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return TextButton(
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
            );
          },
          body: _buildSubMenu(subMenus),
          isExpanded: id == selectedMenu,
        );
      }).toList()
    );
  }

  Widget _buildSubMenu(dynamic subMenus) {
    return ListView.builder(
      itemCount: subMenus.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        dynamic subMenu = subMenus[index];
        String name = subMenu['name'];
        return ListTile(
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
        );
      }
    );
  }

}