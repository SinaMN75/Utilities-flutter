// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Created`
  String get created {
    return Intl.message('Created', name: 'created', desc: '', args: []);
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter`
  String get enter {
    return Intl.message('Enter', name: 'enter', desc: '', args: []);
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message('Dashboard', name: 'dashboard', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Error Fetching Categories`
  String get errorFetchingCategories {
    return Intl.message(
      'Error Fetching Categories',
      name: 'errorFetchingCategories',
      desc: '',
      args: [],
    );
  }

  /// `Categories Not Found`
  String get categoriesNotFound {
    return Intl.message(
      'Categories Not Found',
      name: 'categoriesNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message('Code', name: 'code', desc: '', args: []);
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Subtitle`
  String get subtitle {
    return Intl.message('Subtitle', name: 'subtitle', desc: '', args: []);
  }

  /// `Created At`
  String get createdAt {
    return Intl.message('Created At', name: 'createdAt', desc: '', args: []);
  }

  /// `Operations`
  String get operations {
    return Intl.message('Operations', name: 'operations', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Add Rooms`
  String get addRooms {
    return Intl.message('Add Rooms', name: 'addRooms', desc: '', args: []);
  }

  /// `Create`
  String get create {
    return Intl.message('Create', name: 'create', desc: '', args: []);
  }

  /// `Deposit`
  String get deposit {
    return Intl.message('Deposit', name: 'deposit', desc: '', args: []);
  }

  /// `Rent`
  String get rent {
    return Intl.message('Rent', name: 'rent', desc: '', args: []);
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Contracts`
  String get contracts {
    return Intl.message('Contracts', name: 'contracts', desc: '', args: []);
  }

  /// `Error reading Data`
  String get errorReadingData {
    return Intl.message(
      'Error reading Data',
      name: 'errorReadingData',
      desc: '',
      args: [],
    );
  }

  /// `No Contract Found`
  String get noContractFound {
    return Intl.message(
      'No Contract Found',
      name: 'noContractFound',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message('Start Date', name: 'startDate', desc: '', args: []);
  }

  /// `End Date`
  String get endDate {
    return Intl.message('End Date', name: 'endDate', desc: '', args: []);
  }

  /// `Filter Contracts`
  String get filterContracts {
    return Intl.message(
      'Filter Contracts',
      name: 'filterContracts',
      desc: '',
      args: [],
    );
  }

  /// `Created Date`
  String get createdDate {
    return Intl.message(
      'Created Date',
      name: 'createdDate',
      desc: '',
      args: [],
    );
  }

  /// `Accenting`
  String get accenting {
    return Intl.message('Accenting', name: 'accenting', desc: '', args: []);
  }

  /// `Descending`
  String get descending {
    return Intl.message('Descending', name: 'descending', desc: '', args: []);
  }

  /// `Clear Filters`
  String get clearFilters {
    return Intl.message(
      'Clear Filters',
      name: 'clearFilters',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Please Create a Product before Signing a Contract`
  String get pleaseCreateAProductBeforeSigningAContract {
    return Intl.message(
      'Please Create a Product before Signing a Contract',
      name: 'pleaseCreateAProductBeforeSigningAContract',
      desc: '',
      args: [],
    );
  }

  /// `National Code`
  String get nationalCode {
    return Intl.message(
      'National Code',
      name: 'nationalCode',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Error Reading Dashboard Data`
  String get errorReadingDashboardData {
    return Intl.message(
      'Error Reading Dashboard Data',
      name: 'errorReadingDashboardData',
      desc: '',
      args: [],
    );
  }

  /// `RAM Usage`
  String get ramUsage {
    return Intl.message('RAM Usage', name: 'ramUsage', desc: '', args: []);
  }

  /// `CPU Usage`
  String get cpuUsage {
    return Intl.message('CPU Usage', name: 'cpuUsage', desc: '', args: []);
  }

  /// `HDD Usage`
  String get hddUsage {
    return Intl.message('HDD Usage', name: 'hddUsage', desc: '', args: []);
  }

  /// `Users`
  String get users {
    return Intl.message('Users', name: 'users', desc: '', args: []);
  }

  /// `Exams`
  String get exams {
    return Intl.message('Exams', name: 'exams', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Recently Joined`
  String get recentlyJoined {
    return Intl.message(
      'Recently Joined',
      name: 'recentlyJoined',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Active Users`
  String get monthlyActiveUsers {
    return Intl.message(
      'Monthly Active Users',
      name: 'monthlyActiveUsers',
      desc: '',
      args: [],
    );
  }

  /// `Invoices`
  String get invoices {
    return Intl.message('Invoices', name: 'invoices', desc: '', args: []);
  }

  /// `No Invoice Found`
  String get noInvoiceFound {
    return Intl.message(
      'No Invoice Found',
      name: 'noInvoiceFound',
      desc: '',
      args: [],
    );
  }

  /// `Filter Invoices`
  String get filterInvoices {
    return Intl.message(
      'Filter Invoices',
      name: 'filterInvoices',
      desc: '',
      args: [],
    );
  }

  /// `User Categories`
  String get userCategories {
    return Intl.message(
      'User Categories',
      name: 'userCategories',
      desc: '',
      args: [],
    );
  }

  /// `Dorms`
  String get dorms {
    return Intl.message('Dorms', name: 'dorms', desc: '', args: []);
  }

  /// `Exam Categories`
  String get examCategories {
    return Intl.message(
      'Exam Categories',
      name: 'examCategories',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Logs`
  String get logs {
    return Intl.message('Logs', name: 'logs', desc: '', args: []);
  }

  /// `Product Categories`
  String get productCategories {
    return Intl.message(
      'Product Categories',
      name: 'productCategories',
      desc: '',
      args: [],
    );
  }

  /// `Questionnaire`
  String get questionnaire {
    return Intl.message(
      'Questionnaire',
      name: 'questionnaire',
      desc: '',
      args: [],
    );
  }

  /// `No Product Found`
  String get noProductFound {
    return Intl.message(
      'No Product Found',
      name: 'noProductFound',
      desc: '',
      args: [],
    );
  }

  /// `Dorm`
  String get dorm {
    return Intl.message('Dorm', name: 'dorm', desc: '', args: []);
  }

  /// `Room`
  String get room {
    return Intl.message('Room', name: 'room', desc: '', args: []);
  }

  /// `Filter Products`
  String get filterProducts {
    return Intl.message(
      'Filter Products',
      name: 'filterProducts',
      desc: '',
      args: [],
    );
  }

  /// `Please Create a Category before creating a Product.`
  String get pleaseCreateACategoryBeforeCreatingAProduct {
    return Intl.message(
      'Please Create a Category before creating a Product.',
      name: 'pleaseCreateACategoryBeforeCreatingAProduct',
      desc: '',
      args: [],
    );
  }

  /// `Users Management`
  String get usersManagement {
    return Intl.message(
      'Users Management',
      name: 'usersManagement',
      desc: '',
      args: [],
    );
  }

  /// `No User Found`
  String get noUserFound {
    return Intl.message(
      'No User Found',
      name: 'noUserFound',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Joined Date`
  String get joinedDate {
    return Intl.message('Joined Date', name: 'joinedDate', desc: '', args: []);
  }

  /// `Filter Users`
  String get filterUsers {
    return Intl.message(
      'Filter Users',
      name: 'filterUsers',
      desc: '',
      args: [],
    );
  }

  /// `From Date`
  String get fromDate {
    return Intl.message('From Date', name: 'fromDate', desc: '', args: []);
  }

  /// `To Date`
  String get toDate {
    return Intl.message('To Date', name: 'toDate', desc: '', args: []);
  }

  /// `Tags`
  String get tags {
    return Intl.message('Tags', name: 'tags', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Update functionality would go here`
  String get updateFunctionalityWouldGoHere {
    return Intl.message(
      'Update functionality would go here',
      name: 'updateFunctionalityWouldGoHere',
      desc: '',
      args: [],
    );
  }

  /// `Exam created successfully!`
  String get examCreatedSuccessfully {
    return Intl.message(
      'Exam created successfully!',
      name: 'examCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete`
  String get confirmDelete {
    return Intl.message(
      'Confirm Delete',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this exam?`
  String get areYouSureYouWantToDeleteThisExam {
    return Intl.message(
      'Are you sure you want to delete this exam?',
      name: 'areYouSureYouWantToDeleteThisExam',
      desc: '',
      args: [],
    );
  }

  /// `Exam deleted successfully!`
  String get examDeletedSuccessfully {
    return Intl.message(
      'Exam deleted successfully!',
      name: 'examDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Option title and score are required`
  String get optionTitleAndScoreAreRequired {
    return Intl.message(
      'Option title and score are required',
      name: 'optionTitleAndScoreAreRequired',
      desc: '',
      args: [],
    );
  }

  /// `Add Question`
  String get addQuestion {
    return Intl.message(
      'Add Question',
      name: 'addQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Edit Question`
  String get editQuestion {
    return Intl.message(
      'Edit Question',
      name: 'editQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Question Title`
  String get questionTitle {
    return Intl.message(
      'Question Title',
      name: 'questionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Description (Optional)`
  String get descriptionOptional {
    return Intl.message(
      'Description (Optional)',
      name: 'descriptionOptional',
      desc: '',
      args: [],
    );
  }

  /// `Options:`
  String get options {
    return Intl.message('Options:', name: 'options', desc: '', args: []);
  }

  /// `Score: ${option.score}`
  String get scoreOptionscore {
    return Intl.message(
      'Score: \${option.score}',
      name: 'scoreOptionscore',
      desc: '',
      args: [],
    );
  }

  /// `Option Title`
  String get optionTitle {
    return Intl.message(
      'Option Title',
      name: 'optionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hint (Optional)`
  String get hintOptional {
    return Intl.message(
      'Hint (Optional)',
      name: 'hintOptional',
      desc: '',
      args: [],
    );
  }

  /// `Score`
  String get score {
    return Intl.message('Score', name: 'score', desc: '', args: []);
  }

  /// `Add Option`
  String get addOption {
    return Intl.message('Add Option', name: 'addOption', desc: '', args: []);
  }

  /// `Question title and at least one option are required`
  String get questionTitleAndAtLeastOneOptionAreRequired {
    return Intl.message(
      'Question title and at least one option are required',
      name: 'questionTitleAndAtLeastOneOptionAreRequired',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Upload Failed`
  String get uploadFailed {
    return Intl.message(
      'Upload Failed',
      name: 'uploadFailed',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }

  /// `No Exam Found`
  String get noExamFound {
    return Intl.message(
      'No Exam Found',
      name: 'noExamFound',
      desc: '',
      args: [],
    );
  }

  /// `Edit Exam`
  String get editExam {
    return Intl.message('Edit Exam', name: 'editExam', desc: '', args: []);
  }

  /// `New Exam`
  String get newExam {
    return Intl.message('New Exam', name: 'newExam', desc: '', args: []);
  }

  /// `Required`
  String get required {
    return Intl.message('Required', name: 'required', desc: '', args: []);
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Choose A Category`
  String get chooseACategory {
    return Intl.message(
      'Choose A Category',
      name: 'chooseACategory',
      desc: '',
      args: [],
    );
  }

  /// `Point Details`
  String get pointDetails {
    return Intl.message(
      'Point Details',
      name: 'pointDetails',
      desc: '',
      args: [],
    );
  }

  /// `Add Point Detail`
  String get addPointDetail {
    return Intl.message(
      'Add Point Detail',
      name: 'addPointDetail',
      desc: '',
      args: [],
    );
  }

  /// `Questions`
  String get questions {
    return Intl.message('Questions', name: 'questions', desc: '', args: []);
  }

  /// `Beds`
  String get beds {
    return Intl.message('Beds', name: 'beds', desc: '', args: []);
  }

  /// `Edited`
  String get edited {
    return Intl.message('Edited', name: 'edited', desc: '', args: []);
  }

  /// `Are You Sure You Want To Delete`
  String get areYouSureYouWantToDelete {
    return Intl.message(
      'Are You Sure You Want To Delete',
      name: 'areYouSureYouWantToDelete',
      desc: '',
      args: [],
    );
  }

  /// `Deleted`
  String get deleted {
    return Intl.message('Deleted', name: 'deleted', desc: '', args: []);
  }

  /// `Submitted`
  String get submitted {
    return Intl.message('Submitted', name: 'submitted', desc: '', args: []);
  }

  /// `Error Submitting Form`
  String get errorSubmittingForm {
    return Intl.message(
      'Error Submitting Form',
      name: 'errorSubmittingForm',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load log structure`
  String get failedToLoadLogStructure {
    return Intl.message(
      'Failed to load log structure',
      name: 'failedToLoadLogStructure',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load log content`
  String get failedToLoadLogContent {
    return Intl.message(
      'Failed to load log content',
      name: 'failedToLoadLogContent',
      desc: '',
      args: [],
    );
  }

  /// `Select a Color`
  String get selectAColor {
    return Intl.message(
      'Select a Color',
      name: 'selectAColor',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Due Date`
  String get dueDate {
    return Intl.message('Due Date', name: 'dueDate', desc: '', args: []);
  }

  /// `Amount`
  String get amount {
    return Intl.message('Amount', name: 'amount', desc: '', args: []);
  }

  /// `This field is required.`
  String get requiredMessage {
    return Intl.message(
      'This field is required.',
      name: 'requiredMessage',
      desc: '',
      args: [],
    );
  }

  /// `This field is invalid.`
  String get invalidMessage {
    return Intl.message(
      'This field is invalid.',
      name: 'invalidMessage',
      desc: '',
      args: [],
    );
  }

  /// `Debt`
  String get debt {
    return Intl.message('Debt', name: 'debt', desc: '', args: []);
  }

  /// `Creditor`
  String get creditor {
    return Intl.message('Creditor', name: 'creditor', desc: '', args: []);
  }

  /// `Penalty`
  String get penalty {
    return Intl.message('Penalty', name: 'penalty', desc: '', args: []);
  }

  /// `Paid`
  String get paid {
    return Intl.message('Paid', name: 'paid', desc: '', args: []);
  }

  /// `Tracking Number`
  String get trackingNumber {
    return Intl.message(
      'Tracking Number',
      name: 'trackingNumber',
      desc: '',
      args: [],
    );
  }

  /// `Paid Date`
  String get paidDate {
    return Intl.message('Paid Date', name: 'paidDate', desc: '', args: []);
  }

  /// `This User does not have an Active Contract.`
  String get thisUserDoesNotHaveAnActiveContract {
    return Intl.message(
      'This User does not have an Active Contract.',
      name: 'thisUserDoesNotHaveAnActiveContract',
      desc: '',
      args: [],
    );
  }

  /// `Birthdate`
  String get birthdate {
    return Intl.message('Birthdate', name: 'birthdate', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Admin`
  String get admin {
    return Intl.message('Admin', name: 'admin', desc: '', args: []);
  }

  /// `Guest`
  String get guest {
    return Intl.message('Guest', name: 'guest', desc: '', args: []);
  }

  /// `Father Name`
  String get fatherName {
    return Intl.message('Father Name', name: 'fatherName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Delete User`
  String get deleteUser {
    return Intl.message('Delete User', name: 'deleteUser', desc: '', args: []);
  }

  /// `Are you sure to Delete this User?`
  String get areYouSureToDeleteThisUser {
    return Intl.message(
      'Are you sure to Delete this User?',
      name: 'areYouSureToDeleteThisUser',
      desc: '',
      args: [],
    );
  }

  /// `User created successfully`
  String get userCreatedSuccessfully {
    return Intl.message(
      'User created successfully',
      name: 'userCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fa'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
