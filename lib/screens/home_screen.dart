import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  iconSize: 35,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SearchScreen();
                        },
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                  ),
                )
              ],
              title: Text(
                'Weather App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: getWeatherGradient(
                      BlocProvider.of<WeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition),
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else if (state is WeatherSuccessState) {
                    return WeatherInfoBody();
                  } else if (state is WeatherFailureState) {
                    return Center(
                      child: Text(
                        "Oops, There was an error!",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    return NoWeatherBody();
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

List<Color> getWeatherGradient(String? condition) {
  if (condition == null) {
    return [Colors.blue.shade300, Colors.blue.shade700];
  }

  final normalized = condition.toLowerCase();

  // ☀️ Sunny / Clear
  if (normalized.contains("sunny") || normalized.contains("clear")) {
    return [Colors.orange.shade300, Colors.deepOrange.shade700];
  }

  // ☁️ Cloudy / Overcast / Mist / Fog
  if (normalized.contains("cloudy") ||
      normalized.contains("overcast") ||
      normalized.contains("mist") ||
      normalized.contains("fog")) {
    return [Colors.grey.shade400, Colors.blueGrey.shade700];
  }

  // 🌧️ Rain / Drizzle / Showers
  if (normalized.contains("rain") ||
      normalized.contains("drizzle") ||
      normalized.contains("shower")) {
    return [Colors.blue.shade400, Colors.blue.shade900];
  }

  // ❄️ Snow / Blizzard / Sleet / Ice
  if (normalized.contains("snow") ||
      normalized.contains("sleet") ||
      normalized.contains("blizzard") ||
      normalized.contains("ice") ||
      normalized.contains("freezing")) {
    return [Colors.lightBlue.shade200, Colors.lightBlue.shade700];
  }

  // 🌩️ Thunder / Storm
  if (normalized.contains("thunder") || normalized.contains("storm")) {
    return [Colors.deepPurple.shade400, Colors.deepPurple.shade900];
  }

  // Default fallback
  return [Colors.blue.shade300, Colors.blue.shade700];
}
