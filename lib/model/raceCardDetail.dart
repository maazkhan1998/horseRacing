class RaceCardDetail {
  Data data;
  bool success;
  String message;

  RaceCardDetail({this.data, this.success, this.message});

  RaceCardDetail.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<Racecards> racecards;
  List<Details> details;
  String raceName;
  String raceType;
  String raceKind;
  String kindOfHorse;
  String raceDesc;
  String raceCardDesc;
  String currencyCode;
  int totalPrize;
  String sponsorName;
  String sponsorText;
  int distance;
  int distanceFurlong;
  String ground;
  int firstPrize;
  int secondPrize;
  int thirdPrize;
  int fourthPrize;
  int fifthPrize;
  int sixthPrize;

  Data(
      {this.racecards,
      this.details,
      this.raceName,
      this.raceType,
      this.raceKind,
      this.kindOfHorse,
      this.raceDesc,
      this.raceCardDesc,
      this.currencyCode,
      this.totalPrize,
      this.sponsorName,
      this.sponsorText,
      this.distance,
      this.distanceFurlong,
      this.ground,
      this.firstPrize,
      this.secondPrize,
      this.thirdPrize,
      this.fourthPrize,
      this.fifthPrize,
      this.sixthPrize});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['racecards'] != null) {
      racecards = new List<Racecards>();
      json['racecards'].forEach((v) {
        racecards.add(new Racecards.fromJson(v));
      });
    }
    if (json['details'] != null) {
      details = new List<Details>();
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
    raceName = json['raceName'];
    raceType = json['raceType'];
    raceKind = json['raceKind'];
    kindOfHorse = json['kindOfHorse'];
    raceDesc = json['raceDesc'];
    raceCardDesc = json['raceCardDesc'];
    currencyCode = json['currencyCode'];
    totalPrize = json['totalPrize'];
    sponsorName = json['sponsorName'];
    sponsorText = json['sponsorText'];
    distance = json['distance'];
    distanceFurlong = json['distanceFurlong'];
    ground = json['ground'];
    firstPrize = json['firstPrize'];
    secondPrize = json['secondPrize'];
    thirdPrize = json['thirdPrize'];
    fourthPrize = json['fourthPrize'];
    fifthPrize = json['fifthPrize'];
    sixthPrize = json['sixthPrize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.racecards != null) {
      data['racecards'] = this.racecards.map((v) => v.toJson()).toList();
    }
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    data['raceName'] = this.raceName;
    data['raceType'] = this.raceType;
    data['raceKind'] = this.raceKind;
    data['kindOfHorse'] = this.kindOfHorse;
    data['raceDesc'] = this.raceDesc;
    data['raceCardDesc'] = this.raceCardDesc;
    data['currencyCode'] = this.currencyCode;
    data['totalPrize'] = this.totalPrize;
    data['sponsorName'] = this.sponsorName;
    data['sponsorText'] = this.sponsorText;
    data['distance'] = this.distance;
    data['distanceFurlong'] = this.distanceFurlong;
    data['ground'] = this.ground;
    data['firstPrize'] = this.firstPrize;
    data['secondPrize'] = this.secondPrize;
    data['thirdPrize'] = this.thirdPrize;
    data['fourthPrize'] = this.fourthPrize;
    data['fifthPrize'] = this.fifthPrize;
    data['sixthPrize'] = this.sixthPrize;
    return data;
  }
}

class Racecards {
  int raceNo;
  String raceTime;
  bool resultEntered;

  Racecards({this.raceNo, this.raceTime, this.resultEntered});

  Racecards.fromJson(Map<String, dynamic> json) {
    raceNo = json['raceNo'];
    raceTime = json['raceTime'];
    resultEntered = json['resultEntered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raceNo'] = this.raceNo;
    data['raceTime'] = this.raceTime;
    data['resultEntered'] = this.resultEntered;
    return data;
  }
}

class Details {
  Horse horse;
  Result result;

  Details({this.horse, this.result});

