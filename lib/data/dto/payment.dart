part of '../data.dart';

class PayNgCreateDto {
  final String? action;
  final String? emailAddress;
  final String? outlet;
  final String? currency;
  final String? redirectUrl;
  final int? amount;
  final bool? skipConfirmationPage;

  PayNgCreateDto({
    this.action,
    this.emailAddress,
    this.outlet,
    this.currency,
    this.redirectUrl,
    this.amount,
    this.skipConfirmationPage,
  });

  factory PayNgCreateDto.fromJson(String str) =>
      PayNgCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory PayNgCreateDto.fromMap(dynamic json) => PayNgCreateDto(
        action: json["action"],
        emailAddress: json["emailAddress"],
        outlet: json["outlet"],
        currency: json["currency"],
        redirectUrl: json["redirectUrl"],
        amount: json["amount"],
        skipConfirmationPage: json["skipConfirmationPage"],
      );

  dynamic toMap() => {
        "action": action,
        "emailAddress": emailAddress,
        "outlet": outlet,
        "currency": currency,
        "redirectUrl": redirectUrl,
        "amount": amount,
        "skipConfirmationPage": skipConfirmationPage,
      };
}

class PayNgReadDto {
  final String? id;
  final NgResultLinks? links;
  final String? type;
  final NgFormattedOrderSummary? merchantDefinedData;
  final String? action;
  final NgAmount? amount;
  final String? language;
  final NgFormattedOrderSummary? merchantAttributes;
  final String? emailAddress;
  final String? reference;
  final String? outletId;
  final String? createDateTime;
  final NgPaymentMethods? paymentMethods;
  final String? referrer;
  final NgFormattedOrderSummary? formattedOrderSummary;
  final String? formattedAmount;
  final NgEmbedded? embedded;

  PayNgReadDto({
    this.id,
    this.links,
    this.type,
    this.merchantDefinedData,
    this.action,
    this.amount,
    this.language,
    this.merchantAttributes,
    this.emailAddress,
    this.reference,
    this.outletId,
    this.createDateTime,
    this.paymentMethods,
    this.referrer,
    this.formattedOrderSummary,
    this.formattedAmount,
    this.embedded,
  });

  factory PayNgReadDto.fromJson(String str) =>
      PayNgReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory PayNgReadDto.fromMap(dynamic json) => PayNgReadDto(
        id: json["_id"],
        links: json["_links"] == null
            ? null
            : NgResultLinks.fromMap(json["_links"]),
        type: json["type"],
        merchantDefinedData: json["merchantDefinedData"] == null
            ? null
            : NgFormattedOrderSummary.fromMap(json["merchantDefinedData"]),
        action: json["action"],
        amount:
            json["amount"] == null ? null : NgAmount.fromMap(json["amount"]),
        language: json["language"],
        merchantAttributes: json["merchantAttributes"] == null
            ? null
            : NgFormattedOrderSummary.fromMap(json["merchantAttributes"]),
        emailAddress: json["emailAddress"],
        reference: json["reference"],
        outletId: json["outletId"],
        createDateTime: json["createDateTime"],
        paymentMethods: json["paymentMethods"] == null
            ? null
            : NgPaymentMethods.fromMap(json["paymentMethods"]),
        referrer: json["referrer"],
        formattedOrderSummary: json["formattedOrderSummary"] == null
            ? null
            : NgFormattedOrderSummary.fromMap(json["formattedOrderSummary"]),
        formattedAmount: json["formattedAmount"],
        embedded: json["_embedded"] == null
            ? null
            : NgEmbedded.fromMap(json["_embedded"]),
      );

  dynamic toMap() => {
        "id": id,
        "links": links?.toMap(),
        "type": type,
        "merchantDefinedData": merchantDefinedData?.toMap(),
        "action": action,
        "amount": amount?.toMap(),
        "language": language,
        "merchantAttributes": merchantAttributes?.toMap(),
        "emailAddress": emailAddress,
        "reference": reference,
        "outletId": outletId,
        "createDateTime": createDateTime,
        "paymentMethods": paymentMethods?.toMap(),
        "referrer": referrer,
        "formattedOrderSummary": formattedOrderSummary?.toMap(),
        "formattedAmount": formattedAmount,
        "embedded": embedded?.toMap(),
      };
}

