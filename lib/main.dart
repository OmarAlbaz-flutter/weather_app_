import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                useMaterial3: false,
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: getWeatherColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition,
                  ),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  final normalized = condition.toLowerCase();
  // ☀️ Sunny / Clear
  if (normalized.contains("sunny") || normalized.contains("clear")) {
    return Colors.orange;
  }

  // ☁️ Cloudy / Overcast / Mist / Fog
  if (normalized.contains("cloudy") ||
      normalized.contains("overcast") ||
      normalized.contains("mist") ||
      normalized.contains("fog")) {
    return Colors.grey;
  }

  // 🌧️ Rain / Drizzle / Showers
  if (normalized.contains("rain") ||
      normalized.contains("drizzle") ||
      normalized.contains("shower")) {
    return Colors.blue;
  }

  // ❄️ Snow / Blizzard / Sleet / Ice
  if (normalized.contains("snow") ||
      normalized.contains("sleet") ||
      normalized.contains("blizzard") ||
      normalized.contains("ice") ||
      normalized.contains("freezing")) {
    return Colors.lightBlue;
  }

  // 🌩️ Thunder / Storm
  if (normalized.contains("thunder") || normalized.contains("storm")) {
    return Colors.deepPurple;
  }

  // Default fallback
  return Colors.blueGrey;
}
