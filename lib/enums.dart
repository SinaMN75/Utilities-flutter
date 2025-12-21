extension TagListExtension on Iterable<int> {
  bool isMale() => contains(TagUser.male.number);

  bool isFemaleMale() => contains(TagUser.female.number);

  bool isSuperAdmin() => contains(TagUser.superAdmin.number);
}

enum TagUser with NumericIdentifiable {
  male("مرد", "Male", 100),
  female("زن", "Female", 101),
  superAdmin("سوپر ادمین", "Super Admin", 201),
  guest("مهمان", "Guest", 202)
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
  category("دسته‌بندی", "Category", 100),
  exam("پرشسنامه", "Exam", 101),
  user("کاربران", "User", 102),
  menu("کاربران", "Menu", 103),
  speciality("تخصص", "Speciality", 104),
  dorm("خوابگاه", "Dorm", 105),
  room("اتاق", "Room", 106),
  bed("تخت", "Bed", 107),
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
  image("تصویر", "Image", 100),
  profile("پروفایل", "Profile", 101),
  test("", "", 999)
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
  content("کیس", "Case", 102),
  blog("کیس", "Case", 103),
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
  released("منتشر شده", "Released", 100),
  inQueue("در حال بررسی", "In Queue", 101),
  rejected("رد شده", "Rejected", 102),
  private("خصوصی", "Private", 501)
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

enum TagContract with NumericIdentifiable {
  test("", "", 999)
  ;

  const TagContract(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagInvoice with NumericIdentifiable {
  deposit("", "", 101),
  rent("", "", 102),
  paid("", "", 201),
  paidOnline("", "", 202),
  paidManual("", "", 203),
  notPaid("", "", 204)
  ;

  const TagInvoice(this.titleFa, this.titleEn, this.number);

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