class NgAmount {
  final String? currencyCode;
  final int? value;

  NgAmount({
    this.currencyCode,
    this.value,
  });

  factory NgAmount.fromJson(String str) => NgAmount.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory NgAmount.fromMap(dynamic json) => NgAmount(
        currencyCode: json["currencyCode"],
        value: json["value"],
      );

  dynamic toMap() => {
        "currencyCode": currencyCode,
        "value": value,
      };
}

class NgEmbedded {
  final List<NgPayment>? payment;

  NgEmbedded({
    this.payment,
  });

  factory NgEmbedded.fromJson(String str) =>
      NgEmbedded.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory NgEmbedded.fromMap(dynamic json) => NgEmbedded(
        payment: json["payment"] == null
            ? []
            : List<NgPayment>.from(
                json["payment"]!.map((x) => NgPayment.fromMap(x))),
      );

  dynamic toMap() => {
        "payment": payment == null
            ? []
            : List<dynamic>.from(payment!.map((x) => x.toMap())),
      };
}

class NgPayment {
  final String? id;
  final NgPaymentLinks? links;
  final String? reference;
  final String? state;
  final NgAmount? amount;
  final String? updateDateTime;
  final String? outletId;
  final String? orderReference;

  NgPayment({
    this.id,
    this.links,
    this.reference,
    this.state,
    this.amount,
    this.updateDateTime,
    this.outletId,
    this.orderReference,
  });

  factory NgPayment.fromJson(String str) => NgPayment.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory NgPayment.fromMap(dynamic json) => NgPayment(
        id: json["id"],
        links: json["links"] == null
            ? null
            : NgPaymentLinks.fromMap(json["links"]),
        reference: json["reference"],
        state: json["state"],
        amount:
            json["amount"] == null ? null : NgAmount.fromMap(json["amount"]),
        updateDateTime: json["updateDateTime"],
        outletId: json["outletId"],
        orderReference: json["orderReference"],
      );

  dynamic toMap() => {
        "id": id,
        "links": links?.toMap(),
        "reference": reference,
        "state": state,
        "amount": amount?.toMap(),
        "updateDateTime": updateDateTime,
        "outletId": outletId,
        "orderReference": orderReference,
      };
}

class NgPaymentLinks {
  final NgLink? self;
  final NgLink? paymentCard;
  final NgLink? paymentSavedCard;
  final List<NgLink>? curies;

  NgPaymentLinks({
    this.self,
    this.paymentCard,
    this.paymentSavedCard,
    this.curies,
  });

  factory NgPaymentLinks.fromJson(String str) =>
      NgPaymentLinks.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory NgPaymentLinks.fromMap(dynamic json) => NgPaymentLinks(
        self: json["self"] == null ? null : NgLink.fromMap(json["self"]),
        paymentCard: json["paymentCard"] == null
            ? null
            : NgLink.fromMap(json["paymentCard"]),
        paymentSavedCard: json["paymentSavedCard"] == null
            ? null
            : NgLink.fromMap(json["paymentSavedCard"]),
        curies: json["curies"] == null
            ? []
            : List<NgLink>.from(json["curies"]!.map((x) => NgLink.fromMap(x))),
      );

  dynamic toMap() => {
        "self": self?.toMap(),
        "paymentCard": paymentCard?.toMap(),
        "paymentSavedCard": paymentSavedCard?.toMap(),
        "curies": curies == null
            ? []
            : List<dynamic>.from(curies!.map((x) => x.toMap())),
      };
}

class NgLink {
  final String? name;
  final String? href;
  final bool? templated;

  NgLink({
    this.name,
    this.href,
    this.templated,
  });

  factory NgLink.fromJson(String str) => NgLink.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory NgLink.fromMap(dynamic json) => NgLink(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
      );

  dynamic toMap() => {
        "name": name,
        "href": href,
        "templated": templated,
      };
}

class NgFormattedOrderSummary {
  NgFormattedOrderSummary();

  factory NgFormattedOrderSummary.fromJson(String str) =>
      NgFormattedOrderSummary.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory NgFormattedOrderSummary.fromMap(dynamic json) =>
      NgFormattedOrderSummary();

  dynamic toMap() => {};
}

