# Utilities-Flutter

A comprehensive Flutter package that provides a collection of utilities to simplify common tasks in
Flutter projects. This package wraps various functionalities, including navigation, local storage,
file handling, network checks, notifications, and more, into a single, easy-to-use package.

# Table of Contents

# Components

- [barcode_qrcode.dart](#barcode_qrcodedart)
- [cachedImage.dart](#cachedImagedart)
- [calendar.dart](#calendardart)
- [chart.dart](#chartdart)
- [chat.dart](#chatdart)
- [chip_choice.dart](#chip_choicedart)
- [container.dart](#containerdart)
- [count_down_timer.dart](#count_down_timerdart)
- [flip_card.dart](#flip_carddart)
- [form.dart](#formdart)
- [gauge.dart](#gaugedart)
- [image.dart](#imagedart)
- [image_slider.dart](#image_sliderdart)
- [link_previewer.dart](#link_previewerdart)
- [map.dart](#mapdart)
- [number_pagination.dart](#number_paginationdart)
- [otp_field.dart](#otp_fielddart)
- [pdf_viewer.dart](#pdf_viewerdart)
- [percent_indicator.dart](#percent_indicatordart)
- [persian_date_picker.dart](#persian_date_pickerdart)
- [rating_bar.dart](#rating_bardart)
- [readmore.dart](#readmoredart)
- [scrolling_text.dart](#scrolling_textdart)
- [segmented_control.dart](#segmented_controldart)
- [signaturepad.dart](#signaturepaddart)
- [video_player.dart](#video_playerdart)
- [webview.dart](#webviewdart)
- [widget_to_image.dart](#widget_to_imagedart)

## barcode_qrcode.dart

**Description**: A Flutter widget (`UBarcode`) for generating barcodes and QR codes using the
`syncfusion_flutter_barcodes` Стагітарнапackage. Supports various barcode types with customizable
appearance and behavior.

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

```
UBarcode(
  value: 'https://example.com',
  type: UBarcodeType.qrCode,
  barColor: Colors.black,
  showValue: true,
  errorCorrectionLevel: UErrorCorrectionLevel.high,
)
```

## cachedImage.dart

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

```
CachedNetworkImage(
  imageUrl: 'https://example.com/image.jpg',
  placeholder: CircularProgressIndicator(),
  errorWidget: Icon(Icons.broken_image),
  width: 200,
  height: 200,
  fit: BoxFit.cover,
)
```

## calendar.dart

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

```
UCalendar(
  dataSource: UCalendarDataSource(
    appointments: [
      Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(hours: 1)),
        subject: 'Meeting',
        color: Colors.blue,
      ),
    ],
    useJalali: false,
  ),
  view: CalendarView.month,
  showNavigationArrow: true,
  showCurrentTimeIndicator: true,
  onTap: (details) => print('Tapped: ${details.date}'),
)
```

## chart.dart

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

```
UColumnChart(
  data: [
    ChartData(xValue: 'Jan', yValue: 10, color: Colors.blue, label: 'Sales'),
    ChartData(xValue: 'Feb', yValue: 15, color: Colors.red, label: 'Sales'),
  ],
  legendPosition: ChartLegendPosition.top,
  showLegend: true,
  enableTooltip: true,
  xAxis: CategoryAxis(),
  yAxis: NumericAxis(),
  dataLabelSettings: DataLabelSettings(isVisible: true),
)
```

## chat.dart

**Description**: A Flutter chat widget (`UChat`) built on top of Syncfusion’s `SfChat` that provides
a customizable messaging UI. Supports message lists, avatars, headers, footers, custom composers,
action buttons, error handling, and loading indicators.

**Parameters**:

- `messages`: List of `ChatMessage` objects representing the chat history (required).
- `outgoingUserId`: The ID of the current (outgoing) user (required).
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

```
UChat(
  messages: [
    ChatMessage(
      text: "Hello!",
      time: DateTime.now().subtract(Duration(minutes: 5)),
      author: ChatAuthor(id: "1", name: "Alice"),
    ),
    ChatMessage(
      text: "Hi Alice 👋",
      time: DateTime.now(),
      author: ChatAuthor(id: "2", name: "You"),
    ),
  ],
  outgoingUserId: "2",
  onMessageSent: (message) => debugPrint("Message sent: $message"),
)
```

## chip_choice.dart

**Description**: A customizable chip selection widget (`UChipChoice`) for single or multiple choice
options. Supports scrollable or wrapped layouts, custom chip builders, and styling for selected and
unselected states.

**Parameters**:

- `options`: List of available items to display as chips (required).
- `selected`: Currently selected value(s). For multi-choice, provide a `List<T>` (required).
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

```
UChipChoice<String>(
  options: ["Apple", "Banana", "Orange", "Mango"],
  selected: "Apple",
  onChanged: (index, isSelected, item) => print("Selected: $item"),
)
```

## container.dart

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

```
UContainer(
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.blue[50],
    borderRadius: BorderRadius.circular(12),
  ),
  child: USpacedColumn(
    spacing: 10,
    children: [
      UIconTextHorizontal(
        leading: Icon(Icons.star),
        trailing: Text('Favorite'),
        subtitle: Text('Tap to favorite'),
        onTap: () => print('Tapped'),
      ),
      UCard(
        body: Text('Card Content'),
        header: Text('Header'),
        actions: [
          TextButton(
            onPressed: () => print('Action'),
            child: Text('Action'),
          ),
        ],
      ),
    ],
  ),
)
```

## count_down_timer.dart

**Description**: A Flutter widget (`USendAgainCountDown`) that displays a countdown timer for a
resend button, enabling it when the countdown reaches zero. It is commonly used for scenarios like
resending OTPs or emails.

**Parameters**:

- `counter`: Initial countdown duration in seconds (required).
- `onSendAgainTap`: Callback triggered when the button is tapped after countdown ends (required).
- `buttonTitle`: Text displayed on the button when the countdown is complete (required).
- `counterDescription`: Text appended to the countdown value during the timer (required).

**Usage**:

```
USendAgainCountDown(
  counter: 30,
  onSendAgainTap: () => print('Resend tapped'),
  buttonTitle: 'Resend Code',
  counterDescription: 'seconds remaining',
)
```

## flip_card.dart

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

```
UFlipCard(
  front: Container(
    color: Colors.blue,
    child: Center(child: Text('Front')),
  ),
  back: Container(
    color: Colors.red,
    child: Center(child: Text('Back')),
  ),
  controller: FlipCardController(),
  direction: FlipDirection.HORIZONTAL,
  flipOnTouch: true,
  onFlipDone: (isFront) => print('Flipped to ${isFront ? "front" : "back"}'),
)
```

## form.dart

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

```
USpacedColumn(
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
)
```

## gauge.dart

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

```
UGauge(
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
      widget: Text('75%'),
      angle: 90,
      position: 0.5,
    ),
  ],
  needleColor: Colors.black,
  showTicks: true,
  showLabels: true,
)
```

## image.dart

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

```
USpacedColumn(
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
)
```

## image_slider.dart

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

```
UImageSlider(
  images: [
    'https://example.com/image1.jpg',
    'https://example.com/image2.jpg',
    'assets/image3.png',
  ],
  height: 200,
  imageFit: BoxFit.cover,
  radius: 8,
  autoPlayDuration: 5,
  activeIndicatorColor: Colors.blue,
  inactiveIndicatorColor: Colors.grey,
)
```

## link_previewer.dart

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

```
ULinkPreviewer(
  link: 'https://example.com',
)
```

## map.dart

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

```
UMap(
  controller: MapController(),
  center: LatLng(51.509364, -0.128928),
  zoom: 12,
  tileProvider: UMapTileProvider.openStreetMap,
  markers: [
    Marker(
      point: LatLng(51.509364, -0.128928),
      width: 40,
      height: 40,
      child: Icon(Icons.location_pin, color: Colors.red, size: 40),
    ),
  ],
  polylines: [
    Polyline(
      points: [
        LatLng(51.509364, -0.128928),
        LatLng(51.514364, -0.133928),
      ],
      color: Colors.blue,
      strokeWidth: 4,
    ),
  ],
  centerWidget: Icon(Icons.center_focus_strong, color: Colors.red),
  onTap: (_, point) => print('Tapped at: $point'),
)
```

## number_pagination.dart

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

```
UNumberPagination(
  currentPage: 5,
  totalPages: 10,
  onPageChanged: (page) => print('Page changed to: $page'),
  threshold: 2,
  selectedColor: Colors.blue,
  unselectedColor: Colors.grey,
  showPrevNext: true,
  prevIcon: Icon(Icons.arrow_back),
  nextIcon: Icon(Icons.arrow_forward),
)
```

## otp_field.dart

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

```
UOtpField(
  controller: TextEditingController(),
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
)
```

## pdf_viewer.dart

**Description**: A Flutter widget for displaying PDF files with support for zooming, scrolling, and
page navigation. Built using a PDF rendering library, it provides a smooth experience for viewing
PDF documents.

**Parameters**:

- Not fully specified in the original input, but typically includes:
  - `source`: Path or URL of the PDF file (required).
  - `initialPage`: Starting page number (optional).
  - `zoomLevel`: Initial zoom level (optional).
  - `onPageChanged`: Callback for page changes (optional).
  - `controller`: Controller for programmatic navigation (optional).

**Usage**:

```
UPdfViewer(
  source: 'https://example.com/sample.pdf',
  initialPage: 1,
  zoomLevel: 1.0,
  onPageChanged: (page) => print('Page: $page'),
)
```

## percent_indicator.dart

**Description**: A Flutter widget for displaying progress as a percentage, typically as a circular
or linear indicator. It supports customizable colors, animations, and text display.

**Parameters**:

- Not fully specified, but typically includes:
  - `percent`: Progress value (0.0 to 1.0, required).
  - `center`: Widget to display in the center (optional).
  - `radius`: Radius for circular indicators (optional).
  - `lineWidth`: Thickness of the progress line (optional).
  - `backgroundColor`, `progressColor`: Colors for background and progress (optional).
  - `animation`: Enable animation (defaults to `true`).
  - `animationDuration`: Duration of animation in milliseconds (optional).

**Usage**:

```
UPercentIndicator(
  percent: 0.75,
  center: Text('75%'),
  radius: 50.0,
  lineWidth: 5.0,
  backgroundColor: Colors.grey,
  progressColor: Colors.blue,
  animation: true,
)
```

## persian_date_picker.dart

**Description**: A Flutter widget (`UTextFieldPersianDatePicker`) for selecting dates in the
Persian (Jalali) calendar, integrated with a text field for input.

**Parameters**:

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

**Usage**:

```
UTextFieldPersianDatePicker(
  text: 'Select Date',
  onChange: (dateTime, jalali) => print('Selected: $jalali'),
)
```

## rating_bar.dart

**Description**: A Flutter widget for displaying and interacting with a rating system, typically
using stars or other icons to represent ratings.

**Parameters**:

- Not fully specified, but typically includes:
  - `initialRating`: Initial rating value (required).
  - `itemCount`: Number of rating items (e.g., stars, defaults to `5`).
  - `itemSize`: Size of each rating item (optional).
  - `onRatingUpdate`: Callback for rating changes (optional).
  - `glowColor`, `unratedColor`, `ratedColor`: Styling for glow and colors (optional).
  - `allowHalfRating`: Allow half ratings (defaults to `false`).

**Usage**:

```
URatingBar(
  initialRating: 3.0,
  itemCount: 5,
  itemSize: 40.0,
  onRatingUpdate: (rating) => print('Rating: $rating'),
  ratedColor: Colors.yellow,
  unratedColor: Colors.grey,
)
```

## readmore.dart

**Description**: A Flutter widget for displaying text with a "read more" or "read less" toggle for
long content, allowing users to expand or collapse text.

**Parameters**:

- Not fully specified, but typically includes:
  - `text`: The text to display (required).
  - `trimLines`: Number of lines before trimming (defaults to `3`).
  - `trimMode`: Trimming mode (e.g., `TrimMode.line`, `TrimMode.length`, optional).
  - `trimCollapsedText`, `trimExpandedText`: Text for toggle buttons (defaults to `"Read more"`,
    `"Read less"`).
  - `style`: Text style for the content (optional).
  - `moreStyle`, `lessStyle`: Styles for toggle buttons (optional).

**Usage**:

```
UReadMore(
  text: 'This is a long text that will be trimmed after a few lines...',
  trimLines: 3,
  trimCollapsedText: 'Read more',
  trimExpandedText: 'Read less',
  style: TextStyle(fontSize: 16),
)
```

## scrolling_text.dart

**Description**: A Flutter widget for displaying scrolling text, useful for marquee-style displays
or long text that needs to scroll horizontally.

**Parameters**:

- Not fully specified, but typically includes:
  - `text`: The text to scroll (required).
  - `textStyle`: Style for the text (optional).
  - `scrollSpeed`: Speed of scrolling (optional).
  - `pauseDuration`: Duration to pause after each scroll cycle (optional).
  - `textAlign`: Text alignment (defaults to `TextAlign.start`).

**Usage**:

```
UScrollingText(
  text: 'This is a scrolling text example that moves horizontally.',
  textStyle: TextStyle(fontSize: 16),
  scrollSpeed: 50.0,
  pauseDuration: Duration(seconds: 2),
)
```

## segmented_control.dart

**Description**: A Flutter widget for displaying a segmented control, allowing users to select one
option from a set of mutually exclusive options.

**Parameters**:

- Not fully specified, but typically includes:
  - `segments`: List of segment labels or widgets (required).
  - `selectedSegment`: Initially selected segment (required).
  - `onValueChanged`: Callback for segment changes (required).
  - `backgroundColor`, `thumbColor`: Colors for background and selected segment (optional).
  - `padding`: Padding for the control (optional).

**Usage**:

```
USegmentedControl(
  segments: ['Option 1', 'Option 2', 'Option 3'],
  selectedSegment: 0,
  onValueChanged: (index) => print('Selected: $index'),
  backgroundColor: Colors.grey[200],
  thumbColor: Colors.blue,
)
```

## signaturepad.dart

**Description**: A Flutter widget for capturing user signatures, allowing drawing on a canvas with
customizable stroke width and color.

**Parameters**:

- Not fully specified, but typically includes:
  - `controller`: Controller for accessing signature data (required).
  - `strokeWidth`: Width of the signature stroke (optional).
  - `strokeColor`: Color of the signature stroke (optional).
  - `backgroundColor`: Background color of the canvas (optional).
  - `onDrawStart`, `onDrawEnd`: Callbacks for drawing events (optional).

**Usage**:

```
USignaturePad(
  controller: SignatureController(),
  strokeWidth: 3.0,
  strokeColor: Colors.black,
  backgroundColor: Colors.white,
  onDrawEnd: () => print('Signature completed'),
)
```

## video_player.dart

**Description**: A Flutter widget for playing videos from various sources (network, file, or asset)
with controls for play, pause, and seek.

**Parameters**:

- Not fully specified, but typically includes:
  - `source`: Video source (URL, file, or asset path, required).
  - `controller`: Video player controller (optional).
  - `autoplay`: Start playing automatically (defaults to `false`).
  - `looping`: Loop the video (defaults to `false`).
  - `showControls`: Display playback controls (defaults to `true`).
  - `aspectRatio`: Aspect ratio of the video (optional).

**Usage**:

```
UVideoPlayer(
  source: 'https://example.com/video.mp4',
  autoplay: true,
  looping: false,
  showControls: true,
)
```

## webview.dart

**Description**: A Flutter widget for displaying web content within the app, supporting navigation,
JavaScript execution, and customizable settings.

**Parameters**:

- Not fully specified, but typically includes:
  - `url`: Initial URL to load (required).
  - `javascriptMode`: Enable/disable JavaScript (defaults to enabled).
  - `onPageStarted`, `onPageFinished`: Callbacks for page load events (optional).
  - `navigationDelegate`: Control navigation requests (optional).
  - `userAgent`: Custom user agent string (optional).

**Usage**:

```
UWebView(
  url: 'https://example.com',
  javascriptMode: JavascriptMode.unrestricted,
  onPageFinished: (url) => print('Page loaded: $url'),
)
```

## widget_to_image.dart

**Description**: A Flutter widget for capturing a widget as an image, useful for sharing or saving
widget content as a screenshot.

**Parameters**:

- Not fully specified, but typically includes:
  - `child`: The widget to capture (required).
  - `controller`: Controller for triggering capture (optional).
  - `pixelRatio`: Resolution of the captured image (optional).
  - `onCapture`: Callback with the captured image data (optional).

**Usage**:

```
UWidgetToImage(
  child: Text('Capture this widget'),
  controller: WidgetToImageController(),
  onCapture: (imageData) => print('Image captured'),
)
```
