part of "../data.dart";

class URecentUserItem {
  final String id;
  final String displayName;
  final String? userName;
  final String? phoneNumber;
  final DateTime createdAt;

  URecentUserItem({
    required this.id,
    required this.displayName,
    required this.createdAt,
    this.userName,
    this.phoneNumber,
  });

  factory URecentUserItem.fromMap(Map<String, dynamic> json) => URecentUserItem(
    id: json["id"] as String,
    displayName: json["displayName"] ?? "",
    userName: json["userName"],
    phoneNumber: json["phoneNumber"],
    createdAt: DateTime.parse(json["createdAt"]),
  );
}

// ===================== Financial / Operations Dashboard =====================

class UFinancialOpsDashboardResponse {
  final DateTime generatedAt;
  final DateTime fromDate;
  final DateTime toDate;

  final int usersCount;
  final int newUsersCount;

  final int merchantsCount;
  final int newMerchantsCount;

  final int terminalsCount;
  final int terminalsAssignedCount;
  final int terminalsUnassignedCount;

  final int txnCount;
  final int newTxnCount;

  final int walletsCount;
  final double totalWalletBalance;

  final double totalIn;
  final double totalOut;
  final double net;

  final List<UAccountingBreakdownItem> txnByStatus;
  final List<UAccountingBreakdownItem> txnByMethod;
  final List<UAccountingBreakdownItem> terminalsByType;
  final List<UAccountingTimelineItem> dailyTimeline;

  final List<UTopMerchantItem> topMerchants;
  final List<URecentTxnItem> recentTransactions;
  final List<URecentMerchantItem> recentMerchants;
  final List<URecentUserItem> recentUsers;

  UFinancialOpsDashboardResponse({
    required this.generatedAt,
    required this.fromDate,
    required this.toDate,
    required this.usersCount,
    required this.newUsersCount,
    required this.merchantsCount,
    required this.newMerchantsCount,
    required this.terminalsCount,
    required this.terminalsAssignedCount,
    required this.terminalsUnassignedCount,
    required this.txnCount,
    required this.newTxnCount,
    required this.walletsCount,
    required this.totalWalletBalance,
    required this.totalIn,
    required this.totalOut,
    required this.net,
    required this.txnByStatus,
    required this.txnByMethod,
    required this.terminalsByType,
    required this.dailyTimeline,
    required this.topMerchants,
    required this.recentTransactions,
    required this.recentMerchants,
    required this.recentUsers,
  });

