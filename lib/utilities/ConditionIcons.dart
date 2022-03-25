class ConditionIcons{
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getWeatherImage(int condition) {
    if (condition < 300) {
      return 'assets/thunder.jpg';
    } else if (condition < 400) {
      return 'assets/strong-rainy.jpg';
    } else if (condition < 600) {
      return 'assets/rainy.jpg';
    } else if (condition < 700) {
      return 'assets/snow.jpg';
    } else if (condition < 800) {
      return 'assets/cloudy.jpg';
    } else if (condition == 800) {
      return 'assets/sunny.jpg';
    } else if (condition <= 804) {
      return 'assets/fog.jpg';
    } else {
      return 'assets/weather.jpg';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}