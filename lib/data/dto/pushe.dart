// To parse this JSON data, do
//
//     final pusheCreateDto = pusheCreateDtoFromMap(jsonString);

import 'dart:convert';

class PusheCreateDto {
  PusheCreateDto({
    this.appIds,
    this.data,
    this.isDraft,
    this.filter,
  });

  final String? appIds;
  final PusheData? data;
  final bool? isDraft;
  final PusheFilter? filter;

  factory PusheCreateDto.fromJson(String str) => PusheCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PusheCreateDto.fromMap(Map<String, dynamic> json) => PusheCreateDto(
    appIds: json["app_ids"],
    data: json["data"] == null ? null : PusheData.fromMap(json["data"]),
    isDraft: json["is_draft"],
    filter: json["filter"] == null ? null : PusheFilter.fromMap(json["filter"]),
  );

  Map<String, dynamic> toMap() => {
    "app_ids": appIds,
    "data": data?.toMap(),
    "is_draft": isDraft,
    "filter": filter?.toMap(),
  };
}

class PusheData {
  PusheData({
    this.title,
    this.content,
    this.bigTitle,
    this.bigContent,
    this.showForeground,
    this.action,
  });

  final String? title;
  final String? content;
  final String? bigTitle;
  final String? bigContent;
  final bool? showForeground;
  final PusheAction? action;

  factory PusheData.fromJson(String str) => PusheData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PusheData.fromMap(Map<String, dynamic> json) => PusheData(
    title: json["title"],
    content: json["content"],
    bigTitle: json["big_title"],
    bigContent: json["bigContent"],
    showForeground: json["show_foreground"],
    action: json["action"] == null ? null : PusheAction.fromMap(json["action"]),
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "content": content,
    "big_title": bigTitle,
    "bigContent": bigContent,
    "show_foreground": showForeground,
    "action": action?.toMap(),
  };
}

class PusheAction {
  PusheAction({
    this.actionType,
    this.url,
  });

  final String? actionType;
  final String? url;

  factory PusheAction.fromJson(String str) => PusheAction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PusheAction.fromMap(Map<String, dynamic> json) => PusheAction(
    actionType: json["action_type"],
    url: json["url"],
  );

  Map<String, dynamic> toMap() => {
    "action_type": actionType,
    "url": url,
  };
}

class PusheFilter {
  PusheFilter({
    this.customId,
  });

  final List<String>? customId;

