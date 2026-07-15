part of "../data.dart";

class UFileManagerBrowseParams {
  UFileManagerBrowseParams({this.path = ""});

  final String path;

  Map<String, dynamic> toMap() => <String, dynamic>{"path": path};
}

class UFileManagerCreateFolderParams {
  UFileManagerCreateFolderParams({required this.name, this.path = ""});

  final String path;
  final String name;

  Map<String, dynamic> toMap() => <String, dynamic>{"path": path, "name": name};
}

class UFileManagerRenameParams {
  UFileManagerRenameParams({required this.path, required this.newName});

  final String path;
  final String newName;

  Map<String, dynamic> toMap() => <String, dynamic>{"path": path, "newName": newName};
}

class UFileManagerMoveParams {
  UFileManagerMoveParams({required this.path, this.destination = ""});

  final String path;
  final String destination;

  Map<String, dynamic> toMap() => <String, dynamic>{"path": path, "destination": destination};
}

class UFileManagerDeleteParams {
  UFileManagerDeleteParams({required this.path});

  final String path;

  Map<String, dynamic> toMap() => <String, dynamic>{"path": path};
}

class UFileManagerUploadParams {
  UFileManagerUploadParams({required this.file, this.path = ""});

  final FileData file;
  final String path;

  Map<String, dynamic> toMap() => <String, dynamic>{"path": path};
}
