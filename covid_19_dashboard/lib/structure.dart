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
class Vietnam {
  String province;
  int cases; 
  int death;
  int critical;
  int cure;
  Vietnam({this.province,this.cases,this.death,this.critical,this.cure});

  factory Vietnam.fromJson(Map<String, dynamic> json) {
    return Vietnam(
      province: json['province'].toString(),
      cases:json['cases'],
      death: json['death'],
      critical: json['critical'],
      cure : json['cure'],
    );
  }
}