  factory UFinancialOpsDashboardResponse.fromMap(Map<String, dynamic> json) => UFinancialOpsDashboardResponse(
    generatedAt: DateTime.parse(json["generatedAt"]),
    fromDate: DateTime.parse(json["fromDate"]),
    toDate: DateTime.parse(json["toDate"]),
    usersCount: json["usersCount"] ?? 0,
    newUsersCount: json["newUsersCount"] ?? 0,
    merchantsCount: json["merchantsCount"] ?? 0,
    newMerchantsCount: json["newMerchantsCount"] ?? 0,
    terminalsCount: json["terminalsCount"] ?? 0,
    terminalsAssignedCount: json["terminalsAssignedCount"] ?? 0,
    terminalsUnassignedCount: json["terminalsUnassignedCount"] ?? 0,
    txnCount: json["txnCount"] ?? 0,
    newTxnCount: json["newTxnCount"] ?? 0,
    walletsCount: json["walletsCount"] ?? 0,
    totalWalletBalance: (json["totalWalletBalance"] ?? 0).toString().toDouble(),
    totalIn: (json["totalIn"] ?? 0).toString().toDouble(),
    totalOut: (json["totalOut"] ?? 0).toString().toDouble(),
    net: (json["net"] ?? 0).toString().toDouble(),
    txnByStatus: ((json["txnByStatus"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => UAccountingBreakdownItem.fromMap(x)).toList(),
    txnByMethod: ((json["txnByMethod"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => UAccountingBreakdownItem.fromMap(x)).toList(),
    terminalsByType: ((json["terminalsByType"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => UAccountingBreakdownItem.fromMap(x)).toList(),
    dailyTimeline: ((json["dailyTimeline"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => UAccountingTimelineItem.fromMap(x)).toList(),
    topMerchants: ((json["topMerchants"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => UTopMerchantItem.fromMap(x)).toList(),
    recentTransactions: ((json["recentTransactions"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => URecentTxnItem.fromMap(x)).toList(),
    recentMerchants: ((json["recentMerchants"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => URecentMerchantItem.fromMap(x)).toList(),
    recentUsers: ((json["recentUsers"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => URecentUserItem.fromMap(x)).toList(),
  );
}

class UTopMerchantItem {
  final String id;
  final String title;
  final String city;
  final int terminalCount;
  final DateTime createdAt;

  UTopMerchantItem({required this.id, required this.title, required this.city, required this.terminalCount, required this.createdAt});

  factory UTopMerchantItem.fromMap(Map<String, dynamic> json) => UTopMerchantItem(
    id: json["id"] as String,
    title: json["title"] ?? "",
    city: json["city"] ?? "",
    terminalCount: json["terminalCount"] ?? 0,
    createdAt: DateTime.parse(json["createdAt"]),
  );
}

class URecentTxnItem {
  final String id;
  final double amount;
  final String trackingNumber;
  final String? userName;
  final List<String> tags;
  final DateTime createdAt;

  URecentTxnItem({required this.id, required this.amount, required this.trackingNumber, required this.tags, required this.createdAt, this.userName});

  factory URecentTxnItem.fromMap(Map<String, dynamic> json) => URecentTxnItem(
    id: json["id"] as String,
    amount: (json["amount"] ?? 0).toString().toDouble(),
    trackingNumber: json["trackingNumber"] ?? "",
    userName: json["userName"],
    tags: json["tags"] == null ? <String>[] : List<String>.from(json["tags"].map((dynamic x) => x.toString())),
    createdAt: DateTime.parse(json["createdAt"]),
  );
}

class URecentMerchantItem {
  final String id;
  final String title;
  final String cityCode;
  final int terminalCount;
  final DateTime createdAt;

  URecentMerchantItem({required this.id, required this.title, required this.cityCode, required this.terminalCount, required this.createdAt});

  factory URecentMerchantItem.fromMap(Map<String, dynamic> json) => URecentMerchantItem(
    id: json["id"] as String,
    title: json["title"] ?? "",
    cityCode: json["cityCode"] ?? "",
    terminalCount: json["terminalCount"] ?? 0,
    createdAt: DateTime.parse(json["createdAt"]),
  );
}

// ===================== Property (Hotels/Dorms) Dashboard =====================

class UPropertyDashboardResponse {
  final DateTime generatedAt;

  final int usersCount;
  final int newUsersCount;

  final int hotelsCount;
  final int hotelRoomsCount;
  final int hotelRoomsAvailableCount;
  final int hotelRoomsOccupiedCount;
  final double hotelOccupancyRate;

  final int dormsCount;
  final int dormRoomsCount;
  final int dormBedsCount;
  final int dormBedsAvailableCount;
  final int dormBedsOccupiedCount;
  final double dormOccupancyRate;

  final int contractsCount;
  final int activeContractsCount;
  final int upcomingContractsCount;
  final int expiredContractsCount;
  final int expiringSoonContractsCount;

  final int invoicesCount;
  final int paidInvoicesCount;
  final int unpaidInvoicesCount;
  final int overdueInvoicesCount;

  final double totalDebt;
  final double totalPaid;
  final double totalPenalty;
  final double totalOutstanding;

  final List<UDormBedInvoiceChartItem> monthlyRevenue;
  final List<UExpiringContractItem> expiringContracts;
  final List<UOverdueInvoiceItem> overdueInvoices;
  final List<URecentContractItem> recentContracts;
  final List<URecentUserItem> recentUsers;
  final List<UPropertyBreakdownItem> hotelsByCity;
  final List<UPropertyBreakdownItem> dormsByCity;

  UPropertyDashboardResponse({
    required this.generatedAt,
    required this.usersCount,
    required this.newUsersCount,
    required this.hotelsCount,
    required this.hotelRoomsCount,
    required this.hotelRoomsAvailableCount,
    required this.hotelRoomsOccupiedCount,
    required this.hotelOccupancyRate,
    required this.dormsCount,
    required this.dormRoomsCount,
    required this.dormBedsCount,
    required this.dormBedsAvailableCount,
    required this.dormBedsOccupiedCount,
    required this.dormOccupancyRate,
    required this.contractsCount,
    required this.activeContractsCount,
    required this.upcomingContractsCount,
    required this.expiredContractsCount,
    required this.expiringSoonContractsCount,
    required this.invoicesCount,
    required this.paidInvoicesCount,
    required this.unpaidInvoicesCount,
    required this.overdueInvoicesCount,
    required this.totalDebt,
    required this.totalPaid,
    required this.totalPenalty,
    required this.totalOutstanding,
    required this.monthlyRevenue,
    required this.expiringContracts,
    required this.overdueInvoices,
    required this.recentContracts,
    required this.recentUsers,
    required this.hotelsByCity,
    required this.dormsByCity,
  });

  factory UPropertyDashboardResponse.fromMap(Map<String, dynamic> json) => UPropertyDashboardResponse(
    generatedAt: DateTime.parse(json["generatedAt"]),
    usersCount: json["usersCount"] ?? 0,
    newUsersCount: json["newUsersCount"] ?? 0,
    hotelsCount: json["hotelsCount"] ?? 0,
    hotelRoomsCount: json["hotelRoomsCount"] ?? 0,
    hotelRoomsAvailableCount: json["hotelRoomsAvailableCount"] ?? 0,
    hotelRoomsOccupiedCount: json["hotelRoomsOccupiedCount"] ?? 0,
    hotelOccupancyRate: (json["hotelOccupancyRate"] ?? 0).toString().toDouble(),
    dormsCount: json["dormsCount"] ?? 0,
    dormRoomsCount: json["dormRoomsCount"] ?? 0,
    dormBedsCount: json["dormBedsCount"] ?? 0,
    dormBedsAvailableCount: json["dormBedsAvailableCount"] ?? 0,
    dormBedsOccupiedCount: json["dormBedsOccupiedCount"] ?? 0,
    dormOccupancyRate: (json["dormOccupancyRate"] ?? 0).toString().toDouble(),
    contractsCount: json["contractsCount"] ?? 0,
    activeContractsCount: json["activeContractsCount"] ?? 0,
    upcomingContractsCount: json["upcomingContractsCount"] ?? 0,
    expiredContractsCount: json["expiredContractsCount"] ?? 0,
    expiringSoonContractsCount: json["expiringSoonContractsCount"] ?? 0,
    invoicesCount: json["invoicesCount"] ?? 0,
    paidInvoicesCount: json["paidInvoicesCount"] ?? 0,
    unpaidInvoicesCount: json["unpaidInvoicesCount"] ?? 0,
    overdueInvoicesCount: json["overdueInvoicesCount"] ?? 0,
    totalDebt: (json["totalDebt"] ?? 0).toString().toDouble(),
    totalPaid: (json["totalPaid"] ?? 0).toString().toDouble(),
    totalPenalty: (json["totalPenalty"] ?? 0).toString().toDouble(),
    totalOutstanding: (json["totalOutstanding"] ?? 0).toString().toDouble(),
    monthlyRevenue: ((json["monthlyRevenue"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => UDormBedInvoiceChartItem.fromMap(x)).toList(),
    expiringContracts: ((json["expiringContracts"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => UExpiringContractItem.fromMap(x)).toList(),
    overdueInvoices: ((json["overdueInvoices"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => UOverdueInvoiceItem.fromMap(x)).toList(),
    recentContracts: ((json["recentContracts"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => URecentContractItem.fromMap(x)).toList(),
    recentUsers: ((json["recentUsers"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => URecentUserItem.fromMap(x)).toList(),
    hotelsByCity: ((json["hotelsByCity"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => UPropertyBreakdownItem.fromMap(x)).toList(),
    dormsByCity: ((json["dormsByCity"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => UPropertyBreakdownItem.fromMap(x)).toList(),
  );
}

class UDormBedInvoiceChartItem {
  final String month;
  final double totalDebt;
  final double totalPaid;
  final double totalPenalty;
  final double totalRemaining;
  final int invoiceCount;

  UDormBedInvoiceChartItem({
    required this.month,
    required this.totalDebt,
    required this.totalPaid,
    required this.totalPenalty,
    required this.totalRemaining,
    required this.invoiceCount,
  });

  factory UDormBedInvoiceChartItem.fromMap(Map<String, dynamic> json) => UDormBedInvoiceChartItem(
    month: json["month"] ?? "",
    totalDebt: (json["totalDebt"] ?? 0).toString().toDouble(),
    totalPaid: (json["totalPaid"] ?? 0).toString().toDouble(),
    totalPenalty: (json["totalPenalty"] ?? 0).toString().toDouble(),
    totalRemaining: (json["totalRemaining"] ?? 0).toString().toDouble(),
    invoiceCount: json["invoiceCount"] ?? 0,
  );
}

class UExpiringContractItem {
  final String id;
  final String? userName;
  final String bedTitle;
  final String dormTitle;
  final DateTime endDate;
  final double rent;

  UExpiringContractItem({required this.id, required this.bedTitle, required this.dormTitle, required this.endDate, required this.rent, this.userName});

  factory UExpiringContractItem.fromMap(Map<String, dynamic> json) => UExpiringContractItem(
    id: json["id"] as String,
    userName: json["userName"],
    bedTitle: json["bedTitle"] ?? "",
    dormTitle: json["dormTitle"] ?? "",
    endDate: DateTime.parse(json["endDate"]),
    rent: (json["rent"] ?? 0).toString().toDouble(),
  );
}

class UOverdueInvoiceItem {
  final String id;
  final String? userName;
  final double debtAmount;
  final double paidAmount;
  final double penaltyAmount;
  final DateTime dueDate;
  final int daysOverdue;

  UOverdueInvoiceItem({
    required this.id,
    required this.debtAmount,
    required this.paidAmount,
    required this.penaltyAmount,
    required this.dueDate,
    required this.daysOverdue,
    this.userName,
  });

  factory UOverdueInvoiceItem.fromMap(Map<String, dynamic> json) => UOverdueInvoiceItem(
    id: json["id"] as String,
    userName: json["userName"],
    debtAmount: (json["debtAmount"] ?? 0).toString().toDouble(),
    paidAmount: (json["paidAmount"] ?? 0).toString().toDouble(),
    penaltyAmount: (json["penaltyAmount"] ?? 0).toString().toDouble(),
    dueDate: DateTime.parse(json["dueDate"]),
    daysOverdue: json["daysOverdue"] ?? 0,
  );
}

class URecentContractItem {
  final String id;
  final String? userName;
  final String bedTitle;
  final String dormTitle;
  final DateTime startDate;
  final DateTime endDate;
  final double rent;
  final DateTime createdAt;

  URecentContractItem({
    required this.id,
    required this.bedTitle,
    required this.dormTitle,
    required this.startDate,
    required this.endDate,
    required this.rent,
    required this.createdAt,
    this.userName,
  });

  factory URecentContractItem.fromMap(Map<String, dynamic> json) => URecentContractItem(
    id: json["id"] as String,
    userName: json["userName"],
    bedTitle: json["bedTitle"] ?? "",
    dormTitle: json["dormTitle"] ?? "",
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    rent: (json["rent"] ?? 0).toString().toDouble(),
    createdAt: DateTime.parse(json["createdAt"]),
  );
}

class UPropertyBreakdownItem {
  final String name;
  final int count;

  UPropertyBreakdownItem({required this.name, required this.count});

  factory UPropertyBreakdownItem.fromMap(Map<String, dynamic> json) => UPropertyBreakdownItem(name: json["name"] ?? "", count: json["count"] ?? 0);
}
