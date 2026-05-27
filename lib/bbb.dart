import "package:http/http.dart" as http;
import "package:u/utilities.dart";

class DynamicFormPage extends StatefulWidget {
  final UserFlowStatus flowStatus;

  const DynamicFormPage({required this.flowStatus, super.key});

  @override
  State<DynamicFormPage> createState() => _DynamicFormPageState();
}

class _DynamicFormPageState extends State<DynamicFormPage> {
  int _currentStepIndex = 0;
  final Map<String, dynamic> _formData = <String, dynamic>{};
  final Map<String, String> _fileUrls = <String, String>{};

  UserFlowStep get _currentStep => widget.flowStatus.steps.firstWhere(
    (UserFlowStep step) => step.stepId == widget.flowStatus.currentStep,
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(_currentStep.title),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    body: Stepper(
      currentStep: _currentStepIndex,
      onStepContinue: _nextStep,
      onStepCancel: _previousStep,
      steps: widget.flowStatus.steps
          .map(
            (UserFlowStep step) => Step(
              title: Text(step.title),
              subtitle: step.description != null ? Text(step.description!) : null,
              content: _buildStepContent(step),
              isActive: _currentStepIndex >= step.number - 1,
              state: _getStepState(step.number - 1),
            ),
          )
          .toList(),
    ),
  );

  StepState _getStepState(int index) {
    if (index < _currentStepIndex) return StepState.complete;
    if (index == _currentStepIndex) return StepState.editing;
    return StepState.indexed;
  }

  Widget _buildStepContent(UserFlowStep step) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      // Render fields by groups
      if (step.fieldGroups != null) ...step.fieldGroups!.map((FieldGroup group) => _buildFieldGroup(group, step.fields)) else ...step.fields.map(_buildField),

      const SizedBox(height: 20),

