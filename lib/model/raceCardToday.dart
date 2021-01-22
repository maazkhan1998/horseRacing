class RaceCardToday {
  List<Data> data = [];
  bool success;
  String message;

  RaceCardToday({this.data, this.success, this.message});

  RaceCardToday.fromJson(Map<String, dynamic> json) {
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
  String racecourseFullName;
  String raceTime;
  String raceName;
  String distance;
  bool isNext;
  String nextMeetingDateTime;

  Data(
      {this.racecourseFullName,
      this.raceTime,
      this.raceName,
      this.distance,
      this.isNext,
      this.nextMeetingDateTime});

  Data.fromJson(Map<String, dynamic> json) {
    racecourseFullName = json['racecourseFullName'];
    raceTime = json['raceTime'];
    raceName = json['raceName'];
    distance = json['distance'];
    isNext = json['isNext'];
    nextMeetingDateTime = json['nextMeetingDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['racecourseFullName'] = this.racecourseFullName;
    data['raceTime'] = this.raceTime;
    data['raceName'] = this.raceName;
    data['distance'] = this.distance;
    data['isNext'] = this.isNext;
    data['nextMeetingDateTime'] = this.nextMeetingDateTime;
    return data;
  }
}
