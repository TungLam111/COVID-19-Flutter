import 'dart:async';
import 'dart:convert';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'structure.dart';
//import 'constants.dart';
import 'mainpage.dart';
import 'data.dart';
class MainHome extends StatefulWidget{

  MainHome({Key key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
 // List _flag;
  List _countries = [];
  HashMap _map = new HashMap<String, Detail>();
  HashMap _mymap = new HashMap<String, String>();
  HashMap afghanistan = new HashMap<String, dynamic>();
HashMap albania = new HashMap<String, dynamic>();
HashMap algeria = new HashMap<String, dynamic>();
HashMap andorra = new HashMap<String, dynamic>();
HashMap angola = new HashMap<String, dynamic>();
HashMap antigua = new HashMap<String, dynamic>();
HashMap argentina = new HashMap<String, dynamic>();
HashMap armenia = new HashMap<String, dynamic>();
HashMap australia = new HashMap<String, dynamic>();
HashMap austria = new HashMap<String, dynamic>();
HashMap azerbaijan = new HashMap<String, dynamic>();
HashMap bahamas = new HashMap<String, dynamic>();
HashMap bahrain = new HashMap<String, dynamic>();
HashMap bangladesh = new HashMap<String, dynamic>();
HashMap barbados = new HashMap<String, dynamic>();
HashMap belarus = new HashMap<String, dynamic>();
HashMap belgium = new HashMap<String, dynamic>();
HashMap benin = new HashMap<String, dynamic>();
HashMap bhutan = new HashMap<String, dynamic>();
HashMap bolivia = new HashMap<String, dynamic>();
HashMap bosnia = new HashMap<String, dynamic>();
HashMap brazil = new HashMap<String, dynamic>();
HashMap brunei = new HashMap<String, dynamic>();
HashMap bulgaria = new HashMap<String, dynamic>();
HashMap burkina = new HashMap<String, dynamic>();
HashMap cabo = new HashMap<String, dynamic>();
HashMap cambodia = new HashMap<String, dynamic>();
HashMap cameroon = new HashMap<String, dynamic>();
HashMap canada = new HashMap<String, dynamic>();
HashMap central = new HashMap<String, dynamic>();
HashMap chad = new HashMap<String, dynamic>();
HashMap chile = new HashMap<String, dynamic>();
HashMap china = new HashMap<String, dynamic>();
HashMap colombia = new HashMap<String, dynamic>();
HashMap congobra = new HashMap<String, dynamic>();
HashMap congokin = new HashMap<String, dynamic>();
HashMap costa = new HashMap<String, dynamic>();
HashMap cote = new HashMap<String, dynamic>();
HashMap croatia = new HashMap<String, dynamic>();
HashMap diamond = new HashMap<String, dynamic>();
HashMap cuba = new HashMap<String, dynamic>();
HashMap cyprus = new HashMap<String, dynamic>();
HashMap czechia = new HashMap<String, dynamic>();
HashMap denmark = new HashMap<String, dynamic>();
HashMap djibouti = new HashMap<String, dynamic>();
HashMap dominican = new HashMap<String, dynamic>();
HashMap ecuador = new HashMap<String, dynamic>();
HashMap egypt = new HashMap<String, dynamic>();
HashMap el = new HashMap<String, dynamic>();
HashMap equatorial = new HashMap<String, dynamic>();
HashMap eritrea = new HashMap<String, dynamic>();
HashMap estonia = new HashMap<String, dynamic>();
HashMap eswatini = new HashMap<String, dynamic>();
HashMap ethiopia = new HashMap<String, dynamic>();
HashMap fiji = new HashMap<String, dynamic>();
HashMap finland = new HashMap<String, dynamic>();
HashMap france = new HashMap<String, dynamic>();
HashMap gabon = new HashMap<String, dynamic>();
HashMap gambia = new HashMap<String, dynamic>();
HashMap georgia = new HashMap<String, dynamic>();
HashMap germany = new HashMap<String, dynamic>();
HashMap ghana = new HashMap<String, dynamic>();
HashMap greece = new HashMap<String, dynamic>();
HashMap guatemala = new HashMap<String, dynamic>();
HashMap guinea = new HashMap<String, dynamic>();
HashMap guyana = new HashMap<String, dynamic>();
HashMap haiti = new HashMap<String, dynamic>();
HashMap holy = new HashMap<String, dynamic>();
HashMap honduras = new HashMap<String, dynamic>();
HashMap hungary = new HashMap<String, dynamic>();
HashMap iceland = new HashMap<String, dynamic>();
HashMap india = new HashMap<String, dynamic>();
HashMap indonesia = new HashMap<String, dynamic>();
HashMap iran = new HashMap<String, dynamic>();
HashMap iraq = new HashMap<String, dynamic>();
HashMap ireland = new HashMap<String, dynamic>();
HashMap israel = new HashMap<String, dynamic>();
HashMap italy = new HashMap<String, dynamic>();
HashMap jamaica = new HashMap<String, dynamic>();
HashMap japan = new HashMap<String, dynamic>();
HashMap jordan = new HashMap<String, dynamic>();
HashMap kazakhstan = new HashMap<String, dynamic>();
HashMap kenya = new HashMap<String, dynamic>();
HashMap korea = new HashMap<String, dynamic>();
HashMap kuwait = new HashMap<String, dynamic>();
HashMap kyrgyzstan = new HashMap<String, dynamic>();
HashMap latvia = new HashMap<String, dynamic>();
HashMap lebanon = new HashMap<String, dynamic>();
HashMap liberia = new HashMap<String, dynamic>();
HashMap liechtenstein = new HashMap<String, dynamic>();
HashMap lithuania = new HashMap<String, dynamic>();
HashMap luxembourg = new HashMap<String, dynamic>();
HashMap madagascar = new HashMap<String, dynamic>();
HashMap malaysia = new HashMap<String, dynamic>();
HashMap maldives = new HashMap<String, dynamic>();
HashMap malta = new HashMap<String, dynamic>();
HashMap mauritania = new HashMap<String, dynamic>();
HashMap mauritius = new HashMap<String, dynamic>();
HashMap mexico = new HashMap<String, dynamic>();
HashMap moldova = new HashMap<String, dynamic>();
HashMap monaco = new HashMap<String, dynamic>();
HashMap mongolia = new HashMap<String, dynamic>();
HashMap montenegro = new HashMap<String, dynamic>();
HashMap morocco = new HashMap<String, dynamic>();
HashMap namibia = new HashMap<String, dynamic>();
HashMap nepal = new HashMap<String, dynamic>();
HashMap netherlands = new HashMap<String, dynamic>();
HashMap newzealand = new HashMap<String, dynamic>();
HashMap nicaragua = new HashMap<String, dynamic>();
HashMap niger = new HashMap<String, dynamic>();
HashMap nigeria = new HashMap<String, dynamic>();
HashMap north = new HashMap<String, dynamic>();
HashMap norway = new HashMap<String, dynamic>();
HashMap oman = new HashMap<String, dynamic>();
HashMap pakistan = new HashMap<String, dynamic>();
HashMap panama = new HashMap<String, dynamic>();
HashMap papua = new HashMap<String, dynamic>();
HashMap paraguay = new HashMap<String, dynamic>();
HashMap peru = new HashMap<String, dynamic>();
HashMap philippines = new HashMap<String, dynamic>();
HashMap poland = new HashMap<String, dynamic>();
HashMap portugal = new HashMap<String, dynamic>();
HashMap qatar = new HashMap<String, dynamic>();
HashMap romania = new HashMap<String, dynamic>();
HashMap russia = new HashMap<String, dynamic>();
HashMap rwanda = new HashMap<String, dynamic>();
HashMap saintlucia = new HashMap<String, dynamic>();
HashMap saintvincent = new HashMap<String, dynamic>();
HashMap san = new HashMap<String, dynamic>();
HashMap saudi = new HashMap<String, dynamic>();
HashMap senegal = new HashMap<String, dynamic>();
HashMap serbia = new HashMap<String, dynamic>();
HashMap seychelles = new HashMap<String, dynamic>();
HashMap singapore = new HashMap<String, dynamic>();
HashMap slovakia = new HashMap<String, dynamic>();
HashMap slovenia = new HashMap<String, dynamic>();
HashMap somalia = new HashMap<String, dynamic>();
HashMap southafrica = new HashMap<String, dynamic>();
HashMap spain = new HashMap<String, dynamic>();
HashMap sri = new HashMap<String, dynamic>();
HashMap sudan = new HashMap<String, dynamic>();
HashMap suriname = new HashMap<String, dynamic>();
HashMap sweden = new HashMap<String, dynamic>();
HashMap switzerland = new HashMap<String, dynamic>();
HashMap taiwan = new HashMap<String, dynamic>();
HashMap tanzania = new HashMap<String, dynamic>();
HashMap thailand = new HashMap<String, dynamic>();
HashMap togo = new HashMap<String, dynamic>();
HashMap trinidad = new HashMap<String, dynamic>();
HashMap tunisia = new HashMap<String, dynamic>();
HashMap turkey = new HashMap<String, dynamic>();
HashMap uganda = new HashMap<String, dynamic>();
HashMap ukraine = new HashMap<String, dynamic>();
HashMap unitedarab = new HashMap<String, dynamic>();
HashMap unitedkingdom = new HashMap<String, dynamic>();
HashMap uruguay = new HashMap<String, dynamic>();
HashMap us = new HashMap<String, dynamic>();
HashMap uzbekistan = new HashMap<String, dynamic>();
HashMap venezuela = new HashMap<String, dynamic>();
HashMap vietnam = new HashMap<String, dynamic>();
HashMap zambia = new HashMap<String, dynamic>();
HashMap zimbabwe = new HashMap<String, dynamic>();
HashMap dominica = new HashMap<String, dynamic>();
HashMap grenada = new HashMap<String, dynamic>();
HashMap mozambique = new HashMap<String, dynamic>();
HashMap syria = new HashMap<String, dynamic>();
HashMap timorleste = new HashMap<String, dynamic>();
HashMap belize = new HashMap<String, dynamic>();
HashMap laos = new HashMap<String, dynamic>();
HashMap libya = new HashMap<String, dynamic>();
HashMap west = new HashMap<String, dynamic>();
HashMap guineabissau = new HashMap<String, dynamic>();
HashMap mali = new HashMap<String, dynamic>();
HashMap saint = new HashMap<String, dynamic>();
HashMap kosovo = new HashMap<String, dynamic>();
HashMap burma = new HashMap<String, dynamic>();
HashMap ms = new HashMap<String, dynamic>();
HashMap botswana = new HashMap<String, dynamic>();
HashMap burundi = new HashMap<String, dynamic>();
HashMap sierra = new HashMap<String, dynamic>();
HashMap malawi = new HashMap<String, dynamic>();
HashMap southsudan = new HashMap<String, dynamic>();
HashMap western = new HashMap<String, dynamic>();
HashMap sao = new HashMap<String, dynamic>();
HashMap yemen = new HashMap<String, dynamic>();
HashMap comoros = new HashMap<String, dynamic>();
HashMap tajikistan = new HashMap<String, dynamic>();
HashMap lesotho = new HashMap<String, dynamic>();
//fetch data of list of country
  Future<List<Detail>> fetchDetail() async {
    var response =
      await http.get('https://corona.lmao.ninja/v2/countries');
  
    if (response.statusCode == 200) {
     var jsonObject = json.decode(response.body);
      return jsonObject
        .map<Detail>((json) => Detail.fromJson(json))
        .toList(growable: false);
  } else {
    throw Exception('${response.statusCode}');
    
  }
}
Future<Map<String, dynamic>> fetchTimeSeri() async {
    var response =
      await http.get('https://pomber.github.io/covid19/timeseries.json');
  
    if (response.statusCode == 200) {
     var jsonObject = json.decode(response.body) as Map;
      return jsonObject;
  } else {
    throw Exception('${response.statusCode}');
    
  }
}
// fetch data of world
  Future<Detail> fetchAll() async {
    var response = await http.get('https://corona.lmao.ninja/v2/all');
     if (response.statusCode == 200) {
    var jsonObject = json.decode(response.body);
    return Detail.fromJson(jsonObject);
  }
  else {
    throw Exception('${response.statusCode}');
  }
 }
  @override
  void initState() {
    super.initState();
    fetchDetail().then((value){
      for (var i = 0; i< value.length; i++){
        _countries.add(value[i].country);
        _mymap[value[i].country] = flag[i];
        _map[value[i].country] = value[i];

   }
    fetchTimeSeri().then((date) {
      for (var  i=0; i< date['Vietnam'].length; i++) {
afghanistan[date['Afghanistan'][i]['date']] = date['Afghanistan'][i];
albania[date['Albania'][i]['date']] = date['Albania'][i];
algeria[date['Algeria'][i]['date']] = date['Algeria'][i];
andorra[date['Andorra'][i]['date']] = date['Andorra'][i];
angola[date['Angola'][i]['date']] = date['Angola'][i];
antigua[date['Antigua and Barbuda'][i]['date']] = date['Antigua and Barbuda'][i];
argentina[date['Argentina'][i]['date']] = date['Argentina'][i];
armenia[date['Armenia'][i]['date']] = date['Armenia'][i];
australia[date['Australia'][i]['date']] = date['Australia'][i];
austria[date['Austria'][i]['date']] = date['Austria'][i];
azerbaijan[date['Azerbaijan'][i]['date']] = date['Azerbaijan'][i];
bahamas[date['Bahamas'][i]['date']] = date['Bahamas'][i];
bahrain[date['Bahrain'][i]['date']] = date['Bahrain'][i];
bangladesh[date['Bangladesh'][i]['date']] = date['Bangladesh'][i];
barbados[date['Barbados'][i]['date']] = date['Barbados'][i];
belarus[date['Belarus'][i]['date']] = date['Belarus'][i];
belgium[date['Belgium'][i]['date']] = date['Belgium'][i];
benin[date['Benin'][i]['date']] = date['Benin'][i];
bhutan[date['Bhutan'][i]['date']] = date['Bhutan'][i];
bolivia[date['Bolivia'][i]['date']] = date['Bolivia'][i];
bosnia[date['Bosnia and Herzegovina'][i]['date']] = date['Bosnia and Herzegovina'][i];
brazil[date['Brazil'][i]['date']] = date['Brazil'][i];
brunei[date['Brunei'][i]['date']] = date['Brunei'][i];
bulgaria[date['Bulgaria'][i]['date']] = date['Bulgaria'][i];
burkina[date['Burkina Faso'][i]['date']] = date['Burkina Faso'][i];
cabo[date['Cabo Verde'][i]['date']] = date['Cabo Verde'][i];
cambodia[date['Cambodia'][i]['date']] = date['Cambodia'][i];
cameroon[date['Cameroon'][i]['date']] = date['Cameroon'][i];
canada[date['Canada'][i]['date']] = date['Canada'][i];
central[date['Central African Republic'][i]['date']] = date['Central African Republic'][i];
chad[date['Chad'][i]['date']] = date['Chad'][i];
chile[date['Chile'][i]['date']] = date['Chile'][i];
china[date['China'][i]['date']] = date['China'][i];
colombia[date['Colombia'][i]['date']] = date['Colombia'][i];
congobra[date['Congo (Brazzaville)'][i]['date']] = date['Congo (Brazzaville)'][i];
congokin[date['Congo (Kinshasa)'][i]['date']] = date['Congo (Kinshasa)'][i];
costa[date['Costa Rica'][i]['date']] = date['Costa Rica'][i];
cote[date["Cote d'Ivoire"][i]['date']] = date["Cote d'Ivoire"][i];
croatia[date['Croatia'][i]['date']] = date['Croatia'][i];
diamond[date['Diamond Princess'][i]['date']] = date['Diamond Princess'][i];
cuba[date['Cuba'][i]['date']] = date['Cuba'][i];
cyprus[date['Cyprus'][i]['date']] = date['Cyprus'][i];
czechia[date['Czechia'][i]['date']] = date['Czechia'][i];
denmark[date['Denmark'][i]['date']] = date['Denmark'][i];
djibouti[date['Djibouti'][i]['date']] = date['Djibouti'][i];
dominican[date['Dominican Republic'][i]['date']] = date['Dominican Republic'][i];
ecuador[date['Ecuador'][i]['date']] = date['Ecuador'][i];
egypt[date['Egypt'][i]['date']] = date['Egypt'][i];
el[date['El Salvador'][i]['date']] = date['El Salvador'][i];
equatorial[date['Equatorial Guinea'][i]['date']] = date['Equatorial Guinea'][i];
eritrea[date['Eritrea'][i]['date']] = date['Eritrea'][i];
estonia[date['Estonia'][i]['date']] = date['Estonia'][i];
eswatini[date['Eswatini'][i]['date']] = date['Eswatini'][i];
ethiopia[date['Ethiopia'][i]['date']] = date['Ethiopia'][i];
fiji[date['Fiji'][i]['date']] = date['Fiji'][i];
finland[date['Finland'][i]['date']] = date['Finland'][i];
france[date['France'][i]['date']] = date['France'][i];
gabon[date['Gabon'][i]['date']] = date['Gabon'][i];
gambia[date['Gambia'][i]['date']] = date['Gambia'][i];
georgia[date['Georgia'][i]['date']] = date['Georgia'][i];
germany[date['Germany'][i]['date']] = date['Germany'][i];
ghana[date['Ghana'][i]['date']] = date['Ghana'][i];
greece[date['Greece'][i]['date']] = date['Greece'][i];
guatemala[date['Guatemala'][i]['date']] = date['Guatemala'][i];
guinea[date['Guinea'][i]['date']] = date['Guinea'][i];
guyana[date['Guyana'][i]['date']] = date['Guyana'][i];
haiti[date['Haiti'][i]['date']] = date['Haiti'][i];
holy[date['Holy See'][i]['date']] = date['Holy See'][i];
honduras[date['Honduras'][i]['date']] = date['Honduras'][i];
hungary[date['Hungary'][i]['date']] = date['Hungary'][i];
iceland[date['Iceland'][i]['date']] = date['Iceland'][i];
india[date['India'][i]['date']] = date['India'][i];
indonesia[date['Indonesia'][i]['date']] = date['Indonesia'][i];
iran[date['Iran'][i]['date']] = date['Iran'][i];
iraq[date['Iraq'][i]['date']] = date['Iraq'][i];
ireland[date['Ireland'][i]['date']] = date['Ireland'][i];
israel[date['Israel'][i]['date']] = date['Israel'][i];
italy[date['Italy'][i]['date']] = date['Italy'][i];
jamaica[date['Jamaica'][i]['date']] = date['Jamaica'][i];
japan[date['Japan'][i]['date']] = date['Japan'][i];
jordan[date['Jordan'][i]['date']] = date['Jordan'][i];
kazakhstan[date['Kazakhstan'][i]['date']] = date['Kazakhstan'][i];
kenya[date['Kenya'][i]['date']] = date['Kenya'][i];
korea[date['Korea, South'][i]['date']] = date['Korea, South'][i];
kuwait[date['Kuwait'][i]['date']] = date['Kuwait'][i];
kyrgyzstan[date['Kyrgyzstan'][i]['date']] = date['Kyrgyzstan'][i];
latvia[date['Latvia'][i]['date']] = date['Latvia'][i];
lebanon[date['Lebanon'][i]['date']] = date['Lebanon'][i];
liberia[date['Liberia'][i]['date']] = date['Liberia'][i];
liechtenstein[date['Liechtenstein'][i]['date']] = date['Liechtenstein'][i];
lithuania[date['Lithuania'][i]['date']] = date['Lithuania'][i];
luxembourg[date['Luxembourg'][i]['date']] = date['Luxembourg'][i];
madagascar[date['Madagascar'][i]['date']] = date['Madagascar'][i];
malaysia[date['Malaysia'][i]['date']] = date['Malaysia'][i];
maldives[date['Maldives'][i]['date']] = date['Maldives'][i];
malta[date['Malta'][i]['date']] = date['Malta'][i];
mauritania[date['Mauritania'][i]['date']] = date['Mauritania'][i];
mauritius[date['Mauritius'][i]['date']] = date['Mauritius'][i];
mexico[date['Mexico'][i]['date']] = date['Mexico'][i];
moldova[date['Moldova'][i]['date']] = date['Moldova'][i];
monaco[date['Monaco'][i]['date']] = date['Monaco'][i];
mongolia[date['Mongolia'][i]['date']] = date['Mongolia'][i];
montenegro[date['Montenegro'][i]['date']] = date['Montenegro'][i];
morocco[date['Morocco'][i]['date']] = date['Morocco'][i];
namibia[date['Namibia'][i]['date']] = date['Namibia'][i];
nepal[date['Nepal'][i]['date']] = date['Nepal'][i];
netherlands[date['Netherlands'][i]['date']] = date['Netherlands'][i];
newzealand[date['New Zealand'][i]['date']] = date['New Zealand'][i];
nicaragua[date['Nicaragua'][i]['date']] = date['Nicaragua'][i];
niger[date['Niger'][i]['date']] = date['Niger'][i];
nigeria[date['Nigeria'][i]['date']] = date['Nigeria'][i];
north[date['North Macedonia'][i]['date']] = date['North Macedonia'][i];
norway[date['Norway'][i]['date']] = date['Norway'][i];
oman[date['Oman'][i]['date']] = date['Oman'][i];
pakistan[date['Pakistan'][i]['date']] = date['Pakistan'][i];
panama[date['Panama'][i]['date']] = date['Panama'][i];
papua[date['Papua New Guinea'][i]['date']] = date['Papua New Guinea'][i];
paraguay[date['Paraguay'][i]['date']] = date['Paraguay'][i];
peru[date['Peru'][i]['date']] = date['Peru'][i];
philippines[date['Philippines'][i]['date']] = date['Philippines'][i];
poland[date['Poland'][i]['date']] = date['Poland'][i];
portugal[date['Portugal'][i]['date']] = date['Portugal'][i];
qatar[date['Qatar'][i]['date']] = date['Qatar'][i];
romania[date['Romania'][i]['date']] = date['Romania'][i];
russia[date['Russia'][i]['date']] = date['Russia'][i];
rwanda[date['Rwanda'][i]['date']] = date['Rwanda'][i];
saintlucia[date['Saint Lucia'][i]['date']] = date['Saint Lucia'][i];
saintvincent[date['Saint Vincent and the Grenadines'][i]['date']] = date['Saint Vincent and the Grenadines'][i];
san[date['San Marino'][i]['date']] = date['San Marino'][i];
saudi[date['Saudi Arabia'][i]['date']] = date['Saudi Arabia'][i];
senegal[date['Senegal'][i]['date']] = date['Senegal'][i];
serbia[date['Serbia'][i]['date']] = date['Serbia'][i];
seychelles[date['Seychelles'][i]['date']] = date['Seychelles'][i];
singapore[date['Singapore'][i]['date']] = date['Singapore'][i];
slovakia[date['Slovakia'][i]['date']] = date['Slovakia'][i];
slovenia[date['Slovenia'][i]['date']] = date['Slovenia'][i];
somalia[date['Somalia'][i]['date']] = date['Somalia'][i];
southafrica[date['South Africa'][i]['date']] = date['South Africa'][i];
spain[date['Spain'][i]['date']] = date['Spain'][i];
sri[date['Sri Lanka'][i]['date']] = date['Sri Lanka'][i];
sudan[date['Sudan'][i]['date']] = date['Sudan'][i];
suriname[date['Suriname'][i]['date']] = date['Suriname'][i];
sweden[date['Sweden'][i]['date']] = date['Sweden'][i];
switzerland[date['Switzerland'][i]['date']] = date['Switzerland'][i];
taiwan[date['Taiwan*'][i]['date']] = date['Taiwan*'][i];
tanzania[date['Tanzania'][i]['date']] = date['Tanzania'][i];
thailand[date['Thailand'][i]['date']] = date['Thailand'][i];
togo[date['Togo'][i]['date']] = date['Togo'][i];
trinidad[date['Trinidad and Tobago'][i]['date']] = date['Trinidad and Tobago'][i];
tunisia[date['Tunisia'][i]['date']] = date['Tunisia'][i];
turkey[date['Turkey'][i]['date']] = date['Turkey'][i];
uganda[date['Uganda'][i]['date']] = date['Uganda'][i];
ukraine[date['Ukraine'][i]['date']] = date['Ukraine'][i];
unitedarab[date['United Arab Emirates'][i]['date']] = date['United Arab Emirates'][i];
unitedkingdom[date['United Kingdom'][i]['date']] = date['United Kingdom'][i];
uruguay[date['Uruguay'][i]['date']] = date['Uruguay'][i];
us[date['US'][i]['date']] = date['US'][i];
uzbekistan[date['Uzbekistan'][i]['date']] = date['Uzbekistan'][i];
venezuela[date['Venezuela'][i]['date']] = date['Venezuela'][i];
vietnam[date['Vietnam'][i]['date']] = date['Vietnam'][i];
zambia[date['Zambia'][i]['date']] = date['Zambia'][i];
zimbabwe[date['Zimbabwe'][i]['date']] = date['Zimbabwe'][i];
dominica[date['Dominica'][i]['date']] = date['Dominica'][i];
grenada[date['Grenada'][i]['date']] = date['Grenada'][i];
mozambique[date['Mozambique'][i]['date']] = date['Mozambique'][i];
syria[date['Syria'][i]['date']] = date['Syria'][i];
timorleste[date['Timor-Leste'][i]['date']] = date['Timor-Leste'][i];
belize[date['Belize'][i]['date']] = date['Belize'][i];
laos[date['Laos'][i]['date']] = date['Laos'][i];
libya[date['Libya'][i]['date']] = date['Libya'][i];
west[date['West Bank and Gaza'][i]['date']] = date['West Bank and Gaza'][i];
guineabissau[date['Guinea-Bissau'][i]['date']] = date['Guinea-Bissau'][i];
mali[date['Mali'][i]['date']] = date['Mali'][i];
saint[date['Saint Kitts and Nevis'][i]['date']] = date['Saint Kitts and Nevis'][i];
kosovo[date['Kosovo'][i]['date']] = date['Kosovo'][i];
burma[date['Burma'][i]['date']] = date['Burma'][i];
ms[date['MS Zaandam'][i]['date']] = date['MS Zaandam'][i];
botswana[date['Botswana'][i]['date']] = date['Botswana'][i];
burundi[date['Burundi'][i]['date']] = date['Burundi'][i];
sierra[date['Sierra Leone'][i]['date']] = date['Sierra Leone'][i];
malawi[date['Malawi'][i]['date']] = date['Malawi'][i];
southsudan[date['South Sudan'][i]['date']] = date['South Sudan'][i];
western[date['Western Sahara'][i]['date']] = date['Western Sahara'][i];
sao[date['Sao Tome and Principe'][i]['date']] = date['Sao Tome and Principe'][i];
yemen[date['Yemen'][i]['date']] = date['Yemen'][i];
comoros[date['Comoros'][i]['date']] = date['Comoros'][i];
tajikistan[date['Tajikistan'][i]['date']] = date['Tajikistan'][i];
lesotho[date['Lesotho'][i]['date']] = date['Lesotho'][i];
    }
date['Afghanistan'] = afghanistan;
date['Albania'] = albania;
date['Algeria'] = algeria;
date['Andorra'] = andorra;
date['Angola'] = angola;
date['Antigua and Barbuda'] = antigua;
date['Argentina'] = argentina;
date['Armenia'] = armenia;
date['Australia'] = australia;
date['Austria'] = austria;
date['Azerbaijan'] = azerbaijan;
date['Bahamas'] = bahamas;
date['Bahrain'] = bahrain;
date['Bangladesh'] = bangladesh;
date['Barbados'] = barbados;
date['Belarus'] = belarus;
date['Belgium'] = belgium;
date['Benin'] = benin;
date['Bhutan'] = bhutan;
date['Bolivia'] = bolivia;
date['Bosnia and Herzegovina'] = bosnia;
date['Brazil'] = brazil;
date['Brunei'] = brunei;
date['Bulgaria'] = bulgaria;
date['Burkina Faso'] = burkina;
date['Cabo Verde'] = cabo;
date['Cambodia'] = cambodia;
date['Cameroon'] = cameroon;
date['Canada'] = canada;
date['Central African Republic'] = central;
date['Chad'] = chad;
date['Chile'] = chile;
date['China'] = china;
date['Colombia'] = colombia;
date['Congo (Brazzaville)'] = congobra;
date['Congo (Kinshasa)'] = congokin;
date['Costa Rica'] = costa;
date["Cote d'Ivoire"] = cote;
date['Croatia'] = croatia;
date['Diamond Princess'] = diamond;
date['Cuba'] = cuba;
date['Cyprus'] = cyprus;
date['Czechia'] = czechia;
date['Denmark'] = denmark;
date['Djibouti'] = djibouti;
date['Dominican Republic'] = dominican;
date['Ecuador'] = ecuador;
date['Egypt'] = egypt;
date['El Salvador'] = el;
date['Equatorial Guinea'] = equatorial;
date['Eritrea'] = eritrea;
date['Estonia'] = estonia;
date['Eswatini'] = eswatini;
date['Ethiopia'] = ethiopia;
date['Fiji'] = fiji;
date['Finland'] = finland;
date['France'] = france;
date['Gabon'] = gabon;
date['Gambia'] = gambia;
date['Georgia'] = georgia;
date['Germany'] = germany;
date['Ghana'] = ghana;
date['Greece'] = greece;
date['Guatemala'] = guatemala;
date['Guinea'] = guinea;
date['Guyana'] = guyana;
date['Haiti'] = haiti;
date['Holy See'] = holy;
date['Honduras'] = honduras;
date['Hungary'] = hungary;
date['Iceland'] = iceland;
date['India'] = india;
date['Indonesia'] = indonesia;
date['Iran'] = iran;
date['Iraq'] = iraq;
date['Ireland'] = ireland;
date['Israel'] = israel;
date['Italy'] = italy;
date['Jamaica'] = jamaica;
date['Japan'] = japan;
date['Jordan'] = jordan;
date['Kazakhstan'] = kazakhstan;
date['Kenya'] = kenya;
date['Korea, South'] = korea;
date['Kuwait'] = kuwait;
date['Kyrgyzstan'] = kyrgyzstan;
date['Latvia'] = latvia;
date['Lebanon'] = lebanon;
date['Liberia'] = liberia;
date['Liechtenstein'] = liechtenstein;
date['Lithuania'] = lithuania;
date['Luxembourg'] = luxembourg;
date['Madagascar'] = madagascar;
date['Malaysia'] = malaysia;
date['Maldives'] = maldives;
date['Malta'] = malta;
date['Mauritania'] = mauritania;
date['Mauritius'] = mauritius;
date['Mexico'] = mexico;
date['Moldova'] = moldova;
date['Monaco'] = monaco;
date['Mongolia'] = mongolia;
date['Montenegro'] = montenegro;
date['Morocco'] = morocco;
date['Namibia'] = namibia;
date['Nepal'] = nepal;
date['Netherlands'] = netherlands;
date['New Zealand'] = newzealand;
date['Nicaragua'] = nicaragua;
date['Niger'] = niger;
date['Nigeria'] = nigeria;
date['North Macedonia'] = north;
date['Norway'] = norway;
date['Oman'] = oman;
date['Pakistan'] = pakistan;
date['Panama'] = panama;
date['Papua New Guinea'] = papua;
date['Paraguay'] = paraguay;
date['Peru'] = peru;
date['Philippines'] = philippines;
date['Poland'] = poland;
date['Portugal'] = portugal;
date['Qatar'] = qatar;
date['Romania'] = romania;
date['Russia'] = russia;
date['Rwanda'] = rwanda;
date['Saint Lucia'] = saintlucia;
date['Saint Vincent and the Grenadines'] = saintvincent;
date['San Marino'] = san;
date['Saudi Arabia'] = saudi;
date['Senegal'] = senegal;
date['Serbia'] = serbia;
date['Seychelles'] = seychelles;
date['Singapore'] = singapore;
date['Slovakia'] = slovakia;
date['Slovenia'] = slovenia;
date['Somalia'] = somalia;
date['South Africa'] = southafrica;
date['Spain'] = spain;
date['Sri Lanka'] = sri;
date['Sudan'] = sudan;
date['Suriname'] = suriname;
date['Sweden'] = sweden;
date['Switzerland'] = switzerland;
date['Taiwan*'] = taiwan;
date['Tanzania'] = tanzania;
date['Thailand'] = thailand;
date['Togo'] = togo;
date['Trinidad and Tobago'] = trinidad;
date['Tunisia'] = tunisia;
date['Turkey'] = turkey;
date['Uganda'] = uganda;
date['Ukraine'] = ukraine;
date['United Arab Emirates'] = unitedarab;
date['United Kingdom'] = unitedkingdom;
date['Uruguay'] = uruguay;
date['US'] = us;
date['Uzbekistan'] = uzbekistan;
date['Venezuela'] = venezuela;
date['Vietnam'] = vietnam;
date['Zambia'] = zambia;
date['Zimbabwe'] = zimbabwe;
date['Dominica'] = dominica;
date['Grenada'] = grenada;
date['Mozambique'] = mozambique;
date['Syria'] = syria;
date['Timor-Leste'] = timorleste;
date['Belize'] = belize;
date['Laos'] = laos;
date['Libya'] = libya;
date['West Bank and Gaza'] = west;
date['Guinea-Bissau'] = guineabissau;
date['Mali'] = mali;
date['Saint Kitts and Nevis'] = saint;
date['Kosovo'] = kosovo;
date['Burma'] = burma;
date['MS Zaandam'] = ms;
date['Botswana'] = botswana;
date['Burundi'] = burundi;
date['Sierra Leone'] = sierra;
date['Malawi'] = malawi;
date['South Sudan'] = southsudan;
date['Western Sahara'] = western;
date['Sao Tome and Principe'] = sao;
date['Yemen'] = yemen;
date['Comoros'] = comoros;
date['Tajikistan'] = tajikistan;
date['Lesotho'] = lesotho;
    fetchAll().then((res) {
      return Navigator.push(context, MaterialPageRoute(
            builder: (context) => Worldwide(value: value, info: res, countries: _countries, map: _map, mymap: _mymap, date: date)));
    });
    });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 50),
                child: Image(
                  image: AssetImage('assets/images/meliquestreet_20200723_111219_0.jpg'),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan> [
                    TextSpan(
                        text: 'STAY ',
                        style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: 'HOME  ',
                        style: TextStyle(color: Colors.blueAccent)),
                    TextSpan(
                        text: 'STAY ',
                        style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: 'SAFE',
                        style: TextStyle(color: Colors.green)),
                  ]
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}