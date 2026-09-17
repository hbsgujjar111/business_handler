class KMapTheme {
  /// Light Theme
  static const String? light = null;

  /// Dark Theme
  static const String dark = '''
    [
      {
        "elementType": "geometry",
        "stylers": [ { "color": "#0f0f0f" } ]
      },
      {
        "elementType": "labels.text.fill",
        "stylers": [ { "color": "#8e8e8e" } ]
      },
      {
        "elementType": "labels.text.stroke",
        "stylers": [ { "color": "#0f0f0f" } ]
      },
      {
        "featureType": "administrative",
        "elementType": "geometry",
        "stylers": [ { "color": "#2c2c2c" } ]
      },
      {
        "featureType": "poi",
        "elementType": "labels.text.fill",
        "stylers": [ { "color": "#757575" } ]
      },
      {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [ { "color": "#2c2c2c" } ]
      },
      {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [ { "color": "#3d3d3d" } ]
      },
      {
        "featureType": "road.highway",
        "elementType": "geometry",
        "stylers": [ { "color": "#3c3c3c" } ]
      },
      {
        "featureType": "transit",
        "elementType": "labels.text.fill",
        "stylers": [ { "color": "#757575" } ]
      },
      {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [ { "color": "#000000" } ]
      }
    ]
    ''';
}
