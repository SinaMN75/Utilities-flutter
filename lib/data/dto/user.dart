part of '../data.dart';

class UserReadDto {
  UserReadDto({
    required this.id,
    this.firstName,
    this.lastName,
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
    this.region,
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
        region: json["region"],
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
  final String? headline;
  final String? bio;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? userName;
  final String? phoneNumber;
  final String? userAgent;
  final String? appEmail;
  final String? email;
  final String? region;
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
        "region": region,
        "userAgent": userAgent,
        "state": state,
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
  });

  factory UserJsonDetail.fromJson(final String str) => UserJsonDetail.fromMap(json.decode(str));

  factory UserJsonDetail.fromMap(final Map<String, dynamic> json) => UserJsonDetail(
        instagram: json["instagram"],
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
      );
  final String? instagram;
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
  final int? deliveryPrice1;
  final int? deliveryPrice2;
  final int? deliveryPrice3;
  final int? privacyType;
  final int? legalAuthenticationType;
  final int? nationalityType;

  String toJson() => json.encode(removeNullEntries(toMap()));

  Map<String, dynamic> toMap() => <String, dynamic>{
        "instagram": instagram,
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
      };
}

class UserCreateUpdateDto {
  UserCreateUpdateDto({
    this.id,
    this.address,
    this.email,
    this.firstName,
    this.lastName,
    this.fullName,
    this.bio,
    this.headline,
    this.appUserName,
    this.appPhoneNumber,
    this.appEmail,
    this.fcmToken,
    this.region,
    this.state,
    this.badge,
    this.visitedProducts,
    this.bookmarkedProducts,
    this.followedUsers,
    this.followingUsers,
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
    this.gender,
    this.legalAuthenticationType,
    this.nationalityType,
    this.privacyType,
    this.isOnline,
    this.ageCategory,
    this.birthDate,
    this.premiumExpireDate,
    this.categories,
    this.code,
    this.shebaNumber,
    this.tags,
    this.password,
  });

  factory UserCreateUpdateDto.fromJson(final String str) => UserCreateUpdateDto.fromMap(json.decode(str));

  factory UserCreateUpdateDto.fromMap(final Map<String, dynamic> json) => UserCreateUpdateDto(
        id: json["id"],
        email: json["email"],
        address: json["address"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        bio: json["bio"],
        fcmToken: json["fcmToken"],
        headline: json["headline"],
        appUserName: json["appUserName"],
        appPhoneNumber: json["appPhoneNumber"],
        appEmail: json["appEmail"],
        region: json["region"],
        state: json["state"],
        badge: json["badge"],
        password: json["password"],
        visitedProducts: json["visitedProducts"],
        bookmarkedProducts: json["bookmarkedProducts"],
        followedUsers: json["followedUsers"],
        followingUsers: json["followingUsers"],
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
        gender: json["gender"],
        legalAuthenticationType: json["legalAuthenticationType"],
        nationalityType: json["nationalityType"],
        privacyType: json["privacyType"],
        isOnline: json["isOnline"],
        ageCategory: json["ageCategory"],
        birthDate: json["birthDate"],
        premiumExpireDate: json["premiumExpireDate"],
        categories: json["categories"] == null ? <String>[] : List<String>.from(json["categories"]!.map((final String x) => x)),
        code: json["code"],
        shebaNumber: json["shebaNumber"],
        tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
      );
  final String? id;
  final String? email;
  final String? address;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? fcmToken;
  final String? bio;
  final String? headline;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? appEmail;
  final String? region;
  final String? state;
  final String? badge;
  final String? visitedProducts;
  final String? password;
  final String? bookmarkedProducts;
  final String? followedUsers;
  final String? followingUsers;
  final String? blockedUsers;
  final int? wallet;
  final int? deliveryPrice1;
  final int? deliveryPrice2;
  final int? deliveryPrice3;
  final double? point;
  bool? suspend;
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
  final int? gender;
  final int? legalAuthenticationType;
  final int? nationalityType;
  final int? privacyType;
  final bool? isOnline;
  final int? ageCategory;
  final String? birthDate;
  final String? premiumExpireDate;
  final List<String>? categories;
  final String? code;
  final String? shebaNumber;
  final List<int>? tags;

  String toJson() => json.encode(removeNullEntries(toMap()));

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "email": email,
        "address": address,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "bio": bio,
        "headline": headline,
        "appUserName": appUserName,
        "fcmToken": fcmToken,
        "appPhoneNumber": appPhoneNumber,
        "appEmail": appEmail,
        "region": region,
        "state": state,
        "badge": badge,
        "visitedProducts": visitedProducts,
        "bookmarkedProducts": bookmarkedProducts,
        "followedUsers": followedUsers,
        "followingUsers": followingUsers,
        "password": password,
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
        "gender": gender,
        "legalAuthenticationType": legalAuthenticationType,
        "nationalityType": nationalityType,
        "privacyType": privacyType,
        "isOnline": isOnline,
        "ageCategory": ageCategory,
        "birthDate": birthDate,
        "premiumExpireDate": premiumExpireDate,
        "categories": categories == null ? <dynamic>[] : List<dynamic>.from(categories!.map((final String x) => x)),
        "code": code,
        "shebaNumber": shebaNumber,
        "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((final int x) => x)),
      };
}

