import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:utilities/utilities.dart';

class UExcelData {
  UExcelData({required this.title, required this.data});

  final List<List<String>> data;
  final String title;
}

class UExcel {
  Future<void> generateExcel(final UExcelData data) async {
    final Workbook workbook = Workbook();

    final Worksheet worksheet = workbook.worksheets[0];
    worksheet.name = data.title;
    worksheet.showGridlines = false;

    data.data.forEachIndexed(
      (final int index, final List<String> i) {
        worksheet.getRangeByIndex(i.indexOf(i[index]), index).setText(i[index]);
      },
    );

    final List<int> bytes = workbook.saveAsCSV(',');
    workbook.dispose();
  }
}
