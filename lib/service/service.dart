import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../utils/lang_functions.dart';

class AppService {
  late final LanguageUtils languageUtils;
  Future<void> clearUserData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(languageUtils.getTranslatedString('Clear Data')),
          content: Text(languageUtils.getTranslatedString(
              'Are you sure you want to clear all user data ?')),
          actions: [
            TextButton(
              child: Text(languageUtils.getTranslatedString('Cancel')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(languageUtils.getTranslatedString('OK')),
              onPressed: () async {
                await prefs.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
