class AstroModel {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  // Changed int? to num? to safely handle both integer and double JSON values
  num? moonIllumination;
  num? isMoonUp;
  num? isSunUp;

  AstroModel({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  // Factory constructor for parsing JSON into model object
  AstroModel.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    // Accepts both int and double safely from API
    moonIllumination = json['moon_illumination'];
    isMoonUp = json['is_moon_up'];
    isSunUp = json['is_sun_up'];
  }

  // Method to convert model instance back to JSON map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['moonrise'] = moonrise;
    data['moonset'] = moonset;
    data['moon_phase'] = moonPhase;
    data['moon_illumination'] = moonIllumination;
    data['is_moon_up'] = isMoonUp;
    data['is_sun_up'] = isSunUp;

    return data;
  }
}