import 'package:phone/models/country.dart';

abstract class CountryEvent {}

class CountryChooseEvent extends CountryEvent {
  CountryChooseEvent({required this.country});

  Country country;
}

class CountryInitEvent extends CountryEvent {}
