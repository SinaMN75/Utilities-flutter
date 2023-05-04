import 'package:utilities/utilities.dart';

class AppSettingsDto {
  AppSettingsDto({
    this.formFieldType,
    this.transactionStatuses,
    this.utilitiesStatusCodes,
    this.otpResult,
    this.databaseType,
    this.orderStatuses,
    this.payType,
    this.sendType,
    this.productStatus,
    this.sender,
    this.currency,
    this.seenStatus,
    this.priority,
    this.chatStatus,
    this.appSettings,
  });

  final List<FormFieldTypeDto>? formFieldType;
  final List<TransactionStatuses>? transactionStatuses;
  final List<UtilitiesStatusCodes>? utilitiesStatusCodes;
  final List<OtpResult>? otpResult;
  final List<DatabaseType>? databaseType;
  final List<OrderStatuses>? orderStatuses;
  final List<PayType>? payType;
  final List<SendType>? sendType;
  final List<ProductStatus>? productStatus;
  final List<Sender>? sender;
  final List<Currency>? currency;
  final List<SeenStatus>? seenStatus;
  final List<Priority>? priority;
  final List<ChatStatus>? chatStatus;
  final AppSettings? appSettings;

  factory AppSettingsDto.fromJson(String str) => AppSettingsDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppSettingsDto.fromMap(Map<String, dynamic> json) => AppSettingsDto(
        formFieldType: json["formFieldType"] == null ? null : List<FormFieldTypeDto>.from(json["formFieldType"].map((x) => FormFieldTypeDto.fromMap(x))),
        transactionStatuses: json["transactionStatuses"] == null ? null : List<TransactionStatuses>.from(json["transactionStatuses"].map((x) => TransactionStatuses.fromMap(x))),
        utilitiesStatusCodes: json["utilitiesStatusCodes"] == null ? null : List<UtilitiesStatusCodes>.from(json["utilitiesStatusCodes"].map((x) => UtilitiesStatusCodes.fromMap(x))),
        otpResult: json["otpResult"] == null ? null : List<OtpResult>.from(json["otpResult"].map((x) => OtpResult.fromMap(x))),
        databaseType: json["databaseType"] == null ? null : List<DatabaseType>.from(json["databaseType"].map((x) => DatabaseType.fromMap(x))),
        orderStatuses: json["orderStatuses"] == null ? null : List<OrderStatuses>.from(json["orderStatuses"].map((x) => OrderStatuses.fromMap(x))),
        payType: json["payType"] == null ? null : List<PayType>.from(json["payType"].map((x) => PayType.fromMap(x))),
        sendType: json["sendType"] == null ? null : List<SendType>.from(json["sendType"].map((x) => SendType.fromMap(x))),
        productStatus: json["productStatus"] == null ? null : List<ProductStatus>.from(json["productStatus"].map((x) => ProductStatus.fromMap(x))),
        sender: json["sender"] == null ? null : List<Sender>.from(json["sender"].map((x) => Sender.fromMap(x))),
        currency: json["currency"] == null ? null : List<Currency>.from(json["currency"].map((x) => Currency.fromMap(x))),
        seenStatus: json["seenStatus"] == null ? null : List<SeenStatus>.from(json["seenStatus"].map((x) => SeenStatus.fromMap(x))),
        priority: json["priority"] == null ? null : List<Priority>.from(json["priority"].map((x) => Priority.fromMap(x))),
        chatStatus: json["chatStatus"] == null ? null : List<ChatStatus>.from(json["chatStatus"].map((x) => ChatStatus.fromMap(x))),
        appSettings: json["appSettings"] == null ? null : AppSettings.fromMap(json["appSettings"]),
      );

