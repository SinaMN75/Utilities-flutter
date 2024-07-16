part of '../data.dart';

class UserReadDto {
  UserReadDto({
    required this.id,
    this.firstName,
    this.lastName,
    this.title,
    this.subtitle,
    this.fullName,
    this.headline,
    this.bio,
    this.appUserName,
    this.appPhoneNumber,
    this.userAgent,
    this.userName,
    this.phoneNumber,
    this.appEmail,
    this.email,
    this.country,
    this.city,
    this.state,
    this.badge,
    this.jobStatus,
    this.mutedChats,
    this.gender,
    this.wallet,
    this.point,
    this.birthdate,
    this.createdAt,
    this.updatedAt,
    this.isOnline,
    this.suspend,
    this.isPrivate,
    this.premiumExpireDate,
    this.ageCategory,
    required this.jsonDetail,
    required this.tags,
    this.media,
    this.categories,
    this.isFollowing,
    this.countProducts,
    this.countFollowers,
    this.countFollowing,
    this.token,
  });

  factory UserReadDto.fromJson(final String str) => UserReadDto.fromMap(json.decode(str));

  factory UserReadDto.fromMap(final Map<String, dynamic> json) => UserReadDto(
        id: json["id"] ?? '',
        firstName: json["firstName"],
        title: json["title"],
        subtitle: json["subtitle"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        headline: json["headline"],
        bio: json["bio"],
        appUserName: json["appUserName"],
        appPhoneNumber: json["appPhoneNumber"],
        userName: json["userName"],
        phoneNumber: json["phoneNumber"],
        appEmail: json["appEmail"],
        userAgent: json["userAgent"],
        email: json["email"],
        country: json["country"],
        city: json["city"],
        state: json["state"],
        badge: json["badge"],
        jobStatus: json["jobStatus"],
        mutedChats: json["mutedChats"],
        gender: json["gender"],
        wallet: json["wallet"],
        point: json["point"],
        birthdate: json["birthdate"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        isOnline: json["isOnline"],
        suspend: json["suspend"],
        isPrivate: json["isPrivate"],
        premiumExpireDate: json["premiumExpireDate"],
        ageCategory: json["ageCategory"],
        jsonDetail: UserJsonDetail.fromMap(json["jsonDetail"]),
        tags: List<int>.from(json["tags"]!.map((final dynamic x) => x)),
        media: json["media"] == null ? <MediaReadDto>[] : List<MediaReadDto>.from(json["media"]!.map(MediaReadDto.fromMap)),
        categories: json["categories"] == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(json["categories"]!.map(CategoryReadDto.fromMap)),
        isFollowing: json["isFollowing"],
        countProducts: json["countProducts"],
        countFollowers: json["countFollowers"],
        countFollowing: json["countFollowing"],
        token: json["token"],
      );
  final String id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? title;
  final String? subtitle;
  final String? headline;
  final String? bio;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? userName;
  final String? phoneNumber;
  final String? userAgent;
  final String? appEmail;
  final String? email;
  final String? country;
  final String? city;
  final String? state;
  final String? badge;
  final String? jobStatus;
  final String? mutedChats;
  final int? gender;
  final int? wallet;
  final double? point;
  final String? birthdate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isOnline;
  bool? suspend;
  final bool? isPrivate;
  final String? premiumExpireDate;
  final int? ageCategory;
  final UserJsonDetail jsonDetail;
  List<int> tags;
  final List<MediaReadDto>? media;
  final List<CategoryReadDto>? categories;
  final bool? isFollowing;
  final int? countProducts;
  final int? countFollowers;
  final int? countFollowing;
  final String? token;

  String toJson() => json.encode(removeNullEntries(toMap()));

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "firstName": firstName,
        "title": title,
        "subtitle": subtitle,
        "lastName": lastName,
        "fullName": fullName,
        "headline": headline,
        "bio": bio,
        "appUserName": appUserName,
        "appPhoneNumber": appPhoneNumber,
        "userName": userName,
        "phoneNumber": phoneNumber,
        "appEmail": appEmail,
        "email": email,
        "country": country,
        "city": city,
        "state": state,
        "userAgent": userAgent,
        "badge": badge,
        "jobStatus": jobStatus,
        "mutedChats": mutedChats,
        "gender": gender,
        "wallet": wallet,
        "point": point,
        "birthdate": birthdate,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isOnline": isOnline,
        "suspend": suspend,
        "isPrivate": isPrivate,
        "premiumExpireDate": premiumExpireDate,
        "ageCategory": ageCategory,
        "jsonDetail": jsonDetail.toMap(),
        "tags": List<dynamic>.from(tags.map((final int x) => x)),
        "media": media == null ? <dynamic>[] : List<dynamic>.from(media!.map((final MediaReadDto x) => x.toMap())),
        "categories": categories == null ? <dynamic>[] : List<dynamic>.from(categories!.map((final CategoryReadDto x) => x.toMap())),
        "isFollowing": isFollowing,
        "countProducts": countProducts,
        "countFollowers": countFollowers,
        "countFollowing": countFollowing,
        "token": token,
      };
}

class UserJsonDetail {
  UserJsonDetail({
    this.instagram,
    this.address,
    this.telegram,
    this.whatsApp,
    this.fcmToken,
    this.linkedIn,
    this.dribble,
    this.soundCloud,
    this.pinterest,
    this.website,
    this.activity,
    this.color,
    this.code,
    this.shebaNumber,
    this.boosted,
    this.deliveryPrice1,
    this.deliveryPrice2,
    this.deliveryPrice3,
    this.privacyType,
    this.legalAuthenticationType,
    this.nationalityType,
    this.keyValues1,
    this.userSubscriptions,
    this.weight,
    this.height,
    this.fatherName,
    this.foodAllergies,
    this.schoolName,
    this.sickness,
    this.usedDrugs,
    this.nationalCode,
    this.degree,
    this.stringList,
  });

