import 'package:intl/intl.dart' as intl;
import 'package:u/utilities.dart';

extension TextEditingControllerExtension on TextEditingController {
  String numberString() => text.replaceAll(RegExp('[^0-9]'), '');

  int number() => text.replaceAll(RegExp('[^0-9]'), '').toInt();
}

extension OptionalStringExtension on String? {
  String numberString() => (this ?? "0").replaceAll(RegExp('[^0-9]'), '');

  int number() => (this ?? "0").replaceAll(RegExp('[^0-9]'), '').toInt();

  String? nullIfEmpty() => (this ?? "").isEmpty ? null : this;

  String getPrice() {
    final int nums = this!.toInt();
    return nums > 0 ? intl.NumberFormat('###,###,###,###,000').format(nums) : '0';
  }

  String separateNumbers3By3() => (this ?? "").replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (final Match m) => '${m[1]},');

  String toJalaliDateString() => Jalali.fromDateTime(DateTime.parse(this ?? DateTime.now().toString())).formatFullDate();

  String toJalaliDateTimeFull() {
    final DateTime dateTime = DateTime.parse(this ?? DateTime.now().toString());
    return "${Jalali.fromDateTime(dateTime).formatCompactDate()} ${dateTime.hour}:${dateTime.minute}";
  }

  String toRialMoneyPersian({final bool removeNegative = false}) => "${(this ?? "").separateNumbers3By3()} ریال".trim().replaceAll(removeNegative ? "" : "-", "");

  String toTomanMoneyPersian({final bool removeNegative = false}) => "${(this ?? "").separateNumbers3By3()} تومان".trim().replaceAll(removeNegative ? "" : "-", "");

  String rialToTomanMoneyPersian() => "${((this ?? "0").toInt() / 10).toString().separateNumbers3By3()} تومان ".trim();

  String formatJalaliDateTime({final bool toLocal = false}) {
    final DateTime dateTime = DateTime.parse(this ?? DateTime.now().toString()).toLocal();
    final Jalali jalali = Jalali.fromDateTime(dateTime);
    if (dateTime.hour == 0 && dateTime.minute == 0) return '${jalali.year}/${jalali.month}/${jalali.day}';
    return '${dateTime.hour}:${dateTime.minute}:${dateTime.second} ${jalali.year}/${jalali.month}/${jalali.day}';
  }

  bool isNullOrEmpty() => this == null || this == "";

  bool isNotNullOrEmpty() => this != null || this != "";

  bool isNumeric() => (int.tryParse(this ?? "") ?? 10000) != 10000;
}

extension StringExtensions on String {
  String subStringIfExist(final int start, final int end) => length > end ? substring(start, end) : this;

  String numberString() => replaceAll(RegExp('[^0-9]'), '');

  int number() => replaceAll(RegExp('[^0-9]'), '').toInt();

  String? nullIfEmpty() => isEmpty ? null : this;

  String toRialMoneyPersian() => "${separateNumbers3By3()} ریال ";

  String toTomanMoneyPersian() => "${separateNumbers3By3()} تومان ";

  bool isTrue() => toLowerCase() == 'true';

  bool isFalse() => toLowerCase() == 'false';

  bool isNumeric() => double.tryParse(this) != null;

  int toInt() => int.tryParse(this) ?? 0;

  double toDouble() => double.tryParse(this) ?? 0;

