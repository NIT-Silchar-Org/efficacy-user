import 'package:Efficacy/config.dart';
import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/models/eventCloud.dart';
import 'package:Efficacy/models/people.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class DatabaseService {
  String id;
  DatabaseService({this.id});
  final CollectionReference eventCollection =
      Firestore.instance.collection('events');

  final CollectionReference clubCollection =
      Firestore.instance.collection('clubs');

  final CollectionReference adminCollection =
      Firestore.instance.collection('admins');

  Person _adminsFromSnapshot(DocumentSnapshot snapshot) {
    return Person(
        id: snapshot.documentID ?? 'id missing',
        name: snapshot.data()["adminName"] ?? 'name missing',
        imageUrl: snapshot.data()["imageUrl"] ?? fallbackURL_profile,
        fb: snapshot.data()["fb"] ?? fallbackURLweb);
  }

  List<Person> _adminListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return _adminsFromSnapshot(doc);
    }).toList();
  }

  Stream<List<Person>> get adminsPerClub {
    return adminCollection
        .where("clubId", isEqualTo: id)
        .snapshots()
        .map(_adminListFromSnapshot);
  }

  EventCloud _eventFromSnapshot(DocumentSnapshot snapshot) {
    print("Event Id from database service " + snapshot.reference.documentID);

    return EventCloud(
        id: snapshot.documentID ?? 'NULL ID DATABASE SERVICE EVENTCLOUD',
        venue: snapshot.data()["venue"] ?? '',
        title: snapshot.data()["title"] ?? 'event title',
        startTime: snapshot.data()["startTime"].toDate() ?? DateTime.now(),
        imageUrl: snapshot.data()["imageUrl"] ?? fallbackURL_image,
        googleFormLink: snapshot.data()["googleFormLink"] ?? fallbackURLweb,
        fbPostLink: snapshot.data()["fbPostLink"] ?? fallbackURLweb,
        endTime: snapshot.data()["endTime"].toDate() ?? DateTime.now(),
        clubId: snapshot.data()["clubId"] ?? 'clubid',
        clubName: snapshot.data()["clubName"] ?? 'clubname',
        about: snapshot.data()["about"] ?? 'about',
        duration: snapshot
                .data()["endTime"]
                .toDate()
                .difference(snapshot.data()["startTime"].toDate())
                .inHours ??
            2);
  }

  Club _clubFromSnapshot(DocumentSnapshot snapshot) {
    return Club(
      id: snapshot.data()["id"] ?? 'id missing',
      name: snapshot.data()["name"] ?? 'name missing',
      imageUrl: snapshot.data()["imageUrl"] ?? fallbackClubURL,
      desc: snapshot.data()["desc"] ?? 'description unavailable',
      fb: snapshot.data()["fb"] ?? fallbackURLweb,
    );
  }

  Stream<Club> get fetchClub {
    return clubCollection.document(id).snapshots().map((club) {
      return _clubFromSnapshot(club);
    });
  }

  // Future<void> getSingleEvent(String id) async {
  //   return eventCollection.document(id).get().then((value) {
  //     print(value.data());
  //   });
  // }

  Stream<EventCloud> get fetchEvent {
    return eventCollection.document(id).snapshots().map((event) {
      return _eventFromSnapshot(event);
    });
  }

  List<Club> _clubListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return _clubFromSnapshot(doc);
    }).toList();
  }

  Stream<List<Club>> get clubsFromCloud {
    return clubCollection.snapshots().map(_clubListFromSnapshot);
  }

  List<EventCloud> _eventListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return _eventFromSnapshot(doc);
    }).toList();
  }

  Stream<List<EventCloud>> get eventsFromCloud {
    return eventCollection
        .orderBy("startTime", descending: true)
        .snapshots()
        .map(_eventListFromSnapshot);
  }

  Stream<List<EventCloud>> get eventsPerClub {
    return eventCollection
        .orderBy("startTime", descending: true)
        .where("clubId", isEqualTo: id)
        .snapshots()
        .map(_eventListFromSnapshot);
  }
}
