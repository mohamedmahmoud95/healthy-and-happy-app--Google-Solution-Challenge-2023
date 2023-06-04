import 'package:mental_health_app/Models/appointment.dart';

class AppUser {
  String id = 'id';
  String email = 'example@gmail.com';
  String password = '12345678';
  String firstName = 'first name';
  String lastName = 'last name';
  String phoneNumber = '01234567890';
  String profilePicUrl = 'assets/images/profile_pic.png';
  String about = 'About';
 // List<String>? idsOfAnotherUsersChattedWith = [];
 // List<String>? likedPostsIds = [];
 // List<String>? friendsUsersIds = [];
  bool isTherapist = false;
  List<String> bookedAppointmentsIDs = [];

  AppUser({
    required this.id,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicUrl,
    required this.about,
    // this.idsOfAnotherUsersChattedWith,
    // this.friendsUsersIds,
    // this.likedPostsIds,
    this.isTherapist =
        false, //false by default, unless the opposite is explicitly declared
    required this.bookedAppointmentsIDs,
  });
}

AppUser sampleAppUser1 = AppUser(
    firstName: "Mohamed",
    lastName: "Mahmoud",
    email: "m.raslan97@gmail.com",
    phoneNumber: "+201001412578",
    about: "حد علوضعه جدًا",
    password: '12345678',
    profilePicUrl: "assets/images/Mohamed_Mahmoud.png",
    bookedAppointmentsIDs: ['sampleAppointment1', 'sampleAppointment2', 'sampleAppointment5'],
    id: '',
  isTherapist: true,

);

AppUser sampleAppUser2 = AppUser(
  firstName: "Esraa",
  lastName: "Amr",
  email: "Esraaamrkandil@gmail.com",
  phoneNumber: "+20123456789",
  profilePicUrl: 'assets/images/profile_pic.png',
  about: "..",
  bookedAppointmentsIDs: [],
  id: 'id',
  password: '12345678',

);
AppUser sampleAppUser3 = AppUser(
  firstName: "Habiba",
  lastName: "Alaa",
  email: "https://github.com/Habibaaahmed",
  phoneNumber: "+20123456789",
  profilePicUrl: 'assets/images/profile_pic.png',
  about: "..",
  bookedAppointmentsIDs: [],
  id: 'id',
  password: '12345678',

);
AppUser sampleAppUser4 = AppUser(
  firstName: "Sondos",
  lastName: "",
  email: "https://github.com/S0nd0s",
  phoneNumber: "+20123456789",
  profilePicUrl: 'assets/images/profile_pic.png',
  about: "..",
  bookedAppointmentsIDs: [],
  id: 'id',
  password: '12345678',

);

AppUser currentAppUser =
AppUser(
  firstName: "Mohamed",
  lastName: "Mahmoud",
  email: "m.raslan97@gmail.com",
  phoneNumber: "+201001412578",
  about: "حد علوضعه جدًا",
  profilePicUrl: "assets/images/Mohamed_Mahmoud.png",
  bookedAppointmentsIDs: ['sampleAppointment1', 'sampleAppointment2', 'sampleAppointment5'],
  id: 'id',
  password: '12345678',

);
 //   sampleAppUser1; // a test appUser to use as the current appUser (the one using the app from his phone)


List<AppUser> listOfSampleAppUsers = [sampleAppUser1,sampleAppUser2,sampleAppUser3,sampleAppUser4];