  String separateNumbers3By3() => replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (final Match m) => '${m[1]},');

  String separateCharacters(final int number, final String separator) => replaceAllMapped(
        RegExp('(\\d{1,$number})(?=(\\d{$number})+(?!\\d))'),
        (final Match m) => '${m[1]}$separator',
      );

  String toJalaliCompactDateString() => Jalali.fromDateTime(DateTime.parse(this)).formatCompactDate();

  String toJalaliDateString() => Jalali.fromDateTime(DateTime.parse(this)).formatFullDate();

  String append0() {
    if (length == 1) {
      return "0$this";
    } else {
      return this;
    }
  }

  String formatJalaliDateTime() {
    final DateTime dateTime = DateTime.parse(this);
    final Jalali jalali = Jalali.fromDateTime(dateTime);
    return '${jalali.year}/${jalali.month}/${jalali.day} ${dateTime.hour}:${dateTime.minute}:${dateTime.second.toString().append0()}';
  }

  String maxLength({required final int max}) => length > max ? "${substring(0, max - 3)}..." : this;

  int getDay() => int.parse(substring(8, 10).append0());

  int getMonth() => int.parse(substring(5, 7).append0());

  int getYear() => int.parse(substring(0, 4).append0());

  int getHour() => int.parse(substring(0, 2).append0());

  int getMinute() => int.parse(substring(3, 5).append0());

  String toTimeAgo({final bool numericDates = false, final bool persian = false}) {
    try {
      final Duration difference = DateTime.now().difference(intl.DateFormat("yyyy-MM-ddThh:mm:sss").parse(this));
      if (difference.inDays > 8) {
        return substring(0, 10);
      } else if ((difference.inDays / 7).floor() >= 1)
        return persian
            ? numericDates
                ? '۱ هفته پیش'
                : 'هفته پیش'
            : numericDates
                ? '1 week ago'
                : 'Last week';
      else if (difference.inDays >= 2)
        return persian ? '${difference.inDays.toString().persianNumber()} روز پیش' : '${difference.inDays} days ago';
      else if (difference.inDays >= 1)
        return persian
            ? numericDates
                ? '۱ روز پیش'
                : 'دیروز'
            : numericDates
                ? '1 day ago'
                : 'Yesterday';
      else if (difference.inHours >= 2)
        return persian ? '${difference.inHours.toString().persianNumber()} ساعت پیش' : '${difference.inHours} hours ago';
      else if (difference.inHours >= 1)
        return persian
            ? numericDates
                ? '۱ ساعت پیش'
                : 'یک ساعت پیش'
            : numericDates
                ? '1 hour ago'
                : 'An hour ago';
      else if (difference.inMinutes >= 2)
        return persian ? '${difference.inMinutes.toString().persianNumber()} دقیقه پیش' : '${difference.inMinutes} minutes ago';
      else if (difference.inMinutes >= 1)
        return persian
            ? numericDates
                ? '۱ دقیقه پیش'
                : 'یک دقیقه پیش'
            : numericDates
                ? '1 minute ago'
                : 'A minute ago';
      else if (difference.inSeconds >= 3)
        return persian ? '${difference.inSeconds.toString().persianNumber()} ثانیه پیش' : '${difference.inSeconds} seconds ago';
      else
        return persian ? 'همین الان' : 'Just now';
    } catch (e) {
      return this;
    }
  }

  String persianNumber() {
    String number = this;
    number = number.replaceAll("1", "۱");
    number = number.replaceAll("2", "۲");
    number = number.replaceAll("3", "۳");
    number = number.replaceAll("4", "۴");
    number = number.replaceAll("5", "۵");
    number = number.replaceAll("6", "۶");
    number = number.replaceAll("7", "۷");
    number = number.replaceAll("8", "۸");
    number = number.replaceAll("9", "۹");
    number = number.replaceAll("0", "۰");
    return number;
  }

  String englishNumber() {
    String number = this;
    number = number.replaceAll("۱", "1");
    number = number.replaceAll("۲", "2");
    number = number.replaceAll("۳", "3");
    number = number.replaceAll("۴", "4");
    number = number.replaceAll("۵", "5");
    number = number.replaceAll("۶", "6");
    number = number.replaceAll("۷", "7");
    number = number.replaceAll("۸", "8");
    number = number.replaceAll("۹", "9");
    number = number.replaceAll("۰", "0");
    return number;
  }

  String persianDayDay() {
    String day = this;
    day = day.replaceAll("Sunday", "یک شنبه");
    day = day.replaceAll("Monday", "دو شنبه");
    day = day.replaceAll("Tuesday", "سه شنبه");
    day = day.replaceAll("Wednesday", "چهار شنبه");
    day = day.replaceAll("Thursday", "پنج شنبه");
    day = day.replaceAll("Friday", "جمعه");
    day = day.replaceAll("Saturday", "شنبه");
    return day;
  }

  String englishDay() {
    String day = this;
    day = day.replaceAll("یک شنبه", "Sunday");
    day = day.replaceAll("دو‌شنبه", "Monday");
    day = day.replaceAll("سه‌شنبه", "Tuesday");
    day = day.replaceAll("چهار‌شنبه", "Tuesday");
    day = day.replaceAll("پنج‌شنبه", "Thursday");
    day = day.replaceAll("جمعه", "Friday");
    day = day.replaceAll("جمعه", "Friday");
    day = day.replaceAll("شنبه", "Saturday");
    return day;
  }

  String persianMonth() {
    String month = this;
    month = month.replaceAll("01", "فروردین");
    month = month.replaceAll("02", "اردیبهشت");
    month = month.replaceAll("03", "خرداد");
    month = month.replaceAll("04", "تیر");
    month = month.replaceAll("05", "مرداد");
    month = month.replaceAll("06", "شهریور");
    month = month.replaceAll("07", "مهر");
    month = month.replaceAll("08", "آبان");
    month = month.replaceAll("09", "آذر");
    month = month.replaceAll("10", "دی");
    month = month.replaceAll("11", "بهمن");
    month = month.replaceAll("12", "اسفند");
    return month;
  }

  String englishMonth() {
    String month = this;
    month = month.replaceAll("01", "January");
    month = month.replaceAll("02", "February");
    month = month.replaceAll("03", "March");
    month = month.replaceAll("04", "April");
    month = month.replaceAll("05", "May");
    month = month.replaceAll("06", "June");
    month = month.replaceAll("07", "July");
    month = month.replaceAll("08", "August");
    month = month.replaceAll("09", "September");
    month = month.replaceAll("10", "October");
    month = month.replaceAll("11", "November");
    month = month.replaceAll("12", "December");
    return month;
  }

  String removeCharAt(final int charIndex) {
    final List<String> charList = split('').toList();
    charList.removeAt(charIndex);
    return charList.join();
  }

  String toPhoneNumber({
    final InvalidPhoneAction invalidPhoneAction = InvalidPhoneAction.ShowUnformatted,
    final bool allowEndlessPhone = false,
    final String? defaultMask,
    final String? defaultCountryCode,
  }) =>
      formatAsPhoneNumber(
        this,
        allowEndlessPhone: allowEndlessPhone,
        defaultCountryCode: defaultCountryCode,
        defaultMask: defaultMask,
        invalidPhoneAction: invalidPhoneAction,
      ) ??
      this;

  String toCardNumber() => formatAsCardNumber(this);

  bool isValidCardNumber({
    final bool checkLength = false,
    final bool useLuhnAlgo = true,
  }) =>
      isCardNumberValid(
        cardNumber: this,
        useLuhnAlgo: useLuhnAlgo,
        checkLength: checkLength,
      );

  String toBase64() => base64Encode(utf8.encode(this));

  String fromBase64() => utf8.decode(base64Decode(this));

  String toBase58() {
    const base58Alphabet = '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz';
    final input = utf8.encode(this);
    BigInt intData = BigInt.from(0);

    for (var byte in input) {
      intData = intData * BigInt.from(256) + BigInt.from(byte);
    }

    StringBuffer result = StringBuffer();
    while (intData > BigInt.zero) {
      final remainder = intData % BigInt.from(58);
      intData = intData ~/ BigInt.from(58);
      result.write(base58Alphabet[remainder.toInt()]);
    }

    for (var byte in input) {
      if (byte == 0) {
        result.write(base58Alphabet[0]);
      } else {
        break;
      }
    }

    return result.toString().split('').reversed.join();
  }

  String fromBase58() {
    const base58Alphabet = '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz';
    BigInt intData = BigInt.zero;

    for (var char in split('')) {
      final index = base58Alphabet.indexOf(char);
      if (index < 0) throw FormatException('Invalid Base58 character: $char');
      intData = intData * BigInt.from(58) + BigInt.from(index);
    }

    List<int> bytes = [];
    while (intData > BigInt.zero) {
      bytes.insert(0, (intData % BigInt.from(256)).toInt());
      intData = intData ~/ BigInt.from(256);
    }

    for (var char in split('')) {
      if (char == '1') {
        bytes.insert(0, 0);
      } else {
        break;
      }
    }

    return utf8.decode(bytes);
  }
}
