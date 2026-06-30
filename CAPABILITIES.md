# `u` Package — Capability Index

> Grep-able catalog of everything the shared `u` package exposes. **Before writing ANY new
> Flutter code, search this file first and reuse what already exists.** Import everything with a
> single `import "package:u/utilities.dart";` — it re-exports Flutter material, GetX, http, and all
> items below.
>
> Access patterns at a glance:
> - **API calls:** `UServices.<area>.<method>(p: ..., onOk: ..., onError: ..., onException: ...)`
> - **Global config/state:** `U.baseUrl`, `U.apiKey`, `U.user`, `U.s` (i18n), `U.addTab(...)`
> - **Init once in main:** `await initU(baseUrl: ..., apiKey: ...)`
> - **App-wide MaterialApp:** `UMaterialApp(...)`
> - Navigation key: `navigatorKey` (global)

---

## 1. String extensions  (`utils/extensions/string_extension.dart`)

**On `String`** (`StringExtensions`):
`toBytesFromBase64()`, `toBytesFromBase64Url()`, `subStringIfExist(start,end)`, `numberString()`,
`number()`, `nullIfEmpty()`, `rial()`, `toman()`, `isTrue()`, `isFalse()`, `isNumeric()`, `toInt()`,
`toDouble()`, `separateNumbers3By3()`, `separateCharacters(n,sep)`, `toJalaliCompactDateString()`,
`toJalaliDateString()`, `append0()`, `formatJalaliDateTime()`, `maxLength(max:)`, `getDay()`,
`getMonth()`, `getYear()`, `getHour()`, `getMinute()`, `toTimeAgo(...)`, `toPersianNumber()`,
`toLatinNumber()`, `persianDayDay()`, `englishDay()`, `persianMonth()`, `englishMonth()`,
`removeCharAt(i)`, `toBase64()`, `fromBase64()`, `toBase58()`, `fromBase58()`,
`extractLatinNumber()`.
Getters: `isValidEmail`, `isValidUrl`, `isValidPhone`, `isAlphanumeric`, `isStrongPassword`.

**On `String?`** (`OptionalStringExtension`):
`numberString()`, `toStringOrEmptyIfNull()`, `number()`, `nullIfEmpty()`, `getPrice()`,
`separateNumbers3By3()`, `toJalaliDateString()`, `toJalaliDateTime()`, `toJalaliDate()`,
`rial({removeNegative})`, `toman({removeNegative})`, `rialToTomanMoneyPersian()`,
`formatJalaliDateTime({toLocal})`, `isNullOrEmpty()`, `isNotNullOrEmpty()`, `isNumeric()`.

**On `TextEditingController`** (`TextEditingControllerExtension`):
`numString()`, `numDouble()`, `numInt()`, `valueOrNull()`, `isNullOrEmpty()`, `isNotNullOrEmpty()`.

**On `Uint8List`** (`Base64BytesExtensions`): `toBase64()`, `toBase64Url()`,
`toBase64WithoutPadding()`.

## 2. Number extensions  (`utils/extensions/number_extension.dart`)

**On `int`** (`IntExtesion`): `subtractClamping(...)`, `toKMB()`, `rial(...)`, `separate3By3(...)`,
`toman(...)`, `rialToToman(...)`, `secondsToTimeLeft()`, `getMonthName(isJalali)`; getters
`jalaliMonthName`, `gregorianMonthName`.
**On `int?`** (`OptionalIntExtension`): `rial(...)`, `toman(...)`, `rialToToman(...)`,
`toStringOrEmptyIfNull()`.
**On `double`** (`DoubleExtionsion`): `toStringAsSmartRound(...)`, `toSafeInt(...)`.
**On `double?`** (`OptionalDoubleExtension`): `rial(...)`, `toman(...)`,
`rialToTomanMoneyPersian(...)`, `toStringOrEmptyIfNull()`.
**On `num`** (`NumExtension`, in string_extension.dart): `toBKMG()`.

## 3. Date extensions  (`utils/extensions/date_extension.dart`)

**On `DateTime`** (`DateTimeExtensions`): `formatDate(dateFormat)`, `utcNow()`, `utcNowIso()`,
`toJalaliDateTime()`, `toJalaliDate()`, `toJalali()`, `toTimeAgo(...)`.

