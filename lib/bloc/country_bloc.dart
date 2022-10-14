import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone/bloc/country_event.dart';
import 'package:phone/bloc/country_state.dart';
import 'package:phone/repository.dart';

import '../models/country.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  Repo repo = Repo();

  CountryBloc(super.initialState);

  @override
  Stream<CountryState> mapEventToState(CountryEvent event) async* {
    if (event is CountryInitEvent) {
      List<Country> countries = [];
      countries = await Repo().loadCountries();
      yield CountryLoadedState(countries: countries);
    } else if (event is CountryChooseEvent) {
      yield CountryChosenState(
          country: Country(name: 'name', callingCodes: [], flag: 'flag'));
    }
  }
}
