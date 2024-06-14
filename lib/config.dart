import 'package:translate_app/app_config/app_config.dart';

void setAppDevelopment() {
  AppConfig(
    env: ENV.DEV,
    baseUrl: '6fd7-14-231-11-51.ngrok-free.app',
    baseUrlMap: 'maps.vietmap.vn',
    secure: true,
    fetchCount: 20,
  );
}

void setAppProduction() {
  AppConfig(
    env: ENV.PROD,
    baseUrl: '6fd7-14-231-11-51.ngrok-free.app',
    baseUrlMap: 'maps.vietmap.vn',
    secure: true,
    fetchCount: 20,
  );
}
