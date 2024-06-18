import 'package:translate_app/app_config/app_config.dart';

void setAppDevelopment() {
  AppConfig(
    env: ENV.DEV,
    baseUrl: '18.139.76.230:8087',
    baseUrlMap: 'maps.vietmap.vn',
    secure: false,
    fetchCount: 20,
  );
}

void setAppProduction() {
  AppConfig(
    env: ENV.PROD,
    baseUrl: '18.139.76.230:8087',
    baseUrlMap: 'maps.vietmap.vn',
    secure: false,
    fetchCount: 20,
  );
}
