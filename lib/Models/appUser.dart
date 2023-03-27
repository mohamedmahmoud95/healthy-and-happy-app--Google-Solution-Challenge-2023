class AppUser {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? profilePicUrl;
  String? about;
  String? lastActive;
  List<String>? idsOfAnotherUsersChattedWith=[];
  List<String>? likedPostsIds=[];
  List<String>? friendsUsersIds=[];

  AppUser({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profilePicUrl,
    this.about,
    this.lastActive,
    this.idsOfAnotherUsersChattedWith,
    this.friendsUsersIds,
    this.likedPostsIds,

  });
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'email': email,
  //     'firstName': firstName,
  //     'lastName': lastName,
  //     'phoneNumber': phoneNumber,
  //     'profilePicUrl': profilePicUrl,
  //
  //     'about': about,
  //     'idsOfAnotherUsersChattedWith': idsOfAnotherUsersChattedWith,
  //     'likedPostsIds': likedPostsIds,
  //     'friendsUsersIds': friendsUsersIds,
  //     //    'proposalsIds': proposalsIds,
  //   };
  // }
  //
  // factory AppUser.fromMap(Map<String, dynamic> map) {
  //   return AppUser(
  //     id: map['id'],
  //     email: map['email'],
  //     firstName: map['firstName'],
  //     lastName: map['lastName'],
  //     phoneNumber: map['phoneNumber'],
  //     profilePicUrl: map['profilePicUrl'],
  //
  //     about: map['about'],
  //     idsOfAnotherUsersChattedWith: map['idsOfAnotherUsersChattedWith'] != null
  //         ? List<String>.from(map['idsOfAnotherUsersChattedWith'])
  //         : [],
  //     likedPostsIds: map['likedPostsIds'] != null
  //         ? List<String>.from(map['likedBooksIds'])
  //         : [],
  //     friendsUsersIds: map['friendsUsersIds'] != null
  //         ? List<String>.from(map['friendsUsersIds'])
  //         : [],
  //
  //   );
  // }
}


AppUser sampleAppUser1 = AppUser(firstName: "Mohamed", lastName: "Mahmoud",  email: "m.raslan97@gmail.com",            phoneNumber: "+201001412578", about: "حد علوضعه جدًا", lastActive: "3 min ago",  profilePicUrl: "https://scontent.fcai22-2.fna.fbcdn.net/v/t39.30808-6/320170405_517561220344939_5799560223719347401_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=hxjp6cuNoLcAX-OhJsL&_nc_ht=scontent.fcai22-2.fna&oh=00_AfDuEpPv1t4UrbJbyOUqLL9s2X_T4saf3keC-g-cgiMTqA&oe=64263014");

AppUser sampleAppUser2 = AppUser(firstName: "Esraa",   lastName: "Amr",      email: "Esraaamrkandil@gmail.com",        phoneNumber: "+20123456789",  about: "..",             lastActive: "1 hr ago",  );
AppUser sampleAppUser3 = AppUser(firstName: "Habiba",  lastName: "Alaa",     email: "https://github.com/Habibaaahmed", phoneNumber: "+20123456789",  about: "..",             lastActive: "3 hr ago",  );
AppUser sampleAppUser4 = AppUser(firstName: "Sondos",  lastName: "",         email: "https://github.com/S0nd0s",       phoneNumber: "+20123456789",  about: "..",             lastActive: "1 day ago", );