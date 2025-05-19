part of "../data.dart";

class MetricsResponse {
  final double cpuUsage;
  final double memoryUsage;
  final double diskUsage;
  final double totalMemory;
  final double freeMemory;
  final double totalDisk;
  final double freeDisk;
  final double date;

  MetricsResponse({
    required this.cpuUsage,
    required this.memoryUsage,
    required this.diskUsage,
    required this.totalMemory,
    required this.freeMemory,
    required this.totalDisk,
    required this.freeDisk,
    required this.date,
  });

  factory MetricsResponse.fromJson(String str) => MetricsResponse.fromMap(json.decode(str));

  factory MetricsResponse.fromMap(Map<String, dynamic> json) => MetricsResponse(
        cpuUsage: json["cpuUsage"],
        memoryUsage: json["memoryUsage"],
        diskUsage: json["diskUsage"],
        totalMemory: json["totalMemory"],
        freeMemory: json["freeMemory"],
        totalDisk: json["totalDisk"],
        freeDisk: json["freeDisk"],
        date: json["date"],
      );
}
