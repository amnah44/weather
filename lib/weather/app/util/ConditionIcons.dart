class ConditionIcons{
  // String getWeatherIcon(int condition) {
  //   if (condition < 300) {
  //     return '๐ฉ';
  //   } else if (condition < 400) {
  //     return '๐ง';
  //   } else if (condition < 600) {
  //     return 'โ๏ธ';
  //   } else if (condition < 700) {
  //     return 'โ๏ธ';
  //   } else if (condition < 800) {
  //     return '๐ซ';
  //   } else if (condition == 800) {
  //     return 'โ๏ธ';
  //   } else if (condition <= 804) {
  //     return 'โ๏ธ';
  //   } else {
  //     return '๐คทโ';
  //   }
  // }

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
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}