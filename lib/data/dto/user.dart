import 'package:utilities/utilities.dart';

class UserReadDto {
  UserReadDto({
    this.token,
    this.id,
    this.fullName,
    this.phoneNumber,
    this.userName,
    this.bio,
    this.appUserName,
    this.appPhoneNumber,
    this.appEmail,
    this.type,
    this.firstName,
    this.lastName,
    this.headline,
    this.website,
    this.region,
    this.activity,
    this.wallet,
    this.point,
    this.badge,
    this.instagram,
    this.telegram,
    this.whatsapp,
    this.linkedIn,
    this.showContactInfo,
    this.isAdmin,
    this.suspend,
    this.birthDate,
    this.gender,
    this.followingUsers,
    this.followedUsers,
    this.media,
    this.locations,
    this.categories,
    this.products,
    this.countFollowers,
    this.countProducts,
    this.color,
    this.nationalCode,
    this.bookmarkFolders,
    this.growthRate,
    this.isPrivate,
    this.isFollowing,
    this.soundcloud,
    this.dribble,
    this.pinterest,
    this.state,
    this.countFollowing,
    this.genderTr1,
    this.stateTr1,
    this.detail1,
    this.detail2,
  });

  factory UserReadDto.fromJson(final String str) => UserReadDto.fromMap(json.decode(str));

  factory UserReadDto.fromMap(final Map<String, dynamic> json) => UserReadDto(
        token: json["token"],
        id: json["id"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        userName: json["userName"],
        bio: json["bio"],
        appUserName: json["appUserName"],
        appPhoneNumber: json["appPhoneNumber"],
        appEmail: json["appEmail"],
        type: json["type"],
        firstName: json["firstName"],
        state: json["state"],
        stateTr1: json["stateTr1"],
        lastName: json["lastName"],
        isPrivate: json["isPrivate"],
        headline: json["headline"],
        website: json["website"],
        nationalCode: json["nationalCode"],
        followingUsers: json["followingUsers"],
        followedUsers: json["followedUsers"],
        instagram: json["instagram"],
        telegram: json["telegram"],
        whatsapp: json["whatsApp"],
        linkedIn: json["linkedIn"],
        soundcloud: json["soundCloud"],
        dribble: json["dribble"],
        pinterest: json["pinterest"],
        region: json["region"],
        activity: json["activity"],
        wallet: json["wallet"],
        point: json["point"],
        badge: json["badge"],
        showContactInfo: json["showContactInfo"],
        isAdmin: json["isAdmin"],
        suspend: json["suspend"],
        birthDate: json["birthdate"],
        gender: json["gender"],
        genderTr1: json["genderTr1"],
        countFollowers: json["countFollowers"],
        countFollowing: json["countFollowing"],
        countProducts: json["countProducts"],
        color: json["color"],
        isFollowing: json["isFollowing"],
        detail1: json["detail1"],
        detail2: json["detail2"],
        growthRate: json["growthRate"] == null ? null : GrowthRateReadDto.fromMap(json["growthRate"]),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].cast<Map<String, dynamic>>().map((final x) => MediaReadDto.fromMap)).toList(),
        locations: json["locations"] != null ? List<LocationReadDto>.from(json["locations"].cast<Map<String, dynamic>>().map((final x) => LocationReadDto.fromMap(x))) : null,
        categories: json["categories"] == null ? null : List<CategoryReadDto>.from(json["categories"].cast<Map<String, dynamic>>().map((final x) => CategoryReadDto.fromMap)).toList(),
        products: json["products"] == null ? null : List<ProductReadDto>.from(json["products"].cast<Map<String, dynamic>>().map((final x) => ProductReadDto.fromMap)).toList(),
        bookmarkFolders: json["bookmarkFolders"] == null ? null : List<BookmarkFolder>.from(json["bookmarkFolders"].cast<Map<String, dynamic>>().map((final x) => BookmarkFolder.fromMap)).toList(),
      );

  final String? token;
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? userName;
  final String? bio;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? appEmail;
  final String? type;
  final String? firstName;
  final String? lastName;
  final String? headline;
  final String? state;
  final String? stateTr1;
  final String? website;
  final String? region;
  final String? activity;
  final double? wallet;
  final double? point;
  final String? badge;
  final String? instagram;
  final String? telegram;
  final String? dribble;
  final String? soundcloud;
  final String? pinterest;
  final String? whatsapp;
  final String? linkedIn;
  final String? nationalCode;
  final bool? showContactInfo;
  final bool? isAdmin;
  final bool? isPrivate;
  bool? isFollowing;
  final bool? suspend;
  final String? birthDate;
  final String? gender;
  final String? genderTr1;
  final String? followingUsers;
  final String? followedUsers;
  final int? countFollowers;
  final int? countFollowing;
  final int? countProducts;
  final String? color;
  final String? detail1;
  final String? detail2;
  final GrowthRateReadDto? growthRate;
  final List<MediaReadDto>? media;
  final List<LocationReadDto>? locations;
  final List<CategoryReadDto>? categories;
  final List<ProductReadDto>? products;
  final List<BookmarkFolder>? bookmarkFolders;

  String toJson() => json.encode(toMap());

  static ChatReadDto ff(final Map<String, dynamic> _json) => ChatReadDto.fromMap(_json);

  Map<String, dynamic> toMap() => {
        "token": token,
        "id": id,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "userName": userName,
        "bio": bio,
        "appUserName": appUserName,
        "appPhoneNumber": appPhoneNumber,
        "appEmail": appEmail,
        "type": type,
        "followingUsers": followingUsers,
        "followedUsers": followedUsers,
        "firstName": firstName,
        "lastName": lastName,
        "headline": headline,
        "state": state,
        "isPrivate": isPrivate,
        "stateTr1": stateTr1,
        "website": website,
        "region": region,
        "nationalCode": nationalCode,
        "activity": activity,
        "wallet": wallet,
        "point": point,
        "badge": badge,
        "instagram": instagram,
        "telegram": telegram,
        "whatsApp": whatsapp,
        "linkedIn": linkedIn,
        "pinterest": pinterest,
        "dribble": dribble,
        "soundCloud": soundcloud,
        "showContactInfo": showContactInfo,
        "isAdmin": isAdmin,
        "suspend": suspend,
        "birthdate": birthDate,
        "gender": gender,
        "genderTr1": genderTr1,
        "countFollowers": countFollowers,
        "countFollowing": countFollowing,
        "countProducts": countProducts,
        "color": color,
        "detail1": detail1,
        "detail2": detail2,
        "isFollowing": isFollowing,
        "growthRate": growthRate == null ? null : growthRate!.toMap(),
        "media": media == null ? null : List<dynamic>.from(media!.map((final x) => x.toMap())),
        "locations": locations == null ? null : List<dynamic>.from(locations!.map((final x) => x.toMap())),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((final x) => x.toMap())),
        "products": products == null ? null : List<dynamic>.from(products!.map((final x) => x.toMap())),
        "bookmarkFolders": bookmarkFolders == null ? null : List<dynamic>.from(bookmarkFolders!.map((final x) => x.toMap())),
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
