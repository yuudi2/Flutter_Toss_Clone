import 'dart:convert';
import 'dart:io';

import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';

class LocalJson {
  static T getObject<T>(String filePath) {
    final string = getJsonString(filePath);
    final json = jsonDecode(string);
    return _tryConverting(json);
  }

  static dynamic getJson(String filePath) {
    final string = getJsonString(filePath);
    return jsonDecode(string);
  }

  static String getJsonString(String filePath) {
    Directory current = Directory.current;
    String path = current.path.endsWith('/test_resources') ? current.path : '${current.path}/test_resources';
    final file = File('$path/$filePath');
    final string = file.readAsStringSync();
    return string;
  }
}

T _tryConverting<T>(dynamic json) {
  switch (T) {
    case SimpleStock:
    default:
      return SimpleStock.fromJson(json) as T;
  }
}
