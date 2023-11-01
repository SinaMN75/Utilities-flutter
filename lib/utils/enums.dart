part of 'utils.dart';

class UtilitiesTagUtils {
  static String tagProductTitleFromTagList(final List<int> tags) {
    if (tags.contains(TagProduct.inQueue.number)) return TagProduct.inQueue.title;
    if (tags.contains(TagProduct.released.number)) return TagProduct.released.title;
    if (tags.contains(TagProduct.notAccepted.number)) return TagProduct.notAccepted.title;
    return "";
  }

  static String tagCommentsTitleFromTagList(final List<int> tags) {
    if (tags.contains(TagComment.inQueue.number)) return TagComment.inQueue.title;
    if (tags.contains(TagComment.released.number)) return TagComment.released.title;
    if (tags.contains(TagComment.rejected.number)) return TagComment.rejected.title;
    return "";
  }
}

extension TagMediaExtension on List<TagMedia> {
  List<int> getNumbers() => this.map((final TagMedia e) => e.number).toList();
}

extension NullableTagMediaExtension on List<TagMedia>? {
  List<int> getNumbers() => (this ?? <TagMedia>[]).map((final TagMedia e) => e.number).toList();
}

extension TagCommentExtension on List<TagComment> {
  List<int> getNumbers() => this.map((final TagComment e) => e.number).toList();
}

extension NullableTagCommentExtension on List<TagComment>? {
  List<int> getNumbers() => (this ?? <TagComment>[]).map((final TagComment e) => e.number).toList();
}

extension TagContentExtension on List<TagContent> {
  List<int> getNumbers() => this.map((final TagContent e) => e.number).toList();
}

extension NullableTagContentExtension on List<TagContent>? {
  List<int> getNumbers() => (this ?? <TagContent>[]).map((final TagContent e) => e.number).toList();
}

enum AccountType { free, pro, unlimited, unknown }

enum TagProduct {
  product(100, ""),
  yooNote(101, ""),
  subProduct(102, ""),
  image(103, ""),
  video(104, ""),
  audio(105, ""),
  pdf(106, ""),
  apk(107, ""),
  game(107, ""),
  goods(108, ""),
  job(110, ""),
  attribute(111, ""),
  physical(112, ""),
  digital(113, ""),
  userStatus(113, ""),
  jobType(114, ""),
  jobPlace(115, ""),
  chanel(116, ""),
  story(117, ""),
  ad(118, ""),
  company(120, ""),
  dailyPrice(121, ""),
  tender(122, ""),
  tutorial(123, ""),
  magazine(124, ""),
  blog(125, ""),
  subBlog(126, ""),
  music(127, ""),
  podcast(128, ""),
  adEmployee(129, ""),
  target(130, ""),
  app(131, ""),
  all(132, ""),
  text(133, ""),
  adProject(134, ""),
  adHiring(135, ""),
  highlight(136, ""),
  physicalProduct(137, ""),
  digitalProduct(138, ""),
  project(139, ""),
  children(140, ""),
  recruitment(141, ""),
  freelancing(142, ""),
  store(143, ""),
  artwork(144, ""),
  digitalEquipment(145, ""),
  toolsAndAccessories(146, ""),
  book(147, ""),
  cooperation(148, ""),
  concertFestival(149, ""),
  cinemaTheater(150, ""),
  gathering(151, ""),
  academyEducation(152, ""),
  event(153, ""),
  award(154, ""),
  adult(155, ""),
  teenager(156, ""),
  auction(157, ""),
  consultant(158, ""),
  service(159, ""),
  fullTime(160, ""),
  partTime(161, ""),
  contractual(162, ""),
  free(163, ""),
  payment(164, ""),
  participants(165, ""),
  file(166, ""),
  remote(168, ""),
  onSite(169, ""),
  pricePerDay(170, ""),
  pricePerPerson(171, ""),
  pricePerPage(172, ""),
  pricePerCount(173, ""),
  pricePerHour(174, ""),
  pricePerMinute(175, ""),
  reserve(176, ""),
  microBlog(177, ""),
  deliveryCost(178, ""),
  appointment(179, ""),
  news(201, ""),
  kindOfNew(202, ""),
  used(203, ""),
  released(301, "منتشر شده"),
  expired(302, "منقضی شده"),
  inQueue(303, "در صف انتشار"),
  deleted(304, "حذف شده"),
  notAccepted(305, "رد شده"),
  test(900, "");

  const TagProduct(this.number, this.title);

  @override
  String toString() => name;
  final String title;
  final int number;
}

