import 'package:mental_health_app/Models/appUser.dart';

class Post
{
  String? id;
  String? text;
  String? imageURL;
  AppUser postAuthor;
  int numOfLikes;
  int numOfComments;
  int numOfShares;

  Post({
    this.id,
    this.text,
    this.imageURL,
    required this.postAuthor,
    required this.numOfLikes ,
    required this.numOfComments,
    required this.numOfShares

  });
}

Post samplePost1 = Post(postAuthor: sampleAppUser1, numOfLikes: 0, numOfComments: 2, numOfShares: 0, text: " كن فخورًا بانجازاتك الصغيرة\n be proud of your small steps",         imageURL: "https://www.boredpanda.com/blog/wp-content/uploads/2021/05/My-15-Doodles-to-Spread-Hope-and-Mental-Health-Awareness-609e3e0ac98d9__880.jpg");
Post samplePost2 = Post(postAuthor: sampleAppUser2, numOfLikes: 35, numOfComments: 4, numOfShares: 2, text: "you are worthy of love and respect simply because you exist. You don't need to change or be anything other than yourself to be valuable and deserving of happiness. Take care of your mental health and always remember that you are enough. ❤️\n #mentalhealthawareness #youareenough" ,imageURL: "https://www.boredpanda.com/blog/wp-content/uploads/2021/05/My-15-Doodles-to-Spread-Hope-and-Mental-Health-Awareness-609e3e1304cb2__880.jpg");

Post samplePost3 = Post(postAuthor: sampleAppUser3, numOfLikes: 17, numOfComments: 1, numOfShares: 5, text: "You don't have to control your thoughts. \nYou just have to stop letting them control you.\n - Dan Millman" ,imageURL: "https://blogimage.vantagefit.io/vfitimages/2022/08/21-Men-s-Mental-Health-Quotes-to-Mark-Men-s-Mental-Health-Week-.png");

Post samplePost4 = Post(postAuthor: sampleAppUser4, numOfLikes: 23, numOfComments: 0, numOfShares: 7, text: "" ,imageURL: "https://everydaypower.com/wp-content/uploads/2022/12/mental-health-quotes-2.png");

