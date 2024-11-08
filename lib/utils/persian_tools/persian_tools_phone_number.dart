class PersianToolsPhoneNumberConstants {
  static final mobileRegex = RegExp(r'^(?:[+|0{2}]?98)?(?:0)?(\d{3})+(\d{3})+(\d{4})$');

  static const MCI = {
    '910': OperatorDetail(base: 'کشوری', provinces: [], type: SimCardType.both, operator: Operator.MCI),
    '914': OperatorDetail(provinces: ['آذربایجان شرقی', 'اردبیل', 'اصفهان'], base: 'آذربایجان غربی', type: SimCardType.both, operator: Operator.MCI),
    '911': OperatorDetail(provinces: ['گلستان', 'گیلان'], base: 'مازندران', type: SimCardType.both, operator: Operator.MCI),
    '912': OperatorDetail(provinces: ['البرز', 'زنجان', 'سمنان', 'قزوین', 'قم', 'برخی از شهرستان های استان مرکزی'], base: 'تهران', type: SimCardType.permanent, operator: Operator.MCI),
    '913': OperatorDetail(provinces: ['یزد', 'چهارمحال و بختیاری', 'کرمان'], base: 'اصفهان', type: SimCardType.both, operator: Operator.MCI),
    '915': OperatorDetail(provinces: ['خراسان شمالی', 'خراسان جنوبی', 'سیستان و بلوچستان'], base: 'خراسان رضوی', type: SimCardType.both, operator: Operator.MCI),
    '916': OperatorDetail(provinces: ['لرستان', 'فارس', 'اصفهان'], base: 'خوزستان', type: SimCardType.both, operator: Operator.MCI),
    '917': OperatorDetail(provinces: ['بوشهر', 'کهگیلویه و بویر احمد', 'هرمزگان'], base: 'فارس', type: SimCardType.both, operator: Operator.MCI),
    '918': OperatorDetail(provinces: ['کردستان', 'ایلام', 'همدان'], base: 'کرمانشاه', type: SimCardType.both, operator: Operator.MCI),
    '919': OperatorDetail(provinces: ['البرز', 'سمنان', 'قم', 'قزوین', 'زنجان'], base: 'تهران', type: SimCardType.credit, operator: Operator.MCI),
    '990': OperatorDetail(provinces: [], base: 'کشوری', type: SimCardType.credit, operator: Operator.MCI),
    '991': OperatorDetail(provinces: [], base: 'کشوری', type: SimCardType.both, operator: Operator.MCI),
    '992': OperatorDetail(provinces: [], base: 'کشوری', type: SimCardType.credit, operator: Operator.MCI),
    '993': OperatorDetail(provinces: [], base: 'کشوری', type: SimCardType.credit, operator: Operator.MCI),
    '994': OperatorDetail(provinces: [], base: 'کشوری', type: SimCardType.credit, operator: Operator.MCI),
    '995': OperatorDetail(provinces: [], base: 'کشوری', type: SimCardType.credit, operator: Operator.MCI),
    '996': OperatorDetail(provinces: [], base: 'کشوری', type: SimCardType.credit, operator: Operator.MCI),
  };

  static const taliya = {
    '932': OperatorDetail(provinces: [], base: 'کشوری', type: SimCardType.credit, operator: Operator.taliya),
  };

  static const rightTel = {
    '920': OperatorDetail(provinces: [], base: 'کشوری', type: SimCardType.permanent, operator: Operator.rightTel),
    '921': OperatorDetail(provinces: [], base: 'کشوری', type: SimCardType.credit, operator: Operator.rightTel),
    '922': OperatorDetail(provinces: [], base: 'کشوری', type: SimCardType.credit, operator: Operator.rightTel),
  };

  static const defaultIrancellModel = OperatorDetail(provinces: [], base: 'کشوری', type: SimCardType.both, operator: Operator.irancell);

  static const irancell = {
    '900': defaultIrancellModel,
    '930': defaultIrancellModel,
    '933': defaultIrancellModel,
    '935': defaultIrancellModel,
    '936': defaultIrancellModel,
    '937': defaultIrancellModel,
    '938': defaultIrancellModel,
    '939': defaultIrancellModel,
    '901': defaultIrancellModel,
    '902': defaultIrancellModel,
    '903': defaultIrancellModel,
    '905': defaultIrancellModel,
    '904': OperatorDetail(provinces: [], base: 'کشوری', model: 'سیم‌کارت کودک', type: SimCardType.credit, operator: Operator.irancell),
    '941': OperatorDetail(provinces: [], base: 'کشوری', model: 'TD-LTE', type: SimCardType.credit, operator: Operator.irancell),
  };

  static const shatelMobile = {
    '998': OperatorDetail(provinces: [], base: 'کشوری', type: SimCardType.credit, operator: Operator.shatelMobile),
  };

  static const samanTel = {
    '999': OperatorDetail(provinces: [], base: 'کشوری', type: SimCardType.both, operator: Operator.samanTel),
  };

  static final List<String> prefixes = [
    ...MCI.keys,
    ...taliya.keys,
    ...rightTel.keys,
    ...irancell.keys,
    ...shatelMobile.keys,
    ...samanTel.keys,
  ];

  static final operators = {...MCI, ...taliya, ...irancell, ...shatelMobile, ...rightTel, ...samanTel};
}

