import 'package:logging/logging.dart';

class AppLogger {
  static final Logger _logger = Logger('LayerXApp');

  static void initialize() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      final message = '${record.level.name}: ${record.time}: ${record.message}';
      if (record.error != null) {
        print('$message\n${record.error}\n${record.stackTrace}');
      } else {
        print(message);
      }
    });
  }

  static void debug(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.fine(message, error, stackTrace);
  }

  static void info(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.info(message, error, stackTrace);
  }

  static void warning(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.warning(message, error, stackTrace);
  }

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.severe(message, error, stackTrace);
  }
}
