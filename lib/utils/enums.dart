import 'package:utilities/utilities.dart';

enum AccountType { free, pro, unlimited, unknown }


enum TagProduct {
  product(100),
  yooNote(101),
  image(102),
  video(103),
  audio(104),
  apk(106),
  game(107),
  goods(108),
  job(109),
  attribute(110),
  physical(111),
  digital(112),
  userStatus(113),
  jobType(114),
  jobPlace(115),
  chanel(116),
  story(117),
  blog(118),
  subBlog(119),
  music(120),
  podcast(121),
  adEmployee(122),
  target(123),
  app(124),
  all(125),
  text(126),
  adProject(127),
  adHiring(128),
  highlight(129),
  physicalProduct(130),
  digitalProduct(131),
  project(132),
  children(133),
  recruitment(134),
  freelancing(135),
  store(136),
  artwork(137),
  digitalEquipment(138),
  toolsAndAccessories(139),
  book(140),
  cooperation(141),
  concertFestival(142),
  cinemaTheater(143),
  gathering(144),
  academyEducation(145),
  event(146),
  award(147),
  adult(148),
  teenager(149),
  ad(150),
  company(151),
  dailyPrice(152),
  tender(153),
  tutorial(154),
  auction(155),
  magazine(156),
  consultant(157),
  service(158),
  fullTime(159),
  partTime(160),
  contractual(161),
  free(162),
  payment(163),
  participants(164),
  file(165),
  directShod(500),
  test(900);

  const TagProduct(this.title);

  @override
  String toString() => name;
  final int title;
}

TagCategory getTagCategoryByTagProduct(final TagProduct tagProduct) => TagCategory.values.where((final TagCategory element) => element.name == tagProduct.name).toList().firstOrDefault(TagCategory.category);

TagProduct getTagProductByTagCategory(final TagCategory tagCategory) => TagProduct.values.where((final TagProduct element) => element.name == tagCategory.name).toList().firstOrDefault(TagProduct.product);

enum TagCategory {
  category(100),
  yooNote(101),
  subProduct(102),
  image(103),
  video(104),
  audio(105),
  pdf(106),
  apk(107),
  game(108),
  goods(109),
  job(110),
  attribute(111),
  physical(112),
  digital(113),
  userStatus(114),
  jobType(115),
  jobPlace(116),
  chanel(117),
  story(118),
  ad(119),
  company(120),
  dailyPrice(121),
  tender(122),
  tutorial(123),
  blog(124),
  subBlog(125),
  music(126),
  podcast(127),
  adEmployee(128),
  target(129),
  app(130),
  all(131),
  text(132),
  adProject(133),
  adHiring(134),
  highlight(135),
  auction(136),
  physicalProduct(137),
  digitalProduct(138),
  magazine(139),
  project(140),
  consultant(141),
  service(142),
  children(143),
  recruitment(144),
  freelancing(145),
  store(146),
  artwork(147),
  digitalEquipment(148),
  toolsAndAccessories(149),
  book(150),
  cooperation(151),
  concertFestival(152),
  cinemaTheater(153),
  gathering(154),
  academyEducation(155),
  event(156),
  award(157),
  adult(158),
  teenager(159),
  specialty(160),
  specializedArt(161),
  colors(162),
  brand(163),
  tag(164),
  user(165),
  shopCategory(166),
  insurance(167),
  learn(168),
  group(169),
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
  directShod(500),
  test(900);

  const TagCategory(this.title);

  @override
  String toString() => name;
  final int title;
}

enum TagReaction {
  none(100),
  like(101),
  disLike(102),
  funny(103),
  awful(104),
  all(200);

  const TagReaction(this.title);

  @override
  String toString() => name;
  final int title;
}

enum TagContent {
  content(100),
  banner(101),
  aboutUs(102),
  banner1(103),
  banner2(104),
  homeTop(105),
  qa(106),
  terms(107),
  yoohoo(199),
  all(200);

  const TagContent(this.title);

  @override
  String toString() => name;
  final int title;
}

enum TagGender {
  man("Man", "مرد", 100),
  woman("Woman", "زن", 101),
  company("Company", "تجاری", 102);
  // team("Team", "تیم", 103);

  const TagGender(this.title, this.titleTr1, this.status);

  @override
  String toString() => name;
  final String title;
  final String titleTr1;
  final int status;
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
  file(115),
  participants(116),
  post(190);

  const TagMedia(this.title);

  @override
  String toString() => name;
  final int title;
}

enum TagComment {
  released('منتشر شده','Released',100),
  inQueue('در حال بررسی','InQueue',101),
  rejected('رد شده','Rejected',102);

  const TagComment(this.title,this.titleTr1,this.status);

  @override
  String toString() => name;
  final String title;
  final String titleTr1;
  final int status;
}

