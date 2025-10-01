import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There is no weather 😔 start',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
