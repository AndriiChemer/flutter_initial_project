extension StringExt on String {
  String removeAllSpaces() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  String removeNewLineSurplus() {
    return trim().replaceAll(RegExp(r'(\n){3,}'), '\n\n');
  }

  String replaceCommaWithDot() => replaceFirst(',', '.');
}

extension StringNullExt on String? {
  String? get nullOrValue {
    if (this == null || this!.isEmpty) {
      return null;
    }

    return this;
  }

  bool get isEmpty => this?.isEmpty ?? true;

  bool get isNotEmpty => this?.isNotEmpty ?? false;
}

extension DurationFromISO8601 on String {
  Duration get fromISO8601 {
    final input = replaceAll('-', '');
    const pattern =
        r'^(-)?P(?!$)(\d+(?:[.,]\d+)?Y)?(\d+(?:[.,]\d+)?M)?(\d+(?:[.,]\d+)?W)?(\d+(?:[.,]\d+)?D)?(T(?=\d)(\d+(?:[.,]\d+)?H)?(\d+(?:[.,]\d+)?M)?(\d+(?:[.,]\d+)?S)?)?$';

    final regExp = RegExp(pattern);
    final matches = regExp.matchAsPrefix(input);
    final isValid = RegExp(pattern).hasMatch(input);

    if (matches != null && isValid) {
      final y = matches.group(2)?.replaceFirst('Y', '').replaceCommaWithDot();
      final m = matches.group(3)?.replaceFirst('M', '').replaceCommaWithDot();
      final w = matches.group(4)?.replaceFirst('W', '').replaceCommaWithDot();
      final d = matches.group(5)?.replaceFirst('D', '').replaceCommaWithDot();
      final hrs = matches.group(7)?.replaceFirst('H', '').replaceCommaWithDot();
      final min = matches.group(8)?.replaceFirst('M', '').replaceCommaWithDot();
      final sec = matches.group(9)?.replaceFirst('S', '').replaceCommaWithDot();

      if (<String?>[y, m, w, d, hrs, min, sec].any(
        (element) {
          if (element == null) return false;
          if (double.tryParse(element) == null) return true;

          return false;
        },
      )) {
        throw FormatException('Cannot parse value from $input ISO8601 format');
      }

      final years = double.tryParse(y ?? '');
      final months = double.tryParse(m ?? '');
      final weeks = double.tryParse(w ?? '');
      final days = double.tryParse(d ?? '');
      final hours = double.tryParse(hrs ?? '');
      final minutes = double.tryParse(min ?? '');
      final seconds = double.tryParse(sec ?? '');

      final isNegative = matches.group(1) == '-';
      final multiply = isNegative ? -1 : 1;

      return Duration(
            days: (days ?? 0).toInt() +
                ((weeks ?? 0).toInt() * DateTime.daysPerWeek) +
                ((months ?? 0).toInt() * 30) +
                ((years ?? 0).toInt() * 365),
            hours: (hours ?? 0).toInt(),
            minutes: (minutes ?? 0).toInt(),
            seconds: (seconds ?? 0).toInt(),
          ) *
          multiply;
    } else {
      throw FormatException("$input doesn't match ISO8601 format");
    }
  }
}

extension ColorParser on String {
  /// Example input: #EC0677
  int get colorValueFromHexCode {
    final hexCode = replaceFirst('#', 'ff');

    return int.parse(hexCode, radix: 16);
  }
}
