import 'package:flutter/material.dart';

extension StringExtension on String? {
  bool isNullOrEmpty() {
    return this == null || this == '';
  }

  String removeSpaces() {
    if (this == null) {
      return '';
    } else {
      return this!.replaceAll(' ', '');
    }
  }

  String? getStringMatchesWith(String start, String end) {
    if (isNullOrEmpty()) {
      return '';
    }

    RegExp regExp = RegExp('(?<=$start).*?(?=$end)');
    return regExp.stringMatch(this!);
  }

  double toTimeOfDayAsDouble() {
    if (isNullOrEmpty()) {
      return 0;
    }

    TimeOfDay time = TimeOfDay(
        hour: int.parse(this!.split(':')[0]),
        minute: int.parse(this!.split(':')[1]));
    return time.hour + time.minute / 60.0;
  }

  String toAPIURL() {
    if (isNullOrEmpty()) {
      return '';
    }

    if (this!.endsWith('/')) {
      return this!.substring(0, this!.length - 1);
    }
    return this ?? '';
  }

  String camelCase() {
    return '${this![0].toLowerCase()}${this!.substring(1)}';
  }

  String capitalize() {
    return '${this![0].toUpperCase()}${this!.substring(1)}';
  }
}
