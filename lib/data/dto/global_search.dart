import 'package:utilities/utilities.dart';

class GlobalSearchCreateDto {
  GlobalSearchCreateDto({
    this.user,
    this.product,
    this.title,
    this.categories,
    this.category,
    this.pageNumber,
    this.isBookmark,
    this.isMine,
    this.newest,
    this.oldest,
    this.pageSize,
    this.reputation,
    this.minimal,
    this.isFollowing,
    this.query,
  });

  final String? title;
  final String? query;
  final int? pageSize;
  final int? pageNumber;
  final bool? newest;
  final bool? oldest;
  final bool? reputation;
  final bool? user;
  final bool? product;
  final bool? category;
  final bool? isBookmark;
  final bool? isMine;
  final bool? isFollowing;
  final bool? minimal;
  final List<String>? categories;

  factory GlobalSearchCreateDto.fromJson(String str) => GlobalSearchCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GlobalSearchCreateDto.fromMap(Map<String, dynamic> json) => GlobalSearchCreateDto(
        title: json["title"],
        query: json["query"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        newest: json["newest"],
        oldest: json["oldest"],
        reputation: json["reputation"],
        user: json["user"],
        product: json["product"],
        category: json["category"],
        isBookmark: json["isBookmark"],
        isMine: json["isMine"],
        isFollowing: json["isFollowing"],
        minimal: json["minimal"],
        categories: json["categories"] == null ? null : json["categories"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "query": query,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "newest": newest,
        "oldest": oldest,
        "reputation": reputation,
        "user": user,
        "product": product,
        "category": category,
        "isBookmark": isBookmark,
        "isMine": isMine,
        "isFollowing": isFollowing,
        "minimal": minimal,
        "categories": categories == null ? null : categories,
      };
}

class GlobalSearchReadDto {
  GlobalSearchReadDto({this.categories, this.products, this.users});

  final List<UserReadDto>? users;
  final List<ProductReadDto>? products;
  final List<CategoryReadDto>? categories;

  factory GlobalSearchReadDto.fromJson(String str) => GlobalSearchReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GlobalSearchReadDto.fromMap(Map<String, dynamic> json) => GlobalSearchReadDto(
        users: json["users"] == null ? null : List<UserReadDto>.from(json["users"].map((x) => UserReadDto.fromMap(x))),
        products: json["products"] == null ? null : List<ProductReadDto>.from(json["products"].map((x) => ProductReadDto.fromMap(x))),
        categories: json["categories"] == null ? null : List<CategoryReadDto>.from(json["categories"].map((x) => CategoryReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "users": users == null ? null : List<dynamic>.from(users!.map((x) => x.toMap())),
        "products": products == null ? null : List<dynamic>.from(products!.map((x) => x.toMap())),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toMap())),
      };
}
