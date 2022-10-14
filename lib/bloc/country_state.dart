import 'package:phone/models/country.dart';

abstract class CountryState {}

class CountryLoadedState extends CountryState {
  CountryLoadedState({required this.countries});

  List<Country> countries;
}

class CountryChosenState extends CountryState {
  CountryChosenState({required this.country});

  Country country;
}
