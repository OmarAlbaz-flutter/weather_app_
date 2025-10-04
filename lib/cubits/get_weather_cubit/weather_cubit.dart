import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    emit(WeatherLoadingState());

    try {
      weatherModel = await WeatherService(Dio()).getWeatherInfo(
        cityName: cityName,
      );
      emit(
        WeatherSuccessState(weatherModel!),
      );
    } catch (e) {
      emit(
        WeatherFailureState(errMessage: e.toString()),
      );
    }
  }
}
