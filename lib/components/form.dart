import "package:u/components/persian_date_picker.dart";
import "package:u/utilities.dart";

class UTextField extends StatefulWidget {
  const UTextField({
    super.key,
    this.text,
    this.labelText,
    this.hintText,
    this.contentPadding,
    this.fontSize,
    this.controller,
    this.onTap,
    this.validator,
    this.prefix,
    this.suffix,
    this.onSave,
    this.initialValue,
    this.textHeight,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLength,
    this.formatters,
    this.autoFillHints,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.lines = 1,
    this.hasClearButton = false,
    this.required = false,
    this.isDense = false,
    this.textAlign = TextAlign.start,
  });

  final bool obscureText;
  final bool hasClearButton;
  final bool required;
  final bool isDense;
  final bool readOnly;
  final String? text;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final String? Function(String?)? validator;
  final double? fontSize;
  final double? textHeight;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int lines;
  final int? maxLength;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onTap;
  final Widget? prefix;
  final Widget? suffix;
  final Function(String? value)? onSave;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? formatters;
  final List<String>? autoFillHints;

  @override
  State<UTextField> createState() => _UTextFieldState();
}

class _UTextFieldState extends State<UTextField> {
  bool obscure = false;

  @override
  void initState() {
    obscure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.text != null)
            UIconTextHorizontal(
              leading: Text(widget.text!, style: Theme.of(context).textTheme.titleSmall),
              trailing: widget.required ? const Text("*").bodyMedium(color: Theme.of(context).colorScheme.error) : const SizedBox(),
            ).pSymmetric(vertical: 8),
          TextFormField(
            autofillHints: widget.autoFillHints,
            textDirection: widget.keyboardType == TextInputType.number ? TextDirection.ltr : null,
            inputFormatters: widget.formatters,
            style: TextStyle(fontSize: widget.fontSize),
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
            readOnly: widget.readOnly,
            initialValue: widget.initialValue,
            textAlign: widget.textAlign,
            onSaved: widget.onSave,
            onTap: widget.onTap,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: obscure,
            validator: widget.validator,
            minLines: widget.lines,
            onFieldSubmitted: widget.onFieldSubmitted,
            maxLines: widget.lines == 1 ? 1 : 20,
            decoration: InputDecoration(
              labelText: widget.labelText,
              isDense: widget.isDense,
              helperStyle: const TextStyle(fontSize: 0),
              hintText: widget.hintText,
              contentPadding: widget.contentPadding ?? const EdgeInsets.fromLTRB(10, 0, 10, 0),
              suffixIcon: widget.obscureText
                  ? IconButton(
                      splashRadius: 1,
                      onPressed: () => setState(() => obscure = !obscure),
                      icon: obscure ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    )
                  : widget.suffix,
              prefixIcon: widget.prefix,
            ),
          ),
        ],
      );
}

class UTextFieldPersianDatePicker extends StatefulWidget {
  const UTextFieldPersianDatePicker({
    required this.onChange,
    super.key,
    this.text,
    this.fontSize,
    this.hintText,
    this.labelText,
    this.prefix,
    this.suffix,
    this.textHeight,
    this.controller,
    this.initialDate,
    this.startDate,
    this.endDate,
    this.validator,
    this.readOnly = false,
    this.date = true,
    this.time = false,
    this.submitButtonText = "Submit",
    this.cancelButtonText = "Cancel",
    this.textAlign = TextAlign.start,
  });

  final Function(DateTime, Jalali) onChange;
  final String? text;
  final double? fontSize;
  final String? hintText;
  final String? labelText;
  final Widget? prefix;
  final bool readOnly;
  final Widget? suffix;
  final TextAlign textAlign;
  final double? textHeight;
  final TextEditingController? controller;
  final Jalali? initialDate;
  final Jalali? startDate;
  final Jalali? endDate;
  final String submitButtonText;
  final String cancelButtonText;
  final String? Function(String?)? validator;
  final bool date;
  final bool time;

  @override
  State<UTextFieldPersianDatePicker> createState() => _UTextFieldPersianDatePickerState();
}

class _UTextFieldPersianDatePickerState extends State<UTextFieldPersianDatePicker> {
  late Jalali jalali;

