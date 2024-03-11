import 'package:flutter/material.dart';

extension DecorationExtension on BoxDecoration {
  BoxDecoration get defautlShadow => copyWith(
        boxShadow: [
          const BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 20,
            color: Colors.black12,
          )
        ],
      );
}
