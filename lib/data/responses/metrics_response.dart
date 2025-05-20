part of "../data.dart";

class MetricsResponse {
  final double cpuUsage;
  final double memoryUsage;
  final double diskUsage;
  final double totalMemory;
  final double freeMemory;
  final double totalDisk;
  final double freeDisk;
  final String date;

  MetricsResponse({
    this.cpuUsage = 0,
    this.memoryUsage = 0,
    this.diskUsage = 0,
    this.totalMemory = 0,
    this.freeMemory = 0,
    this.totalDisk = 0,
    this.freeDisk = 0,
    this.date = "",
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
