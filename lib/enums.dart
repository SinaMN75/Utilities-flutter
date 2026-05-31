enum TagUser with NumericIdentifiable {
  male("مرد", "Male", 101),
  female("زن", "Female", 102),
  unspecified("نامشخص", "Unspecified", 103),
  superAdmin("سوپر ادمین", "Super Admin", 201),
  guest("مهمان", "Guest", 202),
  systemAdmin("سیستم ادمین", "System Admin", 203),
  systemUser("کاربر سیستمی", "System User", 204),
  awaitingVerification("در انتظار تایید ادمین", "Awaiting Verification", 301),
  verified("تایید شده", "Verified", 302),
  nationalCardFrontVerified("کارت ملی جلو تایید شده", "National Card Front Verified", 401),
  nationalCardBackVerified("کارت ملی پشت تایید شده", "National Card Back Verified", 402),
  birthCertificateFirstVerified("شناسنامه صفحه اول تایید شده", "Birth Certificate First Verified", 403),
  birthCertificateSecondVerified("شناسنامه صفحه دوم تایید شده", "Birth Certificate Second Verified", 404),
  birthCertificateThirdVerified("شناسنامه صفحه سوم تایید شده", "Birth Certificate Third Verified", 405),
  birthCertificateForthVerified("شناسنامه صفحه چهارم تایید شده", "Birth Certificate Forth Verified", 406),
  birthCertificateFifthVerified("شناسنامه صفحه پنجم تایید شده", "Birth Certificate Fifth Verified", 407),
  visualAuthenticationVerified("احراز هویت تصویری تایید شده", "Visual Authentication Verified", 408),
  eSignatureVerified("امضای الکترونیکی تایید شده", "E-Signature Verified", 409),
  nationalCardFrontAwaitingVerification("کارت ملی جلو در انتظار تایید", "National Card Front Awaiting Verification", 501),
  nationalCardBackAwaitingVerification("کارت ملی پشت در انتظار تایید", "National Card Back Awaiting Verification", 502),
  birthCertificateFirstAwaitingVerification("شناسنامه صفحه اول در انتظار تایید", "Birth Certificate First Awaiting Verification", 503),
  birthCertificateSecondAwaitingVerification("شناسنامه صفحه دوم در انتظار تایید", "Birth Certificate Second Awaiting Verification", 504),
  birthCertificateThirdAwaitingVerification("شناسنامه صفحه سوم در انتظار تایید", "Birth Certificate Third Awaiting Verification", 505),
  birthCertificateForthAwaitingVerification("شناسنامه صفحه چهارم در انتظار تایید", "Birth Certificate Forth Awaiting Verification", 506),
  birthCertificateFifthAwaitingVerification("شناسنامه صفحه پنجم در انتظار تایید", "Birth Certificate Fifth Awaiting Verification", 507),
  visualAuthenticationAwaitingVerification("احراز هویت تصویری در انتظار تایید", "Visual Authentication Awaiting Verification", 508),
  eSignatureAwaitingVerification("امضای الکترونیکی در انتظار تایید", "E-Signature Awaiting Verification", 509),
  nationalCardFrontRejected("کارت ملی جلو رد شده", "National Card Front Rejected", 601),
  nationalCardBackRejected("کارت ملی پشت رد شده", "National Card Back Rejected", 602),
  birthCertificateFirstRejected("شناسنامه صفحه اول رد شده", "Birth Certificate First Rejected", 603),
  birthCertificateSecondRejected("شناسنامه صفحه دوم رد شده", "Birth Certificate Second Rejected", 604),
  birthCertificateThirdRejected("شناسنامه صفحه سوم رد شده", "Birth Certificate Third Rejected", 605),
  birthCertificateForthRejected("شناسنامه صفحه چهارم رد شده", "Birth Certificate Forth Rejected", 606),
  birthCertificateFifthRejected("شناسنامه صفحه پنجم رد شده", "Birth Certificate Fifth Rejected", 607),
  visualAuthenticationRejected("احراز هویت تصویری رد شده", "Visual Authentication Rejected", 608),
  eSignatureRejected("امضای الکترونیکی رد شده", "E-Signature Rejected", 609)
  ;

  const TagUser(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;

  bool isMale() => this == TagUser.male;
}

enum TagContent with NumericIdentifiable {
  aboutUs("درباره ما", "About Us", 101),
  terms("قوانین و مقررات", "Terms and Conditions", 102),
  homeSlider1("اسلایدر", "Slider", 103)
  ;

  const TagContent(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagCategory with NumericIdentifiable {
  category("دسته‌بندی", "Category", 101),
  exam("پرسشنامه", "Exam", 102),
  user("کاربران", "User", 103),
  menu("منو", "Menu", 104),
  speciality("تخصص", "Speciality", 105),
  dorm("خوابگاه", "Dorm", 106),
  room("اتاق", "Room", 107),
  bed("تخت", "Bed", 108),
  enabled("فعال", "Enabled", 201),
  disabled("غیر فعال", "Disabled", 202),
  hidden("مخفی", "Hidden", 203)
  ;

  const TagCategory(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagMedia with NumericIdentifiable {
  image("تصویر", "Image", 101),
  profile("پروفایل", "Profile", 102)
  ;

  const TagMedia(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagProduct with NumericIdentifiable {
  product("محصول", "Product", 101),
  content("محتوا", "Content", 102),
  blog("وبلاگ", "Blog", 103),
  case_("کیس", "Case", 104),
  dorm("خوابگاه", "Dorm", 105),
  room("اتاق", "Room", 106),
  bed("تخت", "Bed", 107),
  new_("جدید", "New", 201),
  kindOfNew("نو", "Kind of New", 202),
  used("دست دوم", "Used", 203),
  released("منتشر شده", "Released", 301),
  expired("منقضی شده", "Expired", 302),
  inQueue("در حال بررسی", "In Queue", 303),
  deleted("حذف شده", "Deleted", 304),
  notAccepted("تایید نشده", "Not Accepted", 305),
  awaitingPayment("در انتظار پرداخت", "Awaiting Payment", 306),
  room1("اتاق ۱ تخته", "1 Bed Room", 401),
  room2("اتاق ۲ تخته", "2 Bed Room", 402),
  room3("اتاق ۳ تخته", "3 Bed Room", 403),
  room4("اتاق ۴ تخته", "4 Bed Room", 404),
  room5("اتاق ۵ تخته", "5 Bed Room", 405),
  room6("اتاق ۶ تخته", "6 Bed Room", 406),
  room7("اتاق ۷ تخته", "7 Bed Room", 407),
  room8("اتاق ۸ تخته", "8 Bed Room", 408),
  room9("اتاق ۹ تخته", "9 Bed Room", 409),
  room10("اتاق ۱۰ تخته", "10 Bed Room", 410)
  ;

  const TagProduct(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagComment with NumericIdentifiable {
  released("منتشر شده", "Released", 101),
  inQueue("در حال بررسی", "In Queue", 102),
  rejected("رد شده", "Rejected", 103),
  private("خصوصی", "Private", 201)
  ;

  const TagComment(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagReaction with NumericIdentifiable {
  like("پسندیدن", "Like", 101),
  disLike("نپسندیدن", "Dislike", 102)
  ;

  const TagReaction(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagAddress with NumericIdentifiable {
  verified("احراز شده", "Verified", 101)
  ;

  const TagAddress(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagVehicle with NumericIdentifiable {
  test("تست", "Test", 999)
  ;

  const TagVehicle(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagWallet with NumericIdentifiable {
  primary("کیف پول اصلی", "Primary", 101)
  ;

  const TagWallet(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagTerminal with NumericIdentifiable {
  atm("خودپرداز", "ATM", 101),
  wallCashless("پرداخت بدون پول نقد دیواری", "Wall Cashless", 102),
  deskCashless("پرداخت بدون پول نقد میز", "Desk Cashless", 103),
  verified("تایید شده", "Verified", 201),
  awaitingVerification("در انتظار تأیید", "Awaiting Verification", 202),
  suspended("تعلیق شده", "Suspended", 203)
  ;

  const TagTerminal(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagSimOperator with NumericIdentifiable {
  hamrahAvval("همراه اول", "Hamrah Avval", 1),
  irancell("ایرانسل", "Irancell", 2),
  rightel("رایتل", "Rightel", 3),
  shatel("شاتل موبایل", "Shatel Mobile", 5)
  ;

  const TagSimOperator(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagFieldType with NumericIdentifiable {
  text("متن", "Text", 101),
  dropDown("لیست کشویی", "DropDown", 102),
  file("فایل", "File", 103),
  eSignature("امضای الکترونیکی", "ESignature", 105)
  ;

  const TagFieldType(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

mixin NumericIdentifiable {
  int get number;

  String get titleFa;

  String get titleEn;
}

extension NumericEnumExtension<T extends Enum> on Iterable<T> {
  List<int> get numbers => map((dynamic e) => (e as dynamic).number as int).toList();

  List<String> get titlesFa => map((dynamic e) => (e as dynamic).titleFa as String).toList();

  List<String> get titlesEn => map((dynamic e) => (e as dynamic).titleEn as String).toList();

  List<Map<String, dynamic>> toMapList() => map(
    (dynamic e) => <String, dynamic>{
      "number": (e as dynamic).number,
      "titleFa": (e as dynamic).titleFa,
      "titleEn": (e as dynamic).titleEn,
    },
  ).toList();

  T? fromNumber(final int id) {
    try {
      return firstWhere((final dynamic element) => (element as dynamic).number == id);
    } catch (e) {
      return null;
    }
  }

  T fromNumericIdOrThrow(final int id) {
    final dynamic result = fromNumber(id);
    if (result == null) {
      throw ArgumentError.value(id, "id", 'No ${T.toString().split('.').first} found with numericId $id');
    }
    return result;
  }
}
