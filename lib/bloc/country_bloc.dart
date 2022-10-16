import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone/bloc/country_event.dart';
import 'package:phone/bloc/country_state.dart';
import 'package:phone/models/country.dart';
import 'package:phone/repository.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  Repo repo = Repo();

  CountryBloc() : super(CountryStartAppState());

  @override
  Stream<CountryState> mapEventToState(CountryEvent event) async* {
    if (event is CountryInitEvent) {
      List<Country> countries = [];
      countries = await Repo().loadCountries();
      yield CountryLoadedState(countries: countries);
    } else if (event is CountryChooseEvent) {
      yield CountryChosenState(
        country: Country(
            name: event.country.name,
            callingCodes: event.country.callingCodes,
            flag: event.country.flag),
      );
    }
  }
}
