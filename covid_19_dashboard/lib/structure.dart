class Detail {
  String country;
  String cases; 
  String deaths;
  String recovered;
  String active;
  Detail({this.country,this.cases,this.deaths,this.recovered,this.active});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      country: json['country'].toString(),
      cases:json['cases'].toString(),
      deaths: json['deaths'].toString(),
      recovered: json['recovered'].toString(),
      active : json['active'].toString(),
    );
  }
}