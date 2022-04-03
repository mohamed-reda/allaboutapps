class Clubs {
  Clubs({
    required this.id,
    required this.name,
    required this.country,
    required this.value,
    required this.image,
    required this.europeanTitles,
    required this.stadium,
    required this.location,
  });
  late final String id;
  late final String name;
  late final String country;
  late final int value;
  late final String image;
  late final int europeanTitles;
  late final Stadium stadium;
  late final Location location;

  Clubs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    value = json['value'];
    image = json['image'];
    europeanTitles = json['european_titles'];
    stadium = Stadium.fromJson(json['stadium']);
    location = Location.fromJson(json['location']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['country'] = country;
    _data['value'] = value;
    _data['image'] = image;
    _data['european_titles'] = europeanTitles;
    _data['stadium'] = stadium.toJson();
    _data['location'] = location.toJson();
    return _data;
  }
}

class Stadium {
  Stadium({
    required this.size,
    required this.name,
  });
  late final int size;
  late final String name;

  Stadium.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['size'] = size;
    _data['name'] = name;
    return _data;
  }
}

class Location {
  Location({
    required this.lat,
    required this.lng,
  });
  late final double lat;
  late final double lng;

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lng'] = lng;
    return _data;
  }
}
