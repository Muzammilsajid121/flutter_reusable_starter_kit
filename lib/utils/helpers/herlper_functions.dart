import 'package:flutter/material.dart';

class THelperFucntion {

  //capital first letter
  static String capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';
  }
  // usage: Text("${THelperFucntion.capitalizeFirst(answerSubmitData.remarks ?? "")},\nUserName!"),


  static List<T> removeDuplicate<T>(List<T> list) {
    return list.toSet().toList();
  }

  
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }


  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(
        Row(children: rowChildren),
      );
    }
    return wrappedList;
  }
}