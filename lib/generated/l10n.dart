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

  /// `Reservations`
  String get reservations {
    return Intl.message(
      'Reservations',
      name: 'reservations',
      desc: '',
      args: [],
    );
  }

  /// `Reservation`
  String get reservation {
    return Intl.message('Reservation', name: 'reservation', desc: '', args: []);
  }

  /// `Create Reservation`
  String get createReservation {
    return Intl.message(
      'Create Reservation',
      name: 'createReservation',
      desc: '',
      args: [],
    );
  }

  /// `Edit Reservation`
  String get editReservation {
    return Intl.message(
      'Edit Reservation',
      name: 'editReservation',
      desc: '',
      args: [],
    );
  }

  /// `Filter Reservations`
  String get filterReservations {
    return Intl.message(
      'Filter Reservations',
      name: 'filterReservations',
      desc: '',
      args: [],
    );
  }

  /// `No reservations found`
  String get noReservationsFound {
    return Intl.message(
      'No reservations found',
      name: 'noReservationsFound',
      desc: '',
      args: [],
    );
  }

  /// `Check In`
  String get checkIn {
    return Intl.message('Check In', name: 'checkIn', desc: '', args: []);
  }

  /// `Check Out`
  String get checkOut {
    return Intl.message('Check Out', name: 'checkOut', desc: '', args: []);
  }

  /// `Check-in Date`
  String get checkInDate {
    return Intl.message(
      'Check-in Date',
      name: 'checkInDate',
      desc: '',
      args: [],
    );
  }

  /// `Check-out Date`
  String get checkOutDate {
    return Intl.message(
      'Check-out Date',
      name: 'checkOutDate',
      desc: '',
      args: [],
    );
  }

  /// `Guests`
  String get guests {
    return Intl.message('Guests', name: 'guests', desc: '', args: []);
  }

  /// `Number of Guests`
  String get guestCount {
    return Intl.message(
      'Number of Guests',
      name: 'guestCount',
      desc: '',
      args: [],
    );
  }

  /// `Nights`
  String get nights {
    return Intl.message('Nights', name: 'nights', desc: '', args: []);
  }

  /// `Total Price`
  String get totalPrice {
    return Intl.message('Total Price', name: 'totalPrice', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Confirmed`
  String get confirmed {
    return Intl.message('Confirmed', name: 'confirmed', desc: '', args: []);
  }

  /// `Checked In`
  String get checkedIn {
    return Intl.message('Checked In', name: 'checkedIn', desc: '', args: []);
  }

  /// `Checked Out`
  String get checkedOut {
    return Intl.message('Checked Out', name: 'checkedOut', desc: '', args: []);
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message('Cancelled', name: 'cancelled', desc: '', args: []);
  }

  /// `No Show`
  String get noShow {
    return Intl.message('No Show', name: 'noShow', desc: '', args: []);
  }

  /// `Please select a room`
  String get selectARoom {
    return Intl.message(
      'Please select a room',
      name: 'selectARoom',
      desc: '',
      args: [],
    );
  }

  /// `Guest Name`
  String get guestName {
    return Intl.message('Guest Name', name: 'guestName', desc: '', args: []);
  }

  /// `Guest Phone`
  String get guestPhone {
    return Intl.message('Guest Phone', name: 'guestPhone', desc: '', args: []);
  }

  /// `Notes`
  String get notes {
    return Intl.message('Notes', name: 'notes', desc: '', args: []);
  }

  /// `Price per Night`
  String get pricePerNight {
    return Intl.message(
      'Price per Night',
      name: 'pricePerNight',
      desc: '',
      args: [],
    );
  }

  /// `Stars`
  String get stars {
    return Intl.message('Stars', name: 'stars', desc: '', args: []);
  }

  /// `Amenities`
  String get amenities {
    return Intl.message('Amenities', name: 'amenities', desc: '', args: []);
  }

  /// `Policies`
  String get policies {
    return Intl.message('Policies', name: 'policies', desc: '', args: []);
  }

  /// `Check-in Time`
  String get checkInTime {
    return Intl.message(
      'Check-in Time',
      name: 'checkInTime',
      desc: '',
      args: [],
    );
  }

  /// `Check-out Time`
  String get checkOutTime {
    return Intl.message(
      'Check-out Time',
      name: 'checkOutTime',
      desc: '',
      args: [],
    );
  }

  /// `Bed Type`
  String get bedType {
    return Intl.message('Bed Type', name: 'bedType', desc: '', args: []);
  }

  /// `Room Number`
  String get roomNumber {
    return Intl.message('Room Number', name: 'roomNumber', desc: '', args: []);
  }

  /// `Floor`
  String get floor {
    return Intl.message('Floor', name: 'floor', desc: '', args: []);
  }

  /// `Size (m2)`
  String get size {
    return Intl.message('Size (m2)', name: 'size', desc: '', args: []);
  }

  /// `Max Occupancy`
  String get maxOccupancy {
    return Intl.message(
      'Max Occupancy',
      name: 'maxOccupancy',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message('Quantity', name: 'quantity', desc: '', args: []);
  }

  /// `Out of Service`
  String get outOfService {
    return Intl.message(
      'Out of Service',
      name: 'outOfService',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message('Pay', name: 'pay', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Finance`
  String get finance {
    return Intl.message('Finance', name: 'finance', desc: '', args: []);
  }

  /// `Wallets`
  String get wallets {
    return Intl.message('Wallets', name: 'wallets', desc: '', args: []);
  }

  /// `Wallet Management`
  String get walletManagement {
    return Intl.message(
      'Wallet Management',
      name: 'walletManagement',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `Accounting`
  String get accounting {
    return Intl.message('Accounting', name: 'accounting', desc: '', args: []);
  }

  /// `Current Balance`
  String get currentBalance {
    return Intl.message(
      'Current Balance',
      name: 'currentBalance',
      desc: '',
      args: [],
    );
  }

  /// `Charge`
  String get charge {
    return Intl.message('Charge', name: 'charge', desc: '', args: []);
  }

  /// `Transfer`
  String get transfer {
    return Intl.message('Transfer', name: 'transfer', desc: '', args: []);
  }

  /// `Transfer Funds`
  String get transferFunds {
    return Intl.message(
      'Transfer Funds',
      name: 'transferFunds',
      desc: '',
      args: [],
    );
  }

  /// `Charge Wallet`
  String get chargeWallet {
    return Intl.message(
      'Charge Wallet',
      name: 'chargeWallet',
      desc: '',
      args: [],
    );
  }

  /// `Receiver`
  String get receiver {
    return Intl.message('Receiver', name: 'receiver', desc: '', args: []);
  }

  /// `Select a receiver`
  String get selectAReceiver {
    return Intl.message(
      'Select a receiver',
      name: 'selectAReceiver',
      desc: '',
      args: [],
    );
  }

  /// `Select a user to manage their wallet`
  String get selectUserToManageWallet {
    return Intl.message(
      'Select a user to manage their wallet',
      name: 'selectUserToManageWallet',
      desc: '',
      args: [],
    );
  }

  /// `Recent Wallet Transactions`
  String get recentWalletTransactions {
    return Intl.message(
      'Recent Wallet Transactions',
      name: 'recentWalletTransactions',
      desc: '',
      args: [],
    );
  }

  /// `No transactions`
  String get noTransactions {
    return Intl.message(
      'No transactions',
      name: 'noTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Last 30 Days`
  String get last30Days {
    return Intl.message('Last 30 Days', name: 'last30Days', desc: '', args: []);
  }

  /// `User`
  String get user {
    return Intl.message('User', name: 'user', desc: '', args: []);
  }

  /// `Money In`
  String get moneyIn {
    return Intl.message('Money In', name: 'moneyIn', desc: '', args: []);
  }

  /// `Money Out`
  String get moneyOut {
    return Intl.message('Money Out', name: 'moneyOut', desc: '', args: []);
  }

  /// `Net`
  String get net {
    return Intl.message('Net', name: 'net', desc: '', args: []);
  }

  /// `Wallet Balance`
  String get walletBalance {
    return Intl.message(
      'Wallet Balance',
      name: 'walletBalance',
      desc: '',
      args: [],
    );
  }

  /// `Income by Type`
  String get incomeByType {
    return Intl.message(
      'Income by Type',
      name: 'incomeByType',
      desc: '',
      args: [],
    );
  }

  /// `Spending by Type`
  String get spendingByType {
    return Intl.message(
      'Spending by Type',
      name: 'spendingByType',
      desc: '',
      args: [],
    );
  }

  /// `Gateway Payments by Type`
  String get gatewayPaymentsByType {
    return Intl.message(
      'Gateway Payments by Type',
      name: 'gatewayPaymentsByType',
      desc: '',
      args: [],
    );
  }

  /// `Daily In / Out`
  String get dailyInOut {
    return Intl.message(
      'Daily In / Out',
      name: 'dailyInOut',
      desc: '',
      args: [],
    );
  }

  /// `System-wide report`
  String get systemWideReport {
    return Intl.message(
      'System-wide report',
      name: 'systemWideReport',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get noData {
    return Intl.message('No data', name: 'noData', desc: '', args: []);
  }

  /// `Create Transaction`
  String get createTransaction {
    return Intl.message(
      'Create Transaction',
      name: 'createTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Edit Transaction`
  String get editTransaction {
    return Intl.message(
      'Edit Transaction',
      name: 'editTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Delete Transaction`
  String get deleteTransaction {
    return Intl.message(
      'Delete Transaction',
      name: 'deleteTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this transaction?`
  String get areYouSureToDeleteThisTransaction {
    return Intl.message(
      'Are you sure you want to delete this transaction?',
      name: 'areYouSureToDeleteThisTransaction',
      desc: '',
      args: [],
    );
  }

  /// `No transactions found`
  String get noTransactionsFound {
    return Intl.message(
      'No transactions found',
      name: 'noTransactionsFound',
      desc: '',
      args: [],
    );
  }

  /// `Filter Transactions`
  String get filterTransactions {
    return Intl.message(
      'Filter Transactions',
      name: 'filterTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Filter Report`
  String get filterReport {
    return Intl.message(
      'Filter Report',
      name: 'filterReport',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message('Refresh', name: 'refresh', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `User (leave empty for system-wide)`
  String get userOptionalSystemWide {
    return Intl.message(
      'User (leave empty for system-wide)',
      name: 'userOptionalSystemWide',
      desc: '',
      args: [],
    );
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
  String get dailyPenalty {
    return Intl.message(
      'Daily Penalty %',
      name: 'dailyPenalty',
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
  String get markThisInvoiceAsFullyPaid {
    return Intl.message(
      'Mark this invoice as fully paid?',
      name: 'markThisInvoiceAsFullyPaid',
      desc: '',
      args: [],
    );
  }

  /// `Invoice marked as paid`
  String get invoiceMarkedAsPaid {
    return Intl.message(
      'Invoice marked as paid',
      name: 'invoiceMarkedAsPaid',
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

  /// `Upcoming`
  String get upcoming {
    return Intl.message('Upcoming', name: 'upcoming', desc: '', args: []);
  }

  /// `Leasing`
  String get leasing {
    return Intl.message('Leasing', name: 'leasing', desc: '', args: []);
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
  String get scoreOptionScore {
    return Intl.message(
      'Score: \${option.score}',
      name: 'scoreOptionScore',
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
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required.',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `This field is invalid.`
  String get thisFieldIsInvalid {
    return Intl.message(
      'This field is invalid.',
      name: 'thisFieldIsInvalid',
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

  /// `Sub Admin`
  String get subAdmin {
    return Intl.message('Sub Admin', name: 'subAdmin', desc: '', args: []);
  }

  /// `Permissions`
  String get permissions {
    return Intl.message('Permissions', name: 'permissions', desc: '', args: []);
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
  String get priceNight {
    return Intl.message(
      'Price / Night',
      name: 'priceNight',
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

  /// `Blogs`
  String get blogs {
    return Intl.message('Blogs', name: 'blogs', desc: '', args: []);
  }

  /// `Blog`
  String get blog {
    return Intl.message('Blog', name: 'blog', desc: '', args: []);
  }

  /// `Create Blog Post`
  String get createBlog {
    return Intl.message(
      'Create Blog Post',
      name: 'createBlog',
      desc: '',
      args: [],
    );
  }

  /// `Edit Blog Post`
  String get editBlog {
    return Intl.message('Edit Blog Post', name: 'editBlog', desc: '', args: []);
  }

  /// `No blog posts found`
  String get noBlogsFound {
    return Intl.message(
      'No blog posts found',
      name: 'noBlogsFound',
      desc: '',
      args: [],
    );
  }

  /// `Filter Blog Posts`
  String get filterBlogs {
    return Intl.message(
      'Filter Blog Posts',
      name: 'filterBlogs',
      desc: '',
      args: [],
    );
  }

  /// `Slug`
  String get slug {
    return Intl.message('Slug', name: 'slug', desc: '', args: []);
  }

  /// `Content`
  String get content {
    return Intl.message('Content', name: 'content', desc: '', args: []);
  }

  /// `Published`
  String get published {
    return Intl.message('Published', name: 'published', desc: '', args: []);
  }

  /// `Draft`
  String get draft {
    return Intl.message('Draft', name: 'draft', desc: '', args: []);
  }

  /// `Publish`
  String get publish {
    return Intl.message('Publish', name: 'publish', desc: '', args: []);
  }

  /// `Unpublish`
  String get unpublish {
    return Intl.message('Unpublish', name: 'unpublish', desc: '', args: []);
  }

  /// `Views`
  String get viewCount {
    return Intl.message('Views', name: 'viewCount', desc: '', args: []);
  }

  /// `Comments`
  String get comments {
    return Intl.message('Comments', name: 'comments', desc: '', args: []);
  }

  /// `No comments found`
  String get noCommentsFound {
    return Intl.message(
      'No comments found',
      name: 'noCommentsFound',
      desc: '',
      args: [],
    );
  }

  /// `Meta Title`
  String get metaTitle {
    return Intl.message('Meta Title', name: 'metaTitle', desc: '', args: []);
  }

  /// `Meta Description`
  String get metaDescription {
    return Intl.message(
      'Meta Description',
      name: 'metaDescription',
      desc: '',
      args: [],
    );
  }

  /// `Source`
  String get source {
    return Intl.message('Source', name: 'source', desc: '', args: []);
  }

  /// `Reading Time (minutes)`
  String get readingTimeMinutes {
    return Intl.message(
      'Reading Time (minutes)',
      name: 'readingTimeMinutes',
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

  /// `Accommodation's Dashboard`
  String get accommodationDashboard {
    return Intl.message(
      'Accommodation\'s Dashboard',
      name: 'accommodationDashboard',
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
  String get institutionId {
    return Intl.message(
      'Institution ID',
      name: 'institutionId',
      desc: '',
      args: [],
    );
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
  String get areYouSureYouWantToApproveThisUserWithAllOfTheirDocuments {
    return Intl.message(
      'Are you sure you want to approve this user with all of their documents?',
      name: 'areYouSureYouWantToApproveThisUserWithAllOfTheirDocuments',
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
  String get reasonForRejectingNationalCardFront {
    return Intl.message(
      'Reason for rejecting National Card (Front)',
      name: 'reasonForRejectingNationalCardFront',
      desc: '',
      args: [],
    );
  }

  /// `Reason for rejecting National Card (Back)`
  String get reasonForRejectingNationalCardBack {
    return Intl.message(
      'Reason for rejecting National Card (Back)',
      name: 'reasonForRejectingNationalCardBack',
      desc: '',
      args: [],
    );
  }

  /// `Reason for rejecting Birth Certificate`
  String get reasonForRejectingBirthCertificate {
    return Intl.message(
      'Reason for rejecting Birth Certificate',
      name: 'reasonForRejectingBirthCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Reason for rejecting Video`
  String get reasonForRejectingVideo {
    return Intl.message(
      'Reason for rejecting Video',
      name: 'reasonForRejectingVideo',
      desc: '',
      args: [],
    );
  }

  /// `Reason for rejecting Signature`
  String get reasonForRejectingSignature {
    return Intl.message(
      'Reason for rejecting Signature',
      name: 'reasonForRejectingSignature',
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
  String get newestFirst {
    return Intl.message(
      'Newest First',
      name: 'newestFirst',
      desc: '',
      args: [],
    );
  }

  /// `Oldest First`
  String get oldestFirst {
    return Intl.message(
      'Oldest First',
      name: 'oldestFirst',
      desc: '',
      args: [],
    );
  }

  /// `First Name (A-Z)`
  String get firstNameAZ {
    return Intl.message(
      'First Name (A-Z)',
      name: 'firstNameAZ',
      desc: '',
      args: [],
    );
  }

  /// `First Name (Z-A)`
  String get firstNameZA {
    return Intl.message(
      'First Name (Z-A)',
      name: 'firstNameZA',
      desc: '',
      args: [],
    );
  }

  /// `Last Name (A-Z)`
  String get lastNameAZ {
    return Intl.message(
      'Last Name (A-Z)',
      name: 'lastNameAZ',
      desc: '',
      args: [],
    );
  }

  /// `Last Name (Z-A)`
  String get lastNameZA {
    return Intl.message(
      'Last Name (Z-A)',
      name: 'lastNameZA',
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
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `System`
  String get system {
    return Intl.message('System', name: 'system', desc: '', args: []);
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
  String get areYouSureYouWantToLogOut {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'areYouSureYouWantToLogOut',
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
  String get oneTerminalPerLineSerialSimnumberSimserialImei {
    return Intl.message(
      'One terminal per line: serial,simNumber,simSerial,imei',
      name: 'oneTerminalPerLineSerialSimnumberSimserialImei',
      desc: '',
      args: [],
    );
  }

  /// `Financial & Operations`
  String get financialOpsDashboard {
    return Intl.message(
      'Financial & Operations',
      name: 'financialOpsDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Property Dashboard`
  String get propertyDashboard {
    return Intl.message(
      'Property Dashboard',
      name: 'propertyDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Entity Overview`
  String get entityOverview {
    return Intl.message(
      'Entity Overview',
      name: 'entityOverview',
      desc: '',
      args: [],
    );
  }

  /// `Transactions by Status`
  String get transactionsByStatus {
    return Intl.message(
      'Transactions by Status',
      name: 'transactionsByStatus',
      desc: '',
      args: [],
    );
  }

  /// `Transactions by Method`
  String get transactionsByMethod {
    return Intl.message(
      'Transactions by Method',
      name: 'transactionsByMethod',
      desc: '',
      args: [],
    );
  }

  /// `Terminals by Type`
  String get terminalsByType {
    return Intl.message(
      'Terminals by Type',
      name: 'terminalsByType',
      desc: '',
      args: [],
    );
  }

  /// `Top Merchants`
  String get topMerchants {
    return Intl.message(
      'Top Merchants',
      name: 'topMerchants',
      desc: '',
      args: [],
    );
  }

  /// `Top Merchants (by terminal count)`
  String get topMerchantsByTerminalCount {
    return Intl.message(
      'Top Merchants (by terminal count)',
      name: 'topMerchantsByTerminalCount',
      desc: '',
      args: [],
    );
  }

  /// `Recent Transactions`
  String get recentTransactions {
    return Intl.message(
      'Recent Transactions',
      name: 'recentTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Recently Onboarded Merchants`
  String get recentlyOnboardedMerchants {
    return Intl.message(
      'Recently Onboarded Merchants',
      name: 'recentlyOnboardedMerchants',
      desc: '',
      args: [],
    );
  }

  /// `Unassigned Terminals`
  String get unassignedTerminals {
    return Intl.message(
      'Unassigned Terminals',
      name: 'unassignedTerminals',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get newThisPeriod {
    return Intl.message('New', name: 'newThisPeriod', desc: '', args: []);
  }

  /// `Hotel Occupancy`
  String get hotelOccupancy {
    return Intl.message(
      'Hotel Occupancy',
      name: 'hotelOccupancy',
      desc: '',
      args: [],
    );
  }

  /// `Dorm Occupancy`
  String get dormOccupancy {
    return Intl.message(
      'Dorm Occupancy',
      name: 'dormOccupancy',
      desc: '',
      args: [],
    );
  }

  /// `Expiring Soon`
  String get expiringSoon {
    return Intl.message(
      'Expiring Soon',
      name: 'expiringSoon',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Revenue`
  String get monthlyRevenue {
    return Intl.message(
      'Monthly Revenue',
      name: 'monthlyRevenue',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Revenue (Debt / Paid / Penalty)`
  String get monthlyRevenueBreakdown {
    return Intl.message(
      'Monthly Revenue (Debt / Paid / Penalty)',
      name: 'monthlyRevenueBreakdown',
      desc: '',
      args: [],
    );
  }

  /// `Occupancy`
  String get occupancy {
    return Intl.message('Occupancy', name: 'occupancy', desc: '', args: []);
  }

  /// `Hotel Occupied`
  String get hotelOccupied {
    return Intl.message(
      'Hotel Occupied',
      name: 'hotelOccupied',
      desc: '',
      args: [],
    );
  }

  /// `Hotel Available`
  String get hotelAvailable {
    return Intl.message(
      'Hotel Available',
      name: 'hotelAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Dorm Occupied`
  String get dormOccupied {
    return Intl.message(
      'Dorm Occupied',
      name: 'dormOccupied',
      desc: '',
      args: [],
    );
  }

  /// `Dorm Available`
  String get dormAvailable {
    return Intl.message(
      'Dorm Available',
      name: 'dormAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Hotels by City`
  String get hotelsByCity {
    return Intl.message(
      'Hotels by City',
      name: 'hotelsByCity',
      desc: '',
      args: [],
    );
  }

  /// `Dorms by City`
  String get dormsByCity {
    return Intl.message(
      'Dorms by City',
      name: 'dormsByCity',
      desc: '',
      args: [],
    );
  }

  /// `Contracts Expiring Soon`
  String get contractsExpiringSoon {
    return Intl.message(
      'Contracts Expiring Soon',
      name: 'contractsExpiringSoon',
      desc: '',
      args: [],
    );
  }

  /// `Overdue Invoices`
  String get overdueInvoicesTitle {
    return Intl.message(
      'Overdue Invoices',
      name: 'overdueInvoicesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ends`
  String get endsOn {
    return Intl.message('Ends', name: 'endsOn', desc: '', args: []);
  }

  /// `Due`
  String get dueOn {
    return Intl.message('Due', name: 'dueOn', desc: '', args: []);
  }

  /// `Days Overdue`
  String get daysOverdue {
    return Intl.message(
      'Days Overdue',
      name: 'daysOverdue',
      desc: '',
      args: [],
    );
  }

  /// `Recent Contracts`
  String get recentContracts {
    return Intl.message(
      'Recent Contracts',
      name: 'recentContracts',
      desc: '',
      args: [],
    );
  }

  /// `Next 30 Days`
  String get next30Days {
    return Intl.message('Next 30 Days', name: 'next30Days', desc: '', args: []);
  }

  /// `Assigned`
  String get assignedTerminalsCount {
    return Intl.message(
      'Assigned',
      name: 'assignedTerminalsCount',
      desc: '',
      args: [],
    );
  }

  /// `OS Metrics`
  String get osMetrics {
    return Intl.message('OS Metrics', name: 'osMetrics', desc: '', args: []);
  }

  /// `Operating System`
  String get operatingSystem {
    return Intl.message(
      'Operating System',
      name: 'operatingSystem',
      desc: '',
      args: [],
    );
  }

  /// `Architecture`
  String get architecture {
    return Intl.message(
      'Architecture',
      name: 'architecture',
      desc: '',
      args: [],
    );
  }

  /// `Framework`
  String get framework {
    return Intl.message('Framework', name: 'framework', desc: '', args: []);
  }

  /// `Machine Name`
  String get machineName {
    return Intl.message(
      'Machine Name',
      name: 'machineName',
      desc: '',
      args: [],
    );
  }

  /// `System Uptime`
  String get systemUptime {
    return Intl.message(
      'System Uptime',
      name: 'systemUptime',
      desc: '',
      args: [],
    );
  }

  /// `Process Uptime`
  String get processUptime {
    return Intl.message(
      'Process Uptime',
      name: 'processUptime',
      desc: '',
      args: [],
    );
  }

  /// `Memory Usage`
  String get memoryUsage {
    return Intl.message(
      'Memory Usage',
      name: 'memoryUsage',
      desc: '',
      args: [],
    );
  }

  /// `Disk Usage`
  String get diskUsage {
    return Intl.message('Disk Usage', name: 'diskUsage', desc: '', args: []);
  }

  /// `Load Average`
  String get loadAverage {
    return Intl.message(
      'Load Average',
      name: 'loadAverage',
      desc: '',
      args: [],
    );
  }

  /// `Disks`
  String get disks {
    return Intl.message('Disks', name: 'disks', desc: '', args: []);
  }

  /// `Network`
  String get network {
    return Intl.message('Network', name: 'network', desc: '', args: []);
  }

  /// `Process`
  String get process {
    return Intl.message('Process', name: 'process', desc: '', args: []);
  }

  /// `Garbage Collector`
  String get garbageCollector {
    return Intl.message(
      'Garbage Collector',
      name: 'garbageCollector',
      desc: '',
      args: [],
    );
  }

  /// `Threads`
  String get threads {
    return Intl.message('Threads', name: 'threads', desc: '', args: []);
  }

  /// `Handles`
  String get handles {
    return Intl.message('Handles', name: 'handles', desc: '', args: []);
  }

  /// `Working Set`
  String get workingSet {
    return Intl.message('Working Set', name: 'workingSet', desc: '', args: []);
  }

  /// `Private Memory`
  String get privateMemory {
    return Intl.message(
      'Private Memory',
      name: 'privateMemory',
      desc: '',
      args: [],
    );
  }

  /// `Sent`
  String get sent {
    return Intl.message('Sent', name: 'sent', desc: '', args: []);
  }

  /// `Received`
  String get received {
    return Intl.message('Received', name: 'received', desc: '', args: []);
  }

  /// `Speed`
  String get speed {
    return Intl.message('Speed', name: 'speed', desc: '', args: []);
  }

  /// `Total Memory`
  String get totalMemory {
    return Intl.message(
      'Total Memory',
      name: 'totalMemory',
      desc: '',
      args: [],
    );
  }

  /// `Free Memory`
  String get freeMemory {
    return Intl.message('Free Memory', name: 'freeMemory', desc: '', args: []);
  }

  /// `Details`
  String get details {
    return Intl.message('Details', name: 'details', desc: '', args: []);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Server GC`
  String get serverGc {
    return Intl.message('Server GC', name: 'serverGc', desc: '', args: []);
  }

  /// `Gen0 / Gen1 / Gen2`
  String get gcGenerations {
    return Intl.message(
      'Gen0 / Gen1 / Gen2',
      name: 'gcGenerations',
      desc: '',
      args: [],
    );
  }

  /// `cores`
  String get cores {
    return Intl.message('cores', name: 'cores', desc: '', args: []);
  }

  /// `No valid rows found`
  String get noValidRowsFound {
    return Intl.message(
      'No valid rows found',
      name: 'noValidRowsFound',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get fieldRequired {
    return Intl.message(
      'This field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `At least`
  String get atLeast {
    return Intl.message('At least', name: 'atLeast', desc: '', args: []);
  }

  /// `At most`
  String get atMost {
    return Intl.message('At most', name: 'atMost', desc: '', args: []);
  }

  /// `characters`
  String get characters {
    return Intl.message('characters', name: 'characters', desc: '', args: []);
  }

  /// `Admin message`
  String get adminMessage {
    return Intl.message(
      'Admin message',
      name: 'adminMessage',
      desc: '',
      args: [],
    );
  }

  /// `Record again`
  String get recordAgain {
    return Intl.message(
      'Record again',
      name: 'recordAgain',
      desc: '',
      args: [],
    );
  }

  /// `The video must be at least 4 seconds`
  String get videoMinDurationError {
    return Intl.message(
      'The video must be at least 4 seconds',
      name: 'videoMinDurationError',
      desc: '',
      args: [],
    );
  }

  /// `Please draw your signature in the box below`
  String get signHere {
    return Intl.message(
      'Please draw your signature in the box below',
      name: 'signHere',
      desc: '',
      args: [],
    );
  }

  /// `Save signature`
  String get saveSignature {
    return Intl.message(
      'Save signature',
      name: 'saveSignature',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message('Clear', name: 'clear', desc: '', args: []);
  }

  /// `Please add your signature first`
  String get signFirst {
    return Intl.message(
      'Please add your signature first',
      name: 'signFirst',
      desc: '',
      args: [],
    );
  }

  /// `Error loading data`
  String get errorLoadingData {
    return Intl.message(
      'Error loading data',
      name: 'errorLoadingData',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get instagram {
    return Intl.message('Instagram', name: 'instagram', desc: '', args: []);
  }

  /// `Telegram`
  String get telegram {
    return Intl.message('Telegram', name: 'telegram', desc: '', args: []);
  }

  /// `WhatsApp`
  String get whatsapp {
    return Intl.message('WhatsApp', name: 'whatsapp', desc: '', args: []);
  }

  /// `Detail 1`
  String get detail1 {
    return Intl.message('Detail 1', name: 'detail1', desc: '', args: []);
  }

  /// `Detail 2`
  String get detail2 {
    return Intl.message('Detail 2', name: 'detail2', desc: '', args: []);
  }

  /// `Social Media`
  String get socialMedia {
    return Intl.message(
      'Social Media',
      name: 'socialMedia',
      desc: '',
      args: [],
    );
  }

  /// `Extra Sections`
  String get extraSections {
    return Intl.message(
      'Extra Sections',
      name: 'extraSections',
      desc: '',
      args: [],
    );
  }

  /// `Add Section`
  String get addSection {
    return Intl.message('Add Section', name: 'addSection', desc: '', args: []);
  }

  /// `No content found`
  String get noContentFound {
    return Intl.message(
      'No content found',
      name: 'noContentFound',
      desc: '',
      args: [],
    );
  }

  /// `Create Content`
  String get createContent {
    return Intl.message(
      'Create Content',
      name: 'createContent',
      desc: '',
      args: [],
    );
  }

  /// `Edit Content`
  String get editContent {
    return Intl.message(
      'Edit Content',
      name: 'editContent',
      desc: '',
      args: [],
    );
  }

  /// `Contents`
  String get contents {
    return Intl.message('Contents', name: 'contents', desc: '', args: []);
  }

  /// `Filter Contents`
  String get filterContents {
    return Intl.message(
      'Filter Contents',
      name: 'filterContents',
      desc: '',
      args: [],
    );
  }

  /// `Content Type`
  String get contentType {
    return Intl.message(
      'Content Type',
      name: 'contentType',
      desc: '',
      args: [],
    );
  }

  /// `Icon 1`
  String get icon1 {
    return Intl.message('Icon 1', name: 'icon1', desc: '', args: []);
  }

  /// `Icon 2`
  String get icon2 {
    return Intl.message('Icon 2', name: 'icon2', desc: '', args: []);
  }

  /// `Icon 3`
  String get icon3 {
    return Intl.message('Icon 3', name: 'icon3', desc: '', args: []);
  }

  /// `Section`
  String get section {
    return Intl.message('Section', name: 'section', desc: '', args: []);
  }

  /// `Images`
  String get images {
    return Intl.message('Images', name: 'images', desc: '', args: []);
  }

  /// `Image`
  String get image {
    return Intl.message('Image', name: 'image', desc: '', args: []);
  }

  /// `Rich Text Editor`
  String get richTextEditor {
    return Intl.message(
      'Rich Text Editor',
      name: 'richTextEditor',
      desc: '',
      args: [],
    );
  }

  /// `Bold`
  String get bold {
    return Intl.message('Bold', name: 'bold', desc: '', args: []);
  }

  /// `Italic`
  String get italic {
    return Intl.message('Italic', name: 'italic', desc: '', args: []);
  }

  /// `Underline`
  String get underline {
    return Intl.message('Underline', name: 'underline', desc: '', args: []);
  }

  /// `Strikethrough`
  String get strikethrough {
    return Intl.message(
      'Strikethrough',
      name: 'strikethrough',
      desc: '',
      args: [],
    );
  }

  /// `Text Color`
  String get textColor {
    return Intl.message('Text Color', name: 'textColor', desc: '', args: []);
  }

  /// `Font Size`
  String get fontSize {
    return Intl.message('Font Size', name: 'fontSize', desc: '', args: []);
  }

  /// `Heading 1`
  String get heading1 {
    return Intl.message('Heading 1', name: 'heading1', desc: '', args: []);
  }

  /// `Heading 2`
  String get heading2 {
    return Intl.message('Heading 2', name: 'heading2', desc: '', args: []);
  }

  /// `Heading 3`
  String get heading3 {
    return Intl.message('Heading 3', name: 'heading3', desc: '', args: []);
  }

  /// `Paragraph`
  String get paragraph {
    return Intl.message('Paragraph', name: 'paragraph', desc: '', args: []);
  }

  /// `Normal Text`
  String get normalText {
    return Intl.message('Normal Text', name: 'normalText', desc: '', args: []);
  }

  /// `Quote`
  String get quote {
    return Intl.message('Quote', name: 'quote', desc: '', args: []);
  }

  /// `Bulleted List`
  String get bulletedList {
    return Intl.message(
      'Bulleted List',
      name: 'bulletedList',
      desc: '',
      args: [],
    );
  }

  /// `Numbered List`
  String get numberedList {
    return Intl.message(
      'Numbered List',
      name: 'numberedList',
      desc: '',
      args: [],
    );
  }

  /// `Code Block`
  String get codeBlock {
    return Intl.message('Code Block', name: 'codeBlock', desc: '', args: []);
  }

  /// `Divider`
  String get divider {
    return Intl.message('Divider', name: 'divider', desc: '', args: []);
  }

  /// `Insert Image`
  String get insertImage {
    return Intl.message(
      'Insert Image',
      name: 'insertImage',
      desc: '',
      args: [],
    );
  }

  /// `Insert Link`
  String get insertLink {
    return Intl.message('Insert Link', name: 'insertLink', desc: '', args: []);
  }

  /// `Remove Link`
  String get removeLink {
    return Intl.message('Remove Link', name: 'removeLink', desc: '', args: []);
  }

  /// `Link`
  String get link {
    return Intl.message('Link', name: 'link', desc: '', args: []);
  }

  /// `URL`
  String get url {
    return Intl.message('URL', name: 'url', desc: '', args: []);
  }

  /// `Align Left`
  String get alignLeft {
    return Intl.message('Align Left', name: 'alignLeft', desc: '', args: []);
  }

  /// `Align Center`
  String get alignCenter {
    return Intl.message(
      'Align Center',
      name: 'alignCenter',
      desc: '',
      args: [],
    );
  }

  /// `Align Right`
  String get alignRight {
    return Intl.message('Align Right', name: 'alignRight', desc: '', args: []);
  }

  /// `Justify`
  String get alignJustify {
    return Intl.message('Justify', name: 'alignJustify', desc: '', args: []);
  }

  /// `Uploading image...`
  String get uploadingImage {
    return Intl.message(
      'Uploading image...',
      name: 'uploadingImage',
      desc: '',
      args: [],
    );
  }

  /// `Preview`
  String get preview {
    return Intl.message('Preview', name: 'preview', desc: '', args: []);
  }

  /// `Remove Block`
  String get removeBlock {
    return Intl.message(
      'Remove Block',
      name: 'removeBlock',
      desc: '',
      args: [],
    );
  }

  /// `Move Up`
  String get moveUp {
    return Intl.message('Move Up', name: 'moveUp', desc: '', args: []);
  }

  /// `Move Down`
  String get moveDown {
    return Intl.message('Move Down', name: 'moveDown', desc: '', args: []);
  }

  /// `Clear Formatting`
  String get clearFormatting {
    return Intl.message(
      'Clear Formatting',
      name: 'clearFormatting',
      desc: '',
      args: [],
    );
  }

  /// `Image description`
  String get imageAltText {
    return Intl.message(
      'Image description',
      name: 'imageAltText',
      desc: '',
      args: [],
    );
  }

  /// `Write something...`
  String get writeSomething {
    return Intl.message(
      'Write something...',
      name: 'writeSomething',
      desc: '',
      args: [],
    );
  }

  /// `API Request Logs`
  String get apiRequestLogs {
    return Intl.message(
      'API Request Logs',
      name: 'apiRequestLogs',
      desc: '',
      args: [],
    );
  }

  /// `Not assigned`
  String get notAssigned {
    return Intl.message(
      'Not assigned',
      name: 'notAssigned',
      desc: '',
      args: [],
    );
  }

  /// `Province`
  String get province {
    return Intl.message('Province', name: 'province', desc: '', args: []);
  }

  /// `Count`
  String get count {
    return Intl.message('Count', name: 'count', desc: '', args: []);
  }

  /// `Time`
  String get time {
    return Intl.message('Time', name: 'time', desc: '', args: []);
  }

  /// `Method`
  String get method {
    return Intl.message('Method', name: 'method', desc: '', args: []);
  }

  /// `Path`
  String get path {
    return Intl.message('Path', name: 'path', desc: '', args: []);
  }

  /// `Duration`
  String get duration {
    return Intl.message('Duration', name: 'duration', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Errors`
  String get errors {
    return Intl.message('Errors', name: 'errors', desc: '', args: []);
  }

  /// `Minute`
  String get minute {
    return Intl.message('Minute', name: 'minute', desc: '', args: []);
  }

  /// `Hour`
  String get hour {
    return Intl.message('Hour', name: 'hour', desc: '', args: []);
  }

  /// `Day`
  String get day {
    return Intl.message('Day', name: 'day', desc: '', args: []);
  }

  /// `Roles`
  String get roles {
    return Intl.message('Roles', name: 'roles', desc: '', args: []);
  }

  /// `IP Address`
  String get ipAddress {
    return Intl.message('IP Address', name: 'ipAddress', desc: '', args: []);
  }

  /// `User Email`
  String get userEmail {
    return Intl.message('User Email', name: 'userEmail', desc: '', args: []);
  }

  /// `Username`
  String get userName {
    return Intl.message('Username', name: 'userName', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `CSV Export`
  String get csvExport {
    return Intl.message('CSV Export', name: 'csvExport', desc: '', args: []);
  }

  /// `Trace Id`
  String get traceId {
    return Intl.message('Trace Id', name: 'traceId', desc: '', args: []);
  }

  /// `Admins`
  String get admins {
    return Intl.message('Admins', name: 'admins', desc: '', args: []);
  }

  /// `Request Body`
  String get requestBody {
    return Intl.message(
      'Request Body',
      name: 'requestBody',
      desc: '',
      args: [],
    );
  }

  /// `Exception`
  String get exception {
    return Intl.message('Exception', name: 'exception', desc: '', args: []);
  }

  /// `Stack Trace`
  String get stackTrace {
    return Intl.message('Stack Trace', name: 'stackTrace', desc: '', args: []);
  }

  /// `Query String`
  String get queryString {
    return Intl.message(
      'Query String',
      name: 'queryString',
      desc: '',
      args: [],
    );
  }

  /// `Response Body`
  String get responseBody {
    return Intl.message(
      'Response Body',
      name: 'responseBody',
      desc: '',
      args: [],
    );
  }

  /// `Request Headers`
  String get requestHeaders {
    return Intl.message(
      'Request Headers',
      name: 'requestHeaders',
      desc: '',
      args: [],
    );
  }

  /// `Response Headers`
  String get responseHeaders {
    return Intl.message(
      'Response Headers',
      name: 'responseHeaders',
      desc: '',
      args: [],
    );
  }

  /// `Total Requests`
  String get totalRequests {
    return Intl.message(
      'Total Requests',
      name: 'totalRequests',
      desc: '',
      args: [],
    );
  }

  /// `Average Duration`
  String get averageDuration {
    return Intl.message(
      'Average Duration',
      name: 'averageDuration',
      desc: '',
      args: [],
    );
  }

  /// `Requests & Response Duration Trend`
  String get requestsAndResponseDurationTrend {
    return Intl.message(
      'Requests & Response Duration Trend',
      name: 'requestsAndResponseDurationTrend',
      desc: '',
      args: [],
    );
  }

  /// `Success / Error Distribution`
  String get successErrorDistribution {
    return Intl.message(
      'Success / Error Distribution',
      name: 'successErrorDistribution',
      desc: '',
      args: [],
    );
  }

  /// `Slowest Paths`
  String get slowestPaths {
    return Intl.message(
      'Slowest Paths',
      name: 'slowestPaths',
      desc: '',
      args: [],
    );
  }

  /// `Most Failing Paths`
  String get mostFailingPaths {
    return Intl.message(
      'Most Failing Paths',
      name: 'mostFailingPaths',
      desc: '',
      args: [],
    );
  }

  /// `Slowest Requests`
  String get slowestRequests {
    return Intl.message(
      'Slowest Requests',
      name: 'slowestRequests',
      desc: '',
      args: [],
    );
  }

  /// `Only Errors`
  String get onlyErrors {
    return Intl.message('Only Errors', name: 'onlyErrors', desc: '', args: []);
  }

  /// `Only Exceptions`
  String get onlyExceptions {
    return Intl.message(
      'Only Exceptions',
      name: 'onlyExceptions',
      desc: '',
      args: [],
    );
  }

  /// `User / IP`
  String get userSlashIp {
    return Intl.message('User / IP', name: 'userSlashIp', desc: '', args: []);
  }

  /// `Filter Logs`
  String get filterLogs {
    return Intl.message('Filter Logs', name: 'filterLogs', desc: '', args: []);
  }

  /// `Path Contains`
  String get pathContains {
    return Intl.message(
      'Path Contains',
      name: 'pathContains',
      desc: '',
      args: [],
    );
  }

  /// `Min Duration (ms)`
  String get minDurationMs {
    return Intl.message(
      'Min Duration (ms)',
      name: 'minDurationMs',
      desc: '',
      args: [],
    );
  }

  /// `Max Duration (ms)`
  String get maxDurationMs {
    return Intl.message(
      'Max Duration (ms)',
      name: 'maxDurationMs',
      desc: '',
      args: [],
    );
  }

  /// `Exact Status Code`
  String get exactStatusCode {
    return Intl.message(
      'Exact Status Code',
      name: 'exactStatusCode',
      desc: '',
      args: [],
    );
  }

  /// `Copy to clipboard`
  String get copyToClipboard {
    return Intl.message(
      'Copy to clipboard',
      name: 'copyToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Request Size`
  String get requestSize {
    return Intl.message(
      'Request Size',
      name: 'requestSize',
      desc: '',
      args: [],
    );
  }

  /// `Response Size`
  String get responseSize {
    return Intl.message(
      'Response Size',
      name: 'responseSize',
      desc: '',
      args: [],
    );
  }

  /// `rows (including header) - up to 10,000 rows based on current filters.`
  String get csvRowsHintSuffix {
    return Intl.message(
      'rows (including header) - up to 10,000 rows based on current filters.',
      name: 'csvRowsHintSuffix',
      desc: '',
      args: [],
    );
  }

  /// `Parking`
  String get parking {
    return Intl.message('Parking', name: 'parking', desc: '', args: []);
  }

  /// `Parking Management`
  String get parkingManagement {
    return Intl.message(
      'Parking Management',
      name: 'parkingManagement',
      desc: '',
      args: [],
    );
  }

  /// `Parking Reports`
  String get parkingReports {
    return Intl.message(
      'Parking Reports',
      name: 'parkingReports',
      desc: '',
      args: [],
    );
  }

  /// `Parking Report`
  String get parkingReport {
    return Intl.message(
      'Parking Report',
      name: 'parkingReport',
      desc: '',
      args: [],
    );
  }

  /// `Create Parking`
  String get createParking {
    return Intl.message(
      'Create Parking',
      name: 'createParking',
      desc: '',
      args: [],
    );
  }

  /// `Edit Parking`
  String get editParking {
    return Intl.message(
      'Edit Parking',
      name: 'editParking',
      desc: '',
      args: [],
    );
  }

  /// `Entrance Price`
  String get entrancePrice {
    return Intl.message(
      'Entrance Price',
      name: 'entrancePrice',
      desc: '',
      args: [],
    );
  }

  /// `Hourly Price`
  String get hourlyPrice {
    return Intl.message(
      'Hourly Price',
      name: 'hourlyPrice',
      desc: '',
      args: [],
    );
  }

  /// `Daily Price`
  String get dailyPrice {
    return Intl.message('Daily Price', name: 'dailyPrice', desc: '', args: []);
  }

  /// `Owner`
  String get owner {
    return Intl.message('Owner', name: 'owner', desc: '', args: []);
  }

  /// `No parkings found`
  String get noParkingsFound {
    return Intl.message(
      'No parkings found',
      name: 'noParkingsFound',
      desc: '',
      args: [],
    );
  }

  /// `No parking reports found`
  String get noParkingReportsFound {
    return Intl.message(
      'No parking reports found',
      name: 'noParkingReportsFound',
      desc: '',
      args: [],
    );
  }

  /// `Licence Plate`
  String get licencePlate {
    return Intl.message(
      'Licence Plate',
      name: 'licencePlate',
      desc: '',
      args: [],
    );
  }

  /// `View Report`
  String get viewReport {
    return Intl.message('View Report', name: 'viewReport', desc: '', args: []);
  }

  /// `External API`
  String get externalApi {
    return Intl.message(
      'External API',
      name: 'externalApi',
      desc: '',
      args: [],
    );
  }

  /// `Pn API Tester`
  String get pnApiTester {
    return Intl.message(
      'Pn API Tester',
      name: 'pnApiTester',
      desc: '',
      args: [],
    );
  }

  /// `API Key`
  String get apiKey {
    return Intl.message('API Key', name: 'apiKey', desc: '', args: []);
  }

  /// `Send Request`
  String get sendRequest {
    return Intl.message(
      'Send Request',
      name: 'sendRequest',
      desc: '',
      args: [],
    );
  }

  /// `Request`
  String get request {
    return Intl.message('Request', name: 'request', desc: '', args: []);
  }

  /// `Response`
  String get response {
    return Intl.message('Response', name: 'response', desc: '', args: []);
  }

  /// `Visual Authentication`
  String get visualAuthentication {
    return Intl.message(
      'Visual Authentication',
      name: 'visualAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `Scan Barcode`
  String get scanBarcode {
    return Intl.message(
      'Scan Barcode',
      name: 'scanBarcode',
      desc: '',
      args: [],
    );
  }

  /// `Place the barcode inside the frame`
  String get scanHint {
    return Intl.message(
      'Place the barcode inside the frame',
      name: 'scanHint',
      desc: '',
      args: [],
    );
  }

  /// `Switch Camera`
  String get switchCamera {
    return Intl.message(
      'Switch Camera',
      name: 'switchCamera',
      desc: '',
      args: [],
    );
  }

  /// `Scan from Gallery`
  String get scanFromGallery {
    return Intl.message(
      'Scan from Gallery',
      name: 'scanFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Flashlight`
  String get flashlight {
    return Intl.message('Flashlight', name: 'flashlight', desc: '', args: []);
  }

  /// `Letter`
  String get letter {
    return Intl.message('Letter', name: 'letter', desc: '', args: []);
  }

  /// `Iran`
  String get iran {
    return Intl.message('Iran', name: 'iran', desc: '', args: []);
  }

  /// `No information found`
  String get noInformationFound {
    return Intl.message(
      'No information found',
      name: 'noInformationFound',
      desc: '',
      args: [],
    );
  }

  /// `No violations found for this vehicle`
  String get noViolationsFoundForThisVehicle {
    return Intl.message(
      'No violations found for this vehicle',
      name: 'noViolationsFoundForThisVehicle',
      desc: '',
      args: [],
    );
  }

  /// `You have not registered any vehicles yet`
  String get youHaveNotRegisteredAnyVehiclesYet {
    return Intl.message(
      'You have not registered any vehicles yet',
      name: 'youHaveNotRegisteredAnyVehiclesYet',
      desc: '',
      args: [],
    );
  }

  /// `Enter the bill ID and payment ID or scan its barcode`
  String get enterBillIdAndPaymentIdOrScanBarcode {
    return Intl.message(
      'Enter the bill ID and payment ID or scan its barcode',
      name: 'enterBillIdAndPaymentIdOrScanBarcode',
      desc: '',
      args: [],
    );
  }

  /// `You have not registered any terminals yet`
  String get youHaveNotRegisteredAnyTerminalsYet {
    return Intl.message(
      'You have not registered any terminals yet',
      name: 'youHaveNotRegisteredAnyTerminalsYet',
      desc: '',
      args: [],
    );
  }

  /// `You have not registered any bank accounts yet`
  String get youHaveNotRegisteredAnyBankAccountsYet {
    return Intl.message(
      'You have not registered any bank accounts yet',
      name: 'youHaveNotRegisteredAnyBankAccountsYet',
      desc: '',
      args: [],
    );
  }

  /// `No SIM card registered`
  String get noSimCardRegistered {
    return Intl.message(
      'No SIM card registered',
      name: 'noSimCardRegistered',
      desc: '',
      args: [],
    );
  }

  /// `No packages found`
  String get noPackagesFound {
    return Intl.message(
      'No packages found',
      name: 'noPackagesFound',
      desc: '',
      args: [],
    );
  }

  /// `No notifications`
  String get noNotifications {
    return Intl.message(
      'No notifications',
      name: 'noNotifications',
      desc: '',
      args: [],
    );
  }

  /// `You have not registered any merchants yet`
  String get youHaveNotRegisteredAnyMerchantsYet {
    return Intl.message(
      'You have not registered any merchants yet',
      name: 'youHaveNotRegisteredAnyMerchantsYet',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Please enter your mobile number to log in.`
  String get pleaseEnterYourMobileNumberToLogin {
    return Intl.message(
      'Please enter your mobile number to log in.',
      name: 'pleaseEnterYourMobileNumberToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Complete user information`
  String get completeUserInformation {
    return Intl.message(
      'Complete user information',
      name: 'completeUserInformation',
      desc: '',
      args: [],
    );
  }

  /// `To use AvaHamrah services, complete your identity information.`
  String get completeYourIdentityInformationToUseAvaHamrahServices {
    return Intl.message(
      'To use AvaHamrah services, complete your identity information.',
      name: 'completeYourIdentityInformationToUseAvaHamrahServices',
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