enum TagCategory {
  category(100),
  yooNote(101),
  specialty(102),
  specializedArt(103),
  colors(104),
  brand(105),
  tag(106),
  user(107),
  target(108),
  tutorial(109),
  attribute(110),
  shopCategory(111),
  magazine(112),
  insurance(113),
  learn(114),
  company(115),
  consultant(116),
  ad(117),
  dailyPrice(118),
  tender(119),
  chanel(120),
  group(121),
  auction(122),
  service(123),
  subProduct(124),
  image(125),
  video(126),
  audio(127),
  pdf(128),
  apk(129),
  game(130),
  goods(131),
  job(132),
  physical(133),
  digital(134),
  userStatus(135),
  jobType(136),
  jobPlace(137),
  story(138),
  blog(139),
  subBlog(140),
  music(141),
  podcast(142),
  adEmployee(143),
  app(144),
  all(145),
  text(146),
  adProject(147),
  adHiring(148),
  highlight(149),
  physicalProduct(150),
  digitalProduct(151),
  project(152),
  children(153),
  recruitment(154),
  freelancing(155),
  store(156),
  artwork(157),
  digitalEquipment(158),
  toolsAndAccessories(159),
  book(160),
  cooperation(161),
  concertFestival(162),
  cinemaTheater(163),
  gathering(164),
  academyEducation(165),
  event(166),
  award(167),
  adult(168),
  teenager(169),
  media(170),
  explore(171),
  reference(172),
  file(173),
  model(174),
  function(175),
  country(176),
  city(177),
  province(178),
  speciality(179),
  free(180),
  payment(181),
  favorites(182),
  remote(183),
  onSite(184),
  reserve(185),
  microBlog(186),
  account(187),
  directShod(500),
  test(900);

  const TagCategory(this.number);

  @override
  String toString() => name;
  final int number;
}

enum TagOrder {
  physical(100, ''),
  digital(101, ''),
  donate(102, ''),
  shop(103, ''),
  job(104, ''),
  pishtazDelivery(201, ''),
  sendTipaxDelivery(202, ''),
  customDelivery(203, ''),
  onlinePay(301, ''),
  onSitePay(302, ''),
  cashPay(303, ''),
  stripePay(304, ''),
  coinPay(305, ''),
  paypalPay(306, ''),
  pending(400, ''),
  inQueue(401, 'در صف انتشار'),
  paid(402, 'پرداخت شده'),
  inProcess(406, 'در حال پردازش'),
  shipping(407, 'در حال ارسال'),
  sent(408, 'ارسال شده'),
  conflict(409, 'اختلاف'),
  complete(410, 'تکمیل شده'),
  all(900, 'همه');

  const TagOrder(this.number, this.title);

  @override
  String toString() => name;
  final String title;
  final int number;
}

enum WithdrawState {
  requested(101, "درحال بررسی"),
  accepted(102, "تایید شده"),
  rejected(103, "رد شده");

  const WithdrawState(this.number, this.title);

  @override
  String toString() => name;
  final int number;
  final String title;
}

enum TagReaction {
  none(100),
  like(101),
  disLike(102),
  funny(103),
  awful(104),
  all(200);

  const TagReaction(this.number);

  @override
  String toString() => name;
  final int number;
}

enum TagUser {
  authorized(100, ""),
  private(101, ""),
  public(102, ""),
  male(200, ""),
  female(201, ""),
  unknown(202, ""),
  legal(203, ""),
  adminCategoryRead(300, "خواندن دسته‌بندی‌ها"),
  adminCategoryUpdate(301, "تغییر دسته‌بندی‌ها"),
  adminProductRead(302, "خواندن محصولات"),
  adminProductUpdate(303, "تغییر محصولات"),
  adminUserRead(304, "خواندن کاربران"),
  adminUserUpdate(305, "تغییر کاربران"),
  adminReportRead(306, "خواندن ریپورت‌ها"),
  adminReportUpdate(307, "تغییر ریپورت‌ها"),
  adminTransactionRead(308, "خواندن تراکنش‌ها"),
  adminTransactionUpdate(309, "تغییر تراکنش‌ها"),
  adminOrderRead(310, "خواندن سفارشات"),
  adminOrderUpdate(311, "تغییر سفارشات"),
  adminContentRead(312, "خواندن محتوا"),
  adminContentUpdate(313, "تغییر محتوا"),
  adminCommentRead(314, "خواندن نظرات"),
  adminCommentUpdate(315, "تغییر نظرات"),
  productPublic(401, ""),
  buysPublic(402, ""),
  sellsPublic(403, ""),
  followingsPublic(404, ""),
  followersPublic(405, ""),
  productPrivate(406, ""),
  buysPrivate(407, ""),
  sellsPrivate(408, ""),
  followingsPrivate(409, ""),
  followersPrivate(410, "");