## 4. Iterable / Map extensions  (`utils/extensions/iterable_extension.dart`, `map_extension.dart`)

**On `Iterable<T>`** (`GenericIterableExtensions`): `mapIndexed(f)`, `forEachIndexed(action)`,
`insertFirstReturn(item)`, `getFirstIfExist()`, `firstOrDefault(...)`, `takeIfPossible(range)`,
`containsAll(list)`, `containsAny(list)`, `alternative(main,replace)`, `addAndReturn(t)`,
`addAllAndReturn(t)`, `insertAndReturn(index,t)`.
**On `Iterable<T>?`** (`NullableIterableExtensions`): `isNullOrEmpty()`, `isNotNullOrEmpty()`,
`containsAll(list)`.
**On `Map<K,V>`** (`MapAddExtension`): `add(key, value)` — chainable, returns the map.

## 5. Widget extensions  (`utils/extensions/widget_extension.dart`)

**On `Widget`** (`WidgetsExtension`) — chainable layout sugar:
Padding: `pAll(p)`, `pSymmetric(...)`, `pOnly(...)`, `pZero`.
Sizing/flex: `fit(...)`, `expanded(...)`, `scale(s)`, `translate(offset)`, `rotate(s)`.
Gestures: `onTap(cb)`, `onPress(...)`, `onTapInk(cb)`, `onLongPress(cb)`, `onDoubleTap(cb)`,
`showMenus(items)`.
Direction/struct: `ltr()`, `rtl()`, `safeArea()`, `form(key)`, `scrollable(...)`,
`fadeSlideIn(...)`,
`container(...)`, `card(...)`.
Alignment: `alignAtCenter(...)`, `alignAtTopLeft(...)`, `alignAtTopCenter(...)`,
`alignAtTopRight(...)`,
`alignAtCenterLeft(...)`, `alignAtCenterRight(...)`, `alignAtBottomLeft(...)`,
`alignAtBottomCenter(...)`,
`alignAtBottomRight(...)`, `alignXY(x,y,...)`, `alignAtLERP(a,b,t,...)`.

---

## 6. UI Components  (`components/*.dart`)

Use these instead of raw Flutter widgets. Constructor param names shown; grep the file for full
signature.

### Text  (`u_text.dart`) — prefer over raw `Text`

`UTextDisplayLarge/Medium/Small`, `UTextHeadlineLarge/Medium/Small`, `UTextTitleLarge/Medium/Small`,
`UTextBodyLarge/Medium/Small`, `UTextLabelLarge/Medium/Small` — all take
`(text, color, fontSize, fontWeight, fontStyle, fontFamily, letterSpacing, height, decoration,
textAlign, maxLines, overflow, ...)`. Also `UAnimatedCounter(value, builder, duration)`.

### Buttons  (`u_button.dart`)

`UButton(title, type, onTap, onLongPress, icon, iconPosition, width, height, textStyle, backgroundColor, ...)`,
`UButtonSubmitCancel(onSubmit, onCancel, submitTitle, cancelTitle)`,
`UPressable(child, onTap, pressedScale, duration)`.
Enums: `UButtonType`, `UButtonIconPosition`.

### Text fields  (`u_text_field.dart`)

`UTextField(text, labelText, hintText, controller, validator, prefix, suffix, onChanged, onSave, ...)`,
`UDropDownField(initialValue, items, onChanged, ...)`,
`UTextFieldDatePicker(onChange, initialDate, startYear, endYear, ...)`,
`UTextFieldAutoComplete(items, labelBuilder, onChanged, selectedItem, ...)`,
`UTextFieldAutoCompleteAsync(labelBuilder, onChanged, fetchData, debounceDuration, ...)`,
`UTextFieldPhoneNumber(pickerMode, onChanged)`. Formatter:
`UCurrencyInputFormatter(thousandSeparator, decimalSeparator, maxDigits)` (
`u_text_field_formatter.dart`). Enums: `CountryPickerMode`; data: `PhoneNumberData`.

### Layout containers  (`container.dart`)

