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
    this.isPrivate,
    this.meliCode,
    this.shebaNumber,
    this.headline,
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
        id: json["id"],
        userName: json["userName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        suspend: json["suspend"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        isPrivate: json["isPrivate"],
        meliCode: json["meliCode"],
        shebaNumber: json["shebaNumber"],
        headline: json["headline"],
        bio: json["bio"],
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
        userJsonDetail: json["userJsonDetail"] == null ? null : UserJsonDetail.fromMap(json["userJsonDetail"]),
        media: json["media"] == null ? <MediaReadDto>[] : List<MediaReadDto>.from(json["media"].cast<Map<String, dynamic>>().map(MediaReadDto.fromMap)).toList(),
        categories: json["categories"] == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(json["categories"].cast<Map<String, dynamic>>().map(CategoryReadDto.fromMap)).toList(),
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
  bool? isPrivate;
  String? meliCode;
  String? shebaNumber;
  String? headline;
  String? bio;
  String? appUserName;
  String? appPhoneNumber;
  String? appEmail;
  String? useCase;
  String? type;
  String? accessLevel;
  String? region;
  String? state;
  int? gender;
  int? wallet;
  int? point;
  DateTime? birthdate;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? badge;
  bool? isOnline;
  String? mutedChats;
  DateTime? expireUpgradeAccount;
  int? ageCategory;
  UserJsonDetail? userJsonDetail;
  List<MediaReadDto>? media;
  List<CategoryReadDto>? categories;
  bool? isFollowing;
  int? countProducts;
  int? countFollowers;
  int? countFollowing;
  String? token;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "userName": userName,
        "email": email,
        "phoneNumber": phoneNumber,
        "suspend": suspend,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "isPrivate": isPrivate,
        "meliCode": meliCode,
        "shebaNumber": shebaNumber,
        "headline": headline,
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
        "media": media == null ? <MediaReadDto>[] : List<MediaReadDto>.from(media!.map((final x) => x.toMap())),
        "categories": categories == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(categories!.map((final x) => x.toMap())),
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
    this.website,
    this.activity,
    this.color,
    this.showContactInfo,
    this.isPrivate,
    this.meliCode,
    this.shebaNumber,
    this.isAuthorize,
    this.isForeigner,
  });

  factory UserJsonDetail.fromJson(final String str) => UserJsonDetail.fromMap(json.decode(str));

  factory UserJsonDetail.fromMap(final Map<String, dynamic> json) => UserJsonDetail(
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
        showContactInfo: json["showContactInfo"],
        isPrivate: json["isPrivate"],
        meliCode: json["meliCode"],
        shebaNumber: json["shebaNumber"],
        isAuthorize: json["isAuthorize"],
        isForeigner: json["isForeigner"],
      );
  String? instagram;
  String? telegram;
  String? whatsApp;
  String? linkedIn;
  String? dribble;
  String? soundCloud;
  String? pinterest;
  String? website;
  String? activity;
  String? color;
  bool? showContactInfo;
  bool? isPrivate;
  String? meliCode;
  String? shebaNumber;
  bool? isAuthorize;
  bool? isForeigner;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
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
        "showContactInfo": showContactInfo,
        "isPrivate": isPrivate,
        "meliCode": meliCode,
        "shebaNumber": shebaNumber,
        "isAuthorize": isAuthorize,
        "isForeigner": isForeigner,
      };
}

class UserCreateUpdateDto {
  UserCreateUpdateDto({
    this.id,
    this.phoneNumber,
    this.userName,
    this.firstName,
    this.lastName,
    this.fullName,
    this.bio,
    this.headline,
    this.website,
    this.instagram,
    this.telegram,
    this.whatsapp,
    this.linkedIn,
    this.password,
    this.appUserName,
    this.appPhoneNumber,
    this.appEmail,
    this.type,
    this.region,
    this.activity,
    this.nationalCode,
    this.color,
    this.badge,
    this.point,
    this.suspend,
    this.wallet,
    this.showContactInfo,
    this.birthDate,
    this.gender,
    this.categories,
    this.locations,
    this.pinterest,
    this.soundcloud,
    this.isPrivate,
    this.dribble,
    this.email,
    this.state,
    this.stateTr1,
    this.genderTr1,
    this.detail1,
    this.detail2,
  });

  factory UserCreateUpdateDto.fromJson(final String str) => UserCreateUpdateDto.fromMap(json.decode(str));