class UserFilterDto {
  UserFilterDto({
    this.userId,
    this.userName,
    this.userNameExact,
    this.query,
    this.phoneNumber,
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
    this.region,
    this.state,
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
        region: json["region"],
        state: json["state"],
        badge: json["badge"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        showMedia: json["showMedia"],
        showCategories: json["showCategories"],
        showSuspend: json["showSuspend"],
        showMyCustomers: json["showMyCustomers"],
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
  final String? bio;
  final String? headline;
  final String? jobStatus;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? appEmail;
  final int? gender;
  final String? region;
  final String? state;
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
        "region": region,
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

class LoginWithEmail {
  LoginWithEmail({
    this.email,
    this.password,
    this.returnUrl,
    this.keep,
  });

  factory LoginWithEmail.fromJson(final String str) => LoginWithEmail.fromMap(json.decode(str));

  factory LoginWithEmail.fromMap(final dynamic json) => LoginWithEmail(
        email: json["email"],
        password: json["password"],
        returnUrl: json["returnUrl"],
        keep: json["keep"],
      );

  final String? email;
  final String? password;
  final String? returnUrl;
  final bool? keep;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, Object?>{
        "email": email,
        "password": password,
        "returnUrl": returnUrl,
        "keep": keep,
      };
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

class ActiveMobileDto {
  ActiveMobileDto({
    this.code,
    this.mobile,
  });

  factory ActiveMobileDto.fromJson(final String str) => ActiveMobileDto.fromMap(json.decode(str));

  factory ActiveMobileDto.fromMap(final dynamic json) => ActiveMobileDto(
        code: json["code"],
        mobile: json["mobile"],
      );

  final String? code;
  final String? mobile;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, String?>{
        "code": code,
        "mobile": mobile,
      };
}

class GrowthRateReadDto {
  GrowthRateReadDto({
    this.id,
    this.interActive1,
    this.interActive2,
    this.interActive3,
    this.interActive4,
    this.interActive5,
    this.interActive6,
    this.interActive7,
    this.feedback1,
    this.feedback2,
    this.feedback3,
    this.feedback4,
    this.feedback5,
    this.feedback6,
    this.feedback7,
    this.totalInterActive,
    this.totalFeedback,
  });

  factory GrowthRateReadDto.fromJson(final String str) => GrowthRateReadDto.fromMap(json.decode(str));

  factory GrowthRateReadDto.fromMap(final dynamic json) => GrowthRateReadDto(
        id: json["id"],
        interActive1: json["interActive1"],
        interActive2: json["interActive2"],
        interActive3: json["interActive3"],
        interActive4: json["interActive4"],
        interActive5: json["interActive5"],
        interActive6: json["interActive6"],
        interActive7: json["interActive7"],
        feedback1: json["feedback1"],
        feedback2: json["feedback2"],
        feedback3: json["feedback3"],
        feedback4: json["feedback4"],
        feedback5: json["feedback5"],
        feedback6: json["feedback6"],
        feedback7: json["feedback7"],
        totalInterActive: json["totalInterActive"],
        totalFeedback: json["totalFeedback"],
      );

  final String? id;
  final int? interActive1;
  final int? interActive2;
  final int? interActive3;
  final int? interActive4;
  final int? interActive5;
  final int? interActive6;
  final int? interActive7;
  final int? feedback1;
  final int? feedback2;
  final int? feedback3;
  final int? feedback4;
  final int? feedback5;
  final int? feedback6;
  final int? feedback7;
  final int? totalInterActive;
  final int? totalFeedback;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, Object?>{
        "id": id,
        "interActive1": interActive1,
        "interActive2": interActive2,
        "interActive3": interActive3,
        "interActive4": interActive4,
        "interActive5": interActive5,
        "interActive6": interActive6,
        "interActive7": interActive7,
        "feedback1": feedback1,
        "feedback2": feedback2,
        "feedback3": feedback3,
        "feedback4": feedback4,
        "feedback5": feedback5,
        "feedback6": feedback6,
        "feedback7": feedback7,
        "totalInterActive": totalInterActive,
        "totalFeedback": totalFeedback,
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

class RegisterDto {
  RegisterDto({
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.password,
    this.sendSms,
    this.jsonDetail,
  });

  factory RegisterDto.fromJson(final String str) => RegisterDto.fromMap(json.decode(str));

  factory RegisterDto.fromMap(final Map<String, dynamic> json) => RegisterDto(
        userName: json["userName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        sendSms: json["sendSms"],
        jsonDetail: json["jsonDetail"] == null ? null : JsonDetail.fromMap(json["jsonDetail"]),
      );
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final bool? sendSms;
  final JsonDetail? jsonDetail;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "userName": userName,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "sendSms": sendSms,
        "jsonDetail": jsonDetail?.toMap(),
      };
}

class JsonDetail {
  JsonDetail({
    this.instagram,
    this.telegram,
    this.whatsApp,
    this.linkedIn,
    this.dribble,
    this.soundCloud,
    this.pinterest,
    this.website,
    this.activity,
    this.color,
    this.code,
    this.shebaNumber,
    this.address,
    this.fcmToken,
    this.boosted,
    this.deliveryPrice1,
    this.deliveryPrice2,
    this.deliveryPrice3,
    this.privacyType,
    this.legalAuthenticationType,
    this.nationalityType,
  });

  factory JsonDetail.fromJson(final String str) => JsonDetail.fromMap(json.decode(str));

  factory JsonDetail.fromMap(final Map<String, dynamic> json) => JsonDetail(
        instagram: json["instagram"],
        telegram: json["telegram"],
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
        address: json["address"],
        fcmToken: json["fcmToken"],
        boosted: json["boosted"],
        deliveryPrice1: json["deliveryPrice1"],
        deliveryPrice2: json["deliveryPrice2"],
        deliveryPrice3: json["deliveryPrice3"],
        privacyType: json["privacyType"],
        legalAuthenticationType: json["legalAuthenticationType"],
        nationalityType: json["nationalityType"],
      );
  final String? instagram;
  final String? telegram;
  final String? whatsApp;
  final String? linkedIn;
  final String? dribble;
  final String? soundCloud;
  final String? pinterest;
  final String? website;
  final String? activity;
  final String? color;
  final String? code;
  final String? shebaNumber;
  final String? address;
  final String? fcmToken;
  final String? boosted;
  final int? deliveryPrice1;
  final int? deliveryPrice2;
  final int? deliveryPrice3;
  final int? privacyType;
  final int? legalAuthenticationType;
  final int? nationalityType;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "instagram": instagram,
        "telegram": telegram,
        "whatsApp": whatsApp,
        "linkedIn": linkedIn,
        "dribble": dribble,
        "soundCloud": soundCloud,
        "pinterest": pinterest,
        "website": website,
        "activity": activity,
        "color": color,
        "code": code,
        "shebaNumber": shebaNumber,
        "address": address,
        "fcmToken": fcmToken,
        "boosted": boosted,
        "deliveryPrice1": deliveryPrice1,
        "deliveryPrice2": deliveryPrice2,
        "deliveryPrice3": deliveryPrice3,
        "privacyType": privacyType,
        "legalAuthenticationType": legalAuthenticationType,
        "nationalityType": nationalityType,
      };
}
