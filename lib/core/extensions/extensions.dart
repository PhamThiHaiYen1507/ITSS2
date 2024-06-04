import 'package:flutter/material.dart';

import '../response/base_response.dart';

extension BaseResponseExtension on BaseResponse {
  List<T>? getItems<T>(T Function(Map<String, dynamic>) decoder,
      {String? fromKey}) {
    if (fromKey != null && data is Map && data[fromKey] is List) {
      return (data[fromKey] as List).map((e) => decoder(e)).toList();
    }

    if (data is List) {
      return (data as List).map((e) => decoder(e)).toList();
    }
    return null;
  }

  T? getBody<T>(T Function(Map<String, dynamic>) decoder, {String? fromKey}) {
    if (fromKey != null && data is Map && data[fromKey] is Map) {
      return decoder(data[fromKey] as Map<String, dynamic>);
    }

    if (data is Map) {
      return decoder(data as Map<String, dynamic>);
    }

    return null;
  }
}

extension BuildContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  Size get size => MediaQuery.of(this).size;
}