`UScaffold(body, appBar, drawer, floatingActionButton, bottomNavigationBar, padding, ...)`,
`UContainer(child, padding, margin, color, gradient, border, radius, boxShadow, width, height, ...)`,
`UColumn(children, spacing, mainAxisAlignment, divider, flexFactors, padding, radius, border, ...)`,
`URow(...)` (same as UColumn), `UCard(child, elevation, color, borderRadius, onTap, ...)`,
`UListView(itemBuilder, itemCount, header, footer, physics, shrinkWrap, ...)`,
`UDefaultTabBar(children, tabBar, controller, ...)`, `UIconTextHorizontal(...)`,
`UIconTextVertical(...)`.

### Images & media

`UImage(source, fileData, fit, borderRadius, placeholder, ...)`, `UImageAsset`, `UImageNetwork`,
`UImageFile`, `UImageMemory`, `UIconPrimary` (`image.dart`); `CachedNetworkImage` (
`cached_image.dart`);
`UImageViewer(fileData, heroTag, minScale, maxScale, ...)`, `BetterImageViewer`,
`ImageGalleryViewer` (`u_image_viewer.dart`);
`USlider(images, height, autoPlayDuration, withIndicator, ...)` carousel (`u_slider.dart`).

### Navigation chrome

`USideMenu` + `UMenuItem`/`UMenuGroup`/`UMenuHeader`/`USideMenuController`/`USideMenuTheme` (
`u_side_menu.dart`);
simpler `USideMenu(items)` + `USideMenuItem` (`u_sidemenu.dart`);
`UTabBar(tabs, selectedIndex, onSelect, theme, enableReorder, ...)` + `UTab`/`UTabBarTheme` (
`u_tab_bar.dart`);
`USegmentedControl(items, selectedValue, onValueChanged, ...)` (`segmented_control.dart`);
`UChipChoice(options, selected, onChanged, isMultiChoice, ...)` (`chip_choice.dart`).

### Inputs / pickers

`UOtpField(controller, length, onCompleted, ...)` (`otp_field.dart`);
`UFilePicker(onFilesChanged, allowMultipleSelection, fileType, ...)` (`file_picker.dart`);
`JalaliDatePickerDialog` (`persian_date_picker.dart`);
`UDropDown`: `UCategorySelector(onCategorySelected, ...)`, `UCountryProvincePicker(...)` (
`u_drop_down.dart`);
`RatingBar(onRatingUpdate, maxRating, allowHalfRating, ...)` + `RatingBarIndicator` (
`rating_bar.dart`);
`USlider` (above); `UNumberPagination(currentPage, totalPages, onPageChanged, ...)` (
`number_pagination.dart`).

### Data viz

`UCartesianChart(series, primaryXAxisTitle, primaryYAxisTitle, ...)` (`chart.dart`);
`UGauge(value, min, max, ranges, annotations, ...)` + `UGaugeRange`/`UGaugeAnnotation` (
`gauge.dart`);
`UBarcode(value, type, errorCorrectionLevel, ...)` QR/barcode (`barcode_qrcode.dart`);
`CircularPercentIndicator`/`LinearPercentIndicator` (`percent_indicator.dart`);
`UJsonViewer(jsonString, fontSize, padding)` (`json_viewer.dart`).

### Misc widgets

`UChat(messages, outgoingUserId, ...)` (`chat.dart`);
`UMap(controller, center, zoom, markers, ...)` + `UMapTileProvider` (`map.dart`);
`UlWebView(initialUrl, onUrlChanged, ...)` (`webview.dart`); `UCreditCard`: `CreditCardWidget`/
`CreditCardForm`/`CardBrandDetector` (`u_credit_card.dart`);
`USendAgainCountDown(counter, onSendAgainTap, ...)` (`count_down_timer.dart`); `FlipCard`/
`UAnimationCard` (`flip_card.dart`);
`ReadMoreText(data, trimMode, trimLines, ...)` (`readmore.dart`); `ScrollingText(text, ...)`
marquee (`scrolling_text.dart`);
`BadgeWidget`/`BadgePositioned` (`badges.dart`); `WidgetToImage`/`WidgetToImageController` (
`widget_to_image.dart`).

---

