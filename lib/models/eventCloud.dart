// ignore_for_file: file_names

class EventCloud {
  // String title, picture, clubId, clubName, about;
  // DateTime timings;
  // String id;
  EventCloud({
    required this.venue,
    required this.title,
    required this.clubName,
    required this.clubId,
    required this.about,
    required this.duration,
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.fbPostLink,
    required this.googleFormLink,
    required this.bannerUrl,
    required this.clubImageUrl,
  });
  String venue, title, clubName, clubId, about, id, clubImageUrl;
  DateTime startTime, endTime;
  String fbPostLink, googleFormLink, bannerUrl;
  int duration;
}