enum TagBase {
  category("100"),
  fffffffffffffffffffffffyooNote("101"),
  fffffffffffffffffffffffsubProduct("102"),
  fffffffffffffffffffffffimage("103"),
  fffffffffffffffffffffffvideo("104"),
  fffffffffffffffffffffffaudio("105"),
  fffffffffffffffffffffffpdf("106"),
  fffffffffffffffffffffffapk("107"),
  fffffffffffffffffffffffgame("108"),
  fffffffffffffffffffffffgoods("109"),
  fffffffffffffffffffffffjob("110"),
  fffffffffffffffffffffffattribute("111"),
  fffffffffffffffffffffffphysical("112"),
  fffffffffffffffffffffffdigital("113"),
  fffffffffffffffffffffffuserStatus("114"),
  fffffffffffffffffffffffjobType("115"),
  fffffffffffffffffffffffjobPlace("116"),
  fffffffffffffffffffffffchanel("117"),
  fffffffffffffffffffffffstory("118"),
  fffffffffffffffffffffffad("119"),
  fffffffffffffffffffffffcompany("120"),
  fffffffffffffffffffffffdailyPrice("121"),
  ffffffffffffffffffffffftender("122"),
  ffffffffffffffffffffffftutorial("123"),
  magazine("124");

  const TagBase(this.title);

  @override
  String toString() => name;
  final String title;
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

enum ExploreType {
  donate("Donit", "دونیت"),
  yooNote("Yoonote", "یونوت"),
  shop("Shop", "فروشگاه"),
  reserve("Reserve", "رزرو"),
  adviser("Adviser", "مشاور"),
  job("Job", "شغل"),
  award("Award", "مسابقه");

  const ExploreType(this.title, this.titleTr1);

  @override
  String toString() => name;
  final String title;
  final String titleTr1;
}


enum JobType {
  fullTime('Full time', "تمام وقت", 159),
  partTime('Part time', "پاره وقت", 160),
  project("Hybrid", "ترکیبی",161);

  const JobType(this.title, this.titleTr1, this.status);

  @override
  String toString() => name;
  final String title;
  final String titleTr1;
  final int status;
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
enum AgeType2 {
  teen("18-25", 200),
  young("26-32",  201),
  adult("33-40",  202);

  const AgeType2(this.title,this.status);

  @override
  String toString() => name;
  final int status;
  final String title;
}

// enum CategoryType {
//   brand("brand"),
//   reference("reference"),
//   company("company"),
//   category("category"),
//   function("function"),
//   country("country"),
//   city("city"),
//   province("province"),
//   model("model"),
//   insurance("insurance"),
//   active("active"),
//   archive("archive"),
//   image("image"),
//   video("video"),
//   music("music"),
//   pdf("pdf"),
//   commodity("commodity"),
//   job("job"),
//   speciality("speciality");
//
//   const CategoryType(this.title);
//
//   @override
//   String toString() => name;
//   final String title;
// }

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

enum PostMediaType {
  all("all"),
  image("image"),
  audio("audio"),
  video("video"),
  pdf("pdf"),
  text("text");

  const PostMediaType(this.title);

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

// enum UseCaseProduct {
//   ad("ad"),
//   dailyPrice("dailyPrice"),
//   tender("tender"),
//   test("test"),
//   project("project"),
//   service("service"),
//   consultant("consultant"),
//   company("company"),
//   yooNote("yooNote"),
//   tutorial("tutorial"),
//   blog("blog"),
//   subBlog("subBlog"),
//   product("product"),
//   story("story"),
//   physicalProduct("physicalProduct"),
//   digitalProduct("digitalProduct"),
//   attribute("attribute"),
//   target("target"),
//   magazine("magazine"),
//   adHiring("hiringAd"),
//   adProject("adProject"),
//   adEmployee("adEmployee");
//
//   const UseCaseProduct(this.title);
//
//   final String title;
// }

// enum UseCaseCategory {
//   location("location"),
//   category("category"),
//   colors("colors"),
//   specialty("specialty"),
//   specializedArt("specializedArt"),
//   tag("tag"),
//   ad("ad"),
//   amnbekhar("amnbekhar"),
//   brand("brand"),
//   dailyPrice("dailyPrice"),
//   tender("tender"),
//   chanel("chanel"),
//   group("group"),
//   auction("auction"),
//   project("project"),
//   service("service"),
//   consultant("consultant"),
//   yooNote("yooNote"),
//   company("company"),
//   learn("learn"),
//   user("user"),
//   insurance("insurance"),
//   target("target"),
//   tutorial("tutorial"),
//   attribute("attribute"),
//   shopCategory("shopCategory"),
//   magazine("magazine");
//
//   const UseCaseCategory(this.title);
//
//   @override
//   String toString() => name;
//   final String title;
// }

enum TypeUser {
  hiring('hiring'),
  openToWork('openToWork');

