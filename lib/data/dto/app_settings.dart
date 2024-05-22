part of '../data.dart';

class AppSettingsReadDto {
  final String? dateTime;
  final List<AgeCategory>? formFieldType;
  final List<AgeCategory>? transactionStatuses;
  final List<AgeCategory>? utilitiesStatusCodes;
  final List<AgeCategory>? currency;
  final List<AgeCategory>? seenStatus;
  final List<AgeCategory>? priority;
  final List<AgeCategory>? chatStatus;
  final List<AgeCategory>? reaction;
  final List<AgeCategory>? ageCategory;
  final List<AgeCategory>? chatTypes;
  final List<AgeCategory>? genderType;
  final List<AgeCategory>? privacyType;
  final List<AgeCategory>? nationality;
  final List<AgeCategory>? legalAuthenticationType;
  final List<AgeCategory>? tagProduct;
  final List<AgeCategory>? tagCategory;
  final List<AgeCategory>? tagOrder;
  final List<AgeCategory>? tagContent;
  final List<AgeCategory>? tagNotification;
  final List<AgeCategory>? tagMedia;
  final List<AgeCategory>? transactionType;
  final List<AgeCategory>? tagComments;
  final AppSettings? appSettings;

  AppSettingsReadDto({
    this.dateTime,
    this.formFieldType,
    this.transactionStatuses,
    this.utilitiesStatusCodes,
    this.currency,
    this.seenStatus,
    this.priority,
    this.chatStatus,
    this.reaction,
    this.ageCategory,
    this.chatTypes,
    this.genderType,
    this.privacyType,
    this.nationality,
    this.legalAuthenticationType,
    this.tagProduct,
    this.tagCategory,
    this.tagOrder,
    this.tagContent,
    this.tagNotification,
    this.tagMedia,
    this.transactionType,
    this.tagComments,
    this.appSettings,
  });

  factory AppSettingsReadDto.fromJson(String str) => AppSettingsReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppSettingsReadDto.fromMap(Map<String, dynamic> json) => AppSettingsReadDto(
        dateTime: json["dateTime"],
        formFieldType: json["formFieldType"] == null ? [] : List<AgeCategory>.from(json["formFieldType"]!.map((x) => AgeCategory.fromMap(x))),
        transactionStatuses: json["transactionStatuses"] == null ? [] : List<AgeCategory>.from(json["transactionStatuses"]!.map((x) => AgeCategory.fromMap(x))),
        utilitiesStatusCodes: json["utilitiesStatusCodes"] == null ? [] : List<AgeCategory>.from(json["utilitiesStatusCodes"]!.map((x) => AgeCategory.fromMap(x))),
        currency: json["currency"] == null ? [] : List<AgeCategory>.from(json["currency"]!.map((x) => AgeCategory.fromMap(x))),
        seenStatus: json["seenStatus"] == null ? [] : List<AgeCategory>.from(json["seenStatus"]!.map((x) => AgeCategory.fromMap(x))),
        priority: json["priority"] == null ? [] : List<AgeCategory>.from(json["priority"]!.map((x) => AgeCategory.fromMap(x))),
        chatStatus: json["chatStatus"] == null ? [] : List<AgeCategory>.from(json["chatStatus"]!.map((x) => AgeCategory.fromMap(x))),
        reaction: json["reaction"] == null ? [] : List<AgeCategory>.from(json["reaction"]!.map((x) => AgeCategory.fromMap(x))),
        ageCategory: json["ageCategory"] == null ? [] : List<AgeCategory>.from(json["ageCategory"]!.map((x) => AgeCategory.fromMap(x))),
        chatTypes: json["chatTypes"] == null ? [] : List<AgeCategory>.from(json["chatTypes"]!.map((x) => AgeCategory.fromMap(x))),
        genderType: json["genderType"] == null ? [] : List<AgeCategory>.from(json["genderType"]!.map((x) => AgeCategory.fromMap(x))),
        privacyType: json["privacyType"] == null ? [] : List<AgeCategory>.from(json["privacyType"]!.map((x) => AgeCategory.fromMap(x))),
        nationality: json["nationality"] == null ? [] : List<AgeCategory>.from(json["nationality"]!.map((x) => AgeCategory.fromMap(x))),
        legalAuthenticationType: json["legalAuthenticationType"] == null ? [] : List<AgeCategory>.from(json["legalAuthenticationType"]!.map((x) => AgeCategory.fromMap(x))),
        tagProduct: json["tagProduct"] == null ? [] : List<AgeCategory>.from(json["tagProduct"]!.map((x) => AgeCategory.fromMap(x))),
        tagCategory: json["tagCategory"] == null ? [] : List<AgeCategory>.from(json["tagCategory"]!.map((x) => AgeCategory.fromMap(x))),
        tagOrder: json["tagOrder"] == null ? [] : List<AgeCategory>.from(json["tagOrder"]!.map((x) => AgeCategory.fromMap(x))),
        tagContent: json["tagContent"] == null ? [] : List<AgeCategory>.from(json["tagContent"]!.map((x) => AgeCategory.fromMap(x))),
        tagNotification: json["tagNotification"] == null ? [] : List<AgeCategory>.from(json["tagNotification"]!.map((x) => AgeCategory.fromMap(x))),
        tagMedia: json["tagMedia"] == null ? [] : List<AgeCategory>.from(json["tagMedia"]!.map((x) => AgeCategory.fromMap(x))),
        transactionType: json["transactionType"] == null ? [] : List<AgeCategory>.from(json["transactionType"]!.map((x) => AgeCategory.fromMap(x))),
        tagComments: json["tagComments"] == null ? [] : List<AgeCategory>.from(json["tagComments"]!.map((x) => AgeCategory.fromMap(x))),
        appSettings: json["appSettings"] == null ? null : AppSettings.fromMap(json["appSettings"]),
      );

  Map<String, dynamic> toMap() => {
        "dateTime": dateTime,
        "formFieldType": formFieldType == null ? [] : List<dynamic>.from(formFieldType!.map((x) => x.toMap())),
        "transactionStatuses": transactionStatuses == null ? [] : List<dynamic>.from(transactionStatuses!.map((x) => x.toMap())),
        "utilitiesStatusCodes": utilitiesStatusCodes == null ? [] : List<dynamic>.from(utilitiesStatusCodes!.map((x) => x.toMap())),
        "currency": currency == null ? [] : List<dynamic>.from(currency!.map((x) => x.toMap())),
        "seenStatus": seenStatus == null ? [] : List<dynamic>.from(seenStatus!.map((x) => x.toMap())),
        "priority": priority == null ? [] : List<dynamic>.from(priority!.map((x) => x.toMap())),
        "chatStatus": chatStatus == null ? [] : List<dynamic>.from(chatStatus!.map((x) => x.toMap())),
        "reaction": reaction == null ? [] : List<dynamic>.from(reaction!.map((x) => x.toMap())),
        "ageCategory": ageCategory == null ? [] : List<dynamic>.from(ageCategory!.map((x) => x.toMap())),
        "chatTypes": chatTypes == null ? [] : List<dynamic>.from(chatTypes!.map((x) => x.toMap())),
        "genderType": genderType == null ? [] : List<dynamic>.from(genderType!.map((x) => x.toMap())),
        "privacyType": privacyType == null ? [] : List<dynamic>.from(privacyType!.map((x) => x.toMap())),
        "nationality": nationality == null ? [] : List<dynamic>.from(nationality!.map((x) => x.toMap())),
        "legalAuthenticationType": legalAuthenticationType == null ? [] : List<dynamic>.from(legalAuthenticationType!.map((x) => x.toMap())),
        "tagProduct": tagProduct == null ? [] : List<dynamic>.from(tagProduct!.map((x) => x.toMap())),
        "tagCategory": tagCategory == null ? [] : List<dynamic>.from(tagCategory!.map((x) => x.toMap())),
        "tagOrder": tagOrder == null ? [] : List<dynamic>.from(tagOrder!.map((x) => x.toMap())),
        "tagContent": tagContent == null ? [] : List<dynamic>.from(tagContent!.map((x) => x.toMap())),
        "tagNotification": tagNotification == null ? [] : List<dynamic>.from(tagNotification!.map((x) => x.toMap())),
        "tagMedia": tagMedia == null ? [] : List<dynamic>.from(tagMedia!.map((x) => x.toMap())),
        "transactionType": transactionType == null ? [] : List<dynamic>.from(transactionType!.map((x) => x.toMap())),
        "tagComments": tagComments == null ? [] : List<dynamic>.from(tagComments!.map((x) => x.toMap())),
        "appSettings": appSettings?.toMap(),
      };
}

class AgeCategory {
  final int? id;
  final String? title;

  AgeCategory({
    this.id,
    this.title,
  });

  factory AgeCategory.fromJson(String str) => AgeCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AgeCategory.fromMap(Map<String, dynamic> json) => AgeCategory(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class AppSettings {
  final SmsPanelSettings? smsPanelSettings;
  final PaymentSettings? paymentSettings;
  final PushNotificationSetting? pushNotificationSetting;
  final UsageRules? usageRules;
  final int? withdrawalLimit;
  final int? withdrawalTimeLimit;
  final bool? isForceUpdate;
  final String? androidMinimumVersion;
  final String? androidLatestVersion;
  final String? iosMinimumVersion;
  final String? iosLatestVersion;
  final String? androidDownloadLink1;
  final String? androidDownloadLink2;
  final String? iosDownloadLink1;
  final String? iosDownloadLink2;

  AppSettings({
    this.smsPanelSettings,
    this.paymentSettings,
    this.pushNotificationSetting,
    this.usageRules,
    this.isForceUpdate,
    this.withdrawalLimit,
    this.withdrawalTimeLimit,
    this.androidMinimumVersion,
    this.androidLatestVersion,
    this.iosMinimumVersion,
    this.iosLatestVersion,
    this.androidDownloadLink1,
    this.androidDownloadLink2,
    this.iosDownloadLink1,
    this.iosDownloadLink2,
  });

  factory AppSettings.fromJson(String str) => AppSettings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppSettings.fromMap(Map<String, dynamic> json) => AppSettings(
        smsPanelSettings: json["smsPanelSettings"] == null ? null : SmsPanelSettings.fromMap(json["smsPanelSettings"]),
        paymentSettings: json["paymentSettings"] == null ? null : PaymentSettings.fromMap(json["paymentSettings"]),
        pushNotificationSetting: json["pushNotificationSetting"] == null ? null : PushNotificationSetting.fromMap(json["pushNotificationSetting"]),
        usageRules: json["usageRules"] == null ? null : UsageRules.fromMap(json["usageRules"]),
        withdrawalLimit: json["withdrawalLimit"],
        isForceUpdate: json["isForceUpdate"],
        withdrawalTimeLimit: json["withdrawalTimeLimit"],
        androidMinimumVersion: json["androidMinimumVersion"],
        androidLatestVersion: json["androidLatestVersion"],
        iosMinimumVersion: json["iosMinimumVersion"],
        iosLatestVersion: json["iosLatestVersion"],
        androidDownloadLink1: json["androidDownloadLink1"],
        androidDownloadLink2: json["androidDownloadLink2"],
        iosDownloadLink1: json["iosDownloadLink1"],
        iosDownloadLink2: json["iosDownloadLink2"],
      );

  Map<String, dynamic> toMap() => {
        "smsPanelSettings": smsPanelSettings?.toMap(),
        "paymentSettings": paymentSettings?.toMap(),
        "pushNotificationSetting": pushNotificationSetting?.toMap(),
        "usageRules": usageRules?.toMap(),
        "withdrawalLimit": withdrawalLimit,
        "isForceUpdate": isForceUpdate,
        "withdrawalTimeLimit": withdrawalTimeLimit,
        "androidMinimumVersion": androidMinimumVersion,
        "androidLatestVersion": androidLatestVersion,
        "iosMinimumVersion": iosMinimumVersion,
        "iosLatestVersion": iosLatestVersion,
        "androidDownloadLink1": androidDownloadLink1,
        "androidDownloadLink2": androidDownloadLink2,
        "iosDownloadLink1": iosDownloadLink1,
        "iosDownloadLink2": iosDownloadLink2,
      };
}

class PaymentSettings {
  final String? id;
  final String? provider;

  PaymentSettings({
    this.id,
    this.provider,
  });

  factory PaymentSettings.fromJson(String str) => PaymentSettings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentSettings.fromMap(Map<String, dynamic> json) => PaymentSettings(
        id: json["id"],
        provider: json["provider"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "provider": provider,
      };
}

class PushNotificationSetting {
  final String? provider;
  final String? token;
  final String? appId;

  PushNotificationSetting({
    this.provider,
    this.token,
    this.appId,
  });

  factory PushNotificationSetting.fromJson(String str) => PushNotificationSetting.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PushNotificationSetting.fromMap(Map<String, dynamic> json) => PushNotificationSetting(
        provider: json["provider"],
        token: json["token"],
        appId: json["appId"],
      );

  Map<String, dynamic> toMap() => {
        "provider": provider,
        "token": token,
        "appId": appId,
      };
}

class SmsPanelSettings {
  final String? provider;
  final String? userName;
  final String? smsApiKey;
  final String? smsSecret;
  final String? patternCode;

  SmsPanelSettings({
    this.provider,
    this.userName,
    this.smsApiKey,
    this.smsSecret,
    this.patternCode,
  });

  factory SmsPanelSettings.fromJson(String str) => SmsPanelSettings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SmsPanelSettings.fromMap(Map<String, dynamic> json) => SmsPanelSettings(
        provider: json["provider"],
        userName: json["userName"],
        smsApiKey: json["smsApiKey"],
        smsSecret: json["smsSecret"],
        patternCode: json["patternCode"],
      );

  Map<String, dynamic> toMap() => {
        "provider": provider,
        "userName": userName,
        "smsApiKey": smsApiKey,
        "smsSecret": smsSecret,
        "patternCode": patternCode,
      };
}

class UsageRules {
  final int? maxProductPerDay;
  final int? maxCommentPerDay;
  final int? maxChatPerDay;

  UsageRules({
    this.maxProductPerDay,
    this.maxCommentPerDay,
    this.maxChatPerDay,
  });

  factory UsageRules.fromJson(String str) => UsageRules.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsageRules.fromMap(Map<String, dynamic> json) => UsageRules(
        maxProductPerDay: json["maxProductPerDay"],
        maxCommentPerDay: json["maxCommentPerDay"],
        maxChatPerDay: json["maxChatPerDay"],
      );

  Map<String, dynamic> toMap() => {
        "maxProductPerDay": maxProductPerDay,
        "maxCommentPerDay": maxCommentPerDay,
        "maxChatPerDay": maxChatPerDay,
      };
}

class ReadEverythingDto {
  final List<CategoryReadDto>? categories;
  final List<ContentReadDto>? contents;
  final List<ProductReadDto>? products;
  final AppSettingsReadDto? appSettings;

  ReadEverythingDto({
    this.categories,
    this.appSettings,
    this.contents,
    this.products,
  });

  factory ReadEverythingDto.fromJson(String str) => ReadEverythingDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReadEverythingDto.fromMap(Map<String, dynamic> json) => ReadEverythingDto(
        categories: json["categories"] == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(json["categories"].cast<Map<String, dynamic>>().map(CategoryReadDto.fromMap)).toList(),
        products: json["products"] == null ? <ProductReadDto>[] : List<ProductReadDto>.from(json["products"].cast<Map<String, dynamic>>().map(ProductReadDto.fromMap)).toList(),
        contents: json["contents"] == null ? <ContentReadDto>[] : List<ContentReadDto>.from(json["contents"].cast<Map<String, dynamic>>().map(ContentReadDto.fromMap)).toList(),
        appSettings: json["appSettings"] == null ? null : AppSettingsReadDto.fromMap(json["appSettings"]),
      );

  Map<String, dynamic> toMap() => {
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((final CategoryReadDto x) => x.toMap())),
        "products": products == null ? [] : List<dynamic>.from(products!.map((final ProductReadDto x) => x.toMap())),
        "contents": contents == null ? [] : List<dynamic>.from(contents!.map((final ContentReadDto x) => x.toMap())),
        "appSettings": appSettings?.toMap(),
      };
}
