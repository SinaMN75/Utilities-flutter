import 'package:utilities/utilities.dart';

class UserReadDto {
  UserReadDto({
    this.id,
    this.userName,
    this.email,
    this.phoneNumber,
    this.suspend,
    this.firstName,
    this.lastName,
    this.fullName,
    this.meliCode,
    this.shebaNumber,
    this.headline,
    this.jobStatus,
    this.bio,
    this.appUserName,
    this.appPhoneNumber,
    this.appEmail,
    this.useCase,
    this.type,
    this.accessLevel,
    this.region,
    this.state,
    this.gender,
    this.wallet,
    this.point,
    this.birthdate,
    this.createdAt,
    this.updatedAt,
    this.badge,
    this.isOnline,
    this.mutedChats,
    this.expireUpgradeAccount,
    this.ageCategory,
    this.userJsonDetail,
    this.growthRate,
    this.media,
    this.categories,
    this.isFollowing,
    this.countProducts,
    this.countFollowers,
    this.countFollowing,
    this.token,
  });

  factory UserReadDto.fromJson(final String str) => UserReadDto.fromMap(json.decode(str));

  factory UserReadDto.fromMap(final dynamic json) => UserReadDto(
        id: json["id"],
        userName: json["userName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        suspend: json["suspend"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        meliCode: json["meliCode"],
        shebaNumber: json["shebaNumber"],
        headline: json["headline"],
        bio: json["bio"],
        jobStatus: json["jobStatus"],
        appUserName: json["appUserName"],
        appPhoneNumber: json["appPhoneNumber"],
        appEmail: json["appEmail"],
        useCase: json["useCase"],
        type: json["type"],
        accessLevel: json["accessLevel"],
        region: json["region"],
        state: json["state"],
        gender: json["gender"],
        wallet: json["wallet"],
        point: json["point"],
        birthdate: json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        badge: json["badge"],
        isOnline: json["isOnline"],
        mutedChats: json["mutedChats"],
        expireUpgradeAccount: json["expireUpgradeAccount"] == null ? null : DateTime.parse(json["expireUpgradeAccount"]),
        ageCategory: json["ageCategory"],
        userJsonDetail: json["jsonDetail"] == null ? null : UserJsonDetail.fromMap(json["jsonDetail"]),
        growthRate: json["growthRateReadDto"] == null ? null : GrowthRateReadDto.fromMap(json["growthRateReadDto"]),
        media: json["media"] == null ? <MediaReadDto>[] : List<MediaReadDto>.from(json["media"].cast<dynamic>().map(MediaReadDto.fromMap)).toList(),
        categories: json["categories"] == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(json["categories"].cast<dynamic>().map(CategoryReadDto.fromMap)).toList(),
        isFollowing: json["isFollowing"],
        countProducts: json["countProducts"],
        countFollowers: json["countFollowers"],
        countFollowing: json["countFollowing"],
        token: json["token"],
      );
  String? id;
  String? userName;
  String? email;
  String? phoneNumber;
  bool? suspend;
  String? firstName;
  String? lastName;
  String? fullName;
  String? meliCode;
  String? shebaNumber;
  String? headline;
  String? bio;
  String? appUserName;
  String? appPhoneNumber;
  String? appEmail;
  String? useCase;
  String? type;
  String? jobStatus;
  String? accessLevel;
  String? region;
  String? state;
  int? gender;
  int? wallet;
  double? point;
  DateTime? birthdate;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? badge;
  bool? isOnline;
  String? mutedChats;
  DateTime? expireUpgradeAccount;
  int? ageCategory;
  UserJsonDetail? userJsonDetail;
  GrowthRateReadDto? growthRate;
  List<MediaReadDto>? media;
  List<CategoryReadDto>? categories;
  bool? isFollowing;
  int? countProducts;
  int? countFollowers;
  int? countFollowing;
  String? token;

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
        "id": id,
        "userName": userName,
        "email": email,
        "phoneNumber": phoneNumber,
        "suspend": suspend,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "meliCode": meliCode,
        "shebaNumber": shebaNumber,
        "headline": headline,
        "jobStatus": jobStatus,
        "bio": bio,
        "appUserName": appUserName,
        "appPhoneNumber": appPhoneNumber,
        "appEmail": appEmail,
        "useCase": useCase,
        "type": type,
        "accessLevel": accessLevel,
        "region": region,
        "state": state,
        "gender": gender,
        "wallet": wallet,
        "point": point,
        "birthdate": birthdate?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "badge": badge,
        "isOnline": isOnline,
        "mutedChats": mutedChats,
        "expireUpgradeAccount": expireUpgradeAccount?.toIso8601String(),
        "ageCategory": ageCategory,
        "userJsonDetail": userJsonDetail?.toMap(),
        "growthRate": growthRate?.toMap(),
        "media": media == null ? <MediaReadDto>[] : List<MediaReadDto>.from(media!.map((final MediaReadDto x) => x.toMap())),
        "categories": categories == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(categories!.map((final CategoryReadDto x) => x.toMap())),
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
    this.telegram,
    this.whatsApp,
    this.linkedIn,
    this.dribble,
    this.soundCloud,
    this.pinterest,
    this.color,
    this.website,
    this.activity,
    this.showContactInfo,
    this.privacyType,
    this.meliCode,
    this.shebaNumber,
    this.isAuthorize,
    this.isForeigner,
    this.detail1,
    this.detail2,
  });

  factory UserJsonDetail.fromJson(final String str) => UserJsonDetail.fromMap(json.decode(str));

  factory UserJsonDetail.fromMap(final dynamic json) => UserJsonDetail(
        instagram: json["instagram"],
        telegram: json["telegram"],
        color: json["color"],
        detail1: json["detail1"],
        detail2: json["detail2"],
        whatsApp: json["whatsApp"],
        linkedIn: json["linkedIn"],
        dribble: json["dribble"],
        soundCloud: json["soundCloud"],
        pinterest: json["pinterest"],
        website: json["website"],
        activity: json["activity"],
        showContactInfo: json["showContactInfo"],
        privacyType: json["privacyType"],
        meliCode: json["meliCode"],
        shebaNumber: json["shebaNumber"],
        isAuthorize: json["isAuthorize"],
        isForeigner: json["isForeigner"],
      );
  String? instagram;
  String? telegram;
  String? whatsApp;
  String? linkedIn;
  String? color;
  String? detail1;
  String? detail2;
  String? dribble;
  String? soundCloud;
  String? pinterest;
  String? website;
  String? activity;
  bool? showContactInfo;
  int? privacyType;
  String? meliCode;
  String? shebaNumber;
  bool? isAuthorize;
  bool? isForeigner;

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
        "instagram": instagram,
        "telegram": telegram,
        "color": color,
        "whatsApp": whatsApp,
        "linkedIn": linkedIn,
        "detail1": detail1,
        "detail2": detail2,
        "dribble": dribble,
        "soundCloud": soundCloud,
        "pinterest": pinterest,
        "website": website,
        "activity": activity,
        "showContactInfo": showContactInfo,
        "privacyType": privacyType,
        "meliCode": meliCode,
        "shebaNumber": shebaNumber,
        "isAuthorize": isAuthorize,
        "isForeigner": isForeigner,
      };
}

