class Detail {
  String country;
  final String cases; 
  final String deaths;
  final String recovered;
  final String active;
  String flag;

  Detail({this.country,this.cases,this.deaths,this.recovered,this.active, this.flag});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      country: json['country'].toString(),
      cases:json['cases'].toString(),
      deaths: json['deaths'].toString(),
      recovered: json['recovered'].toString(),
      active : json['active'].toString(),
      //flag: json['countryInfo']['flag'],
    );
  }
}
/*
class Info{
  final String flag;
  Info({this.flag});
  factory Info.fromJson(Map json){
    return Info(
      flag : json['flag'].toString(),
    );
  }
}*/
