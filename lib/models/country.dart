class Country {
  Country({
    required this.name,
    required this.callingCodes,
    required this.flag,
  });

  Country.fromJson(dynamic json) {
    name = json['name'];
    callingCodes =
        json['callingCodes'] != null ? json['callingCodes'].cast<String>() : [];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['callingCodes'] = callingCodes;
    map['flag'] = flag;
    return map;
  }

  String name = '';
  List<String> callingCodes = [];
  String flag = '';
}
