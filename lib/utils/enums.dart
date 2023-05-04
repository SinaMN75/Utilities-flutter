enum AccountType { free, pro, unlimited, unknown }

enum BackResult {
  ok("ok"),
  error("error");

  const BackResult(this.title);

  @override
  String toString() => name;
  final String title;
}

enum CategoryType {
  brand("brand"),
  reference("reference"),
  company("company"),
  category("category"),
  function("function"),
  country("country"),
  city("city"),
  province("province"),
  model("model"),
  insurance("insurance"),
  active("active"),
  archive("archive"),
  speciality("speciality");

  const CategoryType(this.title);

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

enum TypeMedia {
  image("image"),
  all("all"),
  audio("audio"),
  video("video"),
  text("text");

  const TypeMedia(this.title);

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

enum UseCaseProduct {
  ad("ad"),
  dailyPrice("dailyPrice"),
  tender("tender"),
  test("test"),
  project("project"),
  service("service"),
  consultant("consultant"),
  company("company"),
  tutorial("tutorial"),
  product("product"),
  story("story"),
  physicalProduct("physicalProduct"),
  digitalProduct("digitalProduct"),
  magazine("magazine");

  const UseCaseProduct(this.title);

  final String title;
}

enum UseCaseCategory {
  location("location"),
  category("category"),
  colors("colors"),
  specialty("specialty"),
  specializedArt("specializedArt"),
  tag("tag"),
  ad("ad"),
  amnbekhar("amnbekhar"),
  brand("brand"),
  dailyPrice("dailyPrice"),
  tender("tender"),
  auction("auction"),
  project("project"),
  service("service"),
  consultant("consultant"),
  company("company"),
  learn("learn"),
  user("user"),
  insurance("insurance"),
  tutorial("tutorial"),
  magazine("magazine");

  const UseCaseCategory(this.title);

  @override
  String toString() => name;
  final String title;
}

enum TypeCategory {
  Explore('Explore'),
  Digital('Digital'),
  Physical('Physical');
  const TypeCategory(this.title);

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

enum UseCaseMedia {
  image("image"),
  all("all"),
  audio("audio"),
  video("video"),
  media("media"),
  cover("cover"),
  profile("profile"),
  chat("Chat"),
  post("post"),
  text("text");

  const UseCaseMedia(this.title);

  @override
  String toString() => name;
  final String title;
}

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

enum UseCaseNotification {
  success("success"),
  error("error"),
  message("message");

  const UseCaseNotification(this.title);

  @override
  String toString() => name;
  final String title;
}
