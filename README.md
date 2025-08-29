# Utilities-Flutter

A comprehensive Flutter package that provides a collection of utilities to simplify common tasks in
Flutter projects. This package wraps various functionalities, including navigation, local storage,
file handling, network checks, notifications, and more, into a single, easy-to-use package.

## Table of Contents

- [Getting Started](#getting-started)
- [Features](#features)
  - [UMaterialApp](#umaterialapp)
  - [UClipboard](#uclipboard)
  - [UFile](#ufile)
  - [Http Interceptor](#http-interceptor)
  - [ULaunch](#ulaunch)
  - [ULoading](#uloading)
  - [ULocalAuth](#ulocalauth)
  - [ULocalStorage](#ulocalstorage)
  - [ULocation](#ulocation)
  - [UNavigator](#unavigator)
  - [UNetwork](#unetwork)
  - [UNotification](#unotification)
  - [UAppUtils](#uapputils)
  - [Extensions](#extensions)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

To use the `Utilities-Flutter` package, initialize it in your `main.dart` file. This package
simplifies the setup of common Flutter functionalities such as localization, themes, and navigation.

### Example `main.dart`
```dart
Future<void> main() async {
  await initUtilities(
    apiKey: "your_api_key",
    // Optional: Add API key for HTTP interceptor
    firebaseOptions: null,
    // Optional: Firebase options
    safeDevice: true,
    // Optional: Enable security checks for Android/iOS
    protectDataLeaking: true,
    // Optional: Prevent data leaking
    preventScreenShot: true,
    // Optional: Prevent screenshots
    deviceOrientations: [DeviceOrientation.portraitUp], // Optional: Set device orientations
  );
  runApp(
    UMaterialApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: const <Locale>[Locale("en")],
      locale: Locale(ULocalStorage.getString(UConstants.locale) ?? "en"),
      lightTheme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const SplashPage(),
    ),
  );
}
```

## Features

### UMaterialApp

A wrapper around `GetMaterialApp` from the GetX package, providing default implementations for
theming, localization, and loading dialogs. All parameters are required for simplicity.

### UClipboard

Manage clipboard operations easily.
```dart
UClipboard.set
("some text
"
); // Set text to clipboard
String? text = await UClipboard.getText(); // Get text from clipboard
```

### UFile

Handle file picking and image cropping with ease.
```dart
// File Picker
UFile.showFilePicker(
allowCompression: true,
allowedExtensions: ["png", "jpg", "JPEG"],
allowMultiple: true,
dialogTitle: "Pick Some Awesome Image",
fileType: FileType.image,
action: (List<FileData> files) {
// Handle picked files
},
);

// Image Cropper
UFile.cropImage(
filePath: "filePath",
toolbarColor: Colors.purple,
cropAspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 2),
cropStyle: CropStyle.circle,
androidUiSettings: AndroidUiSettings(hideBottomControls: true),
action: (FileData file) {
// Handle cropped image
},
);
```

### Http Interceptor

Make HTTP requests with a built-in interceptor.
```dart
httpRequest(
url: "${AppConstants.baseUrlPractino}GetReportsByMobile/$nationalCode",
httpMethod: EHttpMethod.get,
action: (Response response) {
if ((response.bodyString ?? "").length >= 50) {
action(LifeReportItemsResponse.fromJson('{"items": ${response.bodyString!}}'));
} else {
action(null);
}
},
error: (Response response) {
// Handle error
},
cacheExpireDate
:
cacheExpireDate
,
);
```

### ULaunch

Easily share content or open external apps and URLs.
```dart
ULaunch.email("sina@email.com", "hello");
ULaunch.call("1234567890");
ULaunch.sms("1234567890", "some text");
ULaunch.launchInstagram("sinamn75");
ULaunch.launchTelegram("sinamn75");
ULaunch.launchWhatsApp("1234567890");
ULaunch.launchURL("https://sinamn75.com");
ULaunch.shareText("some text");
ULaunch.shareWidget(widget: const CircleAvatar());
ULaunch.launchMap(35.37651, 55.753325);
ULaunch.shareWithTelegram("some text");
ULaunch.shareWithWhatsapp("some text");
ULaunch.shareWithEmail("some text");
```

### ULoading

Display simple loading dialogs using `flutter_easyloading`.
```dart
ULoading.showLoading
(); // Show loading dialog
ULoading.dismissLoading
(); // Dismiss loading dialog
ULoading.showError
(); // Show error dialog
bool isLoading = ULoading.isLoadingShow(); // Check if loading dialog is visible
```

### ULocalAuth

Handle biometric authentication with `local_auth`.
```dart

bool canAuthenticate = await
ULocalAuth.canAuthenticate
();

List<BiometricType> biometrics = await
ULocalAuth.availableBiometrics
();
await ULocalAuth.authenticate(
biometricOnly: true,
localizedReason: "just for fun",
sensitiveTransaction: true,
stickyAuth: true,
useErrorDialogs: true,
);
```

### ULocalStorage

Manage local storage with `shared_preferences`.
```dart
ULocalStorage.set
("key1
"
,
"
value
"
);
ULocalStorage.set("key2", 1);
ULocalStorage.set("key3", 4.5);
ULocalStorage.set("key4", true);

String? key1 = ULocalStorage.getString("key1");
int? key2 = ULocalStorage.getInt("key2");
double? key3 = ULocalStorage.getDouble("key3");
bool? key4 = ULocalStorage.getBool("key4
"
);
```

### ULocation

Get the user's location with `geolocator`.
```dart

Position? position = await
ULocation.getUserLocation
();
```

### UNavigator

Navigate between pages without context.
```dart
UNavigator.push
(
const ProfilePage());
UNavigator.off(const ProfilePage(), preventDuplicates: false);
UNavigator.offAll(const ProfilePage(), milliSecondDelay: 100, transition: Transition.fadeIn);
UNavigator.dialog(const ProfilePage());
UNavigator.dialogAlert(const ProfilePage());
UNavigator.back();
```

### UNetwork

Check network and connection status.
```dart

bool hasBluetooth = await
UNetwork.hasBluetooth
();
bool hasCellular = await UNetwork.hasCellular();
bool hasEthernet = await UNetwork.hasEthernet();
bool hasWifi = await UNetwork.hasWifi();
bool hasVpn = await UNetwork.hasVpn();
bool hasNetworkConnection = await UNetwork.hasNetworkConnection();
```

### UNotification

Show simple notifications.
```dart
UNotification.showNotification
(
title: "title",
message: "message",
onNotificationTap: (NotificationResponse response) {
print(response.id);
print(response.actionId);
print(response.input);
print(response.payload);
},
);
```

### UAppUtils

Utilities for app and device information.
```dart

String appBuildNumber = UApp.buildNumber;
String appVersion = UApp.version;
String appName = UApp.name;
String appPackageName = UApp.packageName;

bool isAndroid = UApp.isAndroid;
bool isIos = UApp.isIos;
bool isWeb = UApp.isWeb;
bool isWindows = UApp.isWindows;
bool isMacOs = UApp.isMacOs;
bool isMobile = UApp.isMobile;
bool isPwa = UApp.isPwa;
bool isDesktopSize = UApp.isDesktopSize();
bool isLandScape = UApp.isLandScape();
bool isPortrait = UApp.isPortrait();

UApp.switchTheme
(); // Toggle between light and dark themes
UApp.updateLocale
(
const
Locale
(
"
fa
"
)
); // Update app locale
```

### Extensions

Simplify date handling with `DateExtension`.
```dart

DateTime dateTime = DateTime(2000);
String dateTimeString = dateTime.toIso8601String();

Jalali jalali = dateTime.toJalali();
Gregorian gregorian = jalali.toGregorian();

String compactDate = jalali.formatCompactDate();
String fullDate = jalali.formatFullDate();
String monthYear = jalali.formatMonthYear();
String year = jalali.formatYear();
String shortDate = jalali.formatShortDate();

String jalaliCompact = dateTimeString.toJalaliCompactDateString();
String jalaliDate = dateTimeString.toJalaliDateString();
String jalaliFull = dateTimeString.toJalaliDateTimeFull();
String day = dateTimeString.getDay();
String yearStr = dateTimeString.getYear();
String minute = dateTimeString.getMinute();
```

## Installation

Add the `utilities_flutter` package to your `pubspec.yaml`:

```yaml
dependencies:
  utilities_flutter: ^1.0.0
```

Run the following command to install the package:

```bash
flutter pub get
```

## Usage

1. Initialize the package in `main.dart` as shown in the [Getting Started](#getting-started)
   section.
2. Use the provided utilities as needed in your project.
3. Refer to the [Features](#features) section for detailed examples of each utility.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with a detailed description of your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.