  const TypeUser(this.title);

  @override
  String toString() => name;
  final String title;
}

enum TypePost {
  all('all'),
  explore('Explore'),
  digital('Digital'),
  image("image"),
  video("video"),
  audio("audio"),
  music("music"),
  podcast("podcast"),
  pdf("pdf"),
  podCasts("podCasts"),
  app("app"),
  game("game"),
  text("text"),
  blog("blog"),
  commodity("commodity"),
  job("job"),
  yooNote("yooNote"),
  physical('Physical'),
  adHiring("hiringAd"),
  adProject("adProject"),
  adEmployee("adEmployee");

  const TypePost(this.title);

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

enum TypeChat {
  Private(100),
  PublicGroup(101),
  PrivateGroup(102),
  PublicChannel(103),
  PrivateChannel(104),
  GroupAndChannel(110);

  const TypeChat(this.title);

  @override
  String toString() => name;
  final int title;
}

enum TypeGender {
  man("Man", "مرد", 100),
  woman("Woman", "زن", 101),
  company("Company", "تجاری", 102);
  // team("Team", "تیم", 103);

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

// enum UseCaseMedia {
//   image("image"),
//   all("all"),
//   audio("audio"),
//   video("video"),
//   media("media"),
//   cover("cover"),
//   apk("apk"),
//   profile("profile"),
//   document("document"),
//   license("license"),
//   chat("Chat"),
//   zip("zip"),
//   bio("bio"),
//   post("post"),
//   text("text");
//
//   const UseCaseMedia(this.title);
//
//   @override
//   String toString() => name;
//   final String title;
// }

// enum UseCaseChat {
//   group("group"),
//   chat("chat"),
//   chanel("chanel");
//
//   const UseCaseChat(this.title);
//
//   @override
//   String toString() => name;
//   final String title;
// }

enum TypeAd {
  fullTime('Full time', "تمام وقت", 164),
  partTime('Part time', "پاره وقت", 165),
  project("Contractual/project", "قراردادی/پروژه ای", 140);

  const TypeAd(this.title, this.titleTr1, this.status);

  @override
  String toString() => name;
  final String title;
  final String titleTr1;
  final int status;
}

enum TypeKindAd {
  inWork('In work', "حضوری", 100),
  freelancer('Freelancer', "دورکاری", 101),
  inWorkFreelancer("In work/Freelancer", "حضوری/دورکاری", 102);

  const TypeKindAd(this.title, this.titleTr1, this.status);

  @override
  String toString() => name;
  final String title;
  final String titleTr1;
  final int status;
}
//
// enum TypeCategory {
//   Explore('Explore'),
//   Digital('Digital'),
//   image("image"),
//   video("video"),
//   music("music"),
//   yooNote("yooNote"),
//   pdf("pdf"),
//   group("group"),
//   media("media"),
//   chanel("chanel"),
//   apk("apk"),
//   app("app"),
//   game("game"),
//   commodity("commodity"),
//   job("job"),
//   attribute("attribute"),
//   physical('physical'),
//   userStatus('userStatus'),
//   jobType('jobType'),
//   jobPlace('jobPlace');
//
//   const TypeCategory(this.title);
//
//   @override
//   String toString() => name;
//   final String title;
// }

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
  male("male"),
  female("female"),
  unknown("unknown"),
  both("both");

  const GenderType(this.title);

  @override
  String toString() => name;
  final String title;
}

enum AgeType {
  all("all", "همه", 100),
  kids("kids", "خردسال", 101),
  teen("teen", "نوجوان", 102),
  young("young", "بزرگسال", 103),
  adult("adult", "میانسال", 104),
  elder("elder", "کهن سال", 105);

  const AgeType(this.title, this.titleTr1, this.status);

  @override
  String toString() => name;
  final int status;
  final String title;
  final String titleTr1;
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

// enum OrderStatus {
//   Pending(StatusModel("Pending", "در انتظار", 100)),
//   Canceled("Canceled", "لغو شده", 101),
//   Paid("Paid", "پرداخت شده", 102),
//   Accept("Accept", "قبول شده", 103),
//   Reject("Reject", "رد شده", 104),
//   InProgress("InProgress", "در حال انجام", 105),
//   InProcess("InProcess", "در حال انجام", 106),
//   Shipping("Shipping", "در حال ارسال", 107),
//   Refund("Refund", "بازپرداخت", 108),
//   RefundComplete("RefundComplete", "بازپرداخت کامل", 109),
//   Complete("Complete", "تکمیل شده", 110),
//   PaidFail("PaidFail", "پرداخت ناموفق", 112);
//
//   const OrderStatus(this.statusModel);
//
//   @override
//   String toString() => name;
//   final StatusModel statusModel;
// }

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
