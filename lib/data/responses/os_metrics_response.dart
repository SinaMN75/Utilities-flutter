part of "../data.dart";

// Cross-platform server/OS metrics (identity, uptime, CPU, memory, disk).
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

  final double diskTotalGb;
  final double diskUsedGb;
  final double diskFreeGb;
  final double diskUsagePercent;

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
    required this.diskTotalGb,
    required this.diskUsedGb,
    required this.diskFreeGb,
    required this.diskUsagePercent,
    this.loadAverage1Min,
    this.loadAverage5Min,
    this.loadAverage15Min,
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
    diskTotalGb: (json["diskTotalGb"] ?? 0).toString().toDouble(),
    diskUsedGb: (json["diskUsedGb"] ?? 0).toString().toDouble(),
    diskFreeGb: (json["diskFreeGb"] ?? 0).toString().toDouble(),
    diskUsagePercent: (json["diskUsagePercent"] ?? 0).toString().toDouble(),
  );
}
