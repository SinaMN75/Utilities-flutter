part of 'components.dart';

Widget adminListHeaderWidget({required final List<Widget> widgets}) => Card(
      child: Row(
        children: <Widget>[...widgets.map((final Widget e) => Expanded(child: e)).toList()],
      ).paddingAll(8),
    );

Widget adminListHeaderString({required final List<String> titles}) => Card(
      child: Row(
        children: <Widget>[...titles.map((final String e) => Expanded(child: Text(e).headlineMedium())).toList()],
      ).paddingAll(8),
    );

Widget adminListRowWidget({required final List<Widget> widgets}) => Card(
      child: Row(
        children: <Widget>[...widgets.map((final Widget e) => Expanded(child: e)).toList()],
      ).paddingAll(8),
    );

Widget editForm({required final List<FormViewModel> keyValues}) => Column(
      children: <Widget>[
        ...keyValues
            .map((final FormViewModel e) => TextField(
                  decoration: InputDecoration(
                    hintText: e.hint,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: e.title,
                  ),
                  controller: e.textEditingController,
                ))
            .toList()
      ],
    );

class FormViewModel {
  const FormViewModel({this.title, this.hint, this.textEditingController});

  final String? title;
  final String? hint;
  final TextEditingController? textEditingController;
}