  factory UserJsonDetail.fromJson(final String str) => UserJsonDetail.fromMap(json.decode(str));

  factory UserJsonDetail.fromMap(final Map<String, dynamic> json) => UserJsonDetail(
        instagram: json["instagram"],
        stringList: json["stringList"] == null ? [] : List<String>.from(json["stringList"]!.map((x) => x)),
        degree: json["degree"],
        address: json["address"],
        telegram: json["telegram"],
        fcmToken: json["fcmToken"],
        whatsApp: json["whatsApp"],
        linkedIn: json["linkedIn"],
        dribble: json["dribble"],
        soundCloud: json["soundCloud"],
        pinterest: json["pinterest"],
        website: json["website"],
        activity: json["activity"],
        color: json["color"],
        code: json["code"],
        shebaNumber: json["shebaNumber"],
        boosted: json["boosted"],
        deliveryPrice1: json["deliveryPrice1"],
        deliveryPrice2: json["deliveryPrice2"],
        deliveryPrice3: json["deliveryPrice3"],
        privacyType: json["privacyType"],
        legalAuthenticationType: json["legalAuthenticationType"],
        nationalityType: json["nationalityType"],
        nationalCode: json["nationalCode"],
        usedDrugs: json["usedDrugs"],
        sickness: json["sickness"],
        schoolName: json["schoolName"],
        foodAllergies: json["foodAllergies"],
        fatherName: json["fatherName"],
        height: json["height"],
        keyValues1: json["keyValues1"] == null ? [] : List<KeyValueViewModel>.from(json["keyValues1"]!.map((x) => KeyValueViewModel.fromMap(x))),
        weight: json["weight"],
        userSubscriptions: json["userSubscriptions"] == null ? [] : List<UserSubscriptions>.from(json["userSubscriptions"]!.map((x) => UserSubscriptions.fromMap(x))),
      );
  final String? instagram;
  final List<String>? stringList;
  final String? degree;
  final String? address;
  final String? telegram;
  final String? whatsApp;
  final String? fcmToken;
  final String? linkedIn;
  final String? dribble;
  final String? soundCloud;
  final String? pinterest;
  final String? website;
  final String? activity;
  final String? color;
  final String? code;
  final String? shebaNumber;
  final String? boosted;
  final String? fatherName;
  final String? nationalCode;
  final String? schoolName;
  final String? height;
  final String? weight;
  final String? foodAllergies;
  final String? sickness;
  final String? usedDrugs;
  final int? deliveryPrice1;
  final int? deliveryPrice2;
  final int? deliveryPrice3;
  final int? privacyType;
  final int? legalAuthenticationType;
  final int? nationalityType;
  final List<UserSubscriptions>? userSubscriptions;
  final List<KeyValueViewModel>? keyValues1;

