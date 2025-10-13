class Distance {
  // store distance internally in meters (immutable)
  final double _meters;

  // Private constructor
  const Distance._(this._meters);

  // Named constructors
  factory Distance.cms(double cm) => Distance._(cm / 100);
  factory Distance.meters(double m) => Distance._(m);
  factory Distance.kms(double km) => Distance._(km * 1000);

  // Getters for each unit
  double get cms => _meters * 100;
  double get meters => _meters;
  double get kms => _meters / 1000;

  // Operator overloading (+)
  Distance operator +(Distance other) => Distance._(_meters + other._meters);
}

void main() {
  Distance d1 = Distance.kms(3.4);
  Distance d2 = Distance.meters(1000);

  // Print only the total in kilometers
  print((d1 + d2).kms);
}
