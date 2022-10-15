import 'package:phone/models/country.dart';

abstract class CountryState {}

class CountryStartAppState extends CountryState {}

class CountryLoadedState extends CountryState {
  CountryLoadedState({required this.countries});

  Country initCountry = Country(
    name: 'Ukraine',
    callingCodes: ['380'],
    flag: 'https://flagcdn.com/ua.svg',
  );
  List<Country> countries;
}

class CountryChosenState extends CountryState {
  CountryChosenState({required this.country});

  Country country;
}