  @override
  void initState() {
    jalali = (widget.initialDate ?? Jalali.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UTextField(
        controller: widget.controller,
        text: widget.text,
        prefix: widget.prefix,
        suffix: widget.suffix,
        labelText: widget.labelText,
        fontSize: widget.fontSize,
        hintText: widget.hintText,
        textAlign: widget.textAlign,
        readOnly: true,
        textHeight: widget.textHeight,
        validator: widget.validator,
        onTap: () async {
          if (!widget.readOnly) {
            if (widget.date) {
              await UNavigator.dialog(JalaliDatePickerDialog(
                initialDate: Jalali.now(),
                onDateSelected: (DateTime d, Jalali j) {
                  jalali = j;
                  setState(() => jalali = jalali);
                  widget.onChange(jalali.toDateTime(), jalali);
                },
              ));
              if (widget.time) {
                final TimeOfDay? timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: const TimeOfDay(hour: 0, minute: 0),
                );
                jalali = Jalali(
                  jalali.year,
                  jalali.month,
                  jalali.day,
                  timeOfDay!.hour,
                  timeOfDay.minute,
                );
                setState(() => jalali = jalali);
                widget.onChange(jalali.toDateTime(), jalali);
              }
            }
          }
        },
      );
}

class UElevatedButton extends StatelessWidget {
  const UElevatedButton({
    super.key,
    this.title,
    this.titleWidget,
    this.onTap,
    this.icon,
    this.width,
    this.height,
    this.textStyle,
    this.backgroundColor,
    this.padding,
  });

  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onTap;
  final IconData? icon;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
          textStyle: textStyle == null ? null : WidgetStatePropertyAll<TextStyle>(textStyle!),
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          padding: WidgetStateProperty.all(padding),
        ),
        onPressed: onTap,
        child: SizedBox(
          height: height,
          width: width ?? MediaQuery.sizeOf(navigatorKey.currentContext!).width,
          child: Center(child: titleWidget ?? Text(title ?? "", textAlign: TextAlign.center)),
        ),
      );
}

class UOutlinedButton extends StatelessWidget {
  const UOutlinedButton({
    super.key,
    this.title,
    this.titleWidget,
    this.onTap,
    this.icon,
    this.width,
    this.height,
    this.textStyle,
    this.padding,
  });

  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onTap;
  final IconData? icon;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: ButtonStyle(
          textStyle: textStyle == null ? null : WidgetStatePropertyAll<TextStyle>(textStyle!),
          padding: WidgetStateProperty.all(padding),
        ),
        onPressed: onTap,
        child: SizedBox(
          height: height,
          width: width ?? MediaQuery.sizeOf(navigatorKey.currentContext!).width,
          child: Center(child: titleWidget ?? Text(title ?? "", textAlign: TextAlign.center)),
        ),
      );
}

class UTextButton extends StatelessWidget {
  const UTextButton({
    super.key,
    this.title,
    this.titleWidget,
    this.onTap,
    this.icon,
    this.width,
    this.height,
    this.textStyle,
    this.padding,
  });

  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onTap;
  final IconData? icon;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => TextButton(
        style: ButtonStyle(
          textStyle: textStyle == null ? null : WidgetStatePropertyAll<TextStyle>(textStyle!),
          padding: WidgetStateProperty.all(padding),
        ),
        onPressed: onTap,
        child: SizedBox(
          height: height,
          width: width ?? MediaQuery.sizeOf(navigatorKey.currentContext!).width,
          child: Center(child: titleWidget ?? Text(title ?? "", textAlign: TextAlign.center)),
        ),
      );
}

class USearchableDropdown<T> extends StatefulWidget {
  const USearchableDropdown({
    required this.items,
    required this.labelBuilder,
    required this.onChanged,
    super.key,
    this.selectedItem,
    this.hintText = "Select item",
  });

  final List<T> items;
  final String Function(T) labelBuilder;
  final void Function(T?) onChanged;
  final T? selectedItem;
  final String hintText;

  @override
  State<USearchableDropdown<T>> createState() => _USearchableDropdownState<T>();
}

class _USearchableDropdownState<T> extends State<USearchableDropdown<T>> {
  late RxList<T> filteredItems = widget.items.obs;