class PersianToolsPhoneNumber {
  String getPhonePrefix(String phoneNumber) {
    final matches = PersianToolsPhoneNumberConstants.mobileRegex.allMatches(phoneNumber);

    if (matches.isNotEmpty) {
      return matches.first.group(1) ?? '';
    }

    return '';
  }

  OperatorDetail? getPhoneNumberDetail(String phoneNumber) {
    if (phoneNumberValidator(phoneNumber)) {
      final prefix = getPhonePrefix(phoneNumber);

      return PersianToolsPhoneNumberConstants.operators[prefix];
    }

    return null;
  }

  bool phoneNumberValidator(String phoneNumber) =>
      PersianToolsPhoneNumberConstants.mobileRegex.hasMatch(phoneNumber) &&
      PersianToolsPhoneNumberConstants.prefixes.contains(
        getPhonePrefix(phoneNumber),
      );
}

enum SimCardType { credit, permanent, both }

class OperatorDetail {
  const OperatorDetail({
    required this.base,
    this.provinces,
    this.model,
    this.type = SimCardType.both,
    this.operator,
  });

  final String base;
  final List<String>? provinces;
  final String? model;
  final SimCardType type;
  final Operator? operator;

  String? get name => operator?.name;

  OperatorDetail copyWith({String? base, List<String>? provinces, String? model, SimCardType? type, Operator? operator}) => OperatorDetail(base: base ?? this.base, provinces: provinces ?? this.provinces, model: model ?? this.model, type: type ?? this.type, operator: operator ?? this.operator);

  @override
  bool operator ==(Object other) => identical(this, other) || other is OperatorDetail && runtimeType == other.runtimeType && base == other.base && provinces == other.provinces && model == other.model && type == other.type && operator == other.operator;

  @override
  int get hashCode => base.hashCode ^ provinces.hashCode ^ model.hashCode ^ type.hashCode ^ operator.hashCode;

  @override
  String toString() {
    return 'OperatorDetail{base: $base, provinces: $provinces, model: $model, type: $type, operator: $operator}';
  }
}

class Operator {
  const Operator._(this.name);

  final String name;

  static const shatelMobile = Operator._('شاتل موبایل');
  static const MCI = Operator._('همراه اول');
  static const irancell = Operator._('ایرانسل');
  static const taliya = Operator._('تالیا');
  static const rightTel = Operator._('رایتل');
  static const samanTel = Operator._('سامانتل');

  @override
  bool operator ==(Object other) => identical(this, other) || other is Operator && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => 'Operator{name: $name}';
}
