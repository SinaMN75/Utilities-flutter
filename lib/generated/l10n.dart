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

  /// `Contract`
  String get contract {
    return Intl.message('Contract', name: 'contract', desc: '', args: []);
  }

  /// `Invoice`
  String get invoice {
    return Intl.message('Invoice', name: 'invoice', desc: '', args: []);
  }

  /// `Create Contract`
  String get createContract {
    return Intl.message(
      'Create Contract',
      name: 'createContract',
      desc: '',
      args: [],
    );
  }

  /// `Edit Contract`
  String get editContract {
    return Intl.message(
      'Edit Contract',
      name: 'editContract',
      desc: '',
      args: [],
    );
  }

  /// `Create Invoice`
  String get createInvoice {
    return Intl.message(
      'Create Invoice',
      name: 'createInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Edit Invoice`
  String get editInvoice {
    return Intl.message(
      'Edit Invoice',
      name: 'editInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Tenant`
  String get tenant {
    return Intl.message('Tenant', name: 'tenant', desc: '', args: []);
  }

  /// `Bed`
  String get bed {
    return Intl.message('Bed', name: 'bed', desc: '', args: []);
  }

  /// `Contract Type`
  String get contractType {
    return Intl.message(
      'Contract Type',
      name: 'contractType',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Type`
  String get invoiceType {
    return Intl.message(
      'Invoice Type',
      name: 'invoiceType',
      desc: '',
      args: [],
    );
  }

  /// `Single Invoice`
  String get singleInvoice {
    return Intl.message(
      'Single Invoice',
      name: 'singleInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Daily Penalty %`
  String get penaltyPercent {
    return Intl.message(
      'Daily Penalty %',
      name: 'penaltyPercent',
      desc: '',
      args: [],
    );
  }

  /// `Pay Invoice`
  String get payInvoice {
    return Intl.message('Pay Invoice', name: 'payInvoice', desc: '', args: []);
  }

  /// `Mark as Paid`
  String get markAsPaid {
    return Intl.message('Mark as Paid', name: 'markAsPaid', desc: '', args: []);
  }

  /// `Mark this invoice as fully paid?`
  String get payInvoiceConfirm {
    return Intl.message(
      'Mark this invoice as fully paid?',
      name: 'payInvoiceConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Invoice marked as paid`
  String get invoicePaidSuccessfully {
    return Intl.message(
      'Invoice marked as paid',
      name: 'invoicePaidSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `View Invoices`
  String get viewInvoices {
    return Intl.message(
      'View Invoices',
      name: 'viewInvoices',
      desc: '',
      args: [],
    );
  }

  /// `View Contracts`
  String get viewContracts {
    return Intl.message(
      'View Contracts',
      name: 'viewContracts',
      desc: '',
      args: [],
    );
  }

  /// `Remaining`
  String get remaining {
    return Intl.message('Remaining', name: 'remaining', desc: '', args: []);
  }

  /// `Paid Amount`
  String get paidAmount {
    return Intl.message('Paid Amount', name: 'paidAmount', desc: '', args: []);
  }

  /// `Debt Amount`
  String get debtAmount {
    return Intl.message('Debt Amount', name: 'debtAmount', desc: '', args: []);
  }

  /// `Penalty Amount`
  String get penaltyAmount {
    return Intl.message(
      'Penalty Amount',
      name: 'penaltyAmount',
      desc: '',
      args: [],
    );
  }

  /// `Total Debt`
  String get totalDebt {
    return Intl.message('Total Debt', name: 'totalDebt', desc: '', args: []);
  }

  /// `Total Paid`
  String get totalPaid {
    return Intl.message('Total Paid', name: 'totalPaid', desc: '', args: []);
  }

  /// `Total Remaining`
  String get totalRemaining {
    return Intl.message(
      'Total Remaining',
      name: 'totalRemaining',
      desc: '',
      args: [],
    );
  }

  /// `Total Penalty`
  String get totalPenalty {
    return Intl.message(
      'Total Penalty',
      name: 'totalPenalty',
      desc: '',
      args: [],
    );
  }

  /// `Overdue`
  String get overdue {
    return Intl.message('Overdue', name: 'overdue', desc: '', args: []);
  }

  /// `Unpaid`
  String get unpaid {
    return Intl.message('Unpaid', name: 'unpaid', desc: '', args: []);
  }

  /// `Payment Status`
  String get paymentStatus {
    return Intl.message(
      'Payment Status',
      name: 'paymentStatus',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Expired`
  String get expired {
    return Intl.message('Expired', name: 'expired', desc: '', args: []);
  }

  /// `Leasing`
  String get leasing {
    return Intl.message('Leasing', name: 'leasing', desc: '', args: []);
  }

  /// `Rent`
  String get rentInvoice {
    return Intl.message('Rent', name: 'rentInvoice', desc: '', args: []);
  }

  /// `Deposit`
  String get depositInvoice {
    return Intl.message('Deposit', name: 'depositInvoice', desc: '', args: []);
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

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Search...`
  String get search___ {
    return Intl.message('Search...', name: 'search___', desc: '', args: []);
  }

  /// `Select`
  String get select {
    return Intl.message('Select', name: 'select', desc: '', args: []);
  }

  /// `Search and Select`
  String get searchAndSelect {
    return Intl.message(
      'Search and Select',
      name: 'searchAndSelect',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountry {
    return Intl.message(
      'Select Country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Search country, code, or dial code`
  String get searchCountryCodeOrDialCode {
    return Intl.message(
      'Search country, code, or dial code',
      name: 'searchCountryCodeOrDialCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Busy`
  String get busy {
    return Intl.message('Busy', name: 'busy', desc: '', args: []);
  }

  /// `Free`
  String get free {
    return Intl.message('Free', name: 'free', desc: '', args: []);
  }

  /// `Contract Status`
  String get contractStatus {
    return Intl.message(
      'Contract Status',
      name: 'contractStatus',
      desc: '',
      args: [],
    );
  }

  /// `Active Contract`
  String get activeContract {
    return Intl.message(
      'Active Contract',
      name: 'activeContract',
      desc: '',
      args: [],
    );
  }

  /// `Select a user`
  String get selectAUser {
    return Intl.message(
      'Select a user',
      name: 'selectAUser',
      desc: '',
      args: [],
    );
  }

  /// `Paid Factors`
  String get paidFactors {
    return Intl.message(
      'Paid Factors',
      name: 'paidFactors',
      desc: '',
      args: [],
    );
  }

  /// `Due Factors`
  String get dueFactors {
    return Intl.message('Due Factors', name: 'dueFactors', desc: '', args: []);
  }

  /// `Select a Bed`
  String get selectABed {
    return Intl.message('Select a Bed', name: 'selectABed', desc: '', args: []);
  }

  /// `Connection to Network was Not possible`
  String get connectionToNetworkWasNotPossible {
    return Intl.message(
      'Connection to Network was Not possible',
      name: 'connectionToNetworkWasNotPossible',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected Error, Please try again`
  String get unexpectedErrorPleaseTryAgain {
    return Intl.message(
      'Unexpected Error, Please try again',
      name: 'unexpectedErrorPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Hotels`
  String get hotels {
    return Intl.message('Hotels', name: 'hotels', desc: '', args: []);
  }

  /// `Hotel`
  String get hotel {
    return Intl.message('Hotel', name: 'hotel', desc: '', args: []);
  }

  /// `Hotel Rooms`
  String get hotelRooms {
    return Intl.message('Hotel Rooms', name: 'hotelRooms', desc: '', args: []);
  }

  /// `Dorm Rooms`
  String get dormRooms {
    return Intl.message('Dorm Rooms', name: 'dormRooms', desc: '', args: []);
  }

  /// `Dorm Beds`
  String get dormBeds {
    return Intl.message('Dorm Beds', name: 'dormBeds', desc: '', args: []);
  }

  /// `Rooms`
  String get rooms {
    return Intl.message('Rooms', name: 'rooms', desc: '', args: []);
  }

  /// `Capacity`
  String get capacity {
    return Intl.message('Capacity', name: 'capacity', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Price / Night`
  String get pricePerNight {
    return Intl.message(
      'Price / Night',
      name: 'pricePerNight',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get available {
    return Intl.message('Available', name: 'available', desc: '', args: []);
  }

  /// `Unavailable`
  String get unavailable {
    return Intl.message('Unavailable', name: 'unavailable', desc: '', args: []);
  }

  /// `Occupied`
  String get occupied {
    return Intl.message('Occupied', name: 'occupied', desc: '', args: []);
  }

  /// `Availability`
  String get availability {
    return Intl.message(
      'Availability',
      name: 'availability',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Country`
  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  /// `No rooms found`
  String get noRoomsFound {
    return Intl.message(
      'No rooms found',
      name: 'noRoomsFound',
      desc: '',
      args: [],
    );
  }

  /// `No hotels found`
  String get noHotelsFound {
    return Intl.message(
      'No hotels found',
      name: 'noHotelsFound',
      desc: '',
      args: [],
    );
  }

  /// `No beds found`
  String get noBedsFound {
    return Intl.message(
      'No beds found',
      name: 'noBedsFound',
      desc: '',
      args: [],
    );
  }

  /// `No dorms found`
  String get noDormsFound {
    return Intl.message(
      'No dorms found',
      name: 'noDormsFound',
      desc: '',
      args: [],
    );
  }

  /// `Filter Rooms`
  String get filterRooms {
    return Intl.message(
      'Filter Rooms',
      name: 'filterRooms',
      desc: '',
      args: [],
    );
  }

  /// `Filter Hotels`
  String get filterHotels {
    return Intl.message(
      'Filter Hotels',
      name: 'filterHotels',
      desc: '',
      args: [],
    );
  }

  /// `Filter Beds`
  String get filterBeds {
    return Intl.message('Filter Beds', name: 'filterBeds', desc: '', args: []);
  }

  /// `Filter Dorms`
  String get filterDorms {
    return Intl.message(
      'Filter Dorms',
      name: 'filterDorms',
      desc: '',
      args: [],
    );
  }

  /// `Min Price`
  String get minPrice {
    return Intl.message('Min Price', name: 'minPrice', desc: '', args: []);
  }

  /// `Max Price`
  String get maxPrice {
    return Intl.message('Max Price', name: 'maxPrice', desc: '', args: []);
  }

  /// `Min Rent`
  String get minRent {
    return Intl.message('Min Rent', name: 'minRent', desc: '', args: []);
  }

  /// `Max Rent`
  String get maxRent {
    return Intl.message('Max Rent', name: 'maxRent', desc: '', args: []);
  }

  /// `Minimum Rent`
  String get minimumRent {
    return Intl.message(
      'Minimum Rent',
      name: 'minimumRent',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Rent`
  String get maximumRent {
    return Intl.message(
      'Maximum Rent',
      name: 'maximumRent',
      desc: '',
      args: [],
    );
  }

  /// `Create Room`
  String get createRoom {
    return Intl.message('Create Room', name: 'createRoom', desc: '', args: []);
  }

  /// `Edit Room`
  String get editRoom {
    return Intl.message('Edit Room', name: 'editRoom', desc: '', args: []);
  }

  /// `Create Hotel`
  String get createHotel {
    return Intl.message(
      'Create Hotel',
      name: 'createHotel',
      desc: '',
      args: [],
    );
  }

  /// `Edit Hotel`
  String get editHotel {
    return Intl.message('Edit Hotel', name: 'editHotel', desc: '', args: []);
  }

  /// `Create Bed`
  String get createBed {
    return Intl.message('Create Bed', name: 'createBed', desc: '', args: []);
  }

  /// `Edit Bed`
  String get editBed {
    return Intl.message('Edit Bed', name: 'editBed', desc: '', args: []);
  }

  /// `Create Dorm`
  String get createDorm {
    return Intl.message('Create Dorm', name: 'createDorm', desc: '', args: []);
  }

  /// `Edit Dorm`
  String get editDorm {
    return Intl.message('Edit Dorm', name: 'editDorm', desc: '', args: []);
  }

  /// `Please select a hotel`
  String get pleaseSelectAHotel {
    return Intl.message(
      'Please select a hotel',
      name: 'pleaseSelectAHotel',
      desc: '',
      args: [],
    );
  }

  /// `Please select a room`
  String get pleaseSelectARoom {
    return Intl.message(
      'Please select a room',
      name: 'pleaseSelectARoom',
      desc: '',
      args: [],
    );
  }

  /// `Please select a dorm`
  String get pleaseSelectADorm {
    return Intl.message(
      'Please select a dorm',
      name: 'pleaseSelectADorm',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Accommodation`
  String get accommodation {
    return Intl.message(
      'Accommodation',
      name: 'accommodation',
      desc: '',
      args: [],
    );
  }

  /// `For`
  String get regarding {
    return Intl.message('For', name: 'regarding', desc: '', args: []);
  }

  /// `Payments`
  String get payments {
    return Intl.message('Payments', name: 'payments', desc: '', args: []);
  }

  /// `Merchants`
  String get merchants {
    return Intl.message('Merchants', name: 'merchants', desc: '', args: []);
  }

  /// `Merchants Management`
  String get merchantsManagement {
    return Intl.message(
      'Merchants Management',
      name: 'merchantsManagement',
      desc: '',
      args: [],
    );
  }

  /// `Merchant`
  String get merchant {
    return Intl.message('Merchant', name: 'merchant', desc: '', args: []);
  }

  /// `No Merchants Found`
  String get noMerchantsFound {
    return Intl.message(
      'No Merchants Found',
      name: 'noMerchantsFound',
      desc: '',
      args: [],
    );
  }

  /// `Filter Merchants`
  String get filterMerchants {
    return Intl.message(
      'Filter Merchants',
      name: 'filterMerchants',
      desc: '',
      args: [],
    );
  }

  /// `Create Merchant`
  String get createMerchant {
    return Intl.message(
      'Create Merchant',
      name: 'createMerchant',
      desc: '',
      args: [],
    );
  }

  /// `Edit Merchant`
  String get editMerchant {
    return Intl.message(
      'Edit Merchant',
      name: 'editMerchant',
      desc: '',
      args: [],
    );
  }

  /// `Zip Code`
  String get zipCode {
    return Intl.message('Zip Code', name: 'zipCode', desc: '', args: []);
  }

  /// `City Code`
  String get cityCode {
    return Intl.message('City Code', name: 'cityCode', desc: '', args: []);
  }

  /// `Landline`
  String get landline {
    return Intl.message('Landline', name: 'landline', desc: '', args: []);
  }

  /// `MCC`
  String get mcc {
    return Intl.message('MCC', name: 'mcc', desc: '', args: []);
  }

  /// `Business Title`
  String get businessTitle {
    return Intl.message(
      'Business Title',
      name: 'businessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Owner Name`
  String get ownerName {
    return Intl.message('Owner Name', name: 'ownerName', desc: '', args: []);
  }

  /// `Owner Phone Number`
  String get ownerPhoneNumber {
    return Intl.message(
      'Owner Phone Number',
      name: 'ownerPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Merchant ID`
  String get merchantId {
    return Intl.message('Merchant ID', name: 'merchantId', desc: '', args: []);
  }

  /// `Institution ID`
  String get insId {
    return Intl.message('Institution ID', name: 'insId', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `View Terminals`
  String get viewTerminals {
    return Intl.message(
      'View Terminals',
      name: 'viewTerminals',
      desc: '',
      args: [],
    );
  }

  /// `Terminals`
  String get terminals {
    return Intl.message('Terminals', name: 'terminals', desc: '', args: []);
  }

  /// `Terminals Management`
  String get terminalsManagement {
    return Intl.message(
      'Terminals Management',
      name: 'terminalsManagement',
      desc: '',
      args: [],
    );
  }

  /// `Terminal`
  String get terminal {
    return Intl.message('Terminal', name: 'terminal', desc: '', args: []);
  }

  /// `No Terminals Found`
  String get noTerminalsFound {
    return Intl.message(
      'No Terminals Found',
      name: 'noTerminalsFound',
      desc: '',
      args: [],
    );
  }

  /// `Filter Terminals`
  String get filterTerminals {
    return Intl.message(
      'Filter Terminals',
      name: 'filterTerminals',
      desc: '',
      args: [],
    );
  }

  /// `Create Terminal`
  String get createTerminal {
    return Intl.message(
      'Create Terminal',
      name: 'createTerminal',
      desc: '',
      args: [],
    );
  }

  /// `Edit Terminal`
  String get editTerminal {
    return Intl.message(
      'Edit Terminal',
      name: 'editTerminal',
      desc: '',
      args: [],
    );
  }

  /// `Serial`
  String get serial {
    return Intl.message('Serial', name: 'serial', desc: '', args: []);
  }

  /// `SIM Card Number`
  String get simCardNumber {
    return Intl.message(
      'SIM Card Number',
      name: 'simCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `SIM Card Serial`
  String get simCardSerial {
    return Intl.message(
      'SIM Card Serial',
      name: 'simCardSerial',
      desc: '',
      args: [],
    );
  }

  /// `IMEI`
  String get imei {
    return Intl.message('IMEI', name: 'imei', desc: '', args: []);
  }

  /// `Terminal ID`
  String get terminalId {
    return Intl.message('Terminal ID', name: 'terminalId', desc: '', args: []);
  }

  /// `Terminal Type`
  String get terminalType {
    return Intl.message(
      'Terminal Type',
      name: 'terminalType',
      desc: '',
      args: [],
    );
  }

  /// `Assign`
  String get assign {
    return Intl.message('Assign', name: 'assign', desc: '', args: []);
  }

  /// `Assign Terminal`
  String get assignTerminal {
    return Intl.message(
      'Assign Terminal',
      name: 'assignTerminal',
      desc: '',
      args: [],
    );
  }

  /// `Support Password`
  String get supportPassword {
    return Intl.message(
      'Support Password',
      name: 'supportPassword',
      desc: '',
      args: [],
    );
  }

  /// `Get Support Password`
  String get getSupportPassword {
    return Intl.message(
      'Get Support Password',
      name: 'getSupportPassword',
      desc: '',
      args: [],
    );
  }

  /// `Select Merchant`
  String get selectMerchant {
    return Intl.message(
      'Select Merchant',
      name: 'selectMerchant',
      desc: '',
      args: [],
    );
  }

  /// `Agreement`
  String get agreement {
    return Intl.message('Agreement', name: 'agreement', desc: '', args: []);
  }

  /// `Assigned`
  String get assigned {
    return Intl.message('Assigned', name: 'assigned', desc: '', args: []);
  }

  /// `Unassigned`
  String get unassigned {
    return Intl.message('Unassigned', name: 'unassigned', desc: '', args: []);
  }

  /// `No Merchant Selected`
  String get noMerchantSelected {
    return Intl.message(
      'No Merchant Selected',
      name: 'noMerchantSelected',
      desc: '',
      args: [],
    );
  }

  /// `User Details`
  String get userDetails {
    return Intl.message(
      'User Details',
      name: 'userDetails',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get viewDetails {
    return Intl.message(
      'View Details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Documents`
  String get documents {
    return Intl.message('Documents', name: 'documents', desc: '', args: []);
  }

  /// `User Documents`
  String get userDocuments {
    return Intl.message(
      'User Documents',
      name: 'userDocuments',
      desc: '',
      args: [],
    );
  }

  /// `User Information`
  String get userInformation {
    return Intl.message(
      'User Information',
      name: 'userInformation',
      desc: '',
      args: [],
    );
  }

  /// `Verification Status`
  String get verificationStatus {
    return Intl.message(
      'Verification Status',
      name: 'verificationStatus',
      desc: '',
      args: [],
    );
  }

  /// `Pending Verification`
  String get pendingVerification {
    return Intl.message(
      'Pending Verification',
      name: 'pendingVerification',
      desc: '',
      args: [],
    );
  }

  /// `Needs Review`
  String get needsReview {
    return Intl.message(
      'Needs Review',
      name: 'needsReview',
      desc: '',
      args: [],
    );
  }

  /// `Approve`
  String get approve {
    return Intl.message('Approve', name: 'approve', desc: '', args: []);
  }

  /// `Reject`
  String get reject {
    return Intl.message('Reject', name: 'reject', desc: '', args: []);
  }

  /// `Approved`
  String get approved {
    return Intl.message('Approved', name: 'approved', desc: '', args: []);
  }

  /// `Rejected`
  String get rejected {
    return Intl.message('Rejected', name: 'rejected', desc: '', args: []);
  }

  /// `Verified`
  String get verified {
    return Intl.message('Verified', name: 'verified', desc: '', args: []);
  }

  /// `Not Uploaded`
  String get notUploaded {
    return Intl.message(
      'Not Uploaded',
      name: 'notUploaded',
      desc: '',
      args: [],
    );
  }

  /// `National Card (Front)`
  String get nationalCardFront {
    return Intl.message(
      'National Card (Front)',
      name: 'nationalCardFront',
      desc: '',
      args: [],
    );
  }

  /// `National Card (Back)`
  String get nationalCardBack {
    return Intl.message(
      'National Card (Back)',
      name: 'nationalCardBack',
      desc: '',
      args: [],
    );
  }

  /// `Birth Certificate`
  String get birthCertificate {
    return Intl.message(
      'Birth Certificate',
      name: 'birthCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Signature`
  String get signature {
    return Intl.message('Signature', name: 'signature', desc: '', args: []);
  }

  /// `Video`
  String get video {
    return Intl.message('Video', name: 'video', desc: '', args: []);
  }

  /// `Rejection Reason`
  String get rejectionReason {
    return Intl.message(
      'Rejection Reason',
      name: 'rejectionReason',
      desc: '',
      args: [],
    );
  }

  /// `Download Data`
  String get downloadData {
    return Intl.message(
      'Download Data',
      name: 'downloadData',
      desc: '',
      args: [],
    );
  }

  /// `Final Approval`
  String get finalApproval {
    return Intl.message(
      'Final Approval',
      name: 'finalApproval',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to approve this user with all of their documents?`
  String get approveConfirmMessage {
    return Intl.message(
      'Are you sure you want to approve this user with all of their documents?',
      name: 'approveConfirmMessage',
      desc: '',
      args: [],
    );
  }

  /// `Reject Documents`
  String get rejectDocuments {
    return Intl.message(
      'Reject Documents',
      name: 'rejectDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Reason for rejecting National Card (Front)`
  String get reasonNationalCardFront {
    return Intl.message(
      'Reason for rejecting National Card (Front)',
      name: 'reasonNationalCardFront',
      desc: '',
      args: [],
    );
  }

  /// `Reason for rejecting National Card (Back)`
  String get reasonNationalCardBack {
    return Intl.message(
      'Reason for rejecting National Card (Back)',
      name: 'reasonNationalCardBack',
      desc: '',
      args: [],
    );
  }

  /// `Reason for rejecting Birth Certificate`
  String get reasonBirthCertificate {
    return Intl.message(
      'Reason for rejecting Birth Certificate',
      name: 'reasonBirthCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Reason for rejecting Video`
  String get reasonVideo {
    return Intl.message(
      'Reason for rejecting Video',
      name: 'reasonVideo',
      desc: '',
      args: [],
    );
  }

  /// `Reason for rejecting Signature`
  String get reasonSignature {
    return Intl.message(
      'Reason for rejecting Signature',
      name: 'reasonSignature',
      desc: '',
      args: [],
    );
  }

  /// `Copied to clipboard`
  String get copiedToClipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'copiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Video available`
  String get videoAvailable {
    return Intl.message(
      'Video available',
      name: 'videoAvailable',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message('View', name: 'view', desc: '', args: []);
  }

  /// `Sort By`
  String get sortBy {
    return Intl.message('Sort By', name: 'sortBy', desc: '', args: []);
  }

  /// `Newest First`
  String get sortNewest {
    return Intl.message('Newest First', name: 'sortNewest', desc: '', args: []);
  }

  /// `Oldest First`
  String get sortOldest {
    return Intl.message('Oldest First', name: 'sortOldest', desc: '', args: []);
  }

  /// `First Name (A-Z)`
  String get sortFirstNameAsc {
    return Intl.message(
      'First Name (A-Z)',
      name: 'sortFirstNameAsc',
      desc: '',
      args: [],
    );
  }

  /// `First Name (Z-A)`
  String get sortFirstNameDesc {
    return Intl.message(
      'First Name (Z-A)',
      name: 'sortFirstNameDesc',
      desc: '',
      args: [],
    );
  }

  /// `Last Name (A-Z)`
  String get sortLastNameAsc {
    return Intl.message(
      'Last Name (A-Z)',
      name: 'sortLastNameAsc',
      desc: '',
      args: [],
    );
  }

  /// `Last Name (Z-A)`
  String get sortLastNameDesc {
    return Intl.message(
      'Last Name (Z-A)',
      name: 'sortLastNameDesc',
      desc: '',
      args: [],
    );
  }

  /// `Bio`
  String get bio {
    return Intl.message('Bio', name: 'bio', desc: '', args: []);
  }

  /// `From Birth Date`
  String get fromBirthDate {
    return Intl.message(
      'From Birth Date',
      name: 'fromBirthDate',
      desc: '',
      args: [],
    );
  }

  /// `To Birth Date`
  String get toBirthDate {
    return Intl.message(
      'To Birth Date',
      name: 'toBirthDate',
      desc: '',
      args: [],
    );
  }

  /// `Creator ID`
  String get creatorId {
    return Intl.message('Creator ID', name: 'creatorId', desc: '', args: []);
  }

  /// `User ID`
  String get userId {
    return Intl.message('User ID', name: 'userId', desc: '', args: []);
  }

  /// `Bank Account ID`
  String get bankAccountId {
    return Intl.message(
      'Bank Account ID',
      name: 'bankAccountId',
      desc: '',
      args: [],
    );
  }

  /// `More Filters`
  String get moreFilters {
    return Intl.message(
      'More Filters',
      name: 'moreFilters',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Light`
  String get themeLight {
    return Intl.message('Light', name: 'themeLight', desc: '', args: []);
  }

  /// `Dark`
  String get themeDark {
    return Intl.message('Dark', name: 'themeDark', desc: '', args: []);
  }

  /// `System`
  String get themeSystem {
    return Intl.message('System', name: 'themeSystem', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Persian`
  String get persian {
    return Intl.message('Persian', name: 'persian', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Update Profile`
  String get updateProfile {
    return Intl.message(
      'Update Profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `App Version`
  String get appVersion {
    return Intl.message('App Version', name: 'appVersion', desc: '', args: []);
  }

  /// `Clear Cache`
  String get clearCache {
    return Intl.message('Clear Cache', name: 'clearCache', desc: '', args: []);
  }

  /// `Cache Cleared`
  String get cacheCleared {
    return Intl.message(
      'Cache Cleared',
      name: 'cacheCleared',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get areYouSureLogout {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'areYouSureLogout',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Total Results`
  String get totalResults {
    return Intl.message(
      'Total Results',
      name: 'totalResults',
      desc: '',
      args: [],
    );
  }

  /// `No Results`
  String get noResults {
    return Intl.message('No Results', name: 'noResults', desc: '', args: []);
  }

  /// `Bulk Import`
  String get bulkImport {
    return Intl.message('Bulk Import', name: 'bulkImport', desc: '', args: []);
  }

  /// `Bulk Import Terminals`
  String get bulkImportTerminals {
    return Intl.message(
      'Bulk Import Terminals',
      name: 'bulkImportTerminals',
      desc: '',
      args: [],
    );
  }

  /// `One terminal per line: serial,simNumber,simSerial,imei`
  String get bulkImportHint {
    return Intl.message(
      'One terminal per line: serial,simNumber,simSerial,imei',
      name: 'bulkImportHint',
      desc: '',
      args: [],
    );
  }

  /// `No valid rows found`
  String get noValidRows {
    return Intl.message(
      'No valid rows found',
      name: 'noValidRows',
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
