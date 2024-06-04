import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:translate_app/utils.dart';
import 'package:translate_app/utils/app_logger/custom_printer.dart';

import '../../app_config/app_config.dart';

abstract class ExtendModel {
  Map toJson();
}

final _AppLoggerImp _loggerImp = _AppLoggerImp();

class _AppLoggerImp extends AppLoggerDefine {
  _AppLoggerImp()
      : super(AppConfig.info.env == ENV.DEV ||
            (AppConfig.info.env == ENV.PROD && kDebugMode));
}

void logD(dynamic message) {
  _loggerImp.logD(message);
}

void logW(dynamic message) {
  _loggerImp.logW(message);
}

void logE(dynamic message, [StackTrace? stackTrace]) {
  _loggerImp.logE(message, stackTrace);
}

class _CustomFilter extends LogFilter {
  final bool allowPrint;

  _CustomFilter(this.allowPrint);
  @override
  bool shouldLog(LogEvent event) {
    return allowPrint;
  }
}

abstract class AppLoggerDefine {
  final bool allowPrint;
  late final Logger _logger;
  AppLoggerDefine(this.allowPrint) {
    _logger = Logger(
        printer: CustomPrinter(
          printTime: true,
          methodCount: 8,
        ),
        filter: _CustomFilter(allowPrint));
  }

  void logD(dynamic message) {
    _log(Level.debug, message);
  }

  void logW(dynamic message) {
    _log(Level.warning, message);
  }

  void logE(dynamic message, [StackTrace? stackTrace]) {
    _log(Level.error, message, null, stackTrace);
  }

  void _log(Level level, dynamic message,
      [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      if (message is List) {
        _logger.log(
            level,
            message
                .map((e) => e is Map
                    ? e.prettyJson
                    : e is ExtendModel
                        ? e.toJson()
                        : e)
                .toList(),
            error,
            stackTrace);
      } else if (message is Map) {
        final json = {};
        message.forEach((key, value) {
          json[key] = value is ExtendModel ? value.toJson() : value;
        });
        _logger.log(level, json.prettyJson, error, stackTrace);
      } else if (message is Iterable<Map>) {
        _logger.log(level, message.map((e) => e.prettyJson).toList(), error,
            stackTrace);
      } else if (message is ExtendModel) {
        _logger.log(level, message.toJson().prettyJson, error, stackTrace);
      } else {
        _logger.log(level, message, error, stackTrace);
      }
    }
  }
}