class NgResultLinks {
  final NgLink? cancel;
  final NgLink? cnpPaymentLink;
  final NgLink? paymentAuthorization;
  final NgLink? self;
  final NgLink? tenantBrand;
  final NgLink? payment;
  final NgLink? merchantBrand;

  NgResultLinks({
    this.cancel,
    this.cnpPaymentLink,
    this.paymentAuthorization,
    this.self,
    this.tenantBrand,
    this.payment,
    this.merchantBrand,
  });

  factory NgResultLinks.fromJson(String str) =>
      NgResultLinks.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory NgResultLinks.fromMap(dynamic json) => NgResultLinks(
        cancel: json["cancel"] == null ? null : NgLink.fromMap(json["cancel"]),
        cnpPaymentLink: json["cnpPaymentLink"] == null
            ? null
            : NgLink.fromMap(json["cnpPaymentLink"]),
        paymentAuthorization: json["paymentAuthorization"] == null
            ? null
            : NgLink.fromMap(json["paymentAuthorization"]),
        self: json["self"] == null ? null : NgLink.fromMap(json["self"]),
        tenantBrand: json["tenantBrand"] == null
            ? null
            : NgLink.fromMap(json["tenantBrand"]),
        payment:
            json["payment"] == null ? null : NgLink.fromMap(json["payment"]),
        merchantBrand: json["merchantBrand"] == null
            ? null
            : NgLink.fromMap(json["merchantBrand"]),
      );

  dynamic toMap() => {
        "cancel": cancel?.toMap(),
        "cnpPaymentLink": cnpPaymentLink?.toMap(),
        "paymentAuthorization": paymentAuthorization?.toMap(),
        "self": self?.toMap(),
        "tenantBrand": tenantBrand?.toMap(),
        "payment": payment?.toMap(),
        "merchantBrand": merchantBrand?.toMap(),
      };
}

class NgPaymentMethods {
  final List<String>? card;

  NgPaymentMethods({
    this.card,
  });

  factory NgPaymentMethods.fromJson(String str) =>
      NgPaymentMethods.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory NgPaymentMethods.fromMap(dynamic json) => NgPaymentMethods(
        card: json["card"] == null
            ? []
            : List<String>.from(json["card"]!.map((x) => x)),
      );

  dynamic toMap() => {
        "card": card == null ? [] : List<dynamic>.from(card!.map((x) => x)),
      };
}

class VerifyNgReadDto {
  final String? id;
  final NgResultLinks? links;
  final String? type;
  final NgFormattedOrderSummary? merchantDefinedData;
  final String? action;
  final NgAmount? amount;
  final String? language;
  final NgFormattedOrderSummary? merchantAttributes;
  final String? emailAddress;
  final String? reference;
  final String? outletId;
  final String? createDateTime;
  final NgPaymentMethods? paymentMethods;
  final String? referrer;
  final NgFormattedOrderSummary? formattedOrderSummary;
  final String? formattedAmount;
  final NgEmbedded? embedded;

  VerifyNgReadDto({
    this.id,
    this.links,
    this.type,
    this.merchantDefinedData,
    this.action,
    this.amount,
    this.language,
    this.merchantAttributes,
    this.emailAddress,
    this.reference,
    this.outletId,
    this.createDateTime,
    this.paymentMethods,
    this.referrer,
    this.formattedOrderSummary,
    this.formattedAmount,
    this.embedded,
  });

  factory VerifyNgReadDto.fromJson(String str) =>
      VerifyNgReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory VerifyNgReadDto.fromMap(dynamic json) => VerifyNgReadDto(
        id: json["id"],
        links:
            json["links"] == null ? null : NgResultLinks.fromMap(json["links"]),
        type: json["type"],
        merchantDefinedData: json["merchantDefinedData"] == null
            ? null
            : NgFormattedOrderSummary.fromMap(json["merchantDefinedData"]),
        action: json["action"],
        amount:
            json["amount"] == null ? null : NgAmount.fromMap(json["amount"]),
        language: json["language"],
        merchantAttributes: json["merchantAttributes"] == null
            ? null
            : NgFormattedOrderSummary.fromMap(json["merchantAttributes"]),
        emailAddress: json["emailAddress"],
        reference: json["reference"],
        outletId: json["outletId"],
        createDateTime: json["createDateTime"],
        paymentMethods: json["paymentMethods"] == null
            ? null
            : NgPaymentMethods.fromMap(json["paymentMethods"]),
        referrer: json["referrer"],
        formattedOrderSummary: json["formattedOrderSummary"] == null
            ? null
            : NgFormattedOrderSummary.fromMap(json["formattedOrderSummary"]),
        formattedAmount: json["formattedAmount"],
        embedded: json["embedded"] == null
            ? null
            : NgEmbedded.fromMap(json["embedded"]),
      );

