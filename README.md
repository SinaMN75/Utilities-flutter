# Utilities-Flutter

A comprehensive Flutter package that provides a collection of utilities to simplify common tasks in
Flutter projects. This package wraps various functionalities, including navigation, local storage,
file handling, network checks, notifications, and more, into a single, easy-to-use package.

# Table of Contents

### Components

- [barcode_qrcode.dart](#componentsbarcode_qrcodedart)
- [cachedImage.dart](#componentscachedimagedart)
- [calendar.dart](#componentscalendardart)
- [chart.dart](#componentschartdart)
- [chat.dart](#componentschatdart)
- [chip_choice.dart](#componentschip_choicedart)
- [container.dart](#componentscontainerdart)
- [count_down_timer.dart](#componentscount_down_timerdart)
- [flip_card.dart](#componentsflip_carddart)
- [form.dart](#componentsformdart)
- [gauge.dart](#componentsgaugedart)
- [image_slider.dart](#componentsimage_sliderdart)
- [image.dart](#componentsimagedart)
- [link_previewer.dart](#componentslink_previewerdart)
- [map.dart](#componentsmapdart)
- [number_pagination.dart](#number_pagination)
- [otp_field.dart](#componentsotp_fielddart)
- [pdf_viewer.dart](#componentspdf_viewerdart)
- [percent_indicator.dart](#componentspercent_indicatordart)
- [persian_date_picker.dart](#componentspersian_date_pickerdart)
- [rating_bar.dart](#componentsrating_bardart)
- [readmore.dart](#componentsreadmoredart)
- [scrolling_text.dart](#componentsscrolling_textdart)
- [segmented_control.dart](#componentssegmented_controldart)
- [signaturepad.dart](#componentssignaturepaddart)
- [video_player.dart](#componentsvideo_playerdart)
- [webview.dart](#componentswebviewdart)
- [widget_to_image.dart](#componentswidget_to_imagedart)

### Utils

- [app_utils.dart](#utilsapp_utilsdart)
- [clipboard.dart](#utilsclipboarddart)
- [constants.dart](#utilsconstantsdart)
- [crashlytics.dart](#utilscrashlyticsdart)
- [file.dart](#utilsfiledart)
- [fonts.dart](#utilsfontsdart)
- [http_client.dart](#utilshttp_clientdart)
- [launch.dart](#utilslaunchdart)
- [loading.dart](#utilsloadingdart)
- [local_auth.dart](#utilslocal_authdart)
- [local_storage.dart](#utilslocal_storagedart)
- [location.dart](#utilslocationdart)
- [navigator.dart](#utilsnavigatordart)
- [network.dart](#utilsnetworkdart)
- [notification.dart](#utilsnotificationdart)
- [persian_tools.dart](#utilspersian_toolsdart)
- [shamsi.dart](#utilsshamsidart)
- [utils.dart](#utilsutilsdart)

### Extensions

- [date_extension.dart](#extensionsdate_extensiondart)
- [iterable_extension.dart](#extensionsiterable_extensiondart)
- [map_extension.dart](#extensionsmap_extensiondart)
- [number_extension.dart](#extensionsnumber_extensiondart)
- [string_extension.dart](#extensionsstring_extensiondart)
- [text_extension.dart](#extensionstext_extensiondart)
- [widget_extension.dart](#extensionswidget_extensiondart)

## components/barcode_qrcode.dart

**Description**: A Flutter widget (`UBarcode`) for generating barcodes and QR codes using the
`syncfusion_flutter_barcodes` package. Supports various barcode types with customizable appearance
and behavior.

**Parameters**:

- `value`: The string to encode in the barcode (required).
- `type`: The barcode type (e.g., `UBarcodeType.qrCode`, `UBarcodeType.code128`, defaults to
  `qrCode`).
- `barColor`: Color of the bars or modules (optional).
- `backgroundColor`: Background color of the barcode (optional).
- `showValue`: Whether to display the encoded value below the barcode (defaults to `false`).
- `textSpacing`: Spacing between barcode and text if `showValue` is true (defaults to `15.0`).
- `module`: Size of the smallest line or dot in the barcode (optional).
- `errorCorrectionLevel`: Error correction level for QR codes (e.g., `UErrorCorrectionLevel.high`,
  optional).
- `qrCodeVersion`: QR code version (1-40, or null for auto, optional).
- `enableCheckSum`: Enables checksum for Code39, Code39Extended, and Code11 (optional).

**Usage**:
```dart
class BarcodeExample extends StatelessWidget {
  const BarcodeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: UBarcode(
        value: 'https://example.com',
        type: UBarcodeType.qrCode,
        barColor: Colors.black,
        showValue: true,
        errorCorrectionLevel: UErrorCorrectionLevel.high,
      ),
    );
  }
}
```

## components/cachedImage.dart

**Description**: A Flutter widget (`CachedNetworkImage`) for loading and displaying images from a
URL with caching support. It stores images in local storage to optimize performance and reduce
network requests.

**Parameters**:

- `imageUrl`: The URL of the image to load (required).
- `placeholder`: Widget to display while the image is loading (optional, defaults to
  `CircularProgressIndicator`).
- `errorWidget`: Widget to display if the image fails to load (optional, defaults to
  `Icon(Icons.error)`).
- `width`: Width of the displayed image (optional).
- `height`: Height of the displayed image (optional).
- `fit`: How the image should be scaled to fit its container (e.g., `BoxFit.cover`, optional).

**Usage**:
```dart
class CachedImageExample extends StatelessWidget {
  const CachedImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CachedNetworkImage(
        imageUrl: 'https://example.com/image.jpg',
        placeholder: CircularProgressIndicator(),
        errorWidget: Icon(Icons.broken_image),
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
```

## components/calendar.dart

**Description**: A Flutter widget (`UCalendar`) for displaying a customizable calendar with support
for events, multiple views, and optional Jalali (Persian) calendar integration. Built using the
`syncfusion_flutter_calendar` package.

**Parameters**:

- `dataSource`: The calendar data source containing appointments (required).
- `view`: The calendar view (e.g., `CalendarView.month`, defaults to `month`).
- `firstDayOfWeek`: The first day of the week (1 for Monday, defaults to 1).
- `initialDisplayDate`: The initial date to display (optional).
- `initialSelectedDate`: The initially selected date (optional).
- `minDate`: The minimum selectable date (optional).
- `maxDate`: The maximum selectable date (optional).
- `showNavigationArrow`: Whether to show navigation arrows (defaults to `true`).
- `showCurrentTimeIndicator`: Whether to show the current time indicator (defaults to `true`).
- `showWeekNumber`: Whether to show week numbers (defaults to `false`).
- `useJalali`: Enable Jalali calendar support (defaults to `false`).
- `jalaliDateFormatter`: Custom formatter for Jalali dates (optional).
- `monthCellBuilder`: Custom builder for month cells (optional).
- `appointmentBuilder`: Custom builder for appointments (optional).
- `timeSlotViewSettings`: Settings for time slot views (defaults to `TimeSlotViewSettings()`).
- `monthViewSettings`: Settings for month view (defaults to `MonthViewSettings()`).
- `scheduleViewSettings`: Settings for schedule view (defaults to `ScheduleViewSettings()`).
- `loadingIndicator`: Widget to display while loading (optional).
- `errorIndicator`: Widget to display on error (optional).
- `showLoading`: Whether to show the loading indicator (defaults to `false`).
- `constraints`: Box constraints for the calendar (optional).
- `padding`: Padding around the calendar (defaults to `EdgeInsets.all(8)`).
- `backgroundColor`: Background color of the calendar (optional).
- `controller`: Controller for calendar interactions (optional).
- `onViewChanged`: Callback for view changes (optional).
- `onTap`: Callback for tap events (optional).
- `onLongPress`: Callback for long press events (optional).

**Usage**:
```dart
class CalendarExample extends StatelessWidget {
  const CalendarExample({super.key});

  @override
  Widget build(BuildContext context) {
    final UCalendarDataSource dataSource = UCalendarDataSource(
      appointments: [
        Appointment(
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(hours: 1)),
          subject: 'Meeting',
          color: Colors.blue,
        ),
      ],
      useJalali: false,
    );

    return UCalendar(
      dataSource: dataSource,
      view: CalendarView.month,
      showNavigationArrow: true,
      showCurrentTimeIndicator: true,
      onTap: (details) => print('Tapped: ${details.date}'),
    );
  }
}
```

## components/chart.dart

**Description**: A collection of Flutter widgets for rendering various chart types (e.g., Doughnut,
Pie, Line, Bar, etc.) using the `syncfusion_flutter_charts` package. Each chart supports
customizable data visualization with legends, tooltips, and animations.

**Parameters (Common Across Most Charts)**:

- `data`: List of `ChartData` objects containing chart data (required).
- `legendPosition`: Position of the legend (e.g., `ChartLegendPosition.top`, defaults to `top` or
  `left`).
- `overflowMode`: Legend overflow behavior (e.g., `ChartOverflowMode.wrap`, defaults to `wrap`).
- `showLegend`: Whether to display the legend (defaults to `true`).
- `enableTooltip`: Whether to enable tooltips (defaults to `true`).
- `animationDuration`: Duration of chart animation in milliseconds (defaults to `1000`).
- `dataLabelSettings`: Settings for data labels (defaults vary by chart type).
- **Chart-Specific Parameters**:
  - `UDoughnutChart`: `centerWidget`, `radius`, `innerRadius`, `explode`, `animationDelay`.
  - `UPieChart`, `UPyramidChart`, `UFunnelChart`: `radius`, `height`, `width`, `animationDelay`.
  - `URadialBarChart`: `radius`, `innerRadius`, `trackColor`, `trackOpacity`.
  - `ULineChart`, `USplineChart`, `UStepLineChart`, `UScatterChart`, `UBubbleChart`, `UHiloChart`,
    `UHiloOpenCloseChart`, `UCandlestickChart`, `UBoxAndWhiskerChart`, `UHistogramChart`,
    `UWaterfallChart`, `URangeColumnChart`, `UColumnChart`, `UBarChart`, `UStackedBarChart`,
    `UStackedColumnChart`: `xAxis`, `yAxis`, `spacing` (where applicable), `opacity` (for
    `UAreaChart`).

**Usage**:
```dart
class ChartExample extends StatelessWidget {
  const ChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> data = [
      ChartData(xValue: 'Jan', yValue: 10, color: Colors.blue, label: 'Sales'),
      ChartData(xValue: 'Feb', yValue: 15, color: Colors.red, label: 'Sales'),
    ];

    return UColumnChart(
      data: data,
      legendPosition: ChartLegendPosition.top,
      showLegend: true,
      enableTooltip: true,
      xAxis: const CategoryAxis(),
      yAxis: const NumericAxis(),
      dataLabelSettings: const DataLabelSettings(isVisible: true),
    );
  }
}
```

## components/chat.dart

**Description**:  
A Flutter chat widget (`UChat`) built on top of Syncfusion’s `SfChat` that provides a customizable
messaging UI. Supports message lists, avatars, headers, footers, custom composers, action buttons,
error handling, and loading indicators.

**Parameters**:

- `messages` *(required)*: List of `ChatMessage` objects representing the chat history.
- `outgoingUserId` *(required)*: The ID of the current (outgoing) user.
- `composer`: Custom `ChatComposer` widget for composing messages.
- `actionButton`: Custom `ChatActionButton` for sending messages. Defaults to one that calls
  `onMessageSent`.
- `headerBuilder`: Builder for custom message headers.
- `footerBuilder`: Builder for custom message footers.
- `avatarBuilder`: Builder for custom avatars beside messages.
- `messageBuilder`: Builder for custom message UI.
- `emptyBuilder`: Builder for empty state UI when there are no messages.
- `onMessageSent`: Callback fired when a message is sent (`String message`). Automatically adds the
  message to the list if provided.
- `loadingIndicator`: Custom widget to display while loading (defaults to
  `CircularProgressIndicator`).
- `errorIndicator`: Widget to display if an error occurs.
- `showLoading`: Whether to display a loading indicator (defaults to `false`).
- `constraints`: Box constraints for the chat widget.
- `padding`: Padding around the chat widget (defaults to `EdgeInsets.all(8)`).
- `backgroundColor`: Background color of the chat container.

**Usage**:

```dart
class ChatExample extends StatelessWidget {
  const ChatExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChatMessage> messages = [
      ChatMessage(
        text: "Hello!",
        time: DateTime.now().subtract(const Duration(minutes: 5)),
        author: ChatAuthor(id: "1", name: "Alice"),
      ),
      ChatMessage(
        text: "Hi Alice 👋",
        time: DateTime.now(),
        author: ChatAuthor(id: "2", name: "You"),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Chat Example")),
      body: UChat(
        messages: messages,
        outgoingUserId: "2",
        onMessageSent: (message) {
          debugPrint("Message sent: $message");
        },
      ),
    );
  }
}
```

## components/chip_choice.dart

**Description**:  
A customizable chip selection widget (`UChipChoice`) for single or multiple choice options. Supports
scrollable or wrapped layouts, custom chip builders, and styling for selected and unselected states.

**Parameters**:

- `options` *(required)*: List of available items to display as chips.
- `selected` *(required)*: Currently selected value(s). For multi-choice, provide a `List<T>`.
- `onChanged`: Callback when selection changes. Provides `(index, isSelected, item)`.
- `chipBuilder`: Custom builder for chip widgets `(item, isSelected, index)`.
- `isMultiChoice`: Whether multiple chips can be selected (defaults to `false`).
- `spacing`: Horizontal spacing between chips (defaults to `8.0`).
- `runSpacing`: Vertical spacing between chip rows in wrapped layout (defaults to `8.0`).
- `alignment`: Alignment of chips within a row/column (defaults to `WrapAlignment.start`).
- `scrollController`: Controller for scrollable chip lists.
- `scrollable`: Whether chips should be scrollable instead of wrapped (defaults to `false`).
- `scrollPhysics`: Scroll physics when `scrollable` is true.
- `padding`: Padding around the chip list (defaults to `EdgeInsets.zero`).
- `direction`: Axis of the chip list (`Axis.horizontal` or `Axis.vertical`, defaults to horizontal).
- `selectedChipStyle`: Optional `ChipThemeData` for selected chips.
- `unselectedChipStyle`: Optional `ChipThemeData` for unselected chips.

**Usage**:

```dart
class ChipChoiceExample extends StatefulWidget {
  const ChipChoiceExample({super.key});

  @override
  State<ChipChoiceExample> createState() => _ChipChoiceExampleState();
}

class _ChipChoiceExampleState extends State<ChipChoiceExample> {
  String selected = "Apple";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chip Choice Example")),
      body: Center(
        child: UChipChoice<String>(
          options: const ["Apple", "Banana", "Orange", "Mango"],
          selected: selected,
          onChanged: (index, isSelected, item) {
            setState(() {
              selected = item;
            });
          },
        ),
      ),
    );
  }
}
```

## components/container.dart

**Description**: A collection of Flutter widgets (`UScaffold`, `UDefaultTabBar`,
`UIconTextHorizontal`, `UIconTextVertical`, `UContainer`, `USpacedRow`, `USpacedColumn`, `UCard`,
`UListView`) for creating customizable layouts and UI components with enhanced functionality and
styling options.

**Parameters**:

### UScaffold

- `body`: Main content widget (required).
- `appBar`, `drawer`, `endDrawer`, `floatingActionButton`, `bottomNavigationBar`, `bottomSheet`,
  `persistentFooterButtons`: Standard Scaffold components (optional).
- `padding`, `margin`: EdgeInsets for content (optional).
- `color`, `decoration`: Background styling (optional).
- `constraints`, `width`, `height`: Size constraints (optional).
- `extendBodyBehindAppBar`, `extendBody`, `primary`: Scaffold behavior (defaults to `false`,
  `false`, `true`).
- `drawerScrimColor`, `floatingActionButtonLocation`, `floatingActionButtonAnimator`: Additional
  Scaffold styling (optional).
- `onDrawerChanged`, `onEndDrawerChanged`: Callbacks for drawer state changes (optional).
- `safeArea`, `safeAreaEdges`: Enable SafeArea with custom padding (defaults to `true`,
  `EdgeInsets.zero`).
- `resizeToAvoidBottomInset`: Adjust for keyboard (optional).

### UDefaultTabBar

- `children`: List of tab content widgets (required).
- `tabBar`: Widget for the tab bar (required).
- `width`, `height`, `constraints`: Size constraints (optional).
- `initialIndex`: Starting tab index (defaults to `0`).
- `controller`: Tab controller (optional).
- `physics`: Scroll physics (optional).
- `indicatorColor`, `labelStyle`, `unselectedLabelStyle`, `indicatorWeight`: Tab styling (optional,
  `indicatorWeight` defaults to `2.0`).
- `isScrollable`, `dragStartBehavior`, `viewportFraction`: Tab behavior (defaults to `false`,
  `DragStartBehavior.start`, `1.0`).

### UIconTextHorizontal / UIconTextVertical

- `leading`, `trailing`: Icon and text widgets (required).
- `subtitle`: Optional subtitle widget.
- `spaceBetween`: Spacing between elements (defaults to `8.0`).
- `mainAxisAlignment`, `crossAxisAlignment`, `mainAxisSize`: Layout alignment (defaults to `start`,
  `center`, `min`).
- `iconColor`, `textStyle`, `subtitleStyle`: Styling options (optional).
- `onTap`: Tap callback (optional).
- `backgroundColor`, `borderRadius`, `elevation`, `padding`: Card styling (optional, `elevation`
  defaults to `0.0`, `padding` to `EdgeInsets.all(8)`).

### UContainer

- `child`: Content widget (optional).
- `padding`, `margin`, `constraints`, `width`, `height`: Layout properties (optional).
- `color`, `gradient`, `image`, `border`, `borderRadius`, `boxShadow`, `foregroundDecoration`:
  Decoration options (optional).
- `alignment`: Content alignment (optional).
- `clipBehavior`: Clipping behavior (defaults to `Clip.none`).
- `transform`: Transformation matrix (optional).

### USpacedRow / USpacedColumn

- `children`: List of child widgets (required).
- `spacing`: Spacing between children (defaults to `8.0`).
- `mainAxisAlignment`, `crossAxisAlignment`, `mainAxisSize`: Layout alignment (defaults to `start`,
  `center`, `max`).
- `divider`: Custom divider widget (optional).
- `wrap`, `runSpacing`: Enable wrapping with run spacing (defaults to `false`, `8.0`).
- `flexFactors`: Flex values for children (optional).

### UCard

- `body`: Main content widget (required).
- `header`, `footer`, `actions`: Optional header, footer, and action widgets.
- `elevation`, `color`, `borderRadius`, `margin`, `padding`: Card styling (defaults to `2.0`,
  `BorderRadius.circular(12)`, `EdgeInsets.all(8)`, `EdgeInsets.all(16)`).
- `onTap`: Tap callback (optional).
- `shadowColor`: Shadow color (optional).

### UListView

- `items`: List of widgets (optional, requires `items` or `itemBuilder` with `itemCount`).
- `itemBuilder`, `itemCount`: Builder and count for dynamic lists (optional).
- `header`, `footer`: Optional header and footer widgets.
- `physics`, `padding`, `scrollController`: Scroll behavior (optional).
- `shrinkWrap`, `primary`, `reverse`: List behavior (defaults to `false`, `null`, `false`).

**Usage**:

```dart
class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      appBar: AppBar(title: const Text('Example')),
      body: UContainer(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: USpacedColumn(
          spacing: 10,
          children: [
            UIconTextHorizontal(
              leading: const Icon(Icons.star),
              trailing: const Text('Favorite'),
              subtitle: const Text('Tap to favorite'),
              onTap: () => print('Tapped'),
            ),
            UCard(
              body: const Text('Card Content'),
              header: const Text('Header'),
              actions: [
                TextButton(
                  onPressed: () => print('Action'),
                  child: const Text('Action'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

## components/count_down_timer.dart

**Description**: A Flutter widget (`USendAgainCountDown`) that displays a countdown timer for a
resend button, enabling it when the countdown reaches zero. It is commonly used for scenarios like
resending OTPs or emails.

**Parameters**:

- `counter`: Initial countdown duration in seconds (required).
- `onSendAgainTap`: Callback triggered when the button is tapped after countdown ends (required).
- `buttonTitle`: Text displayed on the button when the countdown is complete (required).
- `counterDescription`: Text appended to the countdown value during the timer (required).

**Usage**:

```dart
class CountDownExample extends StatelessWidget {
  const CountDownExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: USendAgainCountDown(
        counter: 30,
        onSendAgainTap: () => print('Resend tapped'),
        buttonTitle: 'Resend Code',
        counterDescription: 'seconds remaining',
      ),
    );
  }
}
```

## components/flip_card.dart

**Description**: A Flutter widget (`FlipCard`) for creating a flippable card with front and back
sides, supporting animated transitions. It allows flipping on tap or programmatically with
customizable direction and animation speed.

**Parameters**:

- `front`: Widget displayed on the front side (required).
- `back`: Widget displayed on the back side (required).
- `speed`: Animation duration in milliseconds (defaults to `500`).
- `direction`: Flip direction (`FlipDirection.HORIZONTAL` or `VERTICAL`, defaults to `HORIZONTAL`).
- `onFlip`: Callback triggered when flip starts (optional).
- `onFlipDone`: Callback triggered when flip completes, passing the current side (optional).
- `controller`: `FlipCardController` for programmatic control (optional).
- `flipOnTouch`: Whether to flip on tap (defaults to `true`).
- `alignment`: Alignment of the card content (defaults to `Alignment.center`).
- `fill`: Whether to fill front or back side (`Fill.none`, `fillFront`, `fillBack`, defaults to
  `none`).
- `side`: Initial side to display (`CardSide.FRONT` or `BACK`, defaults to `FRONT`).

**Usage**:

```dart
class FlipCardExample extends StatelessWidget {
  const FlipCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    final FlipCardController controller = FlipCardController();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlipCard(
            front: Container(
              color: Colors.blue,
              child: const Center(child: Text('Front')),
            ),
            back: Container(
              color: Colors.red,
              child: const Center(child: Text('Back')),
            ),
            controller: controller,
            direction: FlipDirection.HORIZONTAL,
            flipOnTouch: true,
            onFlipDone: (isFront) => print('Flipped to ${isFront ? "front" : "back"}'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => controller.toggleCard(),
            child: const Text('Flip Card'),
          ),
        ],
      ),
    );
  }
}
```

## components/form.dart

**Description**: A collection of Flutter widgets (`UTextField`, `UTextFieldPersianDatePicker`,
`UElevatedButton`, `UOutlinedButton`, `UTextButton`, `USearchableDropdown`, `UTextFieldPhoneNumber`)
for creating customizable form inputs, buttons, and dropdowns, with support for Persian date picking
and phone number input with country selection.

**Parameters**:

### UTextField

- `text`: Label text above the field (optional).
- `labelText`: Label inside the field (optional).
- `hintText`: Hint text (optional).
- `contentPadding`: Padding inside the field (defaults to `EdgeInsets.fromLTRB(10, 0, 10, 0)`).
- `fontSize`, `textHeight`: Text styling (optional).
- `controller`: Text editing controller (optional).
- `onTap`, `onChanged`, `onFieldSubmitted`, `onSave`: Callbacks for interactions (optional).
- `validator`: Validation function (optional).
- `prefix`, `suffix`: Prefix/suffix widgets (optional).
- `initialValue`: Initial text value (optional).
- `maxLength`: Maximum input length (optional).
- `formatters`: Input formatters (optional).
- `autoFillHints`: Autofill suggestions (optional).
- `readOnly`, `obscureText`, `required`, `isDense`: Behavior flags (defaults to `false`).
- `keyboardType`: Input type (defaults to `TextInputType.text`).
- `lines`: Number of text lines (defaults to `1`).
- `hasClearButton`: Show clear button (defaults to `false`).
- `textAlign`: Text alignment (defaults to `TextAlign.start`).

### UTextFieldPersianDatePicker

- `onChange`: Callback for selected date/time (required, returns `DateTime` and `Jalali`).
- `text`, `hintText`, `labelText`, `fontSize`, `textHeight`: Text styling (optional).
- `controller`: Text editing controller (optional).
- `prefix`, `suffix`: Prefix/suffix widgets (optional).
- `initialDate`, `startDate`, `endDate`: Jalali date settings (optional).
- `validator`: Validation function (optional).
- `readOnly`: Prevent interaction (defaults to `false`).
- `date`, `time`: Enable date/time picker (defaults to `true`, `false`).
- `submitButtonText`, `cancelButtonText`: Button labels (defaults to `"Submit"`, `"Cancel"`).
- `textAlign`: Text alignment (defaults to `TextAlign.start`).

### UElevatedButton / UOutlinedButton / UTextButton

- `title`: Button text (optional).
- `titleWidget`: Custom title widget (optional, overrides `title`).
- `onTap`: Tap callback (optional).
- `icon`: Icon for the button (optional).
- `width`, `height`: Button size (optional, `width` defaults to screen width).
- `textStyle`: Text style (optional).
- `padding`: Button padding (optional).

### USearchableDropdown

- `items`: List of items to select from (required).
- `labelBuilder`: Function to generate item labels (required).
- `onChanged`: Callback when an item is selected (required).
- `selectedItem`: Initially selected item (optional).
- `hintText`: Placeholder text (defaults to `"Select item"`).

### UTextFieldPhoneNumber

- `pickerMode`: Country selection mode (`CountryPickerMode.dropdown`, `dialog`, or `bottomSheet`,
  required).
- `onChanged`: Callback for phone number changes (required, returns `PhoneNumberData`).

**Usage**:

```dart
class FormExample extends StatelessWidget {
  const FormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      body: UContainer(
        padding: const EdgeInsets.all(16),
        child: USpacedColumn(
          spacing: 16,
          children: [
            UTextField(
              labelText: 'Name',
              hintText: 'Enter your name',
              onChanged: (value) => print('Name: $value'),
              validator: (value) => value!.isEmpty ? 'Required' : null,
            ),
            UTextFieldPersianDatePicker(
              text: 'Select Date',
              onChange: (dateTime, jalali) => print('Selected: $jalali'),
            ),
            USearchableDropdown<String>(
              items: ['Option 1', 'Option 2', 'Option 3'],
              labelBuilder: (item) => item,
              onChanged: (item) => print('Selected: $item'),
            ),
            UTextFieldPhoneNumber(
              pickerMode: CountryPickerMode.bottomSheet,
              onChanged: (data) => print('Phone: ${data.phoneNumber}'),
            ),
            UElevatedButton(
              title: 'Submit',
              onTap: () => print('Submitted'),
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
```

## components/gauge.dart

**Description**: A Flutter widget (`UGauge`) for displaying a radial gauge using the
`syncfusion_flutter_gauges` package. It supports customizable ranges, annotations, and styling for
the gauge's axis, needle, ticks, and labels.

**Parameters**:

- `value`: Current value of the gauge (required).
- `min`, `max`: Minimum and maximum values for the gauge (defaults to `0`, `100`).
- `size`: Width and height of the gauge (defaults to `200`).
- `ranges`: List of `UGaugeRange` objects for colored ranges (optional).
- `annotations`: List of `UGaugeAnnotation` objects for custom widgets (optional).
- `showTicks`, `showLabels`: Show/hide ticks and labels (defaults to `true`).
- `axisColor`, `axisThickness`: Axis styling (optional, `axisThickness` defaults to `10`).
- `needleColor`, `needleWidth`, `needleKnobRadius`: Needle styling (optional, `needleWidth` defaults
  to `1`, `needleKnobRadius` to `0.08`).
- `majorTickColor`, `majorTickLength`, `minorTickColor`, `minorTickLength`: Tick styling (optional,
  `majorTickLength` defaults to `10`, `minorTickLength` to `5`).
- `labelFontSize`, `labelColor`: Label styling (optional, `labelFontSize` defaults to `12`).

**Usage**:

```dart
class GaugeExample extends StatelessWidget {
  const GaugeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: UGauge(
        value: 75,
        min: 0,
        max: 100,
        size: 200,
        ranges: [
          UGaugeRange(start: 0, end: 50, color: Colors.red),
          UGaugeRange(start: 50, end: 100, color: Colors.green),
        ],
        annotations: [
          UGaugeAnnotation(
            widget: const Text('75%'),
            angle: 90,
            position: 0.5,
          ),
        ],
        needleColor: Colors.black,
        showTicks: true,
        showLabels: true,
      ),
    );
  }
}
```

## components/image.dart

**Description**: A collection of Flutter widgets (`UImage`, `UIconPrimary`, `UImageAsset`,
`UImageNetwork`, `UImageFile`, `UImageMemory`) for displaying images from various sources (network,
file, memory, assets) with support for SVG, Lottie animations, and caching via `CachedNetworkImage`.
Provides customizable styling like border radius and fit.

**Parameters**:

### UImage

- `source`: Path or URL of the image (required).
- `fileData`: `FileData` for file/memory-based images (optional).
- `color`: Tint color for the image (optional).
- `width`, `height`: Image dimensions (optional).
- `fit`: Scaling behavior (defaults to `BoxFit.contain`).
- `borderRadius`: Corner radius for the image container (defaults to `1`).
- `border`: Border decoration (optional).
- `placeholder`: Fallback image path for errors or invalid URLs (optional).

### UIconPrimary

- `source`: Path or URL of the icon/image (required).
- `color`: Tint color, defaults to theme's primary color (optional).
- `width`, `height`: Icon dimensions (optional).
- `fit`: Scaling behavior (defaults to `BoxFit.contain`).
- `borderRadius`: Corner radius (defaults to `1`).
- `placeholder`: Fallback image path (optional).

### UImageAsset

- `path`: Asset path (required).
- `color`: Tint color (optional).
- `width`, `height`: Dimensions (optional).
- `fit`: Scaling behavior (defaults to `BoxFit.contain`).
- `clipBehavior`: Clipping behavior (defaults to `Clip.hardEdge`).
- `borderRadius`: Corner radius (defaults to `1`).

### UImageNetwork

- `url`: Image URL (required).
- `color`: Tint color (optional).
- `width`, `height`: Dimensions (optional).
- `fit`: Scaling behavior (defaults to `BoxFit.contain`).
- `clipBehavior`: Clipping behavior (defaults to `Clip.hardEdge`).
- `borderRadius`: Corner radius (defaults to `1`).
- `placeholder`: Fallback image path (optional).

### UImageFile

- `file`: File object for the image (required).
- `color`: Tint color (optional).
- `width`, `height`: Dimensions (optional).
- `fit`: Scaling behavior (defaults to `BoxFit.contain`).
- `borderRadius`: Corner radius (defaults to `1`).

### UImageMemory

- `file`: `Uint8List` of image bytes (required).
- `color`: Tint color (optional).
- `width`, `height`: Dimensions (optional).
- `fit`: Scaling behavior (defaults to `BoxFit.contain`).
- `borderRadius`: Corner radius (defaults to `1`).

**Usage**:

```dart
class ImageExample extends StatelessWidget {
  const ImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      body: UContainer(
        padding: const EdgeInsets.all(16),
        child: USpacedColumn(
          spacing: 16,
          children: [
            UImage(
              source: 'https://example.com/image.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              placeholder: 'assets/placeholder.png',
              borderRadius: 8,
            ),
            UIconPrimary(
              source: 'assets/icon.png',
              width: 50,
              height: 50,
            ),
            UImageAsset(
              path: 'assets/image.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
```

## components/image_slider.dart

**Description**: A Flutter widget (`UImageSlider`) for displaying a carousel of images with
automatic scrolling and customizable indicators. It uses `PageView` for sliding images and supports
styling for image fit, border radius, and indicator appearance.

**Parameters**:

- `images`: List of image URLs or asset paths (required).
- `height`: Height of the slider (defaults to `200`).
- `indicatorHeight`: Height of the indicator area (defaults to `30`).
- `activeIndicatorColor`: Color of the active page indicator (defaults to `Colors.white`).
- `inactiveIndicatorColor`: Color of inactive page indicators (defaults to `Colors.grey`).
- `indicatorActiveSize`: Size of the active indicator (defaults to `10`).
- `indicatorInactiveSize`: Size of inactive indicators (defaults to `8`).
- `autoPlayDuration`: Duration in seconds between auto-scrolls (defaults to `7`).
- `imageFit`: Image scaling behavior (defaults to `BoxFit.cover`).
- `radius`: Border radius for images (defaults to `0`).
- `imagePlaceholderColor`: Placeholder color for failed image loads (defaults to `Colors.grey`).
- `errorWidget`: Custom widget for image load errors (optional).

**Usage**:

```dart
class ImageSliderExample extends StatelessWidget {
  const ImageSliderExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://example.com/image1.jpg',
      'https://example.com/image2.jpg',
      'assets/image3.png',
    ];

    return UScaffold(
      body: UContainer(
        padding: const EdgeInsets.all(16),
        child: UImageSlider(
          images: images,
          height: 200,
          imageFit: BoxFit.cover,
          radius: 8,
          autoPlayDuration: 5,
          activeIndicatorColor: Colors.blue,
          inactiveIndicatorColor: Colors.grey,
        ),
      ),
    );
  }
}
```

## components/link_previewer.dart

**Description**: A Flutter widget (`ULinkPreviewer`) that displays a preview of a URL using the
`any_link_preview` package. It shows a clickable preview with a title, description, and image (if
available), with customizable styling and error handling.

**Parameters**:

- `link`: The URL to preview (required).

**Default Configurations**:

- `displayDirection`: Horizontal layout (`UIDirection.uiDirectionHorizontal`).
- `bodyMaxLines`: Maximum lines for the description (set to `10`).
- `titleStyle`: Bold text, black color, font size `15`.
- `bodyStyle`: Black color, font size `12`.
- `errorWidget`: Displays the raw link as clickable text with dynamic color based on theme
  brightness.
- `cache`: Cache duration for the preview (set to `7` days).
- `borderRadius`: Corner radius of the preview card (set to `12`).
- `backgroundColor`: White background.
- `urlLaunchMode`: Opens links in an external application (`LaunchMode.externalApplication`).
- `boxShadow`: Subtle shadow with blur radius `3`.

**Usage**:

```dart
class LinkPreviewerExample extends StatelessWidget {
  const LinkPreviewerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      body: UContainer(
        padding: const EdgeInsets.all(16),
        child: ULinkPreviewer(
          link: 'https://example.com',
        ),
      ),
    );
  }
}
```

## components/map.dart

**Description**: A Flutter widget (`UMap`) for displaying an interactive map using the `flutter_map`
package. It supports multiple tile providers (OpenStreetMap, MapBox, OpenTopoMap, StamenTerrain),
markers, polylines, polygons, and user location features. The map includes zoom controls, a "my
location" button, and customizable event callbacks.

**Parameters**:

- `controller`: `MapController` for programmatic control (required).
- `center`: Initial map center (defaults to `LatLng(51.509364, -0.128928)` - London).
- `zoom`: Initial zoom level (defaults to `10.0`).
- `minZoom`, `maxZoom`: Zoom range (defaults to `3.0`, `18.0`).
- `tileProvider`: Map tile source (`UMapTileProvider`, defaults to `openStreetMap`).
- `markers`: List of map markers (defaults to empty list).
- `polylines`: List of polylines (defaults to empty list).
- `polygons`: List of polygons (defaults to empty list).
- `centerWidget`: Widget at map center (optional).
- `zoomButtons`: Show zoom controls (defaults to `true`).
- `myLocationButton`: Show "my location" button (defaults to `true`).
- `currentLocationLayer`: Show user’s location layer (defaults to `true`).
- `initOnUserLocation`: Center map on user’s location at start (defaults to `false`).
- `showAttribution`: Show tile provider attribution (defaults to `true`).
- `onTap`, `onLongPress`, `onPositionChanged`, `onPointerUp`: Event callbacks (optional).
- `mapBoxAccessToken`: Required for MapBox tile provider (optional).

**Usage**:

```dart
class MapExample extends StatelessWidget {
  const MapExample({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController controller = MapController();

    return UScaffold(
      body: UMap(
        controller: controller,
        center: const LatLng(51.509364, -0.128928),
        zoom: 12,
        tileProvider: UMapTileProvider.openStreetMap,
        markers: [
          Marker(
            point: const LatLng(51.509364, -0.128928),
            width: 40,
            height: 40,
            child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
          ),
        ],
        polylines: [
          Polyline(
            points: [
              const LatLng(51.509364, -0.128928),
              const LatLng(51.514364, -0.133928),
            ],
            color: Colors.blue,
            strokeWidth: 4,
          ),
        ],
        centerWidget: const Icon(Icons.center_focus_strong, color: Colors.red),
        onTap: (_, point) => print('Tapped at: $point'),
      ),
    );
  }
}
```

## components/number_pagination

**Description**: A Flutter widget (`UNumberPagination`) for displaying a pagination control with
numbered page buttons, previous/next navigation, and ellipsis for large page counts. It supports
customizable colors and icons, with a threshold to limit displayed page numbers.

**Parameters**:

- `currentPage`: The currently selected page (required).
- `totalPages`: Total number of pages (required).
- `onPageChanged`: Callback triggered when a page is selected (required).
- `threshold`: Maximum number of pages shown on either side of the current page (defaults to `3`).
- `selectedColor`: Color for the selected page (defaults to theme's `primaryColor`).
- `unselectedColor`: Color for unselected pages (defaults to theme's `disabledColor`).
- `showPrevNext`: Show previous/next buttons (defaults to `true`).
- `prevIcon`, `nextIcon`: Custom icons for previous/next buttons (optional).

**Usage**:

```dart
class PaginationExample extends StatelessWidget {
  const PaginationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      body: UContainer(
        padding: const EdgeInsets.all(16),
        child: UNumberPagination(
          currentPage: 5,
          totalPages: 10,
          onPageChanged: (page) => print('Page changed to: $page'),
          threshold: 2,
          selectedColor: Colors.blue,
          unselectedColor: Colors.grey,
          showPrevNext: true,
          prevIcon: const Icon(Icons.arrow_back),
          nextIcon: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
```

## components/otp_field.dart

**Description**: A Flutter widget (`UOtpField`) for entering OTP (One-Time Password) codes with
individual text fields for each digit. It supports customization of appearance, behavior, and
validation, with features like auto-focus, paste handling, and keyboard navigation.

**Parameters**:

- `controller`: `TextEditingController` for managing the OTP input (required).
- `cursorColor`, `fillColor`, `activeColor`, `borderColor`: Colors for cursor, field background,
  active field, and border (required).
- `length`: Number of OTP digits (defaults to `6`).
- `autoFocus`: Auto-focus the first field (defaults to `false`).
- `onChanged`: Callback for input changes (optional).
- `onCompleted`: Callback when all digits are entered (optional).
- `validator`: Validation function (optional).
- `textStyle`: Style for input text (optional).
- `fieldWidth`, `fieldHeight`: Size of each field (defaults to `48`, `60`).
- `borderRadius`: Corner radius of fields (defaults to `8`).
- `borderWidth`: Border thickness (defaults to `1.5`).
- `obscureText`: Hide input with obscuring character (defaults to `false`).
- `obscuringCharacter`: Character used for obscuring (defaults to `"•"`).
- `keyboardType`: Input type (defaults to `TextInputType.number`).
- `showCursor`: Show cursor in fields (defaults to `true`).
- `readOnly`: Disable input (defaults to `false`).
- `decoration`: Custom input decoration (optional).
- `autoDismissKeyboard`: Dismiss keyboard on completion (defaults to `true`).
- `mainAxisAlignment`: Alignment of fields in the row (defaults to
  `MainAxisAlignment.spaceBetween`).

**Usage**:

```dart
class OtpFieldExample extends StatelessWidget {
  const OtpFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return UScaffold(
      body: UContainer(
        padding: const EdgeInsets.all(16),
        child: UOtpField(
          controller: controller,
          length: 4,
          cursorColor: Colors.blue,
          fillColor: Colors.grey[200]!,
          activeColor: Colors.blue,
          borderColor: Colors.grey,
          borderRadius: 12,
          fieldWidth: 50,
          fieldHeight: 50,
          autoFocus: true,
          onCompleted: (value) => print('OTP: $value'),
          validator: (value) => value!.length < 4 ? 'Enter all digits' : null,
        ),
      ),
    );
  }
}
```
