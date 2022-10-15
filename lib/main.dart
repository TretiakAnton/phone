import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phone/bloc/country_bloc.dart';
import 'package:phone/bloc/country_event.dart';
import 'package:phone/bloc/country_state.dart';
import 'package:phone/models/country.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: BlocProvider<CountryBloc>(
          create: (_) => CountryBloc()..add(CountryInitEvent()),
          child: const HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final CountryBloc bloc = BlocProvider.of<CountryBloc>(context);
    if (bloc.state is CountryStartAppState) {
      return Scaffold(
        body: Center(
          child: Column(
            children: const [
              CircularProgressIndicator(),
              Text('Loading data'),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: BlocBuilder<CountryBloc, CountryState>(
                    builder: (BuildContext context, countryState) {
                  Country country = Country(
                    name: '',
                    callingCodes: [],
                    flag: '',
                  );
                  List<Country> countries = [];
                  if (countryState is CountryLoadedState) {
                    country = countryState.initCountry;
                    countries = countryState.countries;
                  } else if (countryState is CountryChosenState) {
                    country = countryState.country;
                  }
                  return ElevatedButton(
                    child: Row(
                      children: [
                        _getPicture(country.flag),
                        Text('+${country.callingCodes.last}'),
                      ],
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return bottomSheet(countries, bloc);
                          });
                    },
                  );
                }),
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Phone Number',
                  ),
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

Widget bottomSheet(List<Country> countries, CountryBloc bloc) {
  return ListView.separated(
    itemBuilder: (context, index) {
      return InkWell(
        child: Row(
          children: [
            _getPicture(countries.elementAt(index).flag),
            Text('+${countries.elementAt(index).callingCodes.last}'),
            Text(countries.elementAt(index).name),
          ],
        ),
        onTap: () {
          bloc.add(CountryChooseEvent(country: countries.elementAt(index)));
        },
      );
    },
    separatorBuilder: (context, index) {
      return const SizedBox(height: 10);
    },
    itemCount: 10,
  );
}

_getPicture(String uri) {
  SvgPicture networkSvg = SvgPicture.network(
    uri,
    placeholderBuilder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(5.0),
        child: const CircularProgressIndicator()),
  );
  return networkSvg;
}
