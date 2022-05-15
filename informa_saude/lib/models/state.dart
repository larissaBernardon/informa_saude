class State {
  const State._({
    this.uf,
    this.state,
    this.cases,
    this.deaths,
    this.suspects,
    this.refuses,
  });

  final String? state;
  final String? uf;
  final int? cases;
  final int? deaths;
  final int? suspects;
  final int? refuses;

  static State fromJson(Map<String, dynamic> json) {
    return State._(
        uf: json['uf'],
        state: json['state'],
        cases: json['cases'],
        deaths: json['deaths'],
        suspects: json['suspects'],
        refuses: json['refuses']);
  }
}
