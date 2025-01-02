class PersianToolsBank {
  static const bankInformation = <Bank?>[
    Bank(name: 'بانک آینده', initCode: '636214'),
    Bank(name: 'بانک اقتصاد نوین', initCode: '627412'),
    Bank(name: 'بانک انصار', initCode: '627381'),
    Bank(name: 'بانک ایران زمین', initCode: '505785'),
    Bank(name: 'بانک پارسیان', initCode: '622106'),
    Bank(name: 'بانک پارسیان', initCode: '627884'),
    Bank(name: 'بانک پاسارگاد', initCode: '502229'),
    Bank(name: 'بانک پاسارگاد', initCode: '639347'),
    Bank(name: 'پست بانک ایران', initCode: '627760'),
    Bank(name: 'بانک تجارت', initCode: '585983'),
    Bank(name: 'بانک تجارت', initCode: '627353'),
    Bank(name: 'بانک توسعه تعاون', initCode: '502908'),
    Bank(name: 'بانک توسعه صادرات', initCode: '207177'),
    Bank(name: 'بانک توسعه صادرات', initCode: '627648'),
    Bank(name: 'بانک حکمت ایرانیان', initCode: '636949'),
    Bank(name: 'بانک خاورمیانه', initCode: '585949'),
    Bank(name: 'بانک دی', initCode: '502938'),
    Bank(name: 'بانک رسالت', initCode: '504172'),
    Bank(name: 'بانک رفاه کارگران', initCode: '589463'),
    Bank(name: 'بانک سامان', initCode: '621986'),
    Bank(name: 'بانک سپه', initCode: '589210'),
    Bank(name: 'بانک سرمایه', initCode: '639607'),
    Bank(name: 'بانک سینا', initCode: '639346'),
    Bank(name: 'بانک شهر', initCode: '502806'),
    Bank(name: 'بانک شهر', initCode: '504706'),
    Bank(name: 'بانک صادرات ایران', initCode: '603769'),
    Bank(name: 'بانک صادرات ایران', initCode: '903769'),
    Bank(name: 'بانک صنعت و معدن', initCode: '627961'),
    Bank(name: 'بانک قرض الحسنه مهر', initCode: '639370'),
    Bank(name: 'بانک قوامین', initCode: '639599'),
    Bank(name: 'بانک کارآفرین', initCode: '627488'),
    Bank(name: 'بانک کشاورزی', initCode: '603770'),
    Bank(name: 'بانک کشاورزی', initCode: '639217'),
    Bank(name: 'بانک گردشگری', initCode: '505416'),
    Bank(name: 'بانک گردشگری', initCode: '505426'),
    Bank(name: 'بانک مرکزی ایران', initCode: '636797'),
    Bank(name: 'بانک مسکن', initCode: '628023'),
    Bank(name: 'بانک ملت', initCode: '610433'),
    Bank(name: 'بانک ملت', initCode: '991975'),
    Bank(name: 'بانک ملی ایران', initCode: '170019'),
    Bank(name: 'بانک ملی ایران', initCode: '603799'),
    Bank(name: 'بانک مهر ایران', initCode: '606373'),
    Bank(name: 'موسسه کوثر', initCode: '505801'),
    Bank(name: 'موسسه اعتباری ملل', initCode: '606256'),
    Bank(name: 'موسسه اعتباری توسعه', initCode: '628157'),
    Bank(name: 'موسسه مالی اعتباری نور', initCode: '507677'),
    Bank(name: 'بانک خاورمیانه', initCode: '585947'),
  ];

  final _banksInfo = <BankInformation>[
    BankInformation(nickname: 'central-bank', name: 'Central Bank of Iran', persianName: 'بانک مرکزی جمهوری اسلامی ایران', code: '010', isAccountNumberAvailable: false),
    BankInformation(nickname: 'sanat-o-madan', name: 'Sanat O Madan Bank', persianName: 'بانک صنعت و معدن', code: '011', isAccountNumberAvailable: false),
    BankInformation(nickname: 'mellat', name: 'Mellat Bank', persianName: 'بانک ملت', code: '012', isAccountNumberAvailable: false),
    BankInformation(nickname: 'refah', name: 'Refah Bank', persianName: 'بانک رفاه کارگران', code: '013', isAccountNumberAvailable: false),
    BankInformation(nickname: 'maskan', name: 'Maskan Bank', persianName: 'بانک مسکن', code: '014', isAccountNumberAvailable: false),
    BankInformation(nickname: 'sepah', name: 'Sepah Bank', persianName: 'بانک سپه', code: '015', isAccountNumberAvailable: false),
    BankInformation(nickname: 'keshavarzi', name: 'Keshavarzi', persianName: 'بانک کشاورزی', code: '016', isAccountNumberAvailable: false),
    BankInformation(nickname: 'melli', name: 'Melli', persianName: 'بانک ملی ایران', code: '017', isAccountNumberAvailable: false),
    BankInformation(nickname: 'tejarat', name: 'Tejarat Bank', persianName: 'بانک تجارت', code: '018', isAccountNumberAvailable: false),
    BankInformation(nickname: 'saderat', name: 'Saderat Bank', persianName: 'بانک صادرات ایران', code: '019', isAccountNumberAvailable: false),
    BankInformation(nickname: 'tosee-saderat', name: 'Tose Saderat Bank', persianName: 'بانک توسعه صادرات', code: '020', isAccountNumberAvailable: false),
    BankInformation(nickname: 'post', name: 'Post Bank', persianName: 'پست بانک ایران', code: '021', isAccountNumberAvailable: false),
    BankInformation(nickname: 'toose-taavon', name: 'Tosee Taavon Bank', persianName: 'بانک توسعه تعاون', code: '022', isAccountNumberAvailable: false),
    BankInformation(nickname: 'tosee', name: 'Tosee Bank', persianName: 'موسسه اعتباری توسعه', code: '051', isAccountNumberAvailable: false),
    BankInformation(nickname: 'ghavamin', name: 'Ghavamin Bank', persianName: 'بانک قوامین', code: '052', isAccountNumberAvailable: false),
    BankInformation(nickname: 'karafarin', name: 'Karafarin Bank', persianName: 'بانک کارآفرین', code: '053', isAccountNumberAvailable: false),
    BankInformation(nickname: 'eghtesad-novin', name: 'Eghtesad Novin Bank', persianName: 'بانک اقتصاد نوین', code: '055', isAccountNumberAvailable: false),
    BankInformation(nickname: 'saman', name: 'Saman Bank', persianName: 'بانک سامان', code: '056', isAccountNumberAvailable: false),
    BankInformation(nickname: 'sarmayeh', name: 'Sarmayeh Bank', persianName: 'بانک سرمایه', code: '058', isAccountNumberAvailable: false),
    BankInformation(nickname: 'sina', name: 'Sina Bank', persianName: 'بانک سینا', code: '059', isAccountNumberAvailable: false),
    BankInformation(nickname: 'mehr-iran', name: 'Mehr Iran Bank', persianName: 'بانک مهر ایران', code: '060', isAccountNumberAvailable: false),
    BankInformation(nickname: 'ayandeh', name: 'Ayandeh Bank', persianName: 'بانک آینده', code: '062', isAccountNumberAvailable: false),
    BankInformation(nickname: 'ansar', name: 'Ansar Bank', persianName: 'بانک انصار', code: '063', isAccountNumberAvailable: false),
    BankInformation(nickname: 'gardeshgari', name: 'Gardeshgari Bank', persianName: 'بانک گردشگری', code: '064', isAccountNumberAvailable: false),
    BankInformation(nickname: 'hekmat-iranian', name: 'Hekmat Iranian Bank', persianName: 'بانک حکمت ایرانیان', code: '065', isAccountNumberAvailable: false),
    BankInformation(nickname: 'dey', name: 'Dey Bank', persianName: 'بانک دی', code: '066', isAccountNumberAvailable: false),
    BankInformation(nickname: 'iran-zamin', name: 'Iran Zamin Bank', persianName: 'بانک ایران زمین', code: '069', isAccountNumberAvailable: false),
    BankInformation(nickname: 'resalat', name: 'Resalat Bank', persianName: 'بانک قرض الحسنه رسالت', code: '070', isAccountNumberAvailable: false),
    BankInformation(nickname: 'kosar', name: 'Kosar Credit Institute', persianName: 'موسسه اعتباری کوثر', code: '073', isAccountNumberAvailable: false),
    BankInformation(nickname: 'melal', name: 'Melal Credit Institute', persianName: 'موسسه اعتباری ملل', code: '075', isAccountNumberAvailable: false),
    BankInformation(nickname: 'middle-east-bank', name: 'Middle East Bank', persianName: 'بانک خاورمیانه', code: '078', isAccountNumberAvailable: false),
    BankInformation(nickname: 'noor-bank', name: 'Noor Credit Institution', persianName: 'موسسه اعتباری نور', code: '080', isAccountNumberAvailable: false),
    BankInformation(nickname: 'mehr-eqtesad', name: 'Mehr Eqtesad Bank', persianName: 'بانک مهر اقتصاد', code: '079', isAccountNumberAvailable: false),
    BankInformation(nickname: 'mehr-iran', name: 'Mehr Iran Bank', persianName: 'بانک مهر ایران', code: '090', isAccountNumberAvailable: false),
    BankInformation(nickname: 'iran-venezuela', name: 'Iran and Venezuela Bank', persianName: 'بانک ایران و ونزوئلا', code: '095', isAccountNumberAvailable: false),
    BankInformation(
        nickname: 'shahr',
        name: 'City Bank',
        persianName: 'بانک شهر',
        code: '061',
        isAccountNumberAvailable: true,
        process: (s) {
          s = s.substring(7);
          while (s[0] == '0') {
            s = s.substring(1);
          }
          return AccountNumberModel(accountNumber: s, formattedAccountNumber: s);
        }),
    BankInformation(
        nickname: 'pasargad',
        name: 'Pasargad Bank',
        persianName: 'بانک پاسارگاد',
        code: '057',
        isAccountNumberAvailable: true,
        process: (s) {
          s = s.substring(7);
          while (s[0] == '0') {
            s = s.substring(1);
          }
          s = s.substring(0, s.length - 1);
          return AccountNumberModel(accountNumber: s, formattedAccountNumber: '${s.substring(0, 4)}-${s.substring(3, 6)}-${s.substring(6, 14)}-${s[14]}');
        }),
    BankInformation(
      nickname: 'parsian',
      name: 'Parsian Bank',
      persianName: 'بانک پارسیان',
      code: '054',
      isAccountNumberAvailable: true,
      process: (s) {
        s = s.substring(14);
        return AccountNumberModel(accountNumber: s, formattedAccountNumber: '0${s.substring(0, 3)}-0${s.substring(2, 8)}-${s.substring(9, 12)}');
      },
    ),
  ];

  Bank? getBankNameFromCardNumber(String cardNumber) {
    if (cardNumber.length == 16) {
      final initCode = cardNumber.substring(0, 6);

      final findBank = bankInformation.firstWhere(
        (element) => element?.initCode == initCode,
        orElse: () => null,
      );

      if (findBank != null) return findBank;
    }
    return null;
  }

  bool validateCardNumber(String cardNumber) {
    if (cardNumber.length < 16 || int.parse(cardNumber.substring(1, 11)) == 0 || int.parse(cardNumber.substring(10)) == 0) return false;
    int sum = 0, even, subDigit;
    for (var i = 0; i < 16; i++) {
      even = i % 2 == 0 ? 2 : 1;
      subDigit = int.parse(cardNumber[i]) * even;
      sum += subDigit > 9 ? subDigit - 9 : subDigit;
    }
    return sum % 10 == 0;
  }

  int _iso7064Mod97_10(String iban) {
    String remainder = iban, block;
    while (remainder.length > 2) {
      try {
        block = remainder.substring(0, 9);
      } on RangeError catch (_) {
        block = remainder;
      }
      remainder = '${int.parse(block) % 97}${remainder.substring(block.length)}';
    }
    return int.parse(remainder) % 97;
  }

  bool isShebaValid(String sheba) {
    if (sheba.length != 26) return false;
    if (!RegExp(r'IR[0-9]{24}').hasMatch(sheba)) return false;
    final d1 = sheba.codeUnitAt(0) - 65 + 10;
    final d2 = sheba.codeUnitAt(1) - 65 + 10;
    var iban = sheba.substring(4);
    iban += '$d1$d2${sheba.substring(2, 4)}';
    final remainder = _iso7064Mod97_10(iban);
    return remainder != 1 ? false : true;
  }

  BankInformation? call(String sheba) {
    if (!isShebaValid(sheba)) return null;
    final bankCode = RegExp(r'IR[0-9]{2}([0-9]{3})[0-9]{19}').firstMatch(sheba)?[1] ?? '';
    var bank = {for (var bank in _banksInfo) bank.code: bank}[bankCode];
    if (bank == null) return null;
    if (bank.isAccountNumberAvailable) {
      final data = bank.process!(sheba);
      bank.accountNumber = data.accountNumber;
      bank.formattedAccountNumber = data.formattedAccountNumber;
    }
    bank.process = null;
    return bank;
  }
}

class AccountNumberModel {
  final String accountNumber, formattedAccountNumber;

  const AccountNumberModel({
    required this.accountNumber,
    required this.formattedAccountNumber,
  });
}

class BankInformation {
  final String nickname, name, persianName, code;
  final bool isAccountNumberAvailable;
  AccountNumberModel Function(String)? process;
  String? accountNumber, formattedAccountNumber;

  BankInformation({
    required this.nickname,
    required this.name,
    required this.persianName,
    required this.code,
    required this.isAccountNumberAvailable,
    this.process,
    this.accountNumber,
    this.formattedAccountNumber,
  });

  @override
  int get hashCode => Object.hash(nickname, name, [persianName, code, isAccountNumberAvailable, accountNumber, formattedAccountNumber, process]);

  @override
  bool operator ==(Object other) {
    other = other as BankInformation;
    return nickname == other.nickname &&
        name == other.name &&
        persianName == other.persianName &&
        code == other.code &&
        isAccountNumberAvailable == other.isAccountNumberAvailable &&
        accountNumber == other.accountNumber &&
        formattedAccountNumber == other.formattedAccountNumber &&
        process == other.process;
  }
}

class Bank {
  const Bank({this.name, this.initCode});

  final String? name;
  final String? initCode;

  Bank copyWith({String? name, String? initCode}) => Bank(name: name ?? this.name, initCode: initCode ?? this.initCode);

  @override
  bool operator ==(Object other) => identical(this, other) || other is Bank && runtimeType == other.runtimeType && name == other.name && initCode == other.initCode;

  @override
  int get hashCode => name.hashCode ^ initCode.hashCode;

  @override
  String toString() => 'Bank{name: $name, initCode: $initCode}';
}