  const TagUser(this.number, this.title);

  static TagUser byNumber(final int number) {
    if (number == 100) return TagUser.authorized;
    if (number == 101) return TagUser.private;
    if (number == 102) return TagUser.public;
    if (number == 200) return TagUser.male;
    if (number == 201) return TagUser.female;
    if (number == 202) return TagUser.unknown;
    if (number == 203) return TagUser.legal;
    if (number == 300) return TagUser.adminCategoryRead;
    if (number == 301) return TagUser.adminCategoryUpdate;
    if (number == 302) return TagUser.adminProductRead;
    if (number == 303) return TagUser.adminProductUpdate;
    if (number == 304) return TagUser.adminUserRead;
    if (number == 305) return TagUser.adminUserUpdate;
    if (number == 306) return TagUser.adminReportRead;
    if (number == 307) return TagUser.adminReportUpdate;
    if (number == 308) return TagUser.adminTransactionRead;
    if (number == 309) return TagUser.adminTransactionUpdate;
    if (number == 310) return TagUser.adminOrderRead;
    if (number == 311) return TagUser.adminOrderUpdate;
    if (number == 312) return TagUser.adminContentRead;
    if (number == 313) return TagUser.adminContentUpdate;
    return TagUser.adminContentUpdate;
  }

  @override
  String toString() => name;
  final int number;
  final String title;
}

enum TagContent {
  terms(101),
  aboutUs(102),
  homeBanner1(103),
  homeBanner2(104),
  info1(105),
  faq(106),
  homeBannerSmall1(107),
  homeBannerSmall2(108),
  contactInfo(109);

  const TagContent(this.number);

  @override
  String toString() => name;
  final int number;
}

enum TagMedia {
  all(100),
  image(101),
  video(102),
  audio(103),
  pdf(104),
  apk(105),
  profile(106),
  document(107),
  license(108),
  zip(109),
  bio(110),
  cover(111),
  media(112),
  text(113),
  chat(114),
  post(115),
  file(116),
  participants(117);

  const TagMedia(this.number);

  @override
  String toString() => name;
  final int number;
}

enum TagComment {
  all('همه', 'All', 0),
  released('منتشر شده', 'Released', 100),
  inQueue('در حال بررسی', 'InQueue', 101),
  rejected('رد شده', 'Rejected', 102);

  const TagComment(this.title, this.titleTr1, this.number);

  @override
  String toString() => name;
  final String title;
  final String titleTr1;
  final int number;
}

enum TagGender {
  man("Man", "مرد", 100),
  woman("Woman", "زن", 101);

  const TagGender(this.title, this.titleTr1, this.status);

  @override
  String toString() => name;
  final String title;
  final String titleTr1;
  final int status;
}

enum TagStatusProduct {
  released('منتشر شده', 'Released', 301),
  expired('منقضی شده', 'Expired', 302),
  inQueue('در حال بررسی', 'InQueue', 303),
  deleted('حذف شده', 'Deleted', 304),
  notAccepted('رد شده', 'Not Accepted', 305);

  const TagStatusProduct(this.title, this.titleTr1, this.status);

  @override
  String toString() => name;
  final String title;
  final String titleTr1;
  final int status;
}

enum FormFieldType {
  singleLineText(0),
  multiLineText(1),
  multiSelect(2),
  singleSelect(3),
  bool(4),
  number(5),
  file(6),
  image(7),
  carPlack(8),
  phoneNumber(9),
  password(10),
  date(11),
  time(12),
  dateTime(13);

  const FormFieldType(this.title);

  @override
  String toString() => name;
  final int title;
}

enum BackResult {
  ok("ok"),
  error("error");

  const BackResult(this.title);

  @override
  String toString() => name;
  final String title;
}

enum SortLists {
  atoZ("0"),
  zToA("1"),
  mostRecent("2"),
  oldest("3"),
  cheapest("4"),
  mostExpensive("5"),
  orderByVotes("6");

  const SortLists(this.title);

  @override
  String toString() => name;
  final String title;
}

enum Currency {
  rial("100"),
  dolor("101"),
  lira("102"),
  euro("103"),
  btc("200");

  const Currency(this.title);

  @override
  String toString() => name;
  final String title;
}

enum CreateProductStatus {
  inQueue(2),
  done(0);

  const CreateProductStatus(this.title);

  final int title;
}

enum ReportType { user, product, chat, groupChatMessage, groupChat }