      // Render file upload requirements
      ...step.files.map(_buildFileUploader),
    ],
  );

  Widget _buildFieldGroup(FieldGroup group, List<UserFlowField> allFields) {
    final List<UserFlowField> groupFields = allFields.where((UserFlowField? f) => group.fieldNames.contains(f?.fieldName)).toList();

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              group.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (group.description != null)
              Text(
                group.description!,
                style: const TextStyle(color: Colors.grey),
              ),
            const SizedBox(height: 12),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (group.layout == "grid" && group.columns != null) {
                  return Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: groupFields
                        .map(
                          (UserFlowField? f) => SizedBox(
                            width: (constraints.maxWidth / group.columns!) - 12,
                            child: _buildField(f!),
                          ),
                        )
                        .toList(),
                  );
                }
                return Column(
                  children: groupFields.map(_buildField).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(UserFlowField field) {
    // Check visibility
    if (!_isFieldVisible(field)) return const SizedBox.shrink();

    final double widthFactor = _getWidthFactor(field.width);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: widthFactor,
      child: _buildFieldByType(field),
    );
  }

  double _getWidthFactor(FieldWidth width) {
    switch (width) {
      case FieldWidth.half:
        return 0.48;
      case FieldWidth.third:
        return 0.31;
      case FieldWidth.quarter:
        return 0.23;
      case FieldWidth.auto:
        return 0; // Will be determined by content
      default:
        return 1;
    }
  }

  Widget _buildFieldByType(UserFlowField field) {
    final dynamic value = _formData[field.fieldName] ?? field.defaultValue ?? "";

    switch (field.type) {
      case FieldType.text:
      case FieldType.email:
      case FieldType.tel:
      case FieldType.url:
        return TextFormField(
          initialValue: value,
          decoration: InputDecoration(
            labelText: field.label,
            hintText: field.placeholder,
            helperText: field.hint,
            suffixIcon: field.apiEndpoint != null ? const Icon(Icons.cloud_upload, size: 16) : null,
          ),
          onChanged: (String val) => _onFieldChanged(field, val),
          validator: (String? val) => _validateField(field, val),
          enabled: !field.isDisabled,
          readOnly: field.isReadOnly,
        );

      case FieldType.textarea:
        return TextFormField(
          initialValue: value,
          maxLines: 4,
          decoration: InputDecoration(
            labelText: field.label,
            hintText: field.placeholder,
          ),
          onChanged: (String val) => _onFieldChanged(field, val),
          validator: (String? val) => _validateField(field, val),
        );

      case FieldType.number:
        return TextFormField(
          initialValue: value.toString(),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: field.label),
          onChanged: (String val) => _onFieldChanged(field, int.tryParse(val) ?? val),
          validator: (String? val) => _validateField(field, val),
        );

      case FieldType.select:
      case FieldType.phoneWithCountry:
        return DropdownButtonFormField<String>(
          value: value.isNotEmpty ? value : null,
          decoration: InputDecoration(labelText: field.label),
          items: field.options!
              .map(
                (SelectOption opt) => DropdownMenuItem<String>(
                  value: opt.value,
                  child: Row(
                    children: <Widget>[
                      if (opt.icon != null) const Icon(Icons.person, size: 16),
                      const SizedBox(width: 8),
                      Text(opt.text),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (String? val) => _onFieldChanged(field, val),
          validator: (String? val) => _validateField(field, val),
        );

      case FieldType.radioCard:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(field.label, style: const TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              children:
                  field.options
                      ?.map(
                        (SelectOption opt) => ChoiceChip(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              if (opt.icon != null) Text(opt.icon!),
                              const SizedBox(width: 4),
                              Text(opt.text),
                            ],
                          ),
                          selected: value == opt.value,
                          onSelected: (bool selected) {
                            if (selected) _onFieldChanged(field, opt.value);
                          },
                        ),
                      )
                      .toList() ??
                  <Widget>[],
            ),
          ],
        );

      case FieldType.checkbox:
        return CheckboxListTile(
          title: Text(field.label),
          value: value == "true" || value == true,
          onChanged: (bool? val) => _onFieldChanged(field, val.toString()),
        );

      case FieldType.toggle:
        return SwitchListTile(
          title: Text(field.label),
          value: value == "true" || value == true,
          onChanged: (bool val) => _onFieldChanged(field, val.toString()),
        );

      case FieldType.date:
        return TextFormField(
          initialValue: value,
          readOnly: true,
          decoration: InputDecoration(
            labelText: field.label,
            suffixIcon: const Icon(Icons.calendar_today),
          ),
          onTap: () async {
            final DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1300),
              lastDate: DateTime.now(),
            );
            if (date != null) {
              await _onFieldChanged(field, date.toIso8601String().split("T")[0]);
            }
          },
        );

      default:
        return TextFormField(
          initialValue: value,
          decoration: InputDecoration(labelText: field.label),
          onChanged: (String val) => _onFieldChanged(field, val),
        );
    }
  }

  Widget _buildFileUploader(UserFlowFileRequirement file) => Card(
    margin: const EdgeInsets.only(bottom: 16),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(Icons.attach_file),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      file.label,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (file.isRequired)
                      const Text(
                        "* اجباری",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => _uploadFile(file),
            icon: const Icon(Icons.cloud_upload),
            label: Text("آپلود ${file.label}"),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 45),
            ),
          ),
          if (_fileUrls.containsKey(file.fileKey))
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Chip(
                label: Text("فایل آپلود شد: ${_fileUrls[file.fileKey]}"),
                avatar: const Icon(Icons.check_circle, color: Colors.green),
              ),
            ),
        ],
      ),
    ),
  );

  Future<void> _onFieldChanged(UserFlowField field, dynamic value) async {
    setState(() {
      _formData[field.fieldName] = value;
    });

    // Auto-save to API if configured
    if (field.autoSave && field.apiEndpoint != null) {
      await _callApi(field, value);
    }
  }

  Future<void> _callApi(UserFlowField field, dynamic value) async {
    try {
      final http.Response response = await http.put(
        Uri.parse(field.apiEndpoint!),
        headers: <String, String>{
          "Content-Type": "application/json",
          ...?field.apiHeaders,
        },
        body: jsonEncode(<String, dynamic>{field.fieldName: value}),
      );

      if (response.statusCode == 200 && field.onApiResponse != null) {
        _handleApiResponse(field.onApiResponse!);
      }
    } catch (e) {
      debugPrint("API call failed: $e");
    }
  }

  void _handleApiResponse(ApiAction action) {
    switch (action.type) {
      case ActionType.showToast:
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Saved successfully")),
        );
        break;
      case ActionType.updateField:
        // Update another field from response
        break;
      default:
        break;
    }
  }

  String? _validateField(UserFlowField field, String? value) {
    if (field.isRequired && (value == null || value.isEmpty)) {
      return "این فیلد اجباری است";
    }

    final ValidationRules? validation = field.validation;
    if (validation != null && value != null && value.isNotEmpty) {
      if (validation.minLength != null && value.length < validation.minLength!) {
        return "حداقل ${validation.minLength} کاراکتر وارد کنید";
      }
      if (validation.maxLength != null && value.length > validation.maxLength!) {
        return "حداکثر ${validation.maxLength} کاراکتر مجاز است";
      }
      if (validation.regexPattern != null) {
        final RegExp regex = RegExp(validation.regexPattern!);
        if (!regex.hasMatch(value)) {
          return validation.regexErrorMessage ?? "فرمت وارد شده نامعتبر است";
        }
      }
    }
    return null;
  }

  bool _isFieldVisible(UserFlowField field) {
    if (field.visibility == null) return true;

    final VisibilityRule visibility = field.visibility!;
    final String dependsValue = _formData[visibility.dependsOnField]?.toString() ?? "";

    return _evaluateCondition(
      dependsValue,
      visibility.dependsOnValue,
      visibility.operator,
    );
  }

  bool _evaluateCondition(String actual, String expected, ComparisonOperator operator) {
    switch (operator) {
      case ComparisonOperator.equals:
        return actual == expected;
      case ComparisonOperator.notEquals:
        return actual != expected;
      case ComparisonOperator.contains:
        return actual.contains(expected);
      case ComparisonOperator.isEmpty:
        return actual.isEmpty;
      case ComparisonOperator.isNotEmpty:
        return actual.isNotEmpty;
      default:
        return actual == expected;
    }
  }

  Future<void> _uploadFile(UserFlowFileRequirement file) async {
    // In real implementation, use image_picker and http.MultipartRequest
    debugPrint("Uploading to: ${file.uploadApiEndpoint}");

    // Simulate upload
    setState(() {
      _fileUrls[file.fileKey] = "uploaded_file_${DateTime.now().millisecondsSinceEpoch}";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${file.label} با موفقیت آپلود شد")),
    );
  }

  void _nextStep() {
    if (_currentStepIndex < widget.flowStatus.steps.length - 1) {
      setState(() {
        _currentStepIndex++;
      });
    } else {
      _submitForm();
    }
  }

  void _previousStep() {
    if (_currentStepIndex > 0) {
      setState(() {
        _currentStepIndex--;
      });
    }
  }

  void _submitForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("تایید نهایی"),
        content: Text("فرم با موفقیت ثبت شد!\n${jsonEncode(_formData)}"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("باشه"),
          ),
        ],
      ),
    );
  }
}
