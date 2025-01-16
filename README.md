# Everything that Every Project might need in a Single Package

To get started we need to initialize the package in  `main.dart`

## `main.dart`

```dart
Future<void> main() async {
  await initUtilities();
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

## InitUtilities

Here you can pass some optional parameters to `initUtilities` function

`apiKey`: for adding ApiKey header to HttpInterceptor of the u package.

`firebaseOptions`: for adding the firebase options.

`safeDevice`: for having some security checks on Android and iOS   [safe_device](https://pub.dev/packages/safe_device)

`protectDataLeaking` and `preventScreenShot`: screen protector for preventing user from getting
screenshots    [screen_protector](https://pub.dev/packages/screen_protector)

`deviceOrientations`: for supporting different Device orientations.

## UMaterialApp

UMaterialApp is a wrapper on top of `GetMaterialApp` of Getx package with some default implementations.

for simplicity all the parameters are required, and everything about having dark/light theme, localizations, loading
dialogs and... are handled.

## Basic Utilities

### `UClipboard`

setting and getting string data from Clipboard.

```dart
UClipboard.set("some text");

UClipboard.getText();
```

### `UFile`

File Picker [file_picker](https://pub.dev/packages/file_picker)

```dart
UFile.showFilePicker(
allowCompression: true,
allowedExtensions: <String>["png", "jpg", "JPEG"],
allowMultiple: true,
dialogTitle: "Pick Some Awesome Image",
fileType: FileType.image,
...
action: (final List<FileData> files) {},
);
```

File Picker [image_cropper](https://pub.dev/packages/image_cropper)

```dart
UFile.cropImage(
filePath: "filePath",
toolbarColor: Colors.purple,
cropAspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 2),
cropStyle: CropStyle.circle,
androidUiSettings: AndroidUiSettings(hideBottomControls: true),
action: (final FileData file) {},
);
```

### `http_interceptor`

```dart
httpRequest(
url: "${AppConstants.baseUrlPractino}GetReportsByMobile/$nationalCode",
httpMethod: EHttpMethod.get,
action: (final Response<dynamic> response) {
if ((response.bodyString ?? "").length >= 50) action(LifeReportItemsResponse.fromJson('{"items": ${response.bodyString!}}'));
else action(null);
},
error: (final Response<dynamic> response) {},
cacheExpireDate: cacheExpireDate,
);
```

### 'ULaunch'

need to share text, image, widgets, or want to open someone's Telegram, whatsapp.

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

### `ULoading`

A very simple loading dialog from anywhere. [flutter_easyloading](https://pub.dev/packages/flutter_easyloading)

```dart
ULoading.showLoading();
ULoading.dismissLoading();
ULoading.showError();
ULoading.isLoadingShow();
```

### `ULocalAuth`
Authentication with biometric [local_auth](https://pub.dev/packages/local_auth)

```dart
final bool canAuthenticate = await ULocalAuth.canAuthenticate();

final List<BiometricType> availableBiometrics = await ULocalAuth.availableBiometrics();

await ULocalAuth.authenticate(
biometricOnly: true,
localizedReason: "just for fun",
sensitiveTransaction: true,
stickyAuth: true,
useErrorDialogs: true,
);
```

### `ULocalStorage`

Easiest Local Storage management with [shared_preferences](https://pub.dev/packages/shared_preferences)

```dart
  ULocalStorage.set("key1", "value");
ULocalStorage.set("key2", 1);
ULocalStorage.set("key3", 4.5);
ULocalStorage.set("key4", true);

final String? key1 = ULocalStorage.getString("key1");
final int? key2 = ULocalStorage.getInt("key2");
final double? key3 = ULocalStorage.getDouble("key3");
final bool? key4 = ULocalStorage.getBool("key4");
```

### `ULocation`

Get User's location [geolocator](https://pub.dev/packages/geolocator)

```dart
final Position? position = await ULocation.getUserLocation();
```

### `UNavigator`

Navigation Between Pages Without Context.

```dart
  UNavigator.push(const ProfilePage());
UNavigator.off(const ProfilePage(), preventDuplicates: false);
UNavigator.offAll(const ProfilePage(), milliSecondDelay: 100, transition: Transition.fadeIn);
UNavigator.dialog(const ProfilePage());
UNavigator.dialogAlert(const ProfilePage());
UNavigator.back();
```

### `UNetwork`

Check User's Connections.

```dart
  bool hasBluetooth = await UNetwork.hasBluetooth();
bool hasCellular = await UNetwork.hasCellular();
bool hasEthernet = await UNetwork.hasEthernet();
bool hasWifi = await UNetwork.hasWifi();
bool hasVpn = await UNetwork.hasVpn();
bool hasNetworkConnection = await UNetwork.hasNetworkConnection();
```

### `UNotification`

Easiest Way of Showing a Simple Notification.

```dart
  UNotification.showNotification(
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

### `UAppUtils`

A Set of Utils About App and Device.

```dart
  final String appBuildNumber = UApp.buildNumber;
final String appVersion = UApp.version;
final String appName = UApp.name;
final String appPackageName = UApp.packageName;

final bool isAndroid = UApp.isAndroid;
final bool isIos = UApp.isIos;
final bool isWeb = UApp.isWeb;
final bool isWindows = UApp.isWindows;
final bool isMacOs = UApp.isMacOs;
final bool isMobile = UApp.isMobile;
final bool isPwa = UApp.isPwa;
final bool isDesktopSize = UApp.isDesktopSize();
final bool isLandScape = UApp.isLandScape();
final bool isPortrait = UApp.isPortrait();

UApp.switchTheme(); // switch to dark if it's light, and light if it's dark
UApp.updateLocale(const Locale("fa"));
```

### `Extensions`

A Set of Extensions Method for Making the Life Easier.

#### `DateExtension`
```dart
  final DateTime dateTime = DateTime(2000);
final String dateTimeString = DateTime(2000).toIso8601String();

final Jalali jalali = dateTime.toJalali();
final Gregorian gregorian = jalali.toGregorian();

jalali.formatCompactDate();
jalali.formatFullDate();
jalali.formatMonthYear();
jalali.formatYear();
jalali.formatShortDate();

dateTimeString.toJalaliCompactDateString();
dateTimeString.toJalaliDateString();
dateTimeString.toJalaliDateTimeFull();
dateTimeString.getDay();
dateTimeString.getYear();
dateTimeString.getMinute();
```

