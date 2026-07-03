part of "../data.dart";

// Rich, cross-platform server/OS metrics (CPU, memory, disks, process, GC, network).
class UOsMetricsResponse {
  final DateTime generatedAt;

  final String osName;
  final String osDescription;
  final String osArchitecture;
  final String processArchitecture;
  final String frameworkDescription;
  final String machineName;
  final bool is64BitOperatingSystem;
  final bool is64BitProcess;
  final int processorCount;

  final double systemUptimeSeconds;
  final double processUptimeSeconds;
  final DateTime processStartedAt;

  final double cpuUsagePercent;
  final double? loadAverage1Min;
  final double? loadAverage5Min;
  final double? loadAverage15Min;

  final double memoryTotalGb;
  final double memoryUsedGb;
  final double memoryFreeGb;
  final double memoryUsagePercent;

  final List<UDiskMetricsItem> disks;

  final double processWorkingSetMb;
  final double processPrivateMemoryMb;
  final int processThreadCount;
  final int? processHandleCount;

  final double gcTotalMemoryMb;
  final int gen0Collections;
  final int gen1Collections;
  final int gen2Collections;
  final bool isServerGc;

  final List<UNetworkInterfaceMetricsItem> networkInterfaces;

  UOsMetricsResponse({
    required this.generatedAt,
    required this.osName,
    required this.osDescription,
    required this.osArchitecture,
    required this.processArchitecture,
    required this.frameworkDescription,
    required this.machineName,
    required this.is64BitOperatingSystem,
    required this.is64BitProcess,
    required this.processorCount,
    required this.systemUptimeSeconds,
    required this.processUptimeSeconds,
    required this.processStartedAt,
    required this.cpuUsagePercent,
    required this.memoryTotalGb,
    required this.memoryUsedGb,
    required this.memoryFreeGb,
    required this.memoryUsagePercent,
    required this.disks,
    required this.processWorkingSetMb,
    required this.processPrivateMemoryMb,
    required this.processThreadCount,
    required this.gcTotalMemoryMb,
    required this.gen0Collections,
    required this.gen1Collections,
    required this.gen2Collections,
    required this.isServerGc,
    required this.networkInterfaces,
    this.loadAverage1Min,
    this.loadAverage5Min,
    this.loadAverage15Min,
    this.processHandleCount,
  });

  factory UOsMetricsResponse.fromMap(Map<String, dynamic> json) => UOsMetricsResponse(
    generatedAt: DateTime.parse(json["generatedAt"]),
    osName: json["osName"] ?? "",
    osDescription: json["osDescription"] ?? "",
    osArchitecture: json["osArchitecture"] ?? "",
    processArchitecture: json["processArchitecture"] ?? "",
    frameworkDescription: json["frameworkDescription"] ?? "",
    machineName: json["machineName"] ?? "",
    is64BitOperatingSystem: json["is64BitOperatingSystem"] ?? false,
    is64BitProcess: json["is64BitProcess"] ?? false,
    processorCount: json["processorCount"] ?? 0,
    systemUptimeSeconds: (json["systemUptimeSeconds"] ?? 0).toString().toDouble(),
    processUptimeSeconds: (json["processUptimeSeconds"] ?? 0).toString().toDouble(),
    processStartedAt: DateTime.parse(json["processStartedAt"]),
    cpuUsagePercent: (json["cpuUsagePercent"] ?? 0).toString().toDouble(),
    loadAverage1Min: json["loadAverage1Min"] == null ? null : (json["loadAverage1Min"]).toString().toDouble(),
    loadAverage5Min: json["loadAverage5Min"] == null ? null : (json["loadAverage5Min"]).toString().toDouble(),
    loadAverage15Min: json["loadAverage15Min"] == null ? null : (json["loadAverage15Min"]).toString().toDouble(),
    memoryTotalGb: (json["memoryTotalGb"] ?? 0).toString().toDouble(),
    memoryUsedGb: (json["memoryUsedGb"] ?? 0).toString().toDouble(),
    memoryFreeGb: (json["memoryFreeGb"] ?? 0).toString().toDouble(),
    memoryUsagePercent: (json["memoryUsagePercent"] ?? 0).toString().toDouble(),
    disks: ((json["disks"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => UDiskMetricsItem.fromMap(x)).toList(),
    processWorkingSetMb: (json["processWorkingSetMb"] ?? 0).toString().toDouble(),
    processPrivateMemoryMb: (json["processPrivateMemoryMb"] ?? 0).toString().toDouble(),
    processThreadCount: json["processThreadCount"] ?? 0,
    processHandleCount: json["processHandleCount"],
    gcTotalMemoryMb: (json["gcTotalMemoryMb"] ?? 0).toString().toDouble(),
    gen0Collections: json["gen0Collections"] ?? 0,
    gen1Collections: json["gen1Collections"] ?? 0,
    gen2Collections: json["gen2Collections"] ?? 0,
    isServerGc: json["isServerGc"] ?? false,
    networkInterfaces: ((json["networkInterfaces"] ?? <dynamic>[]) as List<dynamic>).map((dynamic x) => UNetworkInterfaceMetricsItem.fromMap(x)).toList(),
  );
}

class UDiskMetricsItem {
  final String name;
  final String driveFormat;
  final String driveType;
  final double totalGb;
  final double freeGb;
  final double usedGb;
  final double usagePercent;

  UDiskMetricsItem({
    required this.name,
    required this.driveFormat,
    required this.driveType,
    required this.totalGb,
    required this.freeGb,
    required this.usedGb,
    required this.usagePercent,
  });

  factory UDiskMetricsItem.fromMap(Map<String, dynamic> json) => UDiskMetricsItem(
    name: json["name"] ?? "",
    driveFormat: json["driveFormat"] ?? "",
    driveType: json["driveType"] ?? "",
    totalGb: (json["totalGb"] ?? 0).toString().toDouble(),
    freeGb: (json["freeGb"] ?? 0).toString().toDouble(),
    usedGb: (json["usedGb"] ?? 0).toString().toDouble(),
    usagePercent: (json["usagePercent"] ?? 0).toString().toDouble(),
  );
}

class UNetworkInterfaceMetricsItem {
  final String name;
  final String description;
  final String type;
  final String status;
  final double speedMbps;
  final double bytesSentMb;
  final double bytesReceivedMb;

  UNetworkInterfaceMetricsItem({
    required this.name,
    required this.description,
    required this.type,
    required this.status,
    required this.speedMbps,
    required this.bytesSentMb,
    required this.bytesReceivedMb,
  });

  factory UNetworkInterfaceMetricsItem.fromMap(Map<String, dynamic> json) => UNetworkInterfaceMetricsItem(
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    type: json["type"] ?? "",
    status: json["status"] ?? "",
    speedMbps: (json["speedMbps"] ?? 0).toString().toDouble(),
    bytesSentMb: (json["bytesSentMb"] ?? 0).toString().toDouble(),
    bytesReceivedMb: (json["bytesReceivedMb"] ?? 0).toString().toDouble(),
  );
}