  factory UserCreateUpdateDto.fromMap(final Map<String, dynamic> json) => UserCreateUpdateDto(
        id: json["id"],
        phoneNumber: json["phoneNumber"],
        userName: json["userName"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        bio: json["bio"],
        isPrivate: json["isPrivate"],
        badge: json["badge"],
        point: json["point"],
        headline: json["headline"],
        website: json["website"],
        instagram: json["instagram"],
        telegram: json["telegram"],
        whatsapp: json["whatsApp"],
        linkedIn: json["linkedIn"],
        soundcloud: json["soundCloud"],
        dribble: json["dribble"],
        pinterest: json["pinterest"],
        password: json["password"],
        nationalCode: json["nationalCode"],
        appUserName: json["appUserName"],
        appPhoneNumber: json["appPhoneNumber"],
        appEmail: json["appEmail"],
        type: json["type"],
        state: json["state"],
        stateTr1: json["stateTr1"],
        region: json["region"],
        activity: json["activity"],
        color: json["color"],
        suspend: json["suspend"],
        wallet: json["wallet"],
        showContactInfo: json["showContactInfo"],
        birthDate: json["birthDate"],
        gender: json["gender"],
        genderTr1: json["genderTr1"],
        detail1: json["detail1"],
        detail2: json["detail2"],
        categories: json["categories"] == null ? null : List<String>.from(json["categories"].cast<Map<String, dynamic>>().map((final x) => x)),
        locations: json["locations"] == null ? null : List<int>.from(json["locations"].cast<Map<String, dynamic>>().map((final x) => x)),
      );

  final String? id;
  final String? phoneNumber;
  final String? userName;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? bio;
  final String? badge;
  final double? point;
  final String? headline;
  final String? website;
  final String? instagram;
  final String? telegram;
  final String? whatsapp;
  final String? linkedIn;
  final String? soundcloud;
  final String? pinterest;
  final String? dribble;
  final String? password;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? appEmail;
  final String? type;
  final String? region;
  final String? nationalCode;
  final String? activity;
  final String? color;
  final String? state;
  final String? stateTr1;
  final bool? suspend;
  final bool? isPrivate;
  final double? wallet;
  final bool? showContactInfo;
  final String? birthDate;
  final String? gender;
  final String? genderTr1;
  final String? detail1;
  final String? detail2;
  final List<String>? categories;
  final List<int>? locations;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "phoneNumber": phoneNumber,
        "userName": userName,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "bio": bio,
        "badge": badge,
        "point": point,
        "headline": headline,
        "website": website,
        "instagram": instagram,
        "telegram": telegram,
        "whatsApp": whatsapp,
        "linkedIn": linkedIn,
        "isPrivate": isPrivate,
        "soundCloud": soundcloud,
        "pinterest": pinterest,
        "dribble": dribble,
        "password": password,
        "appUserName": appUserName,
        "appPhoneNumber": appPhoneNumber,
        "appEmail": appEmail,
        "type": type,
        "state": state,
        "stateTr1": stateTr1,
        "region": region,
        "nationalCode": nationalCode,
        "activity": activity,
        "color": color,
        "suspend": suspend,
        "wallet": wallet,
        "showContactInfo": showContactInfo,
        "birthDate": birthDate,
        "gender": gender,
        "genderTr1": genderTr1,
        "detail1": detail1,
        "detail2": detail2,
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((final x) => x)),
        "locations": locations == null ? null : List<dynamic>.from(locations!.map((final x) => x)),
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
    this.showGender,
    this.showLocations,
    this.showMedia,
    this.nationalCode,
    this.stateTr1,
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

  factory UserFilterDto.fromMap(final Map<String, dynamic> json) => UserFilterDto(
        userId: json["userId"],
        userName: json["userName"],
        badge: json["badge"],
        userNameExact: json["userNameExact"],
        query: json["query"],
        phoneNumber: json["phoneNumber"],
        showGender: json["showGender"],
        appUserName: json["appUserName"],
        nationalCode: json["nationalCode"],
        showMedia: json["showMedia"],
        showCategories: json["showCategories"],
        showLocations: json["showLocations"],
        showForms: json["showForms"],
        showProducts: json["showProducts"],
        showTransactions: json["showTransactions"],
        showFollowings: json["showFollowings"],
        pageSize: json["pageSize"],
        stateTr1: json["stateTr1"],
        state: json["state"],
        pageNumber: json["pageNumber"],
        detail1: json["detail1"],
        detail2: json["detail2"],
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((final x) => x)),
        userIds: json["userIds"] == null ? null : List<String>.from(json["userIds"].cast<Map<String, dynamic>>().map((final x) => x)),
      );

  final String? userId;
  final String? userName;
  final String? userNameExact;
  final String? query;
  final String? phoneNumber;
  final String? badge;
  final String? appUserName;
  final String? nationalCode;
  final bool? showGender;
  final bool? showMedia;
  final bool? showCategories;
  final bool? showLocations;
  final bool? showForms;
  final bool? showProducts;
  final bool? showTransactions;
  final bool? showFollowings;
  final int? pageSize;
  final String? stateTr1;
  final String? state;
  final String? detail1;
  final String? detail2;
  final int? pageNumber;
  final List<String>? userIds;
  final List<String>? categories;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "userName": userName,
        "userNameExact": userNameExact,
        "query": query,
        "badge": badge,
        "phoneNumber": phoneNumber,
        "showGender": showGender,
        "appUserName": appUserName,
        "showMedia": showMedia,
        "showCategories": showCategories,
        "showLocations": showLocations,
        "showForms": showForms,
        "nationalCode": nationalCode,
        "showProducts": showProducts,
        "showTransactions": showTransactions,
        "showFollowings": showFollowings,
        "pageSize": pageSize,
        "stateTr1": stateTr1,
        "state": state,
        "pageNumber": pageNumber,
        "detail1": detail1,
        "detail2": detail2,
        "categories": categories == null ? <String>[] : List<dynamic>.from(categories!.map((final x) => x)),
        "userIds": userIds == null ? null : List<dynamic>.from(userIds!.map((final x) => x)),
      };
}

