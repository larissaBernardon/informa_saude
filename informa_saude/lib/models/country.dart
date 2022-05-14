class Country {
  const Country._({
    this.country,
    this.cases,
    this.deaths,
    this.updated_at,
  });

  final String? country;
  final int? cases;
  final int? deaths;
  final String? updated_at;

  static Country fromJson(Map<String, dynamic> json) {
    return Country._(
      country: json['country'],
      cases: json['cases'],
      deaths: json['deaths'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'cases': cases,
      'deaths': deaths,
      'updated_at': updated_at,
    };
  }
}
