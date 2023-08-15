import 'dart:convert';

import 'package:excel_facility/excel_facility.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:utilities/data/dto/category.dart';

class ExcelToJson {
  /// Use this method to convert the file to a json.
  Future<String?> convert() async {
    Excel? excel = await _getFile();

    if (excel != null) {
      String table = _getTables(excel).first;

      int index = 0;
      Map<String, dynamic> json = {};

      List<Data?> keys = [];
      json.addAll({table: []});

      for (List<Data?> row in excel.tables[table]?.rows ?? []) {
        try {
          if (index == 0) {
            keys = row;
            index++;
          } else {
            Map<String, dynamic> temp = _getRows(keys, row);

            json[table].add(temp);
          }
        } catch (ex) {
          rethrow;
        }
      }
      index = 0;
      return jsonEncode(json);
    }

    return null;
  }

  Map<String, dynamic> _getRows(List<Data?> keys, List<Data?> row) {
    Map<String, dynamic> temp = {};
    int index = 0;
    String tk = '';

    for (Data? key in keys) {
      if (key != null && key.value != null) {
        tk = key.value.toString();

        if ([
          CellType.String,
          CellType.int,
          CellType.double,
          CellType.bool,
        ].contains(row[index]?.cellType)) {
          if (row[index]?.value == 'true') {
            temp[tk] = true;
          } else if (row[index]?.value == 'false') {
            temp[tk] = false;
          } else {
            temp[tk] = row[index]?.value;
          }
        } else if (row[index]?.cellType == CellType.Formula) {
          temp[tk] = row[index]?.value.toString();
        }

        index++;
      }
    }

    return temp;
  }

  List<String> _getTables(Excel excel) {
    List<String> keys = [];

    for (String table in excel.tables.keys) {
      keys.add(table);
    }

    return keys;
  }

  Future<Excel?> _getFile() async {
    FilePickerResult? file = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'csv', 'xls'],
    );
    if (file != null && file.files.isNotEmpty) {
      Uint8List bytes = file.files.first.bytes!;

      return Excel.decodeBytes(bytes);
    } else {
      return null;
    }
  }
}

class ExcelToJson2 {
  /// Use this method to convert the file to a json.
  Future<String?> categoryConvert({required final Function(List<CategoryReadDto> categories) result}) async {
    Excel? excel = await _getFile();

    if (excel != null) {
      final List<String> cc = <String>[];
      // List<cc>=<<String>>[];
      excel.setDefaultSheet('Sheet1');

      final CellStyle cellStyle = CellStyle(fontColorHex: '#000000', fontFamily: getFontFamily(FontFamily.Calibri));

      cellStyle.underline = Underline.Single; // or Underline.Double

      for (String table in excel.tables.keys) {
        final List<List<Data?>> ggg = excel.tables[table]!.rows;

        final List<CategoryReadDto> allCat = <CategoryReadDto>[];

        final List<CategoryReadDto> cats = <CategoryReadDto>[];
        for (int i = 1; i < ggg.length; i++) {
          allCat.add(CategoryReadDto(
            id: ggg[i][0]?.value.toString() ?? '-',
            title: ggg[i][1]?.value.toString() ?? '-',
            titleTr1: ggg[i][2]?.value.toString() ?? '-',
            parentId: ggg[i][3]?.value.toString() ?? '-',
          ));
        }

        for (int i = 0; i < allCat.length; i++) {
          if ((allCat[i].parentId ?? '-') == '-') {
            cats.add(allCat[i]);
          }
        }
        for (int i = 0; i < allCat.length; i++) {
          if ((allCat[i].parentId ?? '-') != '-') {
            cats.add(allCat[i]);
          }
        }

        result(cats);
      }

      return jsonEncode(json);
    }

    return null;
  }

  Map<String, dynamic> _getRows(final List<Data?> keys, final List<Data?> row) {
    Map<String, dynamic> temp = {};
    int index = 0;
    String tk = '';

    for (Data? key in keys) {
      if (key != null && key.value != null) {
        tk = key.value.toString();

        if ([
          CellType.String,
          CellType.int,
          CellType.double,
          CellType.bool,
        ].contains(row[index]?.cellType)) {
          if (row[index]?.value == 'true') {
            temp[tk] = true;
          } else if (row[index]?.value == 'false') {
            temp[tk] = false;
          } else {
            temp[tk] = row[index]?.value;
          }
        } else if (row[index]?.cellType == CellType.Formula) {
          temp[tk] = row[index]?.value.toString();
        }

        index++;
      }
    }

    return temp;
  }

  List<String> _getTables(final Excel excel) {
    List<String> keys = [];

    for (String table in excel.tables.keys) {
      keys.add(table);
    }

    return keys;
  }

  Future<Excel?> _getFile() async {
    FilePickerResult? file = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'csv', 'xls'],
    );
    if (file != null && file.files.isNotEmpty) {
      final Uint8List bytes = file.files.first.bytes!;

      return Excel.decodeBytes(bytes);
    } else {
      return null;
    }
  }
}