  dynamic toMap() => {
        "id": id,
        "links": links?.toMap(),
        "type": type,
        "merchantDefinedData": merchantDefinedData?.toMap(),
        "action": action,
        "amount": amount?.toMap(),
        "language": language,
        "merchantAttributes": merchantAttributes?.toMap(),
        "emailAddress": emailAddress,
        "reference": reference,
        "outletId": outletId,
        "createDateTime": createDateTime,
        "paymentMethods": paymentMethods?.toMap(),
        "referrer": referrer,
        "formattedOrderSummary": formattedOrderSummary?.toMap(),
        "formattedAmount": formattedAmount,
        "embedded": embedded?.toMap(),
      };
}

class GetAvreenIpgDto {
  final String? mid;
  final String? password;
  final String? localDateTime;
  final String? txnType;
  final String? terminalId;
  final String? amount;
  final String? clientTxnId;
  final String? redirectUrl;
  final String? mobileNumber;
  final String? referenceId;
  final String? invoiceNo;
  final ApportiomentParams? apportionment;

  GetAvreenIpgDto({
    this.mid = "1349289522311081984",
    this.password = "U2F5YW5AMTIz",
    this.localDateTime,
    this.txnType = "000000",
    this.terminalId = "41112587",
    this.amount,
    this.referenceId,
    this.invoiceNo,
    this.clientTxnId = "123456789",
    this.redirectUrl = "aaa://hello.com",
    this.mobileNumber = "09351902721",
    this.apportionment,
  });

  factory GetAvreenIpgDto.fromJson(String str) =>
      GetAvreenIpgDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAvreenIpgDto.fromMap(Map<String, dynamic> json) => GetAvreenIpgDto(
        mid: json["mid"],
        password: json["password"],
        invoiceNo: json["invoiceNo"],
        referenceId: json["referenceId"],
        localDateTime: json["localDateTime"],
        txnType: json["txnType"],
        terminalId: json["terminalId"],
        amount: json["amount"],
        clientTxnId: json["clientTxnId"],
        redirectUrl: json["redirectUrl"],
        mobileNumber: json["mobileNumber"],
        apportionment: json["apportionment"] == null
            ? null
            : ApportiomentParams.fromMap(json["apportionment"]),
      );

  Map<String, dynamic> toMap() => {
        "mid": mid,
        "password": password,
        "localDateTime": localDateTime,
        "txnType": txnType,
        "terminalId": terminalId,
        "amount": amount,
        "clientTxnId": clientTxnId,
        "redirectUrl": redirectUrl,
        "mobileNumber": mobileNumber,
        "referenceId": referenceId,
        "invoiceNo": invoiceNo,
        "apportionment": apportionment?.toMap(),
      };
}

class ApportiomentParams {
  final String? accountId;
  final int? amount;

  ApportiomentParams({
    this.accountId,
    this.amount,
  });

  factory ApportiomentParams.fromJson(String str) =>
      ApportiomentParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApportiomentParams.fromMap(Map<String, dynamic> json) =>
      ApportiomentParams(
        accountId: json["accountId"],
        amount: json["amount"],
      );

  Map<String, dynamic> toMap() => {
        "accountId": accountId,
        "amount": amount,
      };
}

class GetAvreenIpgResponse {
  final String? signiture;
  final String? token;

  GetAvreenIpgResponse({
    this.signiture,
    this.token,
  });

  factory GetAvreenIpgResponse.fromJson(String str) =>
      GetAvreenIpgResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAvreenIpgResponse.fromMap(Map<String, dynamic> json) =>
      GetAvreenIpgResponse(
        signiture: json["signiture"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "signiture": signiture,
        "token": token,
      };
}
