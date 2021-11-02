class EventCloud {
  // String title, picture, clubId, clubName, about;
  // DateTime timings;
  // String id;
  EventCloud(
      {this.venue,
      this.title,
      this.clubName,
      this.clubId,
      this.about,
      this.duration,
      this.id,
      this.startTime,
      this.endTime,
      this.fbPostLink,
      this.googleFormLink,
      this.imageUrl});
  String venue, title, clubName, clubId, about, id;
  DateTime startTime, endTime;
  String fbPostLink, googleFormLink, imageUrl;
  int duration;
}
