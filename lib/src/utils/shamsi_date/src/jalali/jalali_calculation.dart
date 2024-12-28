part of 'jalali_date.dart';

class _Algo {
  const _Algo._();

  static _JalaliCalculation calculate(int jy) {
    final List<int> breaks = [
      -61,
      9,
      38,
      199,
      426,
      686,
      756,
      818,
      1111,
      1181,
      1210,
      1635,
      2060,
      2097,
      2192,
      2262,
      2324,
      2394,
      2456,
      3178,
    ];

    final int bl = breaks.length;
    final int gy = jy + 621;
    int leapJ = -14;
    int jp = breaks[0];
    int jump = 0;

    if (jy < -61 || jy >= 3178) {
      throw StateError('should not happen');
    }

    for (int i = 1; i < bl; i += 1) {
      final int jm = breaks[i];
      jump = jm - jp;
      if (jy < jm) {
        break;
      }
      leapJ = leapJ + (jump ~/ 33) * 8 + (((jump % 33)) ~/ 4);
      jp = jm;
    }
    int n = jy - jp;

    leapJ = leapJ + ((n) ~/ 33) * 8 + (((n % 33) + 3) ~/ 4);
    if ((jump % 33) == 4 && jump - n == 4) {
      leapJ += 1;
    }

    final int leapG = ((gy) ~/ 4) - (((((gy) ~/ 100) + 1) * 3) ~/ 4) - 150;

    final int march = 20 + leapJ - leapG;

    if (jump - n < 6) {
      n = n - jump + ((jump + 4) ~/ 33) * 33;
    }
    int leap = ((((n + 1) % 33) - 1) % 4);
    if (leap == -1) {
      leap = 4;
    }

    return _JalaliCalculation(leap: leap, gy: gy, march: march);
  }

  static Jalali createFromJulianDayNumber(
    int julianDayNumber,
    int hour,
    int minute,
    int second,
    int millisecond,
  ) {
    if (julianDayNumber < 1925675 || julianDayNumber > 3108616) {
      throw DateException('Julian day number is out of computable range.');
    }

    if (hour < 0 || hour > 23) {
      throw DateException('Hour is out of bounds. [0..23]');
    }
    if (minute < 0 || minute > 59) {
      throw DateException('Minute is out of bounds. [0..59]');
    }
    if (second < 0 || second > 59) {
      throw DateException('Second is out of bounds. [0..59]');
    }
    if (millisecond < 0 || millisecond > 999) {
      throw DateException('Millisecond is out of bounds. [0..999]');
    }

    final int gy = Gregorian.fromJulianDayNumber(
      julianDayNumber,
      hour,
      minute,
      second,
      millisecond,
    ).year;
    int jy = gy - 621;
    final r = calculate(jy);
    bool isLeap = r.leap == 0;
    final int jdn1f = Gregorian(
      gy,
      3,
      r.march,
      hour,
      minute,
      second,
      millisecond,
    ).julianDayNumber;
    int k = julianDayNumber - jdn1f;
    if (k >= 0) {
      if (k <= 185) {
        final int jm = 1 + (k ~/ 31);
        final int jd = (k % 31) + 1;

        return Jalali._raw(
          julianDayNumber,
          jy,
          jm,
          jd,
          hour,
          minute,
          second,
          millisecond,
          isLeap,
        );
      } else {
        k -= 186;
      }
    } else {
      jy -= 1;
      k += 179;
      if (r.leap == 1) k += 1;

      isLeap = r.leap == 1;
    }
    final int jm = 7 + (k ~/ 30);
    final int jd = (k % 30) + 1;

    return Jalali._raw(
      julianDayNumber,
      jy,
      jm,
      jd,
      hour,
      minute,
      second,
      millisecond,
      isLeap,
    );
  }

  static Jalali createFromYearMonthDay(
    int year,
    int month,
    int day,
    int hour,
    int minute,
    int second,
    int millisecond,
  ) {
    if (year < -61 || year > 3177) {
      throw DateException('Jalali date is out of computable range.');
    }

    if (month < 1 || month > 12) {
      throw DateException('Jalali month is out of valid range.');
    }

    if (day < 1) {
      throw DateException('Jalali day is out of valid range.');
    }

    if (year == 3177) {
      if (month > 10 || (month == 10 && day > 11)) {
        throw DateException('Jalali date is out of computable range.');
      }
    }

    final r = calculate(year);
    final isLeap = r.leap == 0;

    final int ml = month == 12 ? (isLeap ? 30 : 29) : (month > 6 ? 30 : 31);

    if (day > ml) {
      throw DateException('Jalali day is out of valid range.');
    }

    if (hour < 0 || hour > 23) {
      throw DateException('Hour is out of bounds. [0..23]');
    }
    if (minute < 0 || minute > 59) {
      throw DateException('Minute is out of bounds. [0..59]');
    }
    if (second < 0 || second > 59) {
      throw DateException('Second is out of bounds. [0..59]');
    }
    if (millisecond < 0 || millisecond > 999) {
      throw DateException('Millisecond is out of bounds. [0..999]');
    }

    final julianDayNumber = Gregorian(
          r.gy,
          3,
          r.march,
          hour,
          minute,
          second,
          millisecond,
        ).julianDayNumber +
        (month - 1) * 31 -
        (month ~/ 7) * (month - 7) +
        day -
        1;

    return Jalali._raw(
      julianDayNumber,
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      isLeap,
    );
  }
}

class _JalaliCalculation {
  final int leap;

  final int gy;

  final int march;

  const _JalaliCalculation({
    required this.leap,
    required this.gy,
    required this.march,
  });
}