class GetMobileVerificationCodeForLoginDto {
  GetMobileVerificationCodeForLoginDto({
    this.mobile,
    this.sendSms,
    this.token,
  });

  factory GetMobileVerificationCodeForLoginDto.fromJson(final String str) => GetMobileVerificationCodeForLoginDto.fromMap(json.decode(str));

  factory GetMobileVerificationCodeForLoginDto.fromMap(final Map<String, dynamic> json) => GetMobileVerificationCodeForLoginDto(
        mobile: json["mobile"],
        sendSms: json["sendSMS"],
        token: json["token"],
      );

  final String? mobile;
  final String? token;
  final bool? sendSms;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "mobile": mobile,
        "sendSMS": sendSms,
        "token": token,
      };
}

class LoginWithEmail {
  LoginWithEmail({
    this.email,
    this.password,
    this.returnUrl,
    this.keep,
  });

  factory LoginWithEmail.fromJson(final String str) => LoginWithEmail.fromMap(json.decode(str));

  factory LoginWithEmail.fromMap(final Map<String, dynamic> json) => LoginWithEmail(
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

  Map<String, dynamic> toMap() => {
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

  factory LoginWithPassword.fromMap(final Map<String, dynamic> json) => LoginWithPassword(
        email: json["email"],
        userName: json["userName"],
        password: json["password"],
      );

  final String? email;
  final String? password;
  final String? userName;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "email": email,
        "userName": userName,
        "password": password,
      };
}

class VerifyMobileForLoginDto {
  VerifyMobileForLoginDto({
    this.mobile,
    this.verificationCode,
  });

  factory VerifyMobileForLoginDto.fromJson(final String str) => VerifyMobileForLoginDto.fromMap(json.decode(str));

  factory VerifyMobileForLoginDto.fromMap(final Map<String, dynamic> json) => VerifyMobileForLoginDto(
        mobile: json["mobile"],
        verificationCode: json["verificationCode"],
      );

  final String? mobile;
  final String? verificationCode;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "mobile": mobile,
        "verificationCode": verificationCode,
      };
}

class ActiveMobileDto {
  ActiveMobileDto({
    this.code,
    this.mobile,
  });

  factory ActiveMobileDto.fromJson(final String str) => ActiveMobileDto.fromMap(json.decode(str));

  factory ActiveMobileDto.fromMap(final Map<String, dynamic> json) => ActiveMobileDto(
        code: json["code"],
        mobile: json["mobile"],
      );

  final String? code;
  final String? mobile;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
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

  factory GrowthRateReadDto.fromMap(final Map<String, dynamic> json) => GrowthRateReadDto(
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
  final double? interActive1;
  final double? interActive2;
  final double? interActive3;
  final double? interActive4;
  final double? interActive5;
  final double? interActive6;
  final double? interActive7;
  final double? feedback1;
  final double? feedback2;
  final double? feedback3;
  final double? feedback4;
  final double? feedback5;
  final double? feedback6;
  final double? feedback7;
  final double? totalInterActive;
  final double? totalFeedback;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
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

  factory BookmarkFolder.fromMap(final Map<String, dynamic> json) => BookmarkFolder(
        id: json["id"],
        title: json["title"],
      );

  final String? id;
  final String? title;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
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

  factory AuthenticateDto.fromMap(final Map<String, dynamic> json) => AuthenticateDto(
        code: json["code"],
        shebaNumber: json["shebaNumber"],
        isForeigner: json["isForeigner"],
      );

  final bool? isForeigner;
  final String? code;
  final String? shebaNumber;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "code": code,
        "shebaNumber": shebaNumber,
        "isForeigner": isForeigner,
      };
}