  String toJson() => json.encode(removeNullEntries(toMap()));

  Map<String, dynamic> toMap() => <String, dynamic>{
        "instagram": instagram,
        "degree": degree,
        "stringList": stringList == null ? [] : List<dynamic>.from(stringList!.map((x) => x)),
        "address": address,
        "telegram": telegram,
        "whatsApp": whatsApp,
        "linkedIn": linkedIn,
        "fcmToken": fcmToken,
        "dribble": dribble,
        "soundCloud": soundCloud,
        "pinterest": pinterest,
        "website": website,
        "activity": activity,
        "color": color,
        "code": code,
        "shebaNumber": shebaNumber,
        "boosted": boosted,
        "deliveryPrice1": deliveryPrice1,
        "deliveryPrice2": deliveryPrice2,
        "deliveryPrice3": deliveryPrice3,
        "privacyType": privacyType,
        "legalAuthenticationType": legalAuthenticationType,
        "nationalityType": nationalityType,
        "weight": weight,
        "height": height,
        "fatherName": fatherName,
        "foodAllergies": foodAllergies,
        "usedDrugs": usedDrugs,
        "sickness": sickness,
        "schoolName": schoolName,
        "nationalCode": nationalCode,
        "keyValues1": keyValues1 == null ? [] : List<dynamic>.from(keyValues1!.map((x) => x.toMap())),
      };
}

class UserSubscriptions {
  final String? contentId;
  final String? title;
  final String? subTitle;
  final String? description;
  final int? days;
  final List<KeyValueViewModel>? keyValues;
  final int? price;
  final String? transactionRefId;
  final String? expiresIn;
  final List<int>? tags;

  UserSubscriptions({
    this.contentId,
    this.title,
    this.subTitle,
    this.description,
    this.days,
    this.keyValues,
    this.price,
    this.transactionRefId,
    this.expiresIn,
    this.tags,
  });

