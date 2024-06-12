import 'package:translate_app/app_config/app_config.dart';

void setAppDevelopment() {
  AppConfig(
    env: ENV.DEV,
    baseUrl: '0e99-202-191-58-168.ngrok-free.app',
    baseUrlMap: 'maps.vietmap.vn',
    secure: true,
    fetchCount: 20,
  );
}

void setAppProduction() {
  AppConfig(
    env: ENV.PROD,
    baseUrl: '0e99-202-191-58-168.ngrok-free.app',
    baseUrlMap: 'maps.vietmap.vn',
    secure: true,
    fetchCount: 20,
  );
}