  Map<String, dynamic> toMap() => {
        "formFieldType": formFieldType == null ? null : List<dynamic>.from(formFieldType!.map((x) => x.toMap())),
        "transactionStatuses": transactionStatuses == null ? null : List<dynamic>.from(transactionStatuses!.map((x) => x.toMap())),
        "utilitiesStatusCodes": utilitiesStatusCodes == null ? null : List<dynamic>.from(utilitiesStatusCodes!.map((x) => x.toMap())),
        "otpResult": otpResult == null ? null : List<dynamic>.from(otpResult!.map((x) => x.toMap())),
        "databaseType": databaseType == null ? null : List<dynamic>.from(databaseType!.map((x) => x.toMap())),
        "orderStatuses": orderStatuses == null ? null : List<dynamic>.from(orderStatuses!.map((x) => x.toMap())),
        "payType": payType == null ? null : List<dynamic>.from(payType!.map((x) => x.toMap())),
        "sendType": sendType == null ? null : List<dynamic>.from(sendType!.map((x) => x.toMap())),
        "productStatus": productStatus == null ? null : List<dynamic>.from(productStatus!.map((x) => x.toMap())),
        "sender": sender == null ? null : List<dynamic>.from(sender!.map((x) => x.toMap())),
        "currency": currency == null ? null : List<dynamic>.from(currency!.map((x) => x.toMap())),
        "seenStatus": seenStatus == null ? null : List<dynamic>.from(seenStatus!.map((x) => x.toMap())),
        "priority": priority == null ? null : List<dynamic>.from(priority!.map((x) => x.toMap())),
        "chatStatus": formFieldType == null ? null : List<dynamic>.from(formFieldType!.map((x) => x.toMap())),
        "appSettings": appSettings == null ? null : appSettings!.toMap(),
      };
}

