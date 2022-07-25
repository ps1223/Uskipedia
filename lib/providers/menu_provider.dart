import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {

  int _selectedMenu = -1;

  final List<Map<String, dynamic>> _menuList = [
    {
      "id": 1,
      "name": "Geography",
      "subMenus": [
        {
          "id": 1,
          "name": "Discipline"
        },
        {
          "id": 2,
          "name": "Punctuality"
        },
        {
          "id": 3,
          "name": "Value"
        },
      ],
    },
    {
      "id": 2,
      "name": "Science",
      "subMenus": [
        {
          "id": 1,
          "name": "Discipline"
        },
        {
          "id": 2,
          "name": "Punctuality"
        },
        {
          "id": 3,
          "name": "Value"
        },
      ],
    },
    {
      "id": 3,
      "name": "Space",
      "subMenus": [
        {
          "id": 1,
          "name": "Discipline"
        },
        {
          "id": 2,
          "name": "Punctuality"
        },
        {
          "id": 3,
          "name": "Value"
        },
      ],
    },
    {
      "id": 4,
      "name": "Life Skill",
      "subMenus": [
        {
          "id": 1,
          "name": "Discipline"
        },
        {
          "id": 2,
          "name": "Punctuality"
        },
        {
          "id": 3,
          "name": "Value"
        },
      ],
    },
    {
      "id": 5,
      "name": "Quality of life",
      "subMenus": [
        {
          "id": 1,
          "name": "Discipline"
        },
        {
          "id": 2,
          "name": "Punctuality"
        },
        {
          "id": 3,
          "name": "Value"
        },
      ],
    },
    {
      "id": 6,
      "name": "Social",
      "subMenus": [
        {
          "id": 1,
          "name": "Discipline"
        },
        {
          "id": 2,
          "name": "Punctuality"
        },
        {
          "id": 3,
          "name": "Value"
        },
      ],
    },
    {
      "id": 7,
      "name": "General awareness",
      "subMenus": [
        {
          "id": 1,
          "name": "Discipline"
        },
        {
          "id": 2,
          "name": "Punctuality"
        },
        {
          "id": 3,
          "name": "Value"
        },
      ],
    },
    {
      "id": 8,
      "name": "Health",
      "subMenus": [
        {
          "id": 1,
          "name": "Discipline"
        },
        {
          "id": 2,
          "name": "Punctuality"
        },
        {
          "id": 3,
          "name": "Value"
        },
      ],
    },
  ];

  String _selectedTopic = "";

  List<Map<String, dynamic>> get menuList => _menuList;

  int get selectedMenu => _selectedMenu;

  String get selectedTopic => _selectedTopic;

  void setSelectedMenu(int value) {
    _selectedMenu = value;
    notifyListeners();
  }

  void setSelectedTopic(String value) {
    _selectedTopic = value;
    notifyListeners();
  }

}
