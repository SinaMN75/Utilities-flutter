part of "../data.dart";

class UFileManagerEntry {
  UFileManagerEntry({
    required this.name,
    required this.path,
    required this.isDirectory,
    required this.size,
    required this.modifiedAt,
    this.extension,
    this.url,
  });

  factory UFileManagerEntry.fromMap(Map<String, dynamic> json) => UFileManagerEntry(
    name: json["name"] ?? "",
    path: json["path"] ?? "",
    isDirectory: json["isDirectory"] ?? false,
    size: json["size"] ?? 0,
    modifiedAt: DateTime.tryParse(json["modifiedAt"]?.toString() ?? "") ?? DateTime.now(),
    extension: json["extension"],
    url: json["url"],
  );

  final String name;
  final String path;
  final bool isDirectory;
  final int size;
  final DateTime modifiedAt;
  final String? extension;
  final String? url;
}

class UFileManagerList {
  UFileManagerList({
    required this.path,
    required this.directories,
    required this.files,
    required this.totalSize,
  });

  factory UFileManagerList.fromMap(Map<String, dynamic> json) => UFileManagerList(
    path: json["path"] ?? "",
    directories: List<UFileManagerEntry>.from((json["directories"] as List<dynamic>? ?? <dynamic>[]).map((dynamic x) => UFileManagerEntry.fromMap(x))),
    files: List<UFileManagerEntry>.from((json["files"] as List<dynamic>? ?? <dynamic>[]).map((dynamic x) => UFileManagerEntry.fromMap(x))),
    totalSize: json["totalSize"] ?? 0,
  );

  final String path;
  final List<UFileManagerEntry> directories;
  final List<UFileManagerEntry> files;
  final int totalSize;

  List<UFileManagerEntry> get all => <UFileManagerEntry>[...directories, ...files];
}
