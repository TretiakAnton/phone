import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phone/models/country.dart';

Widget bottomSheet(List<Country> countries) {
  return ListView.separated(
    itemBuilder: (context, index) {
      return InkWell(
        child: Row(
          children: [
            _getPicture(countries.elementAt(index).flag),
            Text(countries.elementAt(index).callingCodes.last),
            Text(countries.elementAt(index).name),
          ],
        ),
        //onTap: ,
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