class UserCreateUpdateDto {
  UserCreateUpdateDto({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.fullName,
    this.bio,
    this.headline,
    this.appUserName,
    this.appPhoneNumber,
    this.appEmail,
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
    this.expireUpgradeAccount,
    this.categories,
    this.code,
    this.shebaNumber,
    this.tags,
  });

  factory UserCreateUpdateDto.fromJson(final String str) => UserCreateUpdateDto.fromMap(json.decode(str));

  factory UserCreateUpdateDto.fromMap(final Map<String, dynamic> json) => UserCreateUpdateDto(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        bio: json["bio"],
        headline: json["headline"],
        appUserName: json["appUserName"],
        appPhoneNumber: json["appPhoneNumber"],
        appEmail: json["appEmail"],
        region: json["region"],
        state: json["state"],
        badge: json["badge"],
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
        expireUpgradeAccount: json["expireUpgradeAccount"],
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((final x) => x)),
        code: json["code"],
        shebaNumber: json["shebaNumber"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final x) => x)),
      );
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? bio;
  final String? headline;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? appEmail;
  final String? region;
  final String? state;
  final String? badge;
  final String? visitedProducts;
  final String? bookmarkedProducts;
  final String? followedUsers;
  final String? followingUsers;
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
  final int? gender;
  final int? legalAuthenticationType;
  final int? nationalityType;
  final int? privacyType;
  final bool? isOnline;
  final int? ageCategory;
  final String? birthDate;
  final String? expireUpgradeAccount;
  final List<String>? categories;
  final String? code;
  final String? shebaNumber;
  final List<int>? tags;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "bio": bio,
        "headline": headline,
        "appUserName": appUserName,
        "appPhoneNumber": appPhoneNumber,
        "appEmail": appEmail,
        "region": region,
        "state": state,
        "badge": badge,
        "visitedProducts": visitedProducts,
        "bookmarkedProducts": bookmarkedProducts,
        "followedUsers": followedUsers,
        "followingUsers": followingUsers,
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
        "expireUpgradeAccount": expireUpgradeAccount,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((final String x) => x)),
        "code": code,
        "shebaNumber": shebaNumber,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
      };
}

