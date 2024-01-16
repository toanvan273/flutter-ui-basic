import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';
enum WeatherCondition {
  clear,
  rainy,
  cloudy,
  snowy,
  unknown,
}

@JsonSerializable()
class Weather {
  String location;
  double temperature;
  int? weathercode;
  WeatherCondition condition;
  Weather({
    required this.location,
    required this.temperature,
    @JsonKey(name: 'weathercode')
    this.weathercode,
    required this.condition
  });

  // factory Weather.fromJson(Map<String, dynamic> json){
  //   return Weather(temperature: json['temperature'], weathercode: json['weathercode']);
  // }

  Map<String, dynamic> toJson(){
    return {
      'temperature': temperature,
      'location': location,
      'condition': condition
    };
  }
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  // Map<String, dynamic> toJson() => _$WeatherToJson(this);
  @override
  List<Object> get props => [location, temperature, condition];
}