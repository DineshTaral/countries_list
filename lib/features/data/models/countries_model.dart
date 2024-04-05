class CountriesModel {
  String? abbreviation;
  String? capital;
  String? currency;
  String? name;
  String? phone;
  int? population;
  Media? media;
  int? id;

  CountriesModel(
      {abbreviation,
        capital,
        currency,
        name,
        phone,
        population,
        media,
        id});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    abbreviation = json['abbreviation'];
    capital = json['capital'];
    currency = json['currency'];
    name = json['name'];
    phone = json['phone'];
    population = json['population'];
    media = json['media'] != null ?  Media.fromJson(json['media']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['abbreviation'] = abbreviation;
    data['capital'] = capital;
    data['currency'] = currency;
    data['name'] = name;
    data['phone'] = phone;
    data['population'] = population;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class Media {
  String? flag;
  String? emblem;
  String? orthographic;

  Media({flag, emblem, orthographic});

  Media.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    emblem = json['emblem'];
    orthographic = json['orthographic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['flag'] = flag;
    data['emblem'] = emblem;
    data['orthographic'] = orthographic;
    return data;
  }
}
