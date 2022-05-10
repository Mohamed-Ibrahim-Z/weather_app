abstract class WeatherState{}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class GetWeatherSuccessState extends WeatherState {}

class GetWeatherFailureState extends WeatherState {
  final String? errorMessage;

  GetWeatherFailureState({this.errorMessage});
}