class FormFieldTypeDto {
  FormFieldTypeDto({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory FormFieldTypeDto.fromJson(String str) => FormFieldTypeDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormFieldTypeDto.fromMap(Map<String, dynamic> json) => FormFieldTypeDto(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class TransactionStatuses {
  TransactionStatuses({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory TransactionStatuses.fromJson(String str) => TransactionStatuses.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionStatuses.fromMap(Map<String, dynamic> json) => TransactionStatuses(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class UtilitiesStatusCodes {
  UtilitiesStatusCodes({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory UtilitiesStatusCodes.fromJson(String str) => UtilitiesStatusCodes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UtilitiesStatusCodes.fromMap(Map<String, dynamic> json) => UtilitiesStatusCodes(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class OtpResult {
  OtpResult({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory OtpResult.fromJson(String str) => OtpResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OtpResult.fromMap(Map<String, dynamic> json) => OtpResult(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class DatabaseType {
  DatabaseType({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory DatabaseType.fromJson(String str) => DatabaseType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DatabaseType.fromMap(Map<String, dynamic> json) => DatabaseType(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class OrderStatuses {
  OrderStatuses({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory OrderStatuses.fromJson(String str) => OrderStatuses.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderStatuses.fromMap(Map<String, dynamic> json) => OrderStatuses(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class PayType {
  PayType({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory PayType.fromJson(String str) => PayType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PayType.fromMap(Map<String, dynamic> json) => PayType(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class SendType {
  SendType({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory SendType.fromJson(String str) => SendType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SendType.fromMap(Map<String, dynamic> json) => SendType(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class ProductStatus {
  ProductStatus({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory ProductStatus.fromJson(String str) => ProductStatus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductStatus.fromMap(Map<String, dynamic> json) => ProductStatus(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class Sender {
  Sender({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory Sender.fromJson(String str) => Sender.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sender.fromMap(Map<String, dynamic> json) => Sender(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class Currency {
  Currency({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory Currency.fromJson(String str) => Currency.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class SeenStatus {
  SeenStatus({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory SeenStatus.fromJson(String str) => SeenStatus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SeenStatus.fromMap(Map<String, dynamic> json) => SeenStatus(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class Priority {
  Priority({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory Priority.fromJson(String str) => Priority.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Priority.fromMap(Map<String, dynamic> json) => Priority(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class ChatStatus {
  ChatStatus({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory ChatStatus.fromJson(String str) => ChatStatus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatStatus.fromMap(Map<String, dynamic> json) => ChatStatus(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class AppSettings {
  AppSettings({
    this.smsPanelSettings,
    this.androidMinimumVersion,
    this.androidLatestVersion,
    this.iosMinimumVersion,
    this.iosLatestVersion,
    this.androidDownloadLink1,
    this.androidDownloadLink2,
    this.iosDownloadLink1,
    this.iosDownloadLink2,
  });

  final SmsPanelSettings? smsPanelSettings;
  final String? androidMinimumVersion;
  final String? androidLatestVersion;
  final String? iosMinimumVersion;
  final String? iosLatestVersion;
  final String? androidDownloadLink1;
  final String? androidDownloadLink2;
  final String? iosDownloadLink1;
  final String? iosDownloadLink2;

  factory AppSettings.fromJson(String str) => AppSettings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppSettings.fromMap(Map<String, dynamic> json) => AppSettings(
        smsPanelSettings: json["smsPanelSettings"] == null ? null : SmsPanelSettings.fromMap(json["smsPanelSettings"]),
        androidMinimumVersion: json["androidMinimumVersion"] == null ? null : json["androidMinimumVersion"],
        androidLatestVersion: json["androidLatestVersion"] == null ? null : json["androidLatestVersion"],
        iosMinimumVersion: json["iosMinimumVersion"] == null ? null : json["iosMinimumVersion"],
        iosLatestVersion: json["iosLatestVersion"] == null ? null : json["iosLatestVersion"],
        androidDownloadLink1: json["androidDownloadLink1"] == null ? null : json["androidDownloadLink1"],
        androidDownloadLink2: json["androidDownloadLink2"] == null ? null : json["androidDownloadLink2"],
        iosDownloadLink1: json["iosDownloadLink1"] == null ? null : json["iosDownloadLink1"],
        iosDownloadLink2: json["iosDownloadLink2"] == null ? null : json["iosDownloadLink2"],
      );

  Map<String, dynamic> toMap() => {
        "smsPanelSettings": smsPanelSettings == null ? null : smsPanelSettings!.toMap(),
        "androidMinimumVersion": androidMinimumVersion == null ? null : androidMinimumVersion,
        "androidLatestVersion": androidLatestVersion == null ? null : androidLatestVersion,
        "iosMinimumVersion": iosMinimumVersion == null ? null : iosMinimumVersion,
        "iosLatestVersion": iosLatestVersion == null ? null : iosLatestVersion,
        "androidDownloadLink1": androidDownloadLink1 == null ? null : androidDownloadLink1,
        "androidDownloadLink2": androidDownloadLink2 == null ? null : androidDownloadLink2,
        "iosDownloadLink1": iosDownloadLink1 == null ? null : iosDownloadLink1,
        "iosDownloadLink2": iosDownloadLink2 == null ? null : iosDownloadLink2,
      };
}

class SmsPanelSettings {
  SmsPanelSettings({
    this.userName,
    this.lineNumber,
    this.smsApiKey,
    this.smsSecret,
    this.otpId,
    this.patternCode,
  });

  final String? userName;
  final String? lineNumber;
  final String? smsApiKey;
  final String? smsSecret;
  final int? otpId;
  final String? patternCode;

  factory SmsPanelSettings.fromJson(String str) => SmsPanelSettings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SmsPanelSettings.fromMap(Map<String, dynamic> json) => SmsPanelSettings(
        userName: json["userName"] == null ? null : json["userName"],
        lineNumber: json["lineNumber"] == null ? null : json["lineNumber"],
        smsApiKey: json["smsApiKey"] == null ? null : json["smsApiKey"],
        smsSecret: json["smsSecret"] == null ? null : json["smsSecret"],
        otpId: json["otpId"] == null ? null : json["otpId"],
        patternCode: json["patternCode"] == null ? null : json["patternCode"],
      );

  Map<String, dynamic> toMap() => {
        "userName": userName == null ? null : userName,
        "lineNumber": lineNumber == null ? null : lineNumber,
        "smsApiKey": smsApiKey == null ? null : smsApiKey,
        "smsSecret": smsSecret == null ? null : smsSecret,
        "otpId": otpId == null ? null : otpId,
        "patternCode": patternCode == null ? null : patternCode,
      };
}