## 7. Utility classes  (`utils/*.dart`)

| Class               | Purpose                        | Key static members                                                                                                                                                                                                                                         |
|---------------------|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `UApp`              | Device/platform/theme info     | `isAndroid/isIos/isWeb/isMacOs/isWindows/isLinux`, `isMobile/isDesktop`, `isDarkMode`, `isTablet()`, `size`, `theme`, `colorScheme`, `textTheme`, `locale()`, `updateLocale(l)`, `switchTheme(...)`                                                        |
| `ULocalStorage`     | SharedPreferences wrapper      | `init()`, `set(k,v)`, `getInt/getString/getBool/getDouble/getStringList`, `setToken/getToken/hasToken`, `setLocale/getLocale`, `setDarkMode/isDarkMode`, `setUserId/getUserId`, `remove(k)`, `clear()`, `getIfNotExpired(k)`                               |
| `UFileStorage`      | File-based storage             | `init()`, `setBytes/getBytes/getBytesSync`, `setJson/getJson`, `setString/getString`, `fileExists`, `totalStorageUsed()`, `copyFile(...)`                                                                                                                  |
| `UNavigator`        | Routing & dialogs              | `push/off/offAll/back`, `dialog/dialogResponsive/fullScreenDialog`, `confirm(...)`, `bottomSheet/draggableSheet`, `inputDialog(...)`, `colorPicker(...)`, `showOverlay/dismissOverlay`                                                                     |
| `UHttpClient`       | Low-level HTTP                 | `send(method, endpoint, body, onSuccess, onError, onException)`, `upload(...)`, `multipartFileFromFile/FromUint8List`. Response: `UHttpClientResponse` (`isSuccessful/isError/isException`). Ext `HTTP` on `Response?`: `isSuccessful()`, `prettyLog(...)` |
| `UDownload`         | File download w/ retry+cancel  | `downloadFile(...)`, `isDownloading(key)`, `cancelDownload(key)`                                                                                                                                                                                           |
| `ULaunch`           | External intents               | `launchURL`, `launchWhatsApp`, `launchMap`, `launchTelegram`, `launchInstagram`, `call`, `sms`, `email`, `shareText/shareFile`, `shareWith{Telegram,Whatsapp,Email}`                                                                                       |
| `UToast`            | Snackbars                      | `snackBar(...)`, `error(...)`                                                                                                                                                                                                                              |
| `ULoading`          | Global loading overlay         | `initialize(...)`, `show(...)`, `dismiss()`, `isShowing()`                                                                                                                                                                                                 |
| `UFile`             | Pick/crop files                | `showImagePicker(...)`, `showFilePicker(...)`, `cropImage(...)`, `writeToFile(data)`. Data class: `FileData(path, bytes, extension, url, id, tags, children)`                                                                                              |
| `ULocation`         | GPS                            | `getUserLocation(...)` → `Position?`                                                                                                                                                                                                                       |
| `UNetwork`          | Connectivity                   | `hasNetworkConnection()`, `hasWifi/hasCellular/hasVpn/hasEthernet/hasBluetooth()`                                                                                                                                                                          |
| `ULocalAuth`        | Biometrics                     | `canAuthenticate()`, `availableBiometrics()`, `authenticate(...)`                                                                                                                                                                                          |
| `UNotification`     | Local notifications            | `showNotification(...)`                                                                                                                                                                                                                                    |
| `UEncryption`       | AES encrypt/decrypt            | `encryptString`, `decryptString`, `encryptUint8List`, `decryptUint8List`                                                                                                                                                                                   |
| `UClipboard`        | Clipboard                      | `set(text)`, `getText()`                                                                                                                                                                                                                                   |
| `UUUID`             | UUID generation                | `uuidV1/V4/V5/V6/V7/V8(...)`                                                                                                                                                                                                                               |
| `UValidators`       | Form validators                | `required`, `minLength`, `maxLength`, `exactLength`, `email`, `phone`, `number`, `numberRange`, `url`, `password`, `complexPassword`, `alphanumeric`, `iranianNationalCode`, `pattern`, `match`, `combineValidators`, `validateForm(...)`                  |
| `UCrashlytics`      | Error reporting                | `initialize(...)`, `reportError(error, stack)`                                                                                                                                                                                                             |
| `UFonts`            | Persian font TextStyles/Themes | `vazir`, `samim`, `shabnam`, `sahel`, `yekan`, `iranSansFaNum` (+ `*TextTheme`)                                                                                                                                                                            |
| `UConstants`        | Storage keys                   | `token`, `userId`, `locale`, `isDarkMode`                                                                                                                                                                                                                  |
| `USample`           | Lorem/placeholder data         | `lorem`, `persianLorem`, `profileImageUrl`, `videoUrl`, `loremPicsum(...)`                                                                                                                                                                                 |
| `Debouncer`         | Debounce                       | `Debouncer(delay)`, `run(action)`, `cancel()`, `dispose()`                                                                                                                                                                                                 |
| `UControllerMixin`  | GetX controller helpers        | `okCallback(msg, reload)`, `errorCallBack(msg, reload)`                                                                                                                                                                                                    |
| `UUpdateDialog`     | Force/optional app update      | `checkAndShow(...)`. Data: `UUpdateResponse`, `Os`                                                                                                                                                                                                         |
| `UPhoneNumberUtils` | Phone normalize                | `normalizePhone(raw, ...)`                                                                                                                                                                                                                                 |
| `PersianTools`      | Iranian helpers                | `validateNationalCode`, `validateCardNumber`, `getBankNameFromCard`, `isShebaValid`, `getBankFromSheba`, `numberToWords`, `wordsToNumberString`, `convertDigits`, `getPhoneDetails`, `formatPhoneNumber`, `formatCardNumber`, `isPersian/hasPersian`       |

