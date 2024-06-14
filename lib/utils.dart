import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:convert' as j;

// ignore: camel_case_types, constant_identifier_names
enum NOTIFICATION_TYPE { SUCCESS, ERROR }

class Utils {
  static void showNotification(NOTIFICATION_TYPE type,
      [String? title, String? notification, Color? color]) {
    final notificationColor = {
      NOTIFICATION_TYPE.SUCCESS: Colors.green,
      NOTIFICATION_TYPE.ERROR: Colors.red,
    };

    Get.rawSnackbar(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
        snackPosition: SnackPosition.TOP,
        borderRadius: 8,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: notificationColor[type]!,
        messageText: Text(
          notification?.tr ?? '',
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
        ));
  }

  static bool validatePhoneNumber(String value) {
    final RegExp phoneReg =
        RegExp(r'((09|03|07|08|05)+([0-9]{8})\b)|((84)+([0-9]{9})\b)');
    return phoneReg.hasMatch(value);
  }

  static void backToRoutes(String routes) {
    bool isNot = Get.currentRoute != routes;
    while (isNot) {
      isNot = Get.currentRoute != routes;
      if (isNot) {
        Get.back();
      }
    }
  }

  static String formatDuration(num milliseconds) {
    Duration duration = Duration(milliseconds: milliseconds.toInt());

    int hours = duration.inHours;
    int minutes = (duration.inMinutes % 60);

    String formattedTime = '';

    if (hours > 0) {
      formattedTime += '${(hours < 10) ? '0$hours' : '$hours'}  Giờ';
    }

    if (minutes >= 0 || hours > 0) {
      formattedTime += '${'$minutes'} Phút ';
    }

    return formattedTime;
  }

  static Map<K, V> validateNull<K, V>(Map<K, V> value) {
    value.removeWhere((key, value) {
      return key == null ||
          value == null ||
          value == 'null' ||
          value == '' ||
          value is Map && value.isEmpty ||
          value is List && value.isEmpty;
    });
    return value;
  }

  static DateTime formatStringToDate(String? time, [String? format]) {
    final inputFormat = DateFormat(format ?? 'dd/MM/yyyy');
    if (time != null) {
      return inputFormat.parse(time);
    } else {
      return DateTime.now();
    }
  }

  static String formatDateToDisplay(DateTime? time, [String? outputFormat]) {
    final output = DateFormat(outputFormat ?? 'dd/MM/yyyy');
    if (time == null) return '';
    return output.format(time);
  }

  static String getTimeDifferenceFromNow(DateTime date) {
    final date2 = DateTime.now();
    final difference = date2.difference(date);

    if (difference.inSeconds < 5) {
      return 'Vừa xong';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds} giây trước';
    } else if (difference.inMinutes <= 1) {
      return '1 phút trước';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} phút trước';
    } else if (difference.inHours <= 1) {
      return '1 giờ trước';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inDays <= 1) {
      return '1 ngày trước';
    } else if (difference.inDays < 6) {
      return '${difference.inDays} ngày trước';
    } else if ((difference.inDays / 7).ceil() <= 1) {
      return '1 tuần trước';
    } else if ((difference.inDays / 7).ceil() < 4) {
      return '${(difference.inDays / 7).ceil()} tuần trước';
    } else if ((difference.inDays / 30).ceil() <= 1) {
      return '1 tháng trước';
    } else if ((difference.inDays / 30).ceil() < 30) {
      return '${(difference.inDays / 30).ceil()} tháng trước';
    } else if ((difference.inDays / 365).ceil() <= 1) {
      return '1 năm trước';
    }
    return '${(difference.inDays / 365).floor()} năm trước';
  }

  static String removeVietnameseAccent(String text) {
    return text
        .replaceAll(RegExp(r'[àáảãạăắằẳẵặâấầẩẫậ]'), 'a')
        .replaceAll(RegExp(r'[đ]'), 'd')
        .replaceAll(RegExp(r'[èéẻẽẹêếềểễệ]'), 'e')
        .replaceAll(RegExp(r'[ìíỉĩị]'), 'i')
        .replaceAll(RegExp(r'[òóỏõọôốồổỗộơớờởỡợ]'), 'o')
        .replaceAll(RegExp(r'[ùúủũụưứừửữự]'), 'u')
        .replaceAll(RegExp(r'[ỳýỷỹỵ]'), 'y')
        .replaceAll(RegExp(r'[ÀÁẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬ]'), 'A')
        .replaceAll(RegExp(r'[Đ]'), 'D')
        .replaceAll(RegExp(r'[ÈÉẺẼẸÊẾỀỂỄỆ]'), 'E')
        .replaceAll(RegExp(r'[ÌÍỈĨỊ]'), 'I')
        .replaceAll(RegExp(r'[ÒÓỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢ]'), 'O')
        .replaceAll(RegExp(r'[ÙÚỦŨỤƯỨỪỬỮỰ]'), 'U')
        .replaceAll(RegExp(r'[ỲÝỶỸỴ]'), 'Y');
  }
}

extension MapExtension<K, V> on Map<K, V> {
  Map<K, V> get json => Map<K, V>.from(Utils.validateNull(this));
  Map<K, V> get prettyJson =>
      j.json.decode(const j.JsonEncoder.withIndent(' ').convert(this));
}
