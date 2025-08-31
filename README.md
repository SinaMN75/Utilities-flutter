# Flutter Widget & Utility Library

A comprehensive Flutter library offering customizable widgets and utility classes to simplify and
enhance app development. This library includes rich UI components leveraging packages like
`syncfusion_flutter`, `cached_network_image`, and `flutter_map`, alongside utilities for HTTP
requests, file handling, navigation, and more. Designed for flexibility, it supports extensive
customization for styling, behavior, and platform-specific features.

[![Pub Version](https://img.shields.io/pub/v/flutter_widget_utility)](https://pub.dev/packages/flutter_widget_utility)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
![Flutter: 3.x](https://img.shields.io/badge/Flutter-3.x-blue)

## Table of Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Widgets](#widgets)
  - [UI Components](#ui-components)
  - [Interactive Widgets](#interactive-widgets)
  - [Media Widgets](#media-widgets)
  - [Data Display Widgets](#data-display-widgets)
- [Utilities](#utilities)
  - [App Management](#app-management)
  - [System Utilities](#system-utilities)
  - [Network Utilities](#network-utilities)
- [Installation](#installation)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Overview

This library provides a collection of reusable Flutter widgets and utilities designed to streamline
development and enhance user experiences. Widgets include advanced UI components like calendars,
charts, and maps, while utilities offer tools for tasks such as HTTP requests, file operations, and
navigation. Each component is highly customizable, supporting both Material and Cupertino designs,
with platform-specific optimizations.

## Dependencies

The library relies on the following packages (ensure these are included in your `pubspec.yaml`):

| Package                       | Version  | Purpose                        |
|-------------------------------|----------|--------------------------------|
| `syncfusion_flutter_barcodes` | ^23.1.36 | Barcode and QR code generation |
| `syncfusion_flutter_calendar` | ^23.1.36 | Calendar widget                |
| `syncfusion_flutter_charts`   | ^23.1.36 | Chart widgets                  |
| `syncfusion_flutter_gauges`   | ^23.1.36 | Gauge widget                   |
| `cached_network_image`        | ^3.3.1   | Cached network image loading   |
| `flutter_map`                 | ^7.0.0   | Interactive maps               |
| `any_link_preview`            | ^3.0.1   | URL preview widget             |
| `image_picker`                | ^1.0.4   | Image picking                  |
| `file_picker`                 | ^5.5.0   | File picking                   |
| `image_cropper`               | ^5.0.0   | Image cropping                 |
| `local_auth`                  | ^2.1.8   | Biometric authentication       |
| `shared_preferences`          | ^2.2.2   | Local storage                  |
| `geolocator`                  | ^10.1.0  | Location services              |
| `connectivity_plus`           | ^5.0.2   | Network connectivity           |
| `internet_connection_checker` | ^1.0.0   | Internet connection checking   |
| `uuid`                        | ^4.3.3   | UUID generation                |

Add these dependencies to your `pubspec.yaml` and run `flutter pub get`.

## Widgets

### UI Components

#### UBarcode

**Description**: Generates barcodes and QR codes using `syncfusion_flutter_barcodes`. Supports
various barcode types with customizable appearance.

**Parameters**:

| Parameter              | Type                    | Description                               | Default  |
|------------------------|-------------------------|-------------------------------------------|----------|
| `value`                | `String`                | String to encode (required).              | -        |
| `type`                 | `UBarcodeType`          | Barcode type (e.g., `qrCode`, `code128`). | `qrCode` |
| `barColor`             | `Color`                 | Color of bars/modules.                    | -        |
| `backgroundColor`      | `Color`                 | Background color.                         | -        |
| `showValue`            | `bool`                  | Display encoded value below barcode.      | `false`  |
| `textSpacing`          | `double`                | Spacing between barcode and text.         | `15.0`   |
| `module`               | `double`                | Size of smallest line/dot.                | -        |
| `errorCorrectionLevel` | `UErrorCorrectionLevel` | QR code error correction level.           | -        |
| `qrCodeVersion`        | `int`                   | QR code version (1-40, or null for auto). | -        |
| `enableCheckSum`       | `bool`                  | Enables checksum for certain barcodes.    | -        |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

UBarcode(
  value: 'https://example.com',
  type: UBarcodeType.qrCode,
  barColor: Colors.black,
  showValue: true,
  errorCorrectionLevel: UErrorCorrectionLevel.high,
)
```

#### UCachedImage

**Description**: Loads and displays images from URLs with caching using `cached_network_image` for
optimized performance.

**Parameters**:

| Parameter     | Type     | Description                   | Default                     |
|---------------|----------|-------------------------------|-----------------------------|
| `imageUrl`    | `String` | Image URL (required).         | -                           |
| `placeholder` | `Widget` | Widget shown during loading.  | `CircularProgressIndicator` |
| `errorWidget` | `Widget` | Widget shown on load failure. | `Icon(Icons.error)`         |
| `width`       | `double` | Image width.                  | -                           |
| `height`      | `double` | Image height.                 | -                           |
| `fit`         | `BoxFit` | Image scaling behavior.       | -                           |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

UCachedImage(
  imageUrl: 'https://example.com/image.jpg',
  placeholder: CircularProgressIndicator(),
  errorWidget: Icon(Icons.broken_image),
  width: 200,
  height: 200,
  fit: BoxFit.cover,
)
```

#### UContainer

**Description**: A customizable container widget (`UContainer`) with advanced styling and layout
options, including padding, margin, and decoration.

**Parameters**:

| Parameter              | Type              | Description              | Default     |
|------------------------|-------------------|--------------------------|-------------|
| `child`                | `Widget`          | Content widget.          | -           |
| `padding`              | `EdgeInsets`      | Padding around content.  | -           |
| `margin`               | `EdgeInsets`      | Margin around container. | -           |
| `constraints`          | `BoxConstraints`  | Size constraints.        | -           |
| `width`                | `double`          | Container width.         | -           |
| `height`               | `double`          | Container height.        | -           |
| `color`                | `Color`           | Background color.        | -           |
| `gradient`             | `Gradient`        | Gradient background.     | -           |
| `image`                | `DecorationImage` | Background image.        | -           |
| `border`               | `Border`          | Border decoration.       | -           |
| `borderRadius`         | `BorderRadius`    | Corner radius.           | -           |
| `boxShadow`            | `List<BoxShadow>` | Shadow effects.          | -           |
| `foregroundDecoration` | `Decoration`      | Foreground decoration.   | -           |
| `alignment`            | `Alignment`       | Content alignment.       | -           |
| `clipBehavior`         | `Clip`            | Clipping behavior.       | `Clip.none` |
| `transform`            | `Matrix4`         | Transformation matrix.   | -           |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

UContainer(
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.blue[50],
    borderRadius: BorderRadius.circular(12),
  ),
  child: Text('Content'),
)
```

### Interactive Widgets

#### UChipChoice

**Description**: A customizable chip selection widget for single or multiple choice options,
supporting scrollable or wrapped layouts.

**Parameters**:

| Parameter             | Type                            | Description                                   | Default               |
|-----------------------|---------------------------------|-----------------------------------------------|-----------------------|
| `options`             | `List<T>`                       | List of items to display as chips (required). | -                     |
| `selected`            | `T` or `List<T>`                | Selected value(s) (required).                 | -                     |
| `onChanged`           | `Function(int, bool, T)`        | Callback for selection changes.               | -                     |
| `chipBuilder`         | `Widget Function(T, bool, int)` | Custom chip builder.                          | -                     |
| `isMultiChoice`       | `bool`                          | Enables multiple selections.                  | `false`               |
| `spacing`             | `double`                        | Horizontal spacing between chips.             | `8.0`                 |
| `runSpacing`          | `double`                        | Vertical spacing for wrapped layout.          | `8.0`                 |
| `alignment`           | `WrapAlignment`                 | Chip alignment.                               | `WrapAlignment.start` |
| `scrollController`    | `ScrollController`              | Controller for scrollable chips.              | -                     |
| `scrollable`          | `bool`                          | Enables scrolling instead of wrapping.        | `false`               |
| `scrollPhysics`       | `ScrollPhysics`                 | Scroll physics for scrollable chips.          | -                     |
| `padding`             | `EdgeInsets`                    | Padding around chip list.                     | `EdgeInsets.zero`     |
| `direction`           | `Axis`                          | Chip list direction.                          | `Axis.horizontal`     |
| `selectedChipStyle`   | `ChipThemeData`                 | Style for selected chips.                     | -                     |
| `unselectedChipStyle` | `ChipThemeData`                 | Style for unselected chips.                   | -                     |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

UChipChoice<String>(
  options: ['Apple', 'Banana', 'Orange'],
  selected: 'Apple',
  onChanged: (index, isSelected, item) => print('Selected: $item'),
)
```

#### UForm

**Description**: A collection of form widgets (`UTextField`, `UTextFieldPersianDatePicker`,
`UElevatedButton`, `UOutlinedButton`, `UTextButton`, `USearchableDropdown`, `UTextFieldPhoneNumber`)
for customizable inputs and buttons.

**Parameters (UTextField)**:

| Parameter          | Type                         | Description                       | Default                          |
|--------------------|------------------------------|-----------------------------------|----------------------------------|
| `text`             | `String`                     | Label text above field.           | -                                |
| `labelText`        | `String`                     | Label inside field.               | -                                |
| `hintText`         | `String`                     | Hint text.                        | -                                |
| `contentPadding`   | `EdgeInsets`                 | Padding inside field.             | `EdgeInsets.fromLTRB(10,0,10,0)` |
| `fontSize`         | `double`                     | Text font size.                   | -                                |
| `textHeight`       | `double`                     | Text height.                      | -                                |
| `controller`       | `TextEditingController`      | Text controller.                  | -                                |
| `onTap`            | `VoidCallback`               | Tap callback.                     | -                                |
| `onChanged`        | `ValueChanged<String>`       | Change callback.                  | -                                |
| `onFieldSubmitted` | `ValueChanged<String>`       | Submission callback.              | -                                |
| `onSave`           | `ValueChanged<String>`       | Save callback.                    | -                                |
| `validator`        | `FormFieldValidator<String>` | Validation function.              | -                                |
| `prefix`           | `Widget`                     | Prefix widget.                    | -                                |
| `suffix`           | `Widget`                     | Suffix widget.                    | -                                |
| `initialValue`     | `String`                     | Initial text value.               | -                                |
| `maxLength`        | `int`                        | Maximum input length.             | -                                |
| `formatters`       | `List<TextInputFormatter>`   | Input formatters.                 | -                                |
| `autoFillHints`    | `List<String>`               | Autofill suggestions.             | -                                |
| `readOnly`         | `bool`                       | Disables input.                   | `false`                          |
| `obscureText`      | `bool`                       | Hides text (e.g., for passwords). | `false`                          |
| `required`         | `bool`                       | Marks field as required.          | `false`                          |
| `isDense`          | `bool`                       | Reduces field height.             | `false`                          |
| `keyboardType`     | `TextInputType`              | Input type.                       | `TextInputType.text`             |
| `lines`            | `int`                        | Number of text lines.             | `1`                              |
| `hasClearButton`   | `bool`                       | Shows clear button.               | `false`                          |
| `textAlign`        | `TextAlign`                  | Text alignment.                   | `TextAlign.start`                |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

USpacedColumn(
  spacing: 16,
  children: [
    UTextField(
      labelText: 'Name',
      hintText: 'Enter your name',
      onChanged: (value) => print('Name: $value'),
      validator: (value) => value!.isEmpty ? 'Required' : null,
    ),
    UElevatedButton(
      title: 'Submit',
      onTap: () => print('Submitted'),
      backgroundColor: Colors.blue,
    ),
  ],
)
```

#### UOtpField

**Description**: A widget for entering OTP codes with individual text fields for each digit,
supporting auto-focus and validation.

**Parameters**:

| Parameter             | Type                         | Description                           | Default                          |
|-----------------------|------------------------------|---------------------------------------|----------------------------------|
| `controller`          | `TextEditingController`      | Manages OTP input (required).         | -                                |
| `cursorColor`         | `Color`                      | Cursor color (required).              | -                                |
| `fillColor`           | `Color`                      | Field background color (required).    | -                                |
| `activeColor`         | `Color`                      | Active field color (required).        | -                                |
| `borderColor`         | `Color`                      | Border color (required).              | -                                |
| `length`              | `int`                        | Number of OTP digits.                 | `6`                              |
| `autoFocus`           | `bool`                       | Auto-focus first field.               | `false`                          |
| `onChanged`           | `ValueChanged<String>`       | Input change callback.                | -                                |
| `onCompleted`         | `ValueChanged<String>`       | Completion callback.                  | -                                |
| `validator`           | `FormFieldValidator<String>` | Validation function.                  | -                                |
| `textStyle`           | `TextStyle`                  | Input text style.                     | -                                |
| `fieldWidth`          | `double`                     | Width of each field.                  | `48`                             |
| `fieldHeight`         | `double`                     | Height of each field.                 | `60`                             |
| `borderRadius`        | `double`                     | Corner radius of fields.              | `8`                              |
| `borderWidth`         | `double`                     | Border thickness.                     | `1.5`                            |
| `obscureText`         | `bool`                       | Hides input with obscuring character. | `false`                          |
| `obscuringCharacter`  | `String`                     | Obscuring character.                  | `"•"`                            |
| `keyboardType`        | `TextInputType`              | Input type.                           | `TextInputType.number`           |
| `showCursor`          | `bool`                       | Shows cursor in fields.               | `true`                           |
| `readOnly`            | `bool`                       | Disables input.                       | `false`                          |
| `decoration`          | `InputDecoration`            | Custom input decoration.              | -                                |
| `autoDismissKeyboard` | `bool`                       | Dismisses keyboard on completion.     | `true`                           |
| `mainAxisAlignment`   | `MainAxisAlignment`          | Field alignment in row.               | `MainAxisAlignment.spaceBetween` |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

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
)
```

### Media Widgets

#### UImage

**Description**: Displays images from various sources (network, file, memory, assets) with support
for SVG, Lottie, and caching.

**Parameters**:

| Parameter      | Type       | Description                   | Default          |
|----------------|------------|-------------------------------|------------------|
| `source`       | `String`   | Image path or URL (required). | -                |
| `fileData`     | `FileData` | File/memory-based image data. | -                |
| `color`        | `Color`    | Tint color.                   | -                |
| `width`        | `double`   | Image width.                  | -                |
| `height`       | `double`   | Image height.                 | -                |
| `fit`          | `BoxFit`   | Image scaling behavior.       | `BoxFit.contain` |
| `borderRadius` | `double`   | Corner radius.                | `1`              |
| `border`       | `Border`   | Border decoration.            | -                |
| `placeholder`  | `String`   | Fallback image path.          | -                |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

UImage(
  source: 'https://example.com/image.jpg',
  width: 100,
  height: 100,
  fit: BoxFit.cover,
  placeholder: 'assets/placeholder.png',
  borderRadius: 8,
)
```

#### UImageSlider

**Description**: A carousel widget for displaying images with automatic scrolling and customizable
indicators.

**Parameters**:

| Parameter                | Type           | Description                           | Default        |
|--------------------------|----------------|---------------------------------------|----------------|
| `images`                 | `List<String>` | Image URLs or asset paths (required). | -              |
| `height`                 | `double`       | Slider height.                        | `200`          |
| `indicatorHeight`        | `double`       | Indicator area height.                | `30`           |
| `activeIndicatorColor`   | `Color`        | Active indicator color.               | `Colors.white` |
| `inactiveIndicatorColor` | `Color`        | Inactive indicator color.             | `Colors.grey`  |
| `indicatorActiveSize`    | `double`       | Active indicator size.                | `10`           |
| `indicatorInactiveSize`  | `double`       | Inactive indicator size.              | `8`            |
| `autoPlayDuration`       | `int`          | Seconds between auto-scrolls.         | `7`            |
| `imageFit`               | `BoxFit`       | Image scaling behavior.               | `BoxFit.cover` |
| `radius`                 | `double`       | Border radius for images.             | `0`            |
| `imagePlaceholderColor`  | `Color`        | Placeholder color for failed loads.   | `Colors.grey`  |
| `errorWidget`            | `Widget`       | Widget for image load errors.         | -              |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

UImageSlider(
  images: [
    'https://example.com/image1.jpg',
    'https://example.com/image2.jpg',
  ],
  height: 200,
  imageFit: BoxFit.cover,
  radius: 8,
  autoPlayDuration: 5,
  activeIndicatorColor: Colors.blue,
)
```

#### UVideoPlayer

**Description**: Plays videos from network, file, or asset sources with customizable playback
controls.

**Parameters**:

| Parameter      | Type                    | Description                 | Default |
|----------------|-------------------------|-----------------------------|---------|
| `source`       | `String`                | Video source (required).    | -       |
| `controller`   | `VideoPlayerController` | Video player controller.    | -       |
| `autoplay`     | `bool`                  | Auto-plays video.           | `false` |
| `looping`      | `bool`                  | Loops video.                | `false` |
| `showControls` | `bool`                  | Displays playback controls. | `true`  |
| `aspectRatio`  | `double`                | Video aspect ratio.         | -       |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

UVideoPlayer(
  source: 'https://example.com/video.mp4',
  autoplay: true,
  showControls: true,
)
```

#### UPdfViewer

**Description**: Displays PDF files with support for zooming, scrolling, and page navigation.

**Parameters**:

| Parameter       | Type                  | Description                 | Default |
|-----------------|-----------------------|-----------------------------|---------|
| `source`        | `String`              | PDF path or URL (required). | -       |
| `initialPage`   | `int`                 | Starting page number.       | `1`     |
| `zoomLevel`     | `double`              | Initial zoom level.         | `1.0`   |
| `onPageChanged` | `Function(int)`       | Page change callback.       | -       |
| `controller`    | `PdfViewerController` | Controller for navigation.  | -       |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

UPdfViewer(
  source: 'https://example.com/sample.pdf',
  initialPage: 1,
  zoomLevel: 1.0,
  onPageChanged: (page) => print('Page: $page'),
)
```

#### UWebView

**Description**: Displays web content with support for navigation and JavaScript execution.

**Parameters**:

| Parameter            | Type                 | Description                   | Default        |
|----------------------|----------------------|-------------------------------|----------------|
| `url`                | `String`             | Initial URL (required).       | -              |
| `javascriptMode`     | `JavascriptMode`     | JavaScript mode.              | `unrestricted` |
| `onPageStarted`      | `Function(String)`   | Page start callback.          | -              |
| `onPageFinished`     | `Function(String)`   | Page finish callback.         | -              |
| `navigationDelegate` | `NavigationDelegate` | Controls navigation requests. | -              |
| `userAgent`          | `String`             | Custom user agent.            | -              |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

UWebView(
  url: 'https://example.com',
  javascriptMode: JavascriptMode.unrestricted,
  onPageFinished: (url) => print('Page loaded: $url'),
)
```

### Data Display Widgets

#### UCalendar

**Description**: Displays a customizable calendar with event support and optional Jalali calendar
integration using `syncfusion_flutter_calendar`.

**Parameters**:

| Parameter                  | Type                   | Description                       | Default                  |
|----------------------------|------------------------|-----------------------------------|--------------------------|
| `dataSource`               | `UCalendarDataSource`  | Calendar appointments (required). | -                        |
| `view`                     | `CalendarView`         | Calendar view (e.g., `month`).    | `month`                  |
| `firstDayOfWeek`           | `int`                  | First day of week (1 = Monday).   | `1`                      |
| `initialDisplayDate`       | `DateTime`             | Initial display date.             | -                        |
| `initialSelectedDate`      | `DateTime`             | Initial selected date.            | -                        |
| `minDate`                  | `DateTime`             | Minimum selectable date.          | -                        |
| `maxDate`                  | `DateTime`             | Maximum selectable date.          | -                        |
| `showNavigationArrow`      | `bool`                 | Shows navigation arrows.          | `true`                   |
| `showCurrentTimeIndicator` | `bool`                 | Shows current time indicator.     | `true`                   |
| `showWeekNumber`           | `bool`                 | Shows week numbers.               | `false`                  |
| `useJalali`                | `bool`                 | Enables Jalali calendar.          | `false`                  |
| `jalaliDateFormatter`      | `Function`             | Custom Jalali date formatter.     | -                        |
| `monthCellBuilder`         | `Widget Function`      | Custom month cell builder.        | -                        |
| `appointmentBuilder`       | `Widget Function`      | Custom appointment builder.       | -                        |
| `timeSlotViewSettings`     | `TimeSlotViewSettings` | Time slot view settings.          | `TimeSlotViewSettings()` |
| `monthViewSettings`        | `MonthViewSettings`    | Month view settings.              | `MonthViewSettings()`    |
| `scheduleViewSettings`     | `ScheduleViewSettings` | Schedule view settings.           | `ScheduleViewSettings()` |
| `loadingIndicator`         | `Widget`               | Loading indicator widget.         | -                        |
| `errorIndicator`           | `Widget`               | Error indicator widget.           | -                        |
| `showLoading`              | `bool`                 | Shows loading indicator.          | `false`                  |
| `constraints`              | `BoxConstraints`       | Calendar size constraints.        | -                        |
| `padding`                  | `EdgeInsets`           | Calendar padding.                 | `EdgeInsets.all(8)`      |
| `backgroundColor`          | `Color`                | Background color.                 | -                        |
| `controller`               | `CalendarController`   | Calendar interaction controller.  | -                        |
| `onViewChanged`            | `Function`             | View change callback.             | -                        |
| `onTap`                    | `Function`             | Tap event callback.               | -                        |
| `onLongPress`              | `Function`             | Long press event callback.        | -                        |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

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
  ),
  view: CalendarView.month,
  showNavigationArrow: true,
  onTap: (details) => print('Tapped: ${details.date}'),
)
```

#### UChart

**Description**: A collection of chart widgets (e.g., `UColumnChart`, `UDoughnutChart`) for data
visualization using `syncfusion_flutter_charts`.

**Parameters (Common)**:

| Parameter           | Type                  | Description                    | Default         |
|---------------------|-----------------------|--------------------------------|-----------------|
| `data`              | `List<ChartData>`     | Chart data (required).         | -               |
| `legendPosition`    | `ChartLegendPosition` | Legend position (e.g., `top`). | `top` or `left` |
| `overflowMode`      | `ChartOverflowMode`   | Legend overflow behavior.      | `wrap`          |
| `showLegend`        | `bool`                | Shows legend.                  | `true`          |
| `enableTooltip`     | `bool`                | Enables tooltips.              | `true`          |
| `animationDuration` | `int`                 | Animation duration (ms).       | `1000`          |
| `dataLabelSettings` | `DataLabelSettings`   | Data label settings.           | Varies          |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

UColumnChart(
  data: [
    ChartData(xValue: 'Jan', yValue: 10, color: Colors.blue),
    ChartData(xValue: 'Feb', yValue: 15, color: Colors.red),
  ],
  legendPosition: ChartLegendPosition.top,
  showLegend: true,
  enableTooltip: true,
)
```

#### UGauge

**Description**: Displays a radial gauge using `syncfusion_flutter_gauges` with customizable ranges
and annotations.

**Parameters**:

| Parameter          | Type                     | Description             | Default |
|--------------------|--------------------------|-------------------------|---------|
| `value`            | `double`                 | Gauge value (required). | -       |
| `min`              | `double`                 | Minimum value.          | `0`     |
| `max`              | `double`                 | Maximum value.          | `100`   |
| `size`             | `double`                 | Gauge size.             | `200`   |
| `ranges`           | `List<UGaugeRange>`      | Colored ranges.         | -       |
| `annotations`      | `List<UGaugeAnnotation>` | Custom widgets.         | -       |
| `showTicks`        | `bool`                   | Shows ticks.            | `true`  |
| `showLabels`       | `bool`                   | Shows labels.           | `true`  |
| `axisColor`        | `Color`                  | Axis color.             | -       |
| `axisThickness`    | `double`                 | Axis thickness.         | `10`    |
| `needleColor`      | `Color`                  | Needle color.           | -       |
| `needleWidth`      | `double`                 | Needle width.           | `1`     |
| `needleKnobRadius` | `double`                 | Needle knob radius.     | `0.08`  |
| `majorTickColor`   | `Color`                  | Major tick color.       | -       |
| `majorTickLength`  | `double`                 | Major tick length.      | `10`    |
| `minorTickColor`   | `Color`                  | Minor tick color.       | -       |
| `minorTickLength`  | `double`                 | Minor tick length.      | `5`     |
| `labelFontSize`    | `double`                 | Label font size.        | `12`    |
| `labelColor`       | `Color`                  | Label color.            | -       |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

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
    UGaugeAnnotation(widget: Text('75%'), angle: 90, position: 0.5),
  ],
)
```

#### UMap

**Description**: An interactive map widget using `flutter_map` with support for multiple tile
providers and markers.

**Parameters**:

| Parameter              | Type               | Description                      | Default                        |
|------------------------|--------------------|----------------------------------|--------------------------------|
| `controller`           | `MapController`    | Map controller (required).       | -                              |
| `center`               | `LatLng`           | Initial map center.              | `LatLng(51.509364, -0.128928)` |
| `zoom`                 | `double`           | Initial zoom level.              | `10.0`                         |
| `minZoom`              | `double`           | Minimum zoom level.              | `3.0`                          |
| `maxZoom`              | `double`           | Maximum zoom level.              | `18.0`                         |
| `tileProvider`         | `UMapTileProvider` | Map tile source.                 | `openStreetMap`                |
| `markers`              | `List<Marker>`     | Map markers.                     | `[]`                           |
| `polylines`            | `List<Polyline>`   | Map polylines.                   | `[]`                           |
| `polygons`             | `List<Polygon>`    | Map polygons.                    | `[]`                           |
| `centerWidget`         | `Widget`           | Widget at map center.            | -                              |
| `zoomButtons`          | `bool`             | Shows zoom controls.             | `true`                         |
| `myLocationButton`     | `bool`             | Shows "my location" button.      | `true`                         |
| `currentLocationLayer` | `bool`             | Shows user’s location layer.     | `true`                         |
| `initOnUserLocation`   | `bool`             | Centers map on user’s location.  | `false`                        |
| `showAttribution`      | `bool`             | Shows tile provider attribution. | `true`                         |
| `onTap`                | `Function`         | Tap event callback.              | -                              |
| `onLongPress`          | `Function`         | Long press event callback.       | -                              |
| `onPositionChanged`    | `Function`         | Position change callback.        | -                              |
| `onPointerUp`          | `Function`         | Pointer up callback.             | -                              |
| `mapBoxAccessToken`    | `String`           | MapBox access token.             | -                              |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';
import 'package:flutter_map/flutter_map.dart';

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
)
```

#### UNumberPagination

**Description**: A pagination control with numbered buttons, previous/next navigation, and ellipsis
for large page counts.

**Parameters**:

| Parameter         | Type            | Description                       | Default                 |
|-------------------|-----------------|-----------------------------------|-------------------------|
| `currentPage`     | `int`           | Current page (required).          | -                       |
| `totalPages`      | `int`           | Total number of pages (required). | -                       |
| `onPageChanged`   | `Function(int)` | Page change callback (required).  | -                       |
| `threshold`       | `int`           | Max pages shown on either side.   | `3`                     |
| `selectedColor`   | `Color`         | Selected page color.              | Theme’s `primaryColor`  |
| `unselectedColor` | `Color`         | Unselected page color.            | Theme’s `disabledColor` |
| `showPrevNext`    | `bool`          | Shows previous/next buttons.      | `true`                  |
| `prevIcon`        | `Widget`        | Previous button icon.             | -                       |
| `nextIcon`        | `Widget`        | Next button icon.                 | -                       |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

UNumberPagination(
  currentPage: 5,
  totalPages: 10,
  onPageChanged: (page) => print('Page: $page'),
  threshold: 2,
  selectedColor: Colors.blue,
)
```

## Utilities

### App Management

#### UApp

**Description**: Provides access to app-wide configuration, device information, platform checks, and
theme-related properties.

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

// Access app metadata
String appName = UApp.name;

// Check platform
bool isWeb = UApp.isWeb;

// Update locale
UApp.updateLocale(Locale('fa'));

// Toggle theme
UApp.switchTheme();
```

### System Utilities

#### UClipboard

**Description**: Manages system clipboard operations for copying and pasting text.

**Methods**:

| Method        | Type              | Description                    |
|---------------|-------------------|--------------------------------|
| `set(String)` | `Future<void>`    | Sets text to clipboard.        |
| `getText()`   | `Future<String?>` | Retrieves text from clipboard. |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

await UClipboard.set('Hello, Flutter!');
String? text = await UClipboard.getText();
```

#### UFile

**Description**: Handles file operations like picking images/files and cropping images using
`image_picker`, `file_picker`, and `image_cropper`.

**Methods**:

| Method            | Type                     | Description                       |
|-------------------|--------------------------|-----------------------------------|
| `showImagePicker` | `Future<List<FileData>>` | Picks images from camera/gallery. |
| `showFilePicker`  | `Future<void>`           | Opens file picker dialog.         |
| `writeToFile`     | `Future<File>`           | Writes bytes to a temporary file. |
| `cropImage`       | `Future<FileData?>`      | Crops an image.                   |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

List<FileData> images = await UFile.showImagePicker(
  source: ImageSource.gallery,
  allowMultiple: true,
);
```

#### ULocalAuth

**Description**: Manages biometric and local authentication using `local_auth`.

**Methods**:

| Method                | Type                          | Description                        |
|-----------------------|-------------------------------|------------------------------------|
| `canAuthenticate`     | `Future<bool>`                | Checks biometric availability.     |
| `availableBiometrics` | `Future<List<BiometricType>>` | Lists available biometric types.   |
| `authenticate`        | `Future<bool>`                | Performs biometric authentication. |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

bool canAuth = await ULocalAuth.canAuthenticate();
bool authenticated = await ULocalAuth.authenticate(
  localizedReason: 'Please authenticate',
);
```

#### ULocalStorage

**Description**: Manages persistent key-value storage using `shared_preferences`.

**Methods**:

| Method          | Type            | Description               |
|-----------------|-----------------|---------------------------|
| `init`          | `Future<void>`  | Initializes storage.      |
| `set`           | `void`          | Saves a value.            |
| `getInt`        | `int?`          | Retrieves an integer.     |
| `getString`     | `String?`       | Retrieves a string.       |
| `getBool`       | `bool?`         | Retrieves a boolean.      |
| `getDouble`     | `double?`       | Retrieves a double.       |
| `getStringList` | `List<String>?` | Retrieves a string list.  |
| `clear`         | `void`          | Clears all data.          |
| `remove`        | `void`          | Removes a key-value pair. |
| `getToken`      | `String?`       | Retrieves auth token.     |
| `hasToken`      | `bool`          | Checks if token exists.   |
| `getUserId`     | `String?`       | Retrieves user ID.        |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

await ULocalStorage.init();
ULocalStorage.set('key', 'value');
String? value = ULocalStorage.getString('key');
```

#### ULocation

**Description**: Retrieves user location using `geolocator`.

**Methods**:

| Method            | Type                | Description                 |
|-------------------|---------------------|-----------------------------|
| `getUserLocation` | `Future<Position?>` | Retrieves current location. |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

Position? position = await ULocation.getUserLocation(
  onUserLocationFound: (pos) => print('Location: ${pos.latitude}'),
);
```

#### UNavigator

**Description**: Manages navigation, dialogs, and notifications with custom transitions.

**Methods**:

| Method             | Type         | Description                           |
|--------------------|--------------|---------------------------------------|
| `push`             | `Future<T?>` | Pushes a new route.                   |
| `off`              | `Future<T?>` | Replaces current route.               |
| `offAll`           | `void`       | Clears all routes and pushes new one. |
| `back`             | `void`       | Pops current route.                   |
| `dialog`           | `Future<T?>` | Shows adaptive dialog.                |
| `confirm`          | `void`       | Shows confirmation dialog.            |
| `bottomSheet`      | `Future<T?>` | Shows modal bottom sheet.             |
| `draggableSheet`   | `Future<T?>` | Shows draggable sheet.                |
| `snackbar`         | `void`       | Shows snackbar.                       |
| `toast`            | `void`       | Shows toast notification.             |
| `error`            | `void`       | Shows error snackbar.                 |
| `fullScreenDialog` | `Future<T?>` | Shows full-screen dialog.             |
| `showOverlay`      | `void`       | Shows non-intrusive overlay.          |
| `dismissOverlay`   | `void`       | Dismisses overlay.                    |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

await UNavigator.push(Text('New Page'), transition: RouteTransitions.fade);
UNavigator.snackbar(message: 'Action completed');
```

#### UUUID

**Description**: Generates UUIDs using the `uuid` package.

**Methods**:

| Method   | Type     | Description                           |
|----------|----------|---------------------------------------|
| `uuidV1` | `String` | Generates time-based UUID.            |
| `uuidV4` | `String` | Generates random UUID.                |
| `uuidV5` | `String` | Generates namespace-based UUID.       |
| `uuidV6` | `String` | Generates time-based, reordered UUID. |
| `uuidV7` | `String` | Generates time-based, monotonic UUID. |
| `uuidV8` | `String` | Generates custom UUID.                |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

String uuid = UUUID.uuidV4();
```

#### UValidators

**Description**: Provides form validation methods for various input types.

**Methods**:

| Method              | Type                         | Description                          |
|---------------------|------------------------------|--------------------------------------|
| `validateForm`      | `void`                       | Validates form and executes action.  |
| `combineValidators` | `FormFieldValidator<T>`      | Combines multiple validators.        |
| `required`          | `FormFieldValidator<T>`      | Ensures non-empty input.             |
| `minLength`         | `FormFieldValidator<String>` | Ensures minimum length.              |
| `maxLength`         | `FormFieldValidator<String>` | Ensures maximum length.              |
| `exactLength`       | `FormFieldValidator<String>` | Ensures exact length.                |
| `email`             | `FormFieldValidator<String>` | Validates email format.              |
| `phone`             | `FormFieldValidator<String>` | Validates phone number.              |
| `number`            | `FormFieldValidator<String>` | Validates numeric string.            |
| `numberRange`       | `FormFieldValidator<String>` | Validates number within range.       |
| `url`               | `FormFieldValidator<String>` | Validates URL format.                |
| `password`          | `FormFieldValidator<String>` | Validates password strength.         |
| `alphanumeric`      | `FormFieldValidator<String>` | Validates alphanumeric string.       |
| `pattern`           | `FormFieldValidator<String>` | Validates against regex pattern.     |
| `match`             | `FormFieldValidator<String>` | Ensures input matches another value. |
| `complexPassword`   | `FormFieldValidator<String>` | Validates strong password.           |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

FormFieldValidator<String> validator = UValidators.combineValidators([
  UValidators.required(message: 'Required'),
  UValidators.email(requiredMessage: 'Email required', invalidMessage: 'Invalid email'),
]);
```

### Network Utilities

#### UHttpClient

**Description**: Manages HTTP requests, file uploads, and downloads with customizable headers and
timeouts.

**Methods**:

| Method                  | Type                    | Description                         |
|-------------------------|-------------------------|-------------------------------------|
| `upload`                | `Future<void>`          | Uploads files to an endpoint.       |
| `download`              | `Future<void>`          | Downloads a file to a local path.   |
| `get`                   | `Future<Response?>`     | Performs GET request.               |
| `post`                  | `Future<Response?>`     | Performs POST request.              |
| `put`                   | `Future<Response?>`     | Performs PUT request.               |
| `delete`                | `Future<Response?>`     | Performs DELETE request.            |
| `decodeJson`            | `Map<String, dynamic>`  | Decodes JSON response.              |
| `decodeJsonArray`       | `List<dynamic>`         | Decodes JSON array response.        |
| `multipartFileFromFile` | `Future<MultipartFile>` | Creates multipart file for uploads. |
| `close`                 | `void`                  | Closes HTTP client.                 |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

UHttpClient client = UHttpClient(baseUrl: 'https://api.example.com');
await client.get(
  '/users',
  onSuccess: (response) => print(response.body),
);
client.close();
```

#### UNetwork

**Description**: Checks network connectivity using `connectivity_plus` and
`internet_connection_checker`.

**Methods**:

| Method                 | Type           | Description                    |
|------------------------|----------------|--------------------------------|
| `hasCellular`          | `Future<bool>` | Checks cellular connection.    |
| `hasWifi`              | `Future<bool>` | Checks Wi-Fi connection.       |
| `hasVpn`               | `Future<bool>` | Checks VPN connection.         |
| `hasEthernet`          | `Future<bool>` | Checks Ethernet connection.    |
| `hasBluetooth`         | `Future<bool>` | Checks Bluetooth connection.   |
| `hasNetworkConnection` | `Future<bool>` | Checks any network connection. |

**Usage**:

```
import 'package:flutter_widget_utility/flutter_widget_utility.dart';

bool hasWifi = await UNetwork.hasWifi();
```

## Installation

Add the library to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_widget_utility: ^1.0.0
```

Run `flutter pub get` to install the package. Import and use the widgets and utilities as shown in
the examples above.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/new-feature`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/new-feature`).
5. Create a pull request.

Please ensure your code follows the project's coding standards and includes tests.

## License

This library is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For more information, visit [SinaMN75.com](https://sinamn75.com) or check out
the [GitHub repository](https://github.com/SinaMN75/flutter_widget_utility).