  Future<void> _openSearchDialog() async {
    await showDialog<T>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Search and select"),
        content: SizedBox(
          width: 200,
          height: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              UTextField(
                hintText: "جستجو",
                onChanged: (final String? i) => filteredItems(widget.items.where((T item) => widget.labelBuilder(item).toLowerCase().contains(i!.toLowerCase())).toList()),
              ),
              const SizedBox(height: 12),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final T item = filteredItems[index];
                    return ListTile(
                      title: Text(widget.labelBuilder(item)),
                      onTap: () {
                        widget.onChanged(item);
                        Navigator.of(context).pop(item);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: _openSearchDialog,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: widget.hintText,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
          child: Text(
            widget.selectedItem != null ? widget.labelBuilder(widget.selectedItem as T) : "انتخاب",
          ),
        ),
      );
}

class PhoneNumberInput extends StatefulWidget {
  final CountryPickerMode pickerMode;
  final Function(PhoneNumberData) onChanged;

  const PhoneNumberInput({
    required this.pickerMode,
    required this.onChanged,
    super.key,
  });

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  UCountry _selectedCountry = UCountry.list[0];
  List<UCountry> _filteredCountries = UCountry.list;
  String _phoneNumber = "";

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_onPhoneChanged);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onPhoneChanged() {
    setState(() {
      _phoneNumber = _phoneController.text;
      widget.onChanged(PhoneNumberData(
        countryCode: _selectedCountry.dialCode,
        phoneNumber: "${_selectedCountry.dialCode}$_phoneNumber",
        phoneWithoutCode: _phoneNumber,
        countryName: _selectedCountry.name,
        capital: _selectedCountry.capital,
        continent: _selectedCountry.continent,
        primaryReligion: _selectedCountry.primaryReligion,
        currency: _selectedCountry.currency,
        primaryLanguage: _selectedCountry.primaryLanguage,
      ));
    });
  }

  void _showCountryPickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 500, maxWidth: 400),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              const Text(
                "Select Country",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search country, code, or dial code",
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: _filterCountries,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredCountries.length,
                  itemBuilder: (BuildContext context, int index) {
                    final UCountry country = _filteredCountries[index];
                    return Card(
                      elevation: 0,
                      color: _selectedCountry == country ? Colors.blue[50] : Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        leading: Image.asset(
                          "packages/u/lib/assets/flags/${country.flag}",
                          width: 32,
                          height: 32,
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) => const Icon(Icons.flag, size: 32),
                        ),
                        title: Text(
                          country.name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "${country.dialCode} • ${country.capital}",
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedCountry = country;
                            _onPhoneChanged();
                          });
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCountryPickerBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) => DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: const Text(
                  "Select Country",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search country, code, or dial code",
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: _filterCountries,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: _filteredCountries.length,
                  itemBuilder: (BuildContext context, int index) {
                    final UCountry country = _filteredCountries[index];
                    return Card(
                      elevation: 0,
                      color: _selectedCountry == country ? Colors.blue[50] : Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        leading: Image.asset(
                          "packages/u/lib/assets/flags/${country.flag}",
                          width: 32,
                          height: 32,
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) => const Icon(Icons.flag, size: 32),
                        ),
                        title: Text(
                          country.name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "${country.dialCode} • ${country.capital}",
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedCountry = country;
                            _onPhoneChanged();
                          });
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _filterCountries(String query) {
    setState(() {
      _filteredCountries = UCountry.list.where((UCountry i) => i.name.toLowerCase().contains(query.toLowerCase()) || i.dialCode.contains(query) || i.code.toLowerCase().contains(query.toLowerCase()) || i.capital.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Phone Number",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey[800]),
          ),
          const SizedBox(height: 8),
          Row(
            children: <Widget>[
              // Country selector
              if (widget.pickerMode == CountryPickerMode.dropdown)
                DropdownButton<UCountry>(
                  value: _selectedCountry,
                  items: UCountry.list
                      .map(
                        (UCountry i) => DropdownMenuItem<UCountry>(
                          value: i,
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                "packages/u/lib/assets/flags/${i.flag}",
                                width: 24,
                                height: 24,
                                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) => const Icon(Icons.flag, size: 24),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                i.dialCode,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (UCountry? country) {
                    if (country != null) {
                      setState(() {
                        _selectedCountry = country;
                        _onPhoneChanged();
                      });
                    }
                  },
                  underline: const SizedBox(),
                  icon: Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
                )
              else
                GestureDetector(
                  onTap: widget.pickerMode == CountryPickerMode.dialog ? _showCountryPickerDialog : _showCountryPickerBottomSheet,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          "packages/u/lib/assets/flags/${_selectedCountry.flag}",
                          width: 24,
                          height: 24,
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) => const Icon(Icons.flag, size: 24),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _selectedCountry.dialCode,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                ),
              const SizedBox(width: 8),
              // Phone number input
              Expanded(
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: "Enter phone number",
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    prefixIcon: Icon(Icons.phone, color: Colors.grey[600]),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(15),
                  ],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      );
}

enum CountryPickerMode { dropdown, dialog, bottomSheet }

class PhoneNumberData {
  final String countryCode;
  final String phoneNumber;
  final String phoneWithoutCode;
  final String countryName;
  final String capital;
  final String continent;
  final String primaryReligion;
  final String currency;
  final String primaryLanguage;

  PhoneNumberData({
    required this.countryCode,
    required this.phoneNumber,
    required this.phoneWithoutCode,
    required this.countryName,
    required this.capital,
    required this.continent,
    required this.primaryReligion,
    required this.currency,
    required this.primaryLanguage,
  });
}
