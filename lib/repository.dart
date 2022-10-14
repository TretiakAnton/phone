import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/country.dart';

class Repo {
  factory Repo() => _instance;

  Repo._();

  static final _instance = Repo._();

  Future<List<Country>> loadCountries() async {
    List<Country> countries = <Country>[];
    var response =
        await http.get(Uri.parse('https://restcountries.com/v2/all'));
    var json = jsonDecode(response.body);
    for (var data in json) {
      countries.add(Country.fromJson(data));
    }
    return countries;
  }
}
