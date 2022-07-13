class ReportData {
  const ReportData._({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.active,
    required this.reporter,
    required this.report_type,
  });

  final int id;
  final double latitude;
  final double longitude;
  final String reporter;
  final int report_type;
  final int active;

  static ReportData fromJson(Map<String, dynamic> json) {
    return ReportData._(
      id: json['id_report'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      report_type: json['report_type'],
      reporter: json['reporter'],
      active: json['active'],
    );
  }
}

class ReportList {
  final List<ReportData> reports;

  ReportList({
    required this.reports,
  });

  static ReportList fromJson(Map<String, dynamic> json) {
    return ReportList(reports: json['report']);
  }
}
