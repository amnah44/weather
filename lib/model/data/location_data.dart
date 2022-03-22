class LocationData{
  int temperature;
  String weatherIcon;
  String cityName;
  String weatherMessage;

  LocationData({
    this.temperature = 0,
    this.weatherIcon = '',
    this.cityName = 'loading',
    this.weatherMessage = ''
});
}