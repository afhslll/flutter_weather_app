class City {
  static const table = 'city';
  static const colId = 'id';
  static const colName = 'name';
  static const colState = 'state';
  static const colLatitude = 'latitude';
  static const colLongitude = 'longitude';

  int id;
  String name;
  String state;
  double latitude;
  double longitude;

  City({this.name, this.state, this.latitude, this.longitude});

  City.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
    state = map[colState];
    latitude = map[colLatitude];
    longitude = map[colLongitude];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map;
    if (id != null) {
      map[colId] = id;
    }
    map[colName] = name;
    map[colState] = state;
    map[colLatitude] = latitude;
    map[colLongitude] = longitude;
    return map;
  }
}
