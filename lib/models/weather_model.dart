class WeatherModel {
  final String cityName;
  final DateTime lastUpdated;
  final String? image;
  final double minTemp;
  final double maxTemp;
  final double temp;
  final String weatherCondition;

  WeatherModel({
    this.image,
    required this.temp,
    required this.cityName,
    required this.weatherCondition,
    required this.lastUpdated,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      lastUpdated: DateTime.parse(json['current']['last_updated']),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
