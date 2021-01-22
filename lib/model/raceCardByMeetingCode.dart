class RaceCardByMeetingCode {
  List<Data> data = [];
  bool success;
  String message;

  RaceCardByMeetingCode({this.data, this.success, this.message});

  RaceCardByMeetingCode.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      // ignore: deprecated_member_use
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String id;
  String meetingDate;
  String racecourse;
  String countryFlag;
  String raceDescription;
  int raceNo;
  String raceTime;
  String raceName;
  String raceKind;
  String distance;
  String kindOfHorse;
  String purse;
  String noOfHorseInRace;
  List<Positions> positions;

  Data(
      {this.id,
      this.meetingDate,
      this.racecourse,
      this.countryFlag,
      this.raceDescription,
      this.raceNo,
      this.raceTime,
      this.raceName,
      this.raceKind,
      this.distance,
      this.kindOfHorse,
      this.purse,
      this.noOfHorseInRace,
      this.positions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    meetingDate = json['meetingDate'];
    racecourse = json['racecourse'];
    countryFlag = json['countryFlag'];
    raceDescription = json['raceDescription'];
    raceNo = json['raceNo'];
    raceTime = json['raceTime'];
    raceName = json['raceName'];
    raceKind = json['raceKind'];
    distance = json['distance'];
    kindOfHorse = json['kindOfHorse'];
    purse = json['purse'];
    noOfHorseInRace = json['noOfHorseInRace'];
    if (json['positions'] != null) {
      positions = new List<Positions>();
      json['positions'].forEach((v) {
        positions.add(new Positions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['meetingDate'] = this.meetingDate;
    data['racecourse'] = this.racecourse;
    data['countryFlag'] = this.countryFlag;
    data['raceDescription'] = this.raceDescription;
    data['raceNo'] = this.raceNo;
    data['raceTime'] = this.raceTime;
    data['raceName'] = this.raceName;
    data['raceKind'] = this.raceKind;
    data['distance'] = this.distance;
    data['kindOfHorse'] = this.kindOfHorse;
    data['purse'] = this.purse;
    data['noOfHorseInRace'] = this.noOfHorseInRace;
    if (this.positions != null) {
      data['positions'] = this.positions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Positions {
  String position;
  int gate;
  String horseName;

  Positions({this.position, this.gate, this.horseName});

  Positions.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    gate = json['gate'];
    horseName = json['horseName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['gate'] = this.gate;
    data['horseName'] = this.horseName;
    return data;
  }
}