  factory PusheFilter.fromJson(String str) => PusheFilter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PusheFilter.fromMap(Map<String, dynamic> json) => PusheFilter(
    customId: json["custom_id"] == null ? [] : List<String>.from(json["custom_id"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "custom_id": customId == null ? [] : List<dynamic>.from(customId!.map((x) => x)),
  };
}

class PusheReadDto {
  PusheReadDto({
    this.wrapperId,
    this.hashedId,
    this.appIds,
    this.data,
    this.dataType,
    this.customContent,
    this.abtIds,
    this.topics,
    this.filters,
    this.segmentIds,
    this.segmentNames,
    this.rateLimit,
    this.maxRecipients,
    this.unique,
    this.statistics,
    this.isDraft,
    this.type,
    this.contentType,
    this.priority,
    this.platform,
    this.messageType,
    this.createdAt,
    this.dispatchStartedAt,
    this.dispatchEndedAt,
    this.updatedAt,
    this.timeToLive,
    this.collapseKey,
    this.eta,
    this.updateAvCode,
    this.status,
    this.csvId,
    this.senderConfig,
  });

  final int? wrapperId;
  final String? hashedId;
  final List<String>? appIds;
  final PusheData? data;
  final int? dataType;
  final CustomContent? customContent;
  final dynamic abtIds;
  final dynamic topics;
  final Filters? filters;
  final dynamic segmentIds;
  final List<dynamic>? segmentNames;
  final dynamic rateLimit;
  final dynamic maxRecipients;
  final bool? unique;
  final Statistics? statistics;
  final bool? isDraft;
  final int? type;
  final int? contentType;
  final dynamic priority;
  final int? platform;
  final int? messageType;
  final DateTime? createdAt;
  final dynamic dispatchStartedAt;
  final dynamic dispatchEndedAt;
  final dynamic updatedAt;
  final int? timeToLive;
  final dynamic collapseKey;
  final dynamic eta;
  final dynamic updateAvCode;
  final int? status;
  final dynamic csvId;
  final dynamic senderConfig;

  factory PusheReadDto.fromJson(String str) => PusheReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PusheReadDto.fromMap(Map<String, dynamic> json) => PusheReadDto(
    wrapperId: json["wrapper_id"],
    hashedId: json["hashed_id"],
    appIds: json["app_ids"] == null ? [] : List<String>.from(json["app_ids"]!.map((x) => x)),
    data: json["data"] == null ? null : PusheData.fromMap(json["data"]),
    dataType: json["data_type"],
    customContent: json["custom_content"] == null ? null : CustomContent.fromMap(json["custom_content"]),
    abtIds: json["abt_ids"],
    topics: json["topics"],
    filters: json["filters"] == null ? null : Filters.fromMap(json["filters"]),
    segmentIds: json["segment_ids"],
    segmentNames: json["segment_names"] == null ? [] : List<dynamic>.from(json["segment_names"]!.map((x) => x)),
    rateLimit: json["rate_limit"],
    maxRecipients: json["max_recipients"],
    unique: json["unique"],
    statistics: json["statistics"] == null ? null : Statistics.fromMap(json["statistics"]),
    isDraft: json["is_draft"],
    type: json["type"],
    contentType: json["content_type"],
    priority: json["priority"],
    platform: json["platform"],
    messageType: json["message_type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    dispatchStartedAt: json["dispatch_started_at"],
    dispatchEndedAt: json["dispatch_ended_at"],
    updatedAt: json["updated_at"],
    timeToLive: json["time_to_live"],
    collapseKey: json["collapse_key"],
    eta: json["eta"],
    updateAvCode: json["update_av_code"],
    status: json["status"],
    csvId: json["csv_id"],
    senderConfig: json["sender_config"],
  );

  Map<String, dynamic> toMap() => {
    "wrapper_id": wrapperId,
    "hashed_id": hashedId,
    "app_ids": appIds == null ? [] : List<dynamic>.from(appIds!.map((x) => x)),
    "data": data?.toMap(),
    "data_type": dataType,
    "custom_content": customContent?.toMap(),
    "abt_ids": abtIds,
    "topics": topics,
    "filters": filters?.toMap(),
    "segment_ids": segmentIds,
    "segment_names": segmentNames == null ? [] : List<dynamic>.from(segmentNames!.map((x) => x)),
    "rate_limit": rateLimit,
    "max_recipients": maxRecipients,
    "unique": unique,
    "statistics": statistics?.toMap(),
    "is_draft": isDraft,
    "type": type,
    "content_type": contentType,
    "priority": priority,
    "platform": platform,
    "message_type": messageType,
    "created_at": createdAt?.toIso8601String(),
    "dispatch_started_at": dispatchStartedAt,
    "dispatch_ended_at": dispatchEndedAt,
    "updated_at": updatedAt,
    "time_to_live": timeToLive,
    "collapse_key": collapseKey,
    "eta": eta,
    "update_av_code": updateAvCode,
    "status": status,
    "csv_id": csvId,
    "sender_config": senderConfig,
  };
}

class CustomContent {
  CustomContent();

  factory CustomContent.fromJson(String str) => CustomContent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomContent.fromMap(Map<String, dynamic> json) => CustomContent(
  );

  Map<String, dynamic> toMap() => {
  };
}



class Filters {
  Filters({
    this.customId,
  });

  final List<String>? customId;

  factory Filters.fromJson(String str) => Filters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Filters.fromMap(Map<String, dynamic> json) => Filters(
    customId: json["custom_id"] == null ? [] : List<String>.from(json["custom_id"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "custom_id": customId == null ? [] : List<dynamic>.from(customId!.map((x) => x)),
  };
}

class Statistics {
  Statistics({
    this.recipientCount,
    this.accurateRecipients,
    this.delivered,
    this.clicked,
    this.dismissed,
    this.nacked,
    this.acked,
    this.published,
  });

  final int? recipientCount;
  final int? accurateRecipients;
  final int? delivered;
  final int? clicked;
  final int? dismissed;
  final int? nacked;
  final int? acked;
  final int? published;

  factory Statistics.fromJson(String str) => Statistics.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Statistics.fromMap(Map<String, dynamic> json) => Statistics(
    recipientCount: json["recipient_count"],
    accurateRecipients: json["accurate_recipients"],
    delivered: json["delivered"],
    clicked: json["clicked"],
    dismissed: json["dismissed"],
    nacked: json["nacked"],
    acked: json["acked"],
    published: json["published"],
  );

  Map<String, dynamic> toMap() => {
    "recipient_count": recipientCount,
    "accurate_recipients": accurateRecipients,
    "delivered": delivered,
    "clicked": clicked,
    "dismissed": dismissed,
    "nacked": nacked,
    "acked": acked,
    "published": published,
  };
}
