import 'dart:math';

class DistanceHelper {
  double _degreesToRadians(double degrees) {
    return degrees * (pi / 180.0);
  }

  double getDistance(double lat1, double lon1, double lat2, double lon2) {
    var earthRadiusKm = 6371;
    lat1 = _degreesToRadians(lat1);
    lon1 = _degreesToRadians(lon1);
    lat2 = _degreesToRadians(lat2);
    lon2 = _degreesToRadians(lon2);

    // Calculate the differences
    double dlat = lat2 - lat1;
    double dlon = lon2 - lon1;

    // Haversine formula
    double a =
        pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Calculate the distance
    double distance = earthRadiusKm * c;

    return distance;
  }
}
