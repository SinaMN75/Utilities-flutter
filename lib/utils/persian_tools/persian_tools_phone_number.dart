class PersianToolsPhoneNumberConstants {
  static final RegExp mobileRegex = RegExp(r"^(?:[+|0{2}]?98)?(?:0)?(\d{3})+(\d{3})+(\d{4})$");

  static const Map<String, OperatorDetail> MCI = <String, OperatorDetail>{
    "910": OperatorDetail(base: "کشوری", provinces: <String>[], operator: Operator.MCI),
    "914": OperatorDetail(provinces: <String>["آذربایجان شرقی", "اردبیل", "اصفهان"], base: "آذربایجان غربی", operator: Operator.MCI),
    "911": OperatorDetail(provinces: <String>["گلستان", "گیلان"], base: "مازندران", operator: Operator.MCI),
    "912": OperatorDetail(provinces: <String>["البرز", "زنجان", "سمنان", "قزوین", "قم", "برخی از شهرستان های استان مرکزی"], base: "تهران", type: SimCardType.permanent, operator: Operator.MCI),
    "913": OperatorDetail(provinces: <String>["یزد", "چهارمحال و بختیاری", "کرمان"], base: "اصفهان", operator: Operator.MCI),
    "915": OperatorDetail(provinces: <String>["خراسان شمالی", "خراسان جنوبی", "سیستان و بلوچستان"], base: "خراسان رضوی", operator: Operator.MCI),
    "916": OperatorDetail(provinces: <String>["لرستان", "فارس", "اصفهان"], base: "خوزستان", operator: Operator.MCI),
    "917": OperatorDetail(provinces: <String>["بوشهر", "کهگیلویه و بویر احمد", "هرمزگان"], base: "فارس", operator: Operator.MCI),
    "918": OperatorDetail(provinces: <String>["کردستان", "ایلام", "همدان"], base: "کرمانشاه", operator: Operator.MCI),
    "919": OperatorDetail(provinces: <String>["البرز", "سمنان", "قم", "قزوین", "زنجان"], base: "تهران", type: SimCardType.credit, operator: Operator.MCI),
    "990": OperatorDetail(provinces: <String>[], base: "کشوری", type: SimCardType.credit, operator: Operator.MCI),
    "991": OperatorDetail(provinces: <String>[], base: "کشوری", operator: Operator.MCI),
    "992": OperatorDetail(provinces: <String>[], base: "کشوری", type: SimCardType.credit, operator: Operator.MCI),
    "993": OperatorDetail(provinces: <String>[], base: "کشوری", type: SimCardType.credit, operator: Operator.MCI),
    "994": OperatorDetail(provinces: <String>[], base: "کشوری", type: SimCardType.credit, operator: Operator.MCI),
    "995": OperatorDetail(provinces: <String>[], base: "کشوری", type: SimCardType.credit, operator: Operator.MCI),
    "996": OperatorDetail(provinces: <String>[], base: "کشوری", type: SimCardType.credit, operator: Operator.MCI),
  };

  static const Map<String, OperatorDetail> taliya = <String, OperatorDetail>{
    "932": OperatorDetail(provinces: <String>[], base: "کشوری", type: SimCardType.credit, operator: Operator.taliya),
  };

  static const Map<String, OperatorDetail> rightTel = <String, OperatorDetail>{
    "920": OperatorDetail(provinces: <String>[], base: "کشوری", type: SimCardType.permanent, operator: Operator.rightTel),
    "921": OperatorDetail(provinces: <String>[], base: "کشوری", type: SimCardType.credit, operator: Operator.rightTel),
    "922": OperatorDetail(provinces: <String>[], base: "کشوری", type: SimCardType.credit, operator: Operator.rightTel),
  };

  static const OperatorDetail defaultIrancellModel = OperatorDetail(provinces: <String>[], base: "کشوری", operator: Operator.irancell);

  static const Map<String, OperatorDetail> irancell = <String, OperatorDetail>{
    "900": defaultIrancellModel,
    "930": defaultIrancellModel,
    "933": defaultIrancellModel,
    "935": defaultIrancellModel,
    "936": defaultIrancellModel,
    "937": defaultIrancellModel,
    "938": defaultIrancellModel,
    "939": defaultIrancellModel,
    "901": defaultIrancellModel,
    "902": defaultIrancellModel,
    "903": defaultIrancellModel,
    "905": defaultIrancellModel,
    "904": OperatorDetail(provinces: <String>[], base: "کشوری", model: "سیم‌کارت کودک", type: SimCardType.credit, operator: Operator.irancell),
    "941": OperatorDetail(provinces: <String>[], base: "کشوری", model: "TD-LTE", type: SimCardType.credit, operator: Operator.irancell),
  };

  static const Map<String, OperatorDetail> shatelMobile = <String, OperatorDetail>{
    "998": OperatorDetail(provinces: <String>[], base: "کشوری", type: SimCardType.credit, operator: Operator.shatelMobile),
  };

  static const Map<String, OperatorDetail> samanTel = <String, OperatorDetail>{
    "999": OperatorDetail(provinces: <String>[], base: "کشوری", operator: Operator.samanTel),
  };

  static final List<String> prefixes = <String>[
    ...MCI.keys,
    ...taliya.keys,
    ...rightTel.keys,
    ...irancell.keys,
    ...shatelMobile.keys,
    ...samanTel.keys,
  ];

  static final Map<String, OperatorDetail> operators = <String, OperatorDetail>{...MCI, ...taliya, ...irancell, ...shatelMobile, ...rightTel, ...samanTel};
}

class PersianToolsPhoneNumber {
  String getPhonePrefix(String phoneNumber) {
    final Iterable<RegExpMatch> matches = PersianToolsPhoneNumberConstants.mobileRegex.allMatches(phoneNumber);

    if (matches.isNotEmpty) {
      return matches.first.group(1) ?? "";
    }

    return "";
  }

  OperatorDetail? getPhoneNumberDetail(String phoneNumber) {
    if (phoneNumberValidator(phoneNumber)) {
      final String prefix = getPhonePrefix(phoneNumber);

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
  String toString() => "OperatorDetail{base: $base, provinces: $provinces, model: $model, type: $type, operator: $operator}";
}

class Operator {
  const Operator._(this.name);

  final String name;

  static const Operator shatelMobile = Operator._("شاتل موبایل");
  static const Operator MCI = Operator._("همراه اول");
  static const Operator irancell = Operator._("ایرانسل");
  static const Operator taliya = Operator._("تالیا");
  static const Operator rightTel = Operator._("رایتل");
  static const Operator samanTel = Operator._("سامانتل");

  @override
  bool operator ==(Object other) => identical(this, other) || other is Operator && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => "Operator{name: $name}";
}