  factory UserSubscriptions.fromJson(String str) => UserSubscriptions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserSubscriptions.fromMap(Map<String, dynamic> json) => UserSubscriptions(
        contentId: json["contentId"],
        title: json["title"],
        subTitle: json["subTitle"],
        description: json["description"],
        days: json["days"],
        keyValues: json["keyValues"] == null ? [] : List<KeyValueViewModel>.from(json["keyValues"]!.map((x) => KeyValueViewModel.fromMap(x))),
        price: json["price"],
        transactionRefId: json["transactionRefId"],
        expiresIn: json["expiresIn"],
        tags: List<int>.from(json["tags"]!.map((final dynamic x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "contentId": contentId,
        "title": title,
        "subTitle": subTitle,
        "description": description,
        "days": days,
        "keyValues": keyValues == null ? [] : List<dynamic>.from(keyValues!.map((x) => x.toMap())),
        "price": price,
        "transactionRefId": transactionRefId,
        "expiresIn": expiresIn,
      };
}

class UserFilterDto {
  UserFilterDto({
    this.userId,
    this.userName,
    this.userNameExact,
    this.query,
    this.phoneNumber,
    this.country,
    this.city,
    this.state,
    this.email,
    this.firstName,
    this.lastName,
    this.fullName,
    this.bio,
    this.headline,
    this.jobStatus,
    this.appUserName,
    this.appPhoneNumber,
    this.appEmail,
    this.gender,
    this.badge,
    this.pageSize,
    this.pageNumber,
    this.showMedia,
    this.showCategories,
    this.showSuspend,
    this.showMyCustomers,
    this.orderByUserName,
    this.noneOfMyFollowing,
    this.noneOfMyFollower,
    this.userIds,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.phoneNumbers,
    this.showPremiums,
    this.categories,
    this.tags,
    this.institute,
  });

  factory UserFilterDto.fromMap(final Map<String, dynamic> json) => UserFilterDto(
        userId: json["userId"],
        userName: json["userName"],
        userNameExact: json["userNameExact"],
        showPremiums: json["showPremiums"],
        query: json["query"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        bio: json["bio"],
        headline: json["headline"],
        jobStatus: json["jobStatus"],
        appUserName: json["appUserName"],
        appPhoneNumber: json["appPhoneNumber"],
        appEmail: json["appEmail"],
        gender: json["gender"],
        country: json["country"],
        city: json["city"],
        state: json["state"],
        badge: json["badge"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        showMedia: json["showMedia"],
        showCategories: json["showCategories"],
        showSuspend: json["showSuspend"],
        showMyCustomers: json["showMyCustomers"],
        institute: json["institute"],
        orderByUserName: json["orderByUserName"],
        orderByCreatedAt: json["orderByCreatedAt"],
        orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
        orderByUpdatedAt: json["orderByUpdatedAt"],
        orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"],
        noneOfMyFollowing: json["noneOfMyFollowing"],
        noneOfMyFollower: json["noneOfMyFollower"],
        userIds: json["userIds"] == null ? <String>[] : List<String>.from(json["userIds"]!.map((final String x) => x)),
        phoneNumbers: json["phoneNumbers"] == null ? <String>[] : List<String>.from(json["phoneNumbers"]!.map((final String x) => x)),
        categories: json["categories"] == null ? <String>[] : List<String>.from(json["categories"]!.map((final String x) => x)),
        tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
      );

  factory UserFilterDto.fromJson(final String str) => UserFilterDto.fromMap(json.decode(str));
  final String? userId;
  final bool? showPremiums;
  final String? userName;
  final String? userNameExact;
  final String? query;
  final String? phoneNumber;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? country;
  final String? city;
  final String? state;
  final String? bio;
  final String? headline;
  final String? jobStatus;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? appEmail;
  final String? institute;
  final int? gender;
  final String? badge;
  final int? pageSize;
  final int? pageNumber;
  final bool? showMedia;
  final bool? showCategories;
  final bool? showSuspend;
  final bool? showMyCustomers;
  final bool? orderByUserName;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final bool? noneOfMyFollowing;
  final bool? noneOfMyFollower;
  final List<String>? userIds;
  final List<String>? phoneNumbers;
  final List<String>? categories;
  final List<int>? tags;

  String toJson() => json.encode(removeNullEntries(toMap()));

  Map<String, dynamic> toMap() => <String, dynamic>{
        "userId": userId,
        "userName": userName,
        "showPremiums": showPremiums,
        "userNameExact": userNameExact,
        "query": query,
        "phoneNumber": phoneNumber,
        "email": email,
        "institute": institute,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "bio": bio,
        "headline": headline,
        "jobStatus": jobStatus,
        "appUserName": appUserName,
        "appPhoneNumber": appPhoneNumber,
        "appEmail": appEmail,
        "gender": gender,
        "country": country,
        "city": city,
        "state": state,
        "badge": badge,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "showMedia": showMedia,
        "showCategories": showCategories,
        "showSuspend": showSuspend,
        "showMyCustomers": showMyCustomers,
        "orderByUserName": orderByUserName,
        "orderByUpdatedAt": orderByUpdatedAt,
        "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
        "orderByCreatedAtDesc": orderByCreatedAtDesc,
        "orderByCreatedAt": orderByCreatedAt,
        "noneOfMyFollowing": noneOfMyFollowing,
        "noneOfMyFollower": noneOfMyFollower,
        "userIds": userIds == null ? <dynamic>[] : List<dynamic>.from(userIds!.map((final String x) => x)),
        "phoneNumbers": phoneNumbers == null ? <dynamic>[] : List<dynamic>.from(phoneNumbers!.map((final String x) => x)),
        "categories": categories == null ? <dynamic>[] : List<dynamic>.from(categories!.map((final String x) => x)),
        "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((final int x) => x)),
      };
}

class GetMobileVerificationCodeForLoginDto {
  GetMobileVerificationCodeForLoginDto({required this.mobile});

  factory GetMobileVerificationCodeForLoginDto.fromJson(final String str) => GetMobileVerificationCodeForLoginDto.fromMap(
        json.decode(str),
      );

  factory GetMobileVerificationCodeForLoginDto.fromMap(final dynamic json) => GetMobileVerificationCodeForLoginDto(
        mobile: json["mobile"],
      );

  final String mobile;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, String>{"mobile": mobile};
}

class LoginWithPasswordDto {
  LoginWithPasswordDto({
    this.email,
    this.userName,
    this.password,
  });

  factory LoginWithPasswordDto.fromJson(final String str) => LoginWithPasswordDto.fromMap(json.decode(str));

  factory LoginWithPasswordDto.fromMap(final dynamic json) => LoginWithPasswordDto(
        email: json["email"],
        userName: json["userName"],
        password: json["password"],
      );

  final String? email;
  final String? password;
  final String? userName;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, String?>{
        "email": email,
        "userName": userName,
        "password": password,
      };
}

class VerifyMobileForLoginDto {
  VerifyMobileForLoginDto({
    required this.mobile,
    required this.verificationCode,
    this.firstName,
    this.lastName,
    this.username,
    this.instagram,
    this.fcmToken,
  });

  factory VerifyMobileForLoginDto.fromJson(final String str) => VerifyMobileForLoginDto.fromMap(json.decode(str));

  factory VerifyMobileForLoginDto.fromMap(final dynamic json) => VerifyMobileForLoginDto(
        mobile: json["mobile"],
        verificationCode: json["verificationCode"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        instagram: json["instagram"],
        fcmToken: json["fcmToken"],
      );

  final String mobile;
  final String verificationCode;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? instagram;
  final String? fcmToken;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, String?>{
        "mobile": mobile,
        "verificationCode": verificationCode,
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "instagram": instagram,
        "fcmToken": fcmToken,
      };
}

class BookmarkFolder {
  BookmarkFolder({
    this.id,
    this.title,
  });

  factory BookmarkFolder.fromJson(final String str) => BookmarkFolder.fromMap(json.decode(str));

  factory BookmarkFolder.fromMap(final dynamic json) => BookmarkFolder(
        id: json["id"],
        title: json["title"],
      );

  final String? id;
  final String? title;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, String?>{
        "id": id,
        "title": title,
      };
}

class AuthenticateDto {
  AuthenticateDto({
    this.isForeigner,
    this.code,
    this.shebaNumber,
  });

  factory AuthenticateDto.fromJson(final String str) => AuthenticateDto.fromMap(json.decode(str));

  factory AuthenticateDto.fromMap(final dynamic json) => AuthenticateDto(
        code: json["code"],
        shebaNumber: json["shebaNumber"],
        isForeigner: json["isForeigner"],
      );

  final bool? isForeigner;
  final String? code;
  final String? shebaNumber;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, Object?>{
        "code": code,
        "shebaNumber": shebaNumber,
        "isForeigner": isForeigner,
      };
}

class UserCreateUpdateDto {
  final List<String>? stringList;
  final String? id;
  final String? degree;
  final String? email;
  final String? firstName;
  final String? userName;
  final String? phoneNumber;
  final String? lastName;
  final String? fullName;
  final String? bio;
  final String? headline;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? appEmail;
  final String? badge;
  final String? state;
  final String? country;
  final String? city;
  final String? visitedProducts;
  final String? bookmarkedProducts;
  final String? followedUsers;
  final String? followingUsers;
  final String? fcmToken;
  final String? blockedUsers;
  final int? wallet;
  final int? deliveryPrice1;
  final int? deliveryPrice2;
  final int? deliveryPrice3;
  final int? point;
  final bool? suspend;
  final String? instagram;
  final String? telegram;
  final String? jobStatus;
  final String? whatsApp;
  final String? linkedIn;
  final String? dribble;
  final String? soundCloud;
  final String? pinterest;
  final String? website;
  final String? activity;
  final String? color;
  final String? password;
  final String? fatherName;
  final String? nationalCode;
  final String? schoolName;
  final String? height;
  final String? weight;
  final String? foodAllergies;
  final String? sickness;
  final String? usedDrugs;
  final int? gender;
  final int? legalAuthenticationType;
  final int? nationalityType;
  final int? privacyType;
  final String? birthDate;
  final String? premiumExpireDate;
  final List<String>? categories;
  final String? code;
  final String? shebaNumber;
  final String? address;
  final String? institute;
  final List<int>? tags;
  final List<int>? removeTags;
  final List<int>? addTags;
  final String? title;
  final String? subtitle;
  final List<KeyValueViewModel>? keyValues1;

  UserCreateUpdateDto({
    this.id,
    this.degree,
    this.stringList,
    this.email,
    this.firstName,
    this.userName,
    this.phoneNumber,
    this.lastName,
    this.fullName,
    this.bio,
    this.headline,
    this.appUserName,
    this.appPhoneNumber,
    this.appEmail,
    this.country,
    this.city,
    this.state,
    this.title,
    this.subtitle,
    this.badge,
    this.visitedProducts,
    this.bookmarkedProducts,
    this.followedUsers,
    this.followingUsers,
    this.fcmToken,
    this.blockedUsers,
    this.wallet,
    this.deliveryPrice1,
    this.deliveryPrice2,
    this.deliveryPrice3,
    this.point,
    this.suspend,
    this.instagram,
    this.telegram,
    this.jobStatus,
    this.whatsApp,
    this.linkedIn,
    this.dribble,
    this.soundCloud,
    this.pinterest,
    this.website,
    this.activity,
    this.color,
    this.password,
    this.gender,
    this.legalAuthenticationType,
    this.nationalityType,
    this.privacyType,
    this.birthDate,
    this.premiumExpireDate,
    this.categories,
    this.code,
    this.shebaNumber,
    this.address,
    this.tags,
    this.removeTags,
    this.addTags,
    this.weight,
    this.height,
    this.fatherName,
    this.foodAllergies,
    this.schoolName,
    this.sickness,
    this.usedDrugs,
    this.nationalCode,
    this.keyValues1,
    this.institute,
  });

  factory UserCreateUpdateDto.fromJson(String str) => UserCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserCreateUpdateDto.fromMap(Map<String, dynamic> json) => UserCreateUpdateDto(
    id: json["id"],
        degree: json["degree"],
        stringList: json["stringList"] == null ? [] : List<String>.from(json["stringList"]!.map((x) => x)),
        email: json["email"],
        firstName: json["firstName"],
        userName: json["userName"],
        phoneNumber: json["phoneNumber"],
        title: json["title"],
        subtitle: json["subtitle"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        bio: json["bio"],
        headline: json["headline"],
        appUserName: json["appUserName"],
        appPhoneNumber: json["appPhoneNumber"],
        appEmail: json["appEmail"],
        country: json["country"],
        city: json["city"],
        state: json["state"],
        badge: json["badge"],
        visitedProducts: json["visitedProducts"],
        bookmarkedProducts: json["bookmarkedProducts"],
        followedUsers: json["followedUsers"],
        followingUsers: json["followingUsers"],
        fcmToken: json["fcmToken"],
        blockedUsers: json["blockedUsers"],
        wallet: json["wallet"],
        deliveryPrice1: json["deliveryPrice1"],
        deliveryPrice2: json["deliveryPrice2"],
        deliveryPrice3: json["deliveryPrice3"],
        point: json["point"],
        suspend: json["suspend"],
        instagram: json["instagram"],
        telegram: json["telegram"],
        jobStatus: json["jobStatus"],
        whatsApp: json["whatsApp"],
        linkedIn: json["linkedIn"],
        dribble: json["dribble"],
        soundCloud: json["soundCloud"],
        pinterest: json["pinterest"],
        website: json["website"],
        activity: json["activity"],
        color: json["color"],
        password: json["password"],
        gender: json["gender"],
        legalAuthenticationType: json["legalAuthenticationType"],
        nationalityType: json["nationalityType"],
        privacyType: json["privacyType"],
        birthDate: json["birthDate"],
        premiumExpireDate: json["premiumExpireDate"],
        nationalCode: json["nationalCode"],
        usedDrugs: json["usedDrugs"],
        sickness: json["sickness"],
        schoolName: json["schoolName"],
        foodAllergies: json["foodAllergies"],
        fatherName: json["fatherName"],
        height: json["height"],
        weight: json["weight"],
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
        code: json["code"],
        shebaNumber: json["shebaNumber"],
        address: json["address"],
        institute: json["institute"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
        removeTags: json["removeTags"] == null ? [] : List<int>.from(json["removeTags"]!.map((x) => x)),
        addTags: json["addTags"] == null ? [] : List<int>.from(json["addTags"]!.map((x) => x)),
        keyValues1: json["keyValues1"] == null ? [] : List<KeyValueViewModel>.from(json["keyValues1"]!.map((x) => KeyValueViewModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "stringList": stringList == null ? [] : List<dynamic>.from(stringList!.map((x) => x)),
        "degree": degree,
        "email": email,
        "firstName": firstName,
        "userName": userName,
        "phoneNumber": phoneNumber,
        "lastName": lastName,
        "title": title,
        "subtitle": subtitle,
        "fullName": fullName,
        "bio": bio,
        "headline": headline,
        "appUserName": appUserName,
        "appPhoneNumber": appPhoneNumber,
        "appEmail": appEmail,
        "country": country,
        "city": city,
        "state": state,
        "badge": badge,
        "visitedProducts": visitedProducts,
        "bookmarkedProducts": bookmarkedProducts,
        "followedUsers": followedUsers,
        "followingUsers": followingUsers,
        "fcmToken": fcmToken,
        "blockedUsers": blockedUsers,
        "wallet": wallet,
        "deliveryPrice1": deliveryPrice1,
        "deliveryPrice2": deliveryPrice2,
        "deliveryPrice3": deliveryPrice3,
        "point": point,
        "suspend": suspend,
        "instagram": instagram,
        "telegram": telegram,
        "jobStatus": jobStatus,
        "whatsApp": whatsApp,
        "linkedIn": linkedIn,
        "dribble": dribble,
        "soundCloud": soundCloud,
        "pinterest": pinterest,
        "website": website,
        "activity": activity,
        "color": color,
        "password": password,
        "gender": gender,
        "legalAuthenticationType": legalAuthenticationType,
        "nationalityType": nationalityType,
        "privacyType": privacyType,
        "birthDate": birthDate,
        "premiumExpireDate": premiumExpireDate,
        "weight": weight,
        "height": height,
        "fatherName": fatherName,
        "foodAllergies": foodAllergies,
        "usedDrugs": usedDrugs,
        "sickness": sickness,
        "schoolName": schoolName,
        "institute": institute,
        "nationalCode": nationalCode,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
        "code": code,
        "shebaNumber": shebaNumber,
        "address": address,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "removeTags": removeTags == null ? [] : List<dynamic>.from(removeTags!.map((x) => x)),
        "addTags": addTags == null ? [] : List<dynamic>.from(addTags!.map((x) => x)),
        "keyValues1": keyValues1 == null ? [] : List<dynamic>.from(keyValues1!.map((x) => x.toMap())),
      };
}
