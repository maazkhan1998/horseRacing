//countries List
import 'package:intl/intl.dart';

const String countryURL = 'http://mksracing.com:8080/countries';

//auth
const String signUpURL = 'http://mksracing.com:8080/users';
const String loginURL = 'http://mksracing.com:8080/auth';

//meetingByDate
String dateByMeeting(DateTime date) {
  return 'http://mksracing.com:8080/meetingcodes/countrywise/date?forDate=${DateFormat('yyyy-MM-dd').format(date)}';
}

const String todayMeetingURL =
    'http://mksracing.com:8080/meetingcodes/countrywise/date';

const String todayRaceCardURL = 'http://mksracing.com:8080/racecards/today';

const String raceCardByMeetingCodeURL =
    'http://mksracing.com:8080/racecards/meetingCode/';

String raceCardDetailURL(String id) {
  return 'http://mksracing.com:8080/meetingCode/raceCard/$id/details';
}