enum DialogMessage { info, warning, success }

enum FilterType { history, text, username, hashtag, location }

enum NotificationType { vote, comment, join, phopx }

enum PostType { all, text, voice, video, image, unknown }

enum ProductType {
  highlight("highlight");

  const ProductType(this.title);

  @override
  String toString() => name;
  final String title;
}

enum SizeType {
  square("square"),
  horizontal45("horizontal45"),
  vertical45("vertical45"),
  vertical169("vertical169"),
  horizontal169("horizontal169");

  const SizeType(this.title);

  @override
  String toString() => name;
  final String title;
}

enum TenderType {
  tender("tender"),
  auction("auction");

  const TenderType(this.title);

  @override
  String toString() => name;
  final String title;
}

enum UseCaseBime {
  bime("bime");

  const UseCaseBime(this.title);

  @override
  String toString() => name;
  final String title;
}

enum UseCaseSlider {
  sliderBime("sliderBime");

  const UseCaseSlider(this.title);

  @override
  String toString() => name;
  final String title;
}

enum UseCasePaymentBime {
  paymentBime("paymentBime");

  const UseCasePaymentBime(this.title);

  @override
  String toString() => name;
  final String title;
}

enum TypeUser {
  hiring('hiring'),
  openToWork('openToWork');

  const TypeUser(this.title);

  @override
  String toString() => name;
  final String title;
}

enum NationalityType {
  iranian(100),
  foreigner(101);

  const NationalityType(this.title);

  @override
  String toString() => name;
  final int title;
}

enum TypeProduct {
  jobType('jobType'),
  blog('blog'),
  jobPlace('jobPlace');

  const TypeProduct(this.title);

  @override
  String toString() => name;
  final String title;
}

enum TagChat {
  private(100),
  publicGroup(101),
  privateGroup(102),
  publicChannel(103),
  privateChannel(104),
  groupAndChannel(110);

  const TagChat(this.number);

  @override
  String toString() => name;
  final int number;
}

enum TypeGender {
  man("Man", "مرد", 100),
  woman("Woman", "زن", 101),
  company("Company", "تجاری", 102);

  const TypeGender(this.title, this.titleTr1, this.status);

  @override
  String toString() => name;
  final String title;
  final String titleTr1;
  final int status;
}

enum PrivacyType {
  private(100),
  public(101),
  followersOnly(102),
  commercial(103);

  const PrivacyType(this.title);

  @override
  String toString() => name;
  final int title;
}

enum UseCaseContent {
  news("news"),
  onBoarding("onBoarding"),
  aboutUs("aboutUs"),
  terms("terms"),
  qa("qa"),
  homeTop("homeTop"),
  banner("banner"),
  banner1("banner1"),
  banner2("banner2"),
  paymentBime("paymentBime");

  const UseCaseContent(this.title);

  @override
  String toString() => name;
  final String title;
}

enum GenderType {
  male("male", 200),
  female("female", 201),
  unknown("unknown", 202),
  both("legal", 203);

  const GenderType(this.title, this.number);

  @override
  String toString() => name;
  final String title;
  final int number;
}

enum ProductStatus {
  isNew("New", "نو", 100),
  isWorked("Worked", "کارکرده", 101),
  isLikeNew("Like new", "در حد نو", 102);

  const ProductStatus(this.title, this.titleTr1, this.status);

  @override
  String toString() => name;
  final int status;
  final String title;
  final String titleTr1;
}

enum OrderStatus {
  pending("Pending", "در انتظار", 100),
  canceled("Canceled", "لغو شده", 101),
  paid("Paid", "پرداخت شده", 102),
  accept("Accept", "قبول شده", 103),
  reject("Reject", "رد شده", 104),
  inProgress("InProgress", "در حال انجام", 105),
  inProcess("InProcess", "در حال انجام", 106),
  shipping("Shipping", "در حال ارسال", 107),
  refund("Refund", "بازپرداخت", 108),
  refundComplete("RefundComplete", "بازپرداخت کامل", 109),
  complete("Complete", "تکمیل شده", 110),
  paidFail("PaidFail", "پرداخت ناموفق", 112);

  const OrderStatus(this.title, this.titleTr1, this.status);

  @override
  String toString() => name;
  final int status;
  final String title;
  final String titleTr1;
}

class StatusModel {
  StatusModel(
    this.title,
    this.titleTr1,
    this.status,
  );

  final String title;
  final String titleTr1;
  final int status;
}

enum UseCaseNotification {
  success("success"),
  error("error"),
  message("message");

  const UseCaseNotification(this.title);

  @override
  String toString() => name;
  final String title;
}
