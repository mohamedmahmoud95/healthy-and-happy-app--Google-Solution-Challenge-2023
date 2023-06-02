import 'package:mental_health_app/Models/appointment.dart';

class AppUser {
  String? id;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? profilePicUrl;
  String? about;
  String? lastActive;
  List<String>? idsOfAnotherUsersChattedWith = [];
  List<String>? likedPostsIds = [];
  List<String>? friendsUsersIds = [];
  bool isTherapist;
  List<String>? bookedAppointmentsIDs = [];

  AppUser({
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profilePicUrl,
    this.about,
    this.lastActive,
    this.idsOfAnotherUsersChattedWith,
    this.friendsUsersIds,
    this.likedPostsIds,
    this.isTherapist =
        false, //false by default, unless the opposite is explicitly declared
    this.bookedAppointmentsIDs,
  });
}

AppUser sampleAppUser1 = AppUser(
    firstName: "Mohamed",
    lastName: "Mahmoud",
    email: "m.raslan97@gmail.com",
    phoneNumber: "+201001412578",
    about: "حد علوضعه جدًا",
    lastActive: "3 min ago",
    password: '12345678',
    profilePicUrl: "assets/images/Mohamed_Mahmoud.png",
    bookedAppointmentsIDs: ['sampleAppointment1', 'sampleAppointment2', 'sampleAppointment5'],

);

AppUser sampleAppUser2 = AppUser(
  firstName: "Esraa",
  lastName: "Amr",
  email: "Esraaamrkandil@gmail.com",
  phoneNumber: "+20123456789",
  about: "..",
  lastActive: "1 hr ago",
  bookedAppointmentsIDs: [],

);
AppUser sampleAppUser3 = AppUser(
  firstName: "Habiba",
  lastName: "Alaa",
  email: "https://github.com/Habibaaahmed",
  phoneNumber: "+20123456789",
  about: "..",
  lastActive: "3 hr ago",
  bookedAppointmentsIDs: [],

);
AppUser sampleAppUser4 = AppUser(
  firstName: "Sondos",
  lastName: "",
  email: "https://github.com/S0nd0s",
  phoneNumber: "+20123456789",
  about: "..",
  lastActive: "1 day ago",
  bookedAppointmentsIDs: [],

);

AppUser thisAppUser =
AppUser(
  firstName: "Mohamed",
  lastName: "Mahmoud",
  email: "m.raslan97@gmail.com",
  phoneNumber: "+201001412578",
  about: "حد علوضعه جدًا",
  lastActive: "3 min ago",
  password: '12345678',
  profilePicUrl: "assets/images/Mohamed_Mahmoud.png",
  bookedAppointmentsIDs: ['sampleAppointment1', 'sampleAppointment2', 'sampleAppointment5'],

);
 //   sampleAppUser1; // a test appUser to use as the current appUser (the one using the app from his phone)