  Details.fromJson(Map<String, dynamic> json) {
    horse = json['horse'] != null ? new Horse.fromJson(json['horse']) : null;
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.horse != null) {
      data['horse'] = this.horse.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Horse {
  String name;
  int horseNo;
  int gate;
  String nationality;
  int age;
  String color;
  String sex;
  int daysSincePrevRace;
  String siri;
  String gsiri;
  String dam;
  String trainer;
  String breeder;
  String ownerName;
  String equipment;
  String rating;
  String jockey;
  String jockeyWeight;
  String kindOfHorseId;

  Horse(
      {this.name,
      this.horseNo,
      this.gate,
      this.nationality,
      this.age,
      this.color,
      this.sex,
      this.daysSincePrevRace,
      this.siri,
      this.gsiri,
      this.dam,
      this.trainer,
      this.breeder,
      this.ownerName,
      this.equipment,
      this.rating,
      this.jockey,
      this.jockeyWeight,
      this.kindOfHorseId});

  Horse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    horseNo = json['horseNo'];
    gate = json['gate'];
    nationality = json['nationality'];
    age = json['age'];
    color = json['color'];
    sex = json['sex'];
    daysSincePrevRace = json['daysSincePrevRace'];
    siri = json['siri'];
    gsiri = json['gsiri'];
    dam = json['dam'];
    trainer = json['trainer'];
    breeder = json['breeder'];
    ownerName = json['ownerName'];
    equipment = json['equipment'];
    rating = json['rating'];
    jockey = json['jockey'];
    jockeyWeight = json['jockeyWeight'];
    kindOfHorseId = json['kindOfHorseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['horseNo'] = this.horseNo;
    data['gate'] = this.gate;
    data['nationality'] = this.nationality;
    data['age'] = this.age;
    data['color'] = this.color;
    data['sex'] = this.sex;
    data['daysSincePrevRace'] = this.daysSincePrevRace;
    data['siri'] = this.siri;
    data['gsiri'] = this.gsiri;
    data['dam'] = this.dam;
    data['trainer'] = this.trainer;
    data['breeder'] = this.breeder;
    data['ownerName'] = this.ownerName;
    data['equipment'] = this.equipment;
    data['rating'] = this.rating;
    data['jockey'] = this.jockey;
    data['jockeyWeight'] = this.jockeyWeight;
    data['kindOfHorseId'] = this.kindOfHorseId;
    return data;
  }
}

class Result {
  List<Details> details;
  Positions positions;
  int totalPrize;

  Result({this.details, this.positions, this.totalPrize});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['details'] != null) {
      details = new List<Details>();
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
    positions = json['positions'] != null
        ? new Positions.fromJson(json['positions'])
        : null;
    totalPrize = json['totalPrize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    if (this.positions != null) {
      data['positions'] = this.positions.toJson();
    }
    data['totalPrize'] = this.totalPrize;
    return data;
  }
}

class Detail {
  String date;
  String racecourse;
  int distance;
  String trackCondition;
  String raceType;
  int prizeAmount;
  String raceTime;
  String jockey;
  String jockeyWeight;
  String finishingPosition;
  double lessWeight;
  int noOfRunners;
  String winnerHorse;
  String winnerJockeyWeight;
  int gate;
  String groundType;

  Detail(
      {this.date,
      this.racecourse,
      this.distance,
      this.trackCondition,
      this.raceType,
      this.prizeAmount,
      this.raceTime,
      this.jockey,
      this.jockeyWeight,
      this.finishingPosition,
      this.lessWeight,
      this.noOfRunners,
      this.winnerHorse,
      this.winnerJockeyWeight,
      this.gate,
      this.groundType});

  Detail.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    racecourse = json['racecourse'];
    distance = json['distance'];
    trackCondition = json['trackCondition'];
    raceType = json['raceType'];
    prizeAmount = json['prizeAmount'];
    raceTime = json['raceTime'];
    jockey = json['jockey'];
    jockeyWeight = json['jockeyWeight'];
    finishingPosition = json['finishingPosition'];
    lessWeight = json['lessWeight'];
    noOfRunners = json['noOfRunners'];
    winnerHorse = json['winnerHorse'];
    winnerJockeyWeight = json['winnerJockeyWeight'];
    gate = json['gate'];
    groundType = json['groundType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['racecourse'] = this.racecourse;
    data['distance'] = this.distance;
    data['trackCondition'] = this.trackCondition;
    data['raceType'] = this.raceType;
    data['prizeAmount'] = this.prizeAmount;
    data['raceTime'] = this.raceTime;
    data['jockey'] = this.jockey;
    data['jockeyWeight'] = this.jockeyWeight;
    data['finishingPosition'] = this.finishingPosition;
    data['lessWeight'] = this.lessWeight;
    data['noOfRunners'] = this.noOfRunners;
    data['winnerHorse'] = this.winnerHorse;
    data['winnerJockeyWeight'] = this.winnerJockeyWeight;
    data['gate'] = this.gate;
    data['groundType'] = this.groundType;
    return data;
  }
}

class Positions {
  Starts starts;
  Starts distance;
  Starts raceType;
  Starts dirt;
  Starts turf;
  Starts allWeather;
  Starts uAE;

  Positions(
      {this.starts,
      this.distance,
      this.raceType,
      this.dirt,
      this.turf,
      this.allWeather,
      this.uAE});

  Positions.fromJson(Map<String, dynamic> json) {
    starts =
        json['starts'] != null ? new Starts.fromJson(json['starts']) : null;
    distance =
        json['distance'] != null ? new Starts.fromJson(json['distance']) : null;
    raceType =
        json['raceType'] != null ? new Starts.fromJson(json['raceType']) : null;
    dirt = json['Dirt'] != null ? new Starts.fromJson(json['Dirt']) : null;
    turf = json['Turf'] != null ? new Starts.fromJson(json['Turf']) : null;
    allWeather = json['All Weather'] != null
        ? new Starts.fromJson(json['All Weather'])
        : null;
    uAE = json['UAE'] != null ? new Starts.fromJson(json['UAE']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.starts != null) {
      data['starts'] = this.starts.toJson();
    }
    if (this.distance != null) {
      data['distance'] = this.distance.toJson();
    }
    if (this.raceType != null) {
      data['raceType'] = this.raceType.toJson();
    }
    if (this.dirt != null) {
      data['Dirt'] = this.dirt.toJson();
    }
    if (this.turf != null) {
      data['Turf'] = this.turf.toJson();
    }
    if (this.allWeather != null) {
      data['All Weather'] = this.allWeather.toJson();
    }
    if (this.uAE != null) {
      data['UAE'] = this.uAE.toJson();
    }
    return data;
  }
}

class Starts {
  int i1;
  int i2;
  int i3;
  int total;

  Starts({this.i1, this.i2, this.i3, this.total});

  Starts.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
    i3 = json['3'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.i1;
    data['2'] = this.i2;
    data['3'] = this.i3;
    data['total'] = this.total;
    return data;
  }
}
