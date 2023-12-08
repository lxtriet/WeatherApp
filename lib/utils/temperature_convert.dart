import 'package:intl/intl.dart';

const String unitDegreesCelsius = "\u00B0C";
const String unitDegreesFahrenheit = "\u00B0F";
const String unitKelvin = "K";

final NumberFormat _f = NumberFormat.decimalPattern("de_DE");

class TemperatureConvert {
  static num stringToDouble(String s) => _f.parse(s);

  static double celsiusToKelvin(double celsius) => 273.15 + celsius;

  static double fahrenheitToKelvin(double fahrenheit) =>
      (fahrenheit + 459.67) * 5 / 9;

  static double kelvinToCelsius(double kelvin) => kelvin - 273.15;

  static double kelvinToFahrenheit(double kelvin) => kelvin * 1.8 - 459.67;

  static double celsiusToFahrenheit(double celsius) => (celsius * 1.8) + 32;

  static double fahrenheitToCelsius(double fahrenheit) =>
      (fahrenheit - 32) * 5 / 9;

  static String celsiusToString(double celsius) =>
      _doubleToString(celsius, unitDegreesCelsius);

  static String fahrenheitToString(double fahrenheit) =>
      _doubleToString(fahrenheit, unitDegreesFahrenheit);

  static String kelvinToString(double kelvin) =>
      _doubleToString(kelvin, unitKelvin);

  static String _doubleToString(double val, String suffix) {
    var rounded = val.round();
    // Could be implemented nicer using intl
    return "${_f.format(val == rounded ? rounded : val)} $suffix";
  }
}