class UserFilterDto {
  UserFilterDto({
    this.userId,
    this.userName,
    this.userNameExact,
    this.query,
    this.phoneNumber,
    this.showCategories,
    this.showFollowings,
    this.showForms,
    this.badge,
    this.jobStatus,
    this.privacyType,
    this.showGender,
    this.showLocations,
    this.showMedia,
    this.nationalCode,
    this.state,
    this.appUserName,
    this.showProducts,
    this.showTransactions,
    this.pageSize,
    this.userIds,
    this.pageNumber,
    this.categories,
    this.detail1,
    this.detail2,
  });

  factory UserFilterDto.fromJson(final String str) => UserFilterDto.fromMap(json.decode(str));

  factory UserFilterDto.fromMap(final dynamic json) => UserFilterDto(
        userId: json["userId"],
        userName: json["userName"],
        badge: json["badge"],
        userNameExact: json["userNameExact"],
        query: json["query"],
        jobStatus: json["jobStatus"],
        phoneNumber: json["phoneNumber"],
        showGender: json["showGender"],
        appUserName: json["appUserName"],
        nationalCode: json["nationalCode"],
        privacyType: json["privacyType"],
        showMedia: json["showMedia"],
        showCategories: json["showCategories"],
        showLocations: json["showLocations"],
        showForms: json["showForms"],
        showProducts: json["showProducts"],
        showTransactions: json["showTransactions"],
        showFollowings: json["showFollowings"],
        pageSize: json["pageSize"],
        state: json["state"],
        pageNumber: json["pageNumber"],
        detail1: json["detail1"],
        detail2: json["detail2"],
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((final x) => x)),
        userIds: json["userIds"] == null ? null : List<String>.from(json["userIds"].cast<dynamic>().map((final x) => x)),
      );

  final String? userId;
  final String? userName;
  final String? userNameExact;
  final String? query;
  final String? phoneNumber;
  final String? badge;
  final String? appUserName;
  final String? nationalCode;
  final String? jobStatus;
  final int? privacyType;
  final bool? showGender;
  final bool? showMedia;
  final bool? showCategories;
  final bool? showLocations;
  final bool? showForms;
  final bool? showProducts;
  final bool? showTransactions;
  final bool? showFollowings;
  final int? pageSize;
  final String? state;
  final String? detail1;
  final String? detail2;
  final int? pageNumber;
  final List<String>? userIds;
  final List<String>? categories;

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
        "userId": userId,
        "userName": userName,
        "userNameExact": userNameExact,
        "query": query,
        "badge": badge,
        "privacyType": privacyType,
        "phoneNumber": phoneNumber,
        "showGender": showGender,
        "appUserName": appUserName,
        "showMedia": showMedia,
        "showCategories": showCategories,
        "jobStatus": jobStatus,
        "showLocations": showLocations,
        "showForms": showForms,
        "nationalCode": nationalCode,
        "showProducts": showProducts,
        "showTransactions": showTransactions,
        "showFollowings": showFollowings,
        "pageSize": pageSize,
        "state": state,
        "pageNumber": pageNumber,
        "detail1": detail1,
        "detail2": detail2,
        "categories": categories == null ? <String>[] : List<dynamic>.from(categories!.map((final String x) => x)),
        "userIds": userIds == null ? null : List<dynamic>.from(userIds!.map((final String x) => x)),
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

  String toJson() => json.encode(toMap());

  dynamic toMap() => {"mobile": mobile};
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

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
        "email": email,
        "password": password,
        "returnUrl": returnUrl,
        "keep": keep,
      };
}

class LoginWithPassword {
  LoginWithPassword({
    this.email,
    this.userName,
    this.password,
  });

  factory LoginWithPassword.fromJson(final String str) => LoginWithPassword.fromMap(json.decode(str));

  factory LoginWithPassword.fromMap(final dynamic json) => LoginWithPassword(
        email: json["email"],
        userName: json["userName"],
        password: json["password"],
      );

  final String? email;
  final String? password;
  final String? userName;

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
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
  });

  factory VerifyMobileForLoginDto.fromJson(final String str) => VerifyMobileForLoginDto.fromMap(json.decode(str));

  factory VerifyMobileForLoginDto.fromMap(final dynamic json) => VerifyMobileForLoginDto(
        mobile: json["mobile"],
        verificationCode: json["verificationCode"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        instagram: json["instagram"],
      );

  final String mobile;
  final String verificationCode;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? instagram;

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
        "mobile": mobile,
        "verificationCode": verificationCode,
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "instagram": instagram,
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

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
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

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
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

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
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

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
        "code": code,
        "shebaNumber": shebaNumber,
        "isForeigner": isForeigner,
      };
}
