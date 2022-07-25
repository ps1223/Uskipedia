import 'package:flutter/material.dart';
import 'package:uskimuski/ui/grid/Detail.dart';
import 'package:uskimuski/ui/grid/PhotoGrid.dart';
import 'package:uskimuski/ui/uskipedia/uskipedia.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String uskipedia = '/uskipedia';
  static const String photoGrid = '/photo_grid';
  static const String detail = '/detail';

  static final routes = <String, WidgetBuilder>{
    uskipedia: (BuildContext context) => const Uskipedia(),
    photoGrid: (BuildContext context) => const PhotoGrid(),
    detail: (BuildContext context) => const Detail(),
  };
}
