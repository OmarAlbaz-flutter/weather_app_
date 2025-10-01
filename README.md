# Weather App

A Flutter application that provides real-time weather information for any city.

## Overview

**Weather App** allows users to search for a city and instantly get up-to-date weather details, including temperature, weather condition, and more. The app features a responsive and visually appealing interface with dynamic backgrounds based on current weather conditions.

## Features

- **City Search:**  
  Enter a city name to retrieve the latest weather information.

- **Weather Details:**  
  - City name
  - Last updated time
  - Temperature (current, max, min)
  - Weather condition (e.g., Sunny, Rainy) with icon

- **Dynamic UI:**  
  - Gradient backgrounds and color scheme change based on the weather condition.
  - Error handling with informative messages.

- **Cross-Platform:**  
  Built with Flutter and runs on Android, iOS, Web, Linux, and Windows.

## Getting Started

1. **Clone this repository:**
   ```sh
   git clone https://github.com/OmarAlbaz-flutter/weather_app_.git
   cd weather_app_
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Run the app:**
   ```sh
   flutter run
   ```

## Project Structure

- `lib/screens/`: Main screens (home, search).
- `lib/widgets/`: UI components for displaying weather info and states.
- `lib/cubits/`: State management using Bloc/Cubit.
- `lib/services/`: API service for fetching weather data.
- `lib/models/`: Data models.

## Notes

- Uses [WeatherAPI.com](https://www.weatherapi.com/) for data fetching (API key required in `lib/services/weather_service.dart`).
- Make sure to replace the API key with your own for production use.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

[MIT](LICENSE)

---

For more information on Flutter, see the [official Flutter documentation](https://docs.flutter.dev/).
