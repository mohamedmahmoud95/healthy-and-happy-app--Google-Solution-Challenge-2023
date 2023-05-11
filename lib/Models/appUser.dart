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

}


AppUser sampleAppUser1 = AppUser(firstName: "Mohamed", lastName: "Mahmoud",  email: "m.raslan97@gmail.com",            phoneNumber: "+201001412578", about: "حد علوضعه جدًا", lastActive: "3 min ago",  profilePicUrl: "assets/images/Mohamed_Mahmoud.png");
AppUser sampleAppUser2 = AppUser(firstName: "Esraa",   lastName: "Amr",      email: "Esraaamrkandil@gmail.com",        phoneNumber: "+20123456789",  about: "..",             lastActive: "1 hr ago",  );
AppUser sampleAppUser3 = AppUser(firstName: "Habiba",  lastName: "Alaa",     email: "https://github.com/Habibaaahmed", phoneNumber: "+20123456789",  about: "..",             lastActive: "3 hr ago",  );
AppUser sampleAppUser4 = AppUser(firstName: "Sondos",  lastName: "",         email: "https://github.com/S0nd0s",       phoneNumber: "+20123456789",  about: "..",             lastActive: "1 day ago", );