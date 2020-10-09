class ConstantUrl {
  ConstantUrl._();

  static String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static String appId = '8431c1af723ec74b5e15ecf8656b25dc';

  static String getWeatherUrl(double lat, double lng) =>
      '$baseUrl/weather?lat=$lat&lon=$lng&units=metric&appid=$appId';
  static String getForecastUrl(double lat, double lng) =>
      '$baseUrl/forecast?lat=$lat&lon=$lng&units=metric&appid=$appId';
}
