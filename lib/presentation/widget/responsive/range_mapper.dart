typedef Range = (double from, double to);

extension on Range {
  double get from => $1;
  double get to => $2;
}

final class RangeMapper {
  const RangeMapper({
    required this.inRange,
    required this.outRange,
  });

  final Range inRange;
  final Range outRange;

  double call(double value) {
    final clamped = value.clamp(inRange.from, inRange.to);
    final normalized = (clamped - inRange.from) / (inRange.to - inRange.from);
    return normalized * (outRange.to - outRange.from) + outRange.from;
  }
}
