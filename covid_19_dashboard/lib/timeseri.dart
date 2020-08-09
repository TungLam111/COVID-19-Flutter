class TimeSeri {
  DateTime date;
  String cases; 
  String deaths;
  String recovered;
  TimeSeri({this.date,this.cases,this.deaths,this.recovered});

  factory TimeSeri.fromJson(Map<String, dynamic> json) {
    return TimeSeri(
      date: json['date'].toDate(),
      cases:json['confirmed'].toString(),
      deaths: json['deaths'].toString(),
      recovered: json['recovered'].toString(),
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['confirmed'] = this.cases;
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    return data;
  }
}