### Top-level helpers

`delay(milliseconds, action)` — `Future` delayed callback (`u_utils.dart`).
Global: `navigatorKey` (GlobalKey<NavigatorState>).

### Shamsi / Jalali date  (`utils/u_shamsi.dart`)

`Jalali`, `Gregorian` (interconvert via `.toJalali()` / `.toGregorian()` / `.toDateTime()`). Ext
`JalaliExt`:
`formatFullDate()`, `formatCompactDate()`, `formatDateTime()`, `formatCustom(pattern)`,
`formatShortDate()`,
`formatMonthYear()`, `formatAfghanDate()`, `formatTime()`, `isToday()`, `isThisMonth()`,
`firstDayOfMonth()`,
`lastDayOfMonth()`, `nextDay()`, `previousDay()`, `startOfWeek()`, `endOfWeek()`, `daysUntil(o)`,
`isWeekend()`, `addDays/addHours/addMinutes/addSeconds`, `quarter`, month/weekday constants.

### PageState  (`utils/u_constants.dart`)

Enum `PageState`. Ext on `PageState` and `Rx<PageState>`:
`isInitial/isLoading/isLoaded/isError/isPaging/isEmpty()`
and setters `initial()/loading()/loaded()/error()/paging()/emptying()`.

---

## 8. Data layer — API services  (`data/services/*.dart`)

Call as
`UServices.<area>.<method>(p: <Params>, onOk: (r){...}, onError: (e){...}, onException: (s){...})`.
Every method returns `Future<UHttpClientResponse>`. Responses wrap in `UResponse<T>` /
`UEmptyResponse`.

