class Distance {
  final double _meters;

  const Distance._(this._meters);

  Distance.cms(double cm) : this._(cm / 100);
  Distance.meters(double m) : this._(m);
  Distance.kms(double km) : this._(km * 1000);

  double get cms => _meters * 100;
  double get meters => _meters;
  double get kms => _meters / 1000;

  Distance operator +(Distance other) => Distance._(_meters + other._meters);
}
void main() {
  var d1 = Distance.kms(3.4);
  var d2 = Distance.meters(1000);

  print((d1 + d2).meters);
}
