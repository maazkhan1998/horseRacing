class MeetingByDate {
  List<Data> data = [];
  bool success;
  String message;

  MeetingByDate({this.data, this.success, this.message});

  MeetingByDate.fromJson(Map<String, dynamic> json) {
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
  String countryName;
  String flag;
  List<MeetingCodes> meetingCodes = [];

  Data({this.countryName, this.flag, this.meetingCodes});

  Data.fromJson(Map<String, dynamic> json) {
    countryName = json['countryName'];
    flag = json['flag'];
    if (json['meetingCodes'] != null) {
      // ignore: deprecated_member_use
      meetingCodes = new List<MeetingCodes>();
      json['meetingCodes'].forEach((v) {
        meetingCodes.add(new MeetingCodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryName'] = this.countryName;
    data['flag'] = this.flag;
    if (this.meetingCodes != null) {
      data['meetingCodes'] = this.meetingCodes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MeetingCodes {
  String meetingCode;
  String racecourseFullName;
  String raceTime;
  String meetingDate;

  MeetingCodes(
      {this.meetingCode,
      this.racecourseFullName,
      this.raceTime,
      this.meetingDate});

  MeetingCodes.fromJson(Map<String, dynamic> json) {
    meetingCode = json['meetingCode'];
    racecourseFullName = json['racecourseFullName'];
    raceTime = json['raceTime'];
    meetingDate = json['meetingDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meetingCode'] = this.meetingCode;
    data['racecourseFullName'] = this.racecourseFullName;
    data['raceTime'] = this.raceTime;
    data['meetingDate'] = this.meetingDate;
    return data;
  }
}
