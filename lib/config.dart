import 'package:translate_app/app_config/app_config.dart';

void setAppDevelopment() {
  AppConfig(
    env: ENV.DEV,
    baseUrl: '24db-113-185-51-143.ngrok-free.app',
    baseUrlMap: 'maps.vietmap.vn',
    secure: false,
    fetchCount: 20,
  );
}

void setAppProduction() {
  AppConfig(
    env: ENV.PROD,
    baseUrl: '24db-113-185-51-143.ngrok-free.app',
    baseUrlMap: 'maps.vietmap.vn',
    secure: true,
    fetchCount: 20,
  );
}
