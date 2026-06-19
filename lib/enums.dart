enum Usc with NumericIdentifiable {
  success("موفقیت", "Success", 200),
  created("ایجاد شده", "Created", 201),
  deleted("حذف شده", "Deleted", 211),
  processCompleted("پردازش کامل شد", "Process Completed", 212),
  badRequest("درخواست نامعتبر", "Bad Request", 400),
  unAuthorized("احراز هویت نشده", "Unauthorized", 401),
  forbidden("دسترسی ممنوع", "Forbidden", 403),
  notFound("یافت نشد", "Not Found", 404),
  conflict("تداخل", "Conflict", 409),
  payloadTooLarge("حجم بار بیش از حد", "Payload Too Large", 413),
  mediaTypeNotSupported("نوع رسانه پشتیبانی نمی‌شود", "Media Type Not Supported", 451),
  securityError("خطای امنیتی", "Security Error", 452),
  internalServerError("خطای داخلی سرور", "Internal Server Error", 500),
  thirdPartyError("خطای شخص ثالث", "Third Party Error", 600),
  wrongVerificationCode("کد تایید اشتباه", "Wrong Verification Code", 601),
  maximumLimitReached("حداکثر تعداد رسیده", "Maximum Limit Reached", 602),
  userNotFound("کاربر یافت نشد", "User Not Found", 603),
  expiredToken("توکن منقضی شده", "Expired Token", 604),
  shahkarException("استثنای شهکار", "Shahkar Exception", 605),
  shahkarError("خطای شهکار", "Shahkar Error", 606),
  balanceIsLow("موجودی کم است", "Balance Is Low", 701);

  const Usc(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagSmsPanel with NumericIdentifiable {
  nikSms("نیک اس ام اس", "Nik Sms", 101),
  ghasedak("قاصدک", "Ghasedak", 102),
  kavenegar("کاوه نگار", "Kavenegar", 103);

  const TagSmsPanel(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagUser with NumericIdentifiable {
  male("مرد", "Male", 101),
  female("زن", "Female", 102),
  unspecified("نامشخص", "Unspecified", 103),
  superAdmin("سوپر ادمین", "Super Admin", 201),
  guest("مهمان", "Guest", 202),
  systemAdmin("سیستم ادمین", "System Admin", 203),
  systemUser("کاربر سیستمی", "System User", 204),
  awaitingVerification("در انتظار تایید", "Awaiting Verification", 301),
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
  eSignatureRejected("امضای الکترونیکی رد شده", "E-Signature Rejected", 609);

  const TagUser(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;

  bool isMale() => this == TagUser.male;
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
  hidden("مخفی", "Hidden", 203);

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
  profile("پروفایل", "Profile", 102);

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
  room10("اتاق ۱۰ تخته", "10 Bed Room", 410);

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
  private("خصوصی", "Private", 201);

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
  dislike("نپسندیدن", "Dislike", 102);

  const TagReaction(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagFollow with NumericIdentifiable {
  user("کاربر", "User", 101),
  product("محصول", "Product", 102),
  category("دسته‌بندی", "Category", 103);

  const TagFollow(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagContent with NumericIdentifiable {
  aboutUs("درباره ما", "About Us", 101),
  terms("قوانین و مقررات", "Terms", 102),
  homeSlider1("اسلایدر اصلی", "Home Slider 1", 103);

  const TagContent(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagTicket with NumericIdentifiable {
  superAdmin("سوپر ادمین", "Super Admin", 101),
  admin("ادمین", "Admin", 102);

  const TagTicket(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagTxn with NumericIdentifiable {
  creditCard("کارت اعتباری", "Credit Card", 101),
  cash("نقدی", "Cash", 102),
  pending("در انتظار", "Pending", 201),
  paid("پرداخت شده", "Paid", 202),
  failed("ناموفق", "Failed", 203),
  refunded("بازگشت داده شده", "Refunded", 204),
  chargeWallet("شارژ کیف پول", "Charge Wallet", 301);

  const TagTxn(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagParking with NumericIdentifiable {
  test("تست", "Test", 999);

  const TagParking(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagVehicle with NumericIdentifiable {
  test("تست", "Test", 999);

  const TagVehicle(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagParkingReport with NumericIdentifiable {
  test("تست", "Test", 999);

  const TagParkingReport(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagAddress with NumericIdentifiable {
  verified("تایید شده", "Verified", 101);

  const TagAddress(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagWallet with NumericIdentifiable {
  primary("اصلی", "Primary", 101);

  const TagWallet(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagWalletTxn with NumericIdentifiable {
  charge("شارژ", "Charge", 101),
  transfer("انتقال", "Transfer", 102),
  mobileAndNationalCodeVerification("اعتبارسنجی موبایل و کد ملی", "Mobile And National Code Verification", 201),
  zipCodeToAddressDetail("کد پستی به آدرس", "Zip Code To Address Detail", 202),
  vehicleViolationsDetail("جزئیات تخلفات وسیله نقلیه", "Vehicle Violations Detail", 203),
  drivingLicenceStatus("وضعیت گواهینامه", "Driving Licence Status", 204),
  licencePlateDetail("جزئیات پلاک", "Licence Plate Detail", 205),
  drivingLicenceNegativePoint("امتیاز منفی گواهینامه", "Driving Licence Negative Point", 206),
  iBanToBankAccountDetail("IBan به جزئیات حساب بانکی", "IBan To Bank Account Detail", 207),
  freewayTolls("عوارض آزادراه", "Freeway Tolls", 208),
  chargeSimPin("شارژ سیم کارت با پین", "Charge Sim Pin", 301),
  chargeSimTopup("شارژ سیم کارت", "Charge Sim Topup", 302),
  internetSim("اینترنت سیم کارت", "Internet Sim", 303);

  const TagWalletTxn(this.titleFa, this.titleEn, this.number);

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
  awaitingVerification("در انتظار تایید", "Awaiting Verification", 202),
  suspended("تعلیق شده", "Suspended", 203);

  const TagTerminal(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagBankAccount with NumericIdentifiable {
  verified("تایید شده", "Verified", 101);

  const TagBankAccount(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagIpg with NumericIdentifiable {
  pn("پی ان", "Pn", 101);

  const TagIpg(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagMpg with NumericIdentifiable {
  pn("پی ان", "Pn", 101);

  const TagMpg(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagPayment with NumericIdentifiable {
  chargeWallet("شارژ کیف پول", "Charge Wallet", 101);

  const TagPayment(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagInquiryHistory with NumericIdentifiable {
  validateNationalCodeAndPhoneNumber("اعتبارسنجی کد ملی و شماره تلفن", "Validate National Code And Phone Number", 101),
  zipCodeToAddressDetail("کد پستی به آدرس", "Zip Code To Address Detail", 201),
  vehicleViolationsDetail("جزئیات تخلفات وسیله نقلیه", "Vehicle Violations Detail", 301),
  drivingLicenceDetail("جزئیات گواهینامه", "Driving Licence Detail", 302),
  licencePlateDetail("جزئیات پلاک", "Licence Plate Detail", 303),
  drivingLicenceNegativePoint("امتیاز منفی گواهینامه", "Driving Licence Negative Point", 304),
  freewayTolls("عوارض آزادراه", "Freeway Tolls", 305),
  iBanToBankAccountDetail("IBan به جزئیات حساب بانکی", "IBan To Bank Account Detail", 501),
  verified("تایید شده", "Verified", 601),
  notVerified("تایید نشده", "Not Verified", 602),
  error("خطا", "Error", 603),
  itHub("آی تی هاب", "It Hub", 701);

  const TagInquiryHistory(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagNotification with NumericIdentifiable {
  test("تست", "Test", 999);

  const TagNotification(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagTxnErrorCodes with NumericIdentifiable {
  lowBalance("موجودی کم", "Low Balance", 101),
  unauthorized("غیرمجاز", "Unauthorized", 102),
  senderWalletNotFound("کیف پول فرستنده یافت نشد", "Sender Wallet Not Found", 103),
  receiverWalletNotFound("کیف پول گیرنده یافت نشد", "Receiver Wallet Not Found", 104),
  securityError("خطای امنیتی", "Security Error", 105),
  ok("تایید", "Ok", 201);

  const TagTxnErrorCodes(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagVas with NumericIdentifiable {
  water("آب", "Water", 101),
  chargeTopup("شارژ مستقیم", "Charge Topup", 201),
  chargePin("شارژ با پین", "Charge Pin", 202),
  internetPackage("بسته اینترنت", "Internet Package", 203);

  const TagVas(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagSimOperator with NumericIdentifiable {
  iranCell("ایرانسل", "Iran Cell", 1),
  hamrahAvval("همراه اول", "Hamrah Avval", 2),
  rigthel("رایتل", "Rigthel", 3),
  shatel("شاتل", "Shatel", 5);

  const TagSimOperator(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagMerchant with NumericIdentifiable {
  normal("معمولی", "Normal", 101);

  const TagMerchant(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagFieldType with NumericIdentifiable {
  text("متن", "Text", 101),
  dropDown("لیست کشویی", "Drop Down", 102),
  file("فایل", "File", 103),
  eSignature("امضای الکترونیکی", "E-Signature", 105);

  const TagFieldType(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagTextFieldType with NumericIdentifiable {
  text("متن", "Text", 101),
  multilineText("متن چند خطی", "Multiline Text", 102),
  numberDecimal("عدد اعشاری", "Number Decimal", 201),
  phoneNumber("شماره تلفن", "Phone Number", 301),
  phoneNumberWithCountryCode("شماره تلفن با کد کشور", "Phone Number With Country Code", 302),
  date("تاریخ", "Date", 401),
  dateTime("تاریخ و زمان", "DateTime", 402),
  persianDate("تاریخ شمسی", "Persian Date", 403),
  persianDateTime("تاریخ و زمان شمسی", "Persian DateTime", 404);

  const TagTextFieldType(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagFileFieldType with NumericIdentifiable {
  image("تصویر", "Image", 101),
  video("ویدئو", "Video", 102),
  pdf("پی دی اف", "Pdf", 103),
  text("متن", "Text", 104);

  const TagFileFieldType(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagProcessStatus with NumericIdentifiable {
  available("موجود", "Available", 101),
  comingSoon("به زودی", "Coming Soon", 102),
  disabled("غیر فعال", "Disabled", 103),
  hidden("مخفی", "Hidden", 104);

  const TagProcessStatus(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagProcessStepStatus with NumericIdentifiable {
  notStarted("", "", 101),
  current("", "", 102),
  awaitingVerification("", "", 103),
  verified("", "", 104);

  const TagProcessStepStatus(this.titleFa, this.titleEn, this.number);

  @override
  final String titleFa;
  @override
  final String titleEn;
  @override
  final int number;
}

enum TagContract with NumericIdentifiable {
  test("", "", 999);

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
  notPaid("", "", 204);

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