| `UServices.`     | Methods                                                                                                                                                      |
|------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `auth`           | register, login, refreshToken, getVerificationCodeForLogin, verifyCodeForLogin, completeProfile                                                              |
| `user`           | create, bulkCreate, read, readById, update, delete, downloadUserData                                                                                         |
| `product`        | create, bulkCreate, read, readById, update, delete, deleteRange                                                                                              |
| `category`       | create, bulkCreate, read, readById, update, delete                                                                                                           |
| `content`        | create, read, update, delete                                                                                                                                 |
| `comment`        | create, read, readById, update, delete, readProductCommentCount, readUserCommentCount                                                                        |
| `media`          | create, read, update, delete, deleteRange                                                                                                                    |
| `follow`         | follow, unfollow, readFollowers, readFollowedUsers/Products/Categories, readFollowerFollowingCount, isFollowing{User,Product,Category}                       |
| `wallet`         | charge, transfer, purchase, readByUserId, readTxn                                                                                                            |
| `txn`            | create, read, update, delete                                                                                                                                 |
| `ipg`            | pay                                                                                                                                                          |
| `bankAccount`    | create, read, update, delete                                                                                                                                 |
| `address`        | create, read, update, delete                                                                                                                                 |
| `notification`   | create, read, update, delete                                                                                                                                 |
| `merchant`       | create, read, readById, delete                                                                                                                               |
| `terminal`       | create, bulkCreate, read, assign, delete, update, readSupportPassword, import                                                                                |
| `sim`            | create, read, update, delete                                                                                                                                 |
| `chargeInternet` | pin, topup, internetList, internetReserve, getStatus, getBalance, echo                                                                                       |
| `inquiry`        | zipCodeToAddressDetail, vehicleViolationDetail, drivingLicenceDetail, licencePlateDetail, drivingLicenceNegativePoint, freewayTolls, iBanToBankAccountDetail |
| `vehicle`        | create, read, update, delete                                                                                                                                 |
| `parking`        | createParking, readParking, updateParking, deleteParking, +ParkingReport CRUD                                                                                |
| `hotel`          | full CRUD for Hotel, HotelRoom, Dorm, DormRoom, DormBed, DormBedContract, DormBedInvoice, payDormBedInvoice                                                  |
| `ticket`         | create, read, update, delete                                                                                                                                 |
| `chatBot`        | create, read                                                                                                                                                 |
| `accounting`     | report                                                                                                                                                       |
| `dashboard`      | readSystemMetrics, read                                                                                                                                      |
| `appSettings`    | read                                                                                                                                                         |
| `process`        | get, send                                                                                                                                                    |

**Params** (`data/params/*.dart`): one `*Params` class per call, e.g. `ULoginParams`,
`UProductCreateParams`,
`UProductReadParams`, `UUserUpdateParams`, `UCategoryReadParams`, `UWalletChargeParams`, etc. Base:
`UBaseParams`, `UIdParams`, `UIdListParams`. Selector args: `*SelectorArgs` (
`data/params/selectors.dart`).

**Responses** (`data/responses/*.dart`): `UResponse<T>` (generic envelope: `result`, etc.),
`UEmptyResponse`,
plus typed bodies `UUserResponse`, `UProductResponse`, `UCategoryResponse`, `ULoginResponse`,
`UContentResponse`, `UWalletResponse`, etc. (one per area).

---

## 9. Enums  (`enums.dart`) — 43 total

`Usc` (status codes, with `titleFa`/`titleEn`/`number`), `TagOrderBy`, and 40+ `Tag*` enums:
`TagUser`, `TagCategory`, `TagMedia`, `TagProduct`, `TagComment`, `TagReaction`, `TagFollow`,
`TagContent`,
`TagTicket`, `TagTxn`, `TagParking`, `TagVehicle`, `TagAddress`, `TagWallet`, `TagWalletTxn`,
`TagTerminal`,
`TagBankAccount`, `TagIpg`, `TagMpg`, `TagPayment`, `TagInquiryHistory`, `TagNotification`,
`TagVas`,
`TagSimOperator`, `TagMerchant`, `TagFieldType`, `TagTextFieldType`, `TagFileFieldType`,
`TagProcessStatus`,
`TagProcessStepStatus`, `TagHotel`, `TagDorm`, `TagRoom`, `TagDormRoom`, `TagDormBed`, `TagBed`,
etc.
Most mix in `NumericIdentifiable` (have `titleFa`, `titleEn`, `number`).

## 10. Models  (`models/*.dart`)

`UBusinessCategory`, `UCountry`, `UProvince`, `UCity`.

---

## How to use this index

1. **Grep first.** Searching for what you need? `grep -ri "<keyword>" CAPABILITIES.md` then jump to
   the
   named source file for the full signature.
2. **Reuse, don't recreate.** If a function/widget/service here covers the need, use it — never
   hand-roll a duplicate (no raw `Text` when `UText*` exists, no manual `http` when a `UServices`
   method exists, no custom date formatting when Jalali/string extensions exist).
3. **Regenerate** this file whenever the package changes (new components/services/extensions).
