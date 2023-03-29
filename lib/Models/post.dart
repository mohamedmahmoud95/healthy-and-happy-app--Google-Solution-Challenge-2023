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

Post samplePost1 = Post(postAuthor: sampleAppUser1, numOfLikes: 0, numOfComments: 2, numOfShares: 0, text: "تَطيبُ الحياةُ لمن لا يُبالي",         imageURL: "https://scontent.fcai22-1.fna.fbcdn.net/v/t1.18169-9/14708330_1083264081720989_3368564921783854607_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=9267fe&_nc_ohc=0xwmas1MiPAAX-tkzNB&_nc_oc=AQkXgjYIzbfDVlVcdxZVqvItTosvPWKjGLNXeXr34eEokjpHq43HAdx6fSE0MpkHo0Q&_nc_ht=scontent.fcai22-1.fna&oh=00_AfBhaJxJupILZLfDtbO-gskxIONpcfMoI8-rvIsE-o-1XQ&oe=64491EAE");
Post samplePost2 = Post(postAuthor: sampleAppUser2, numOfLikes: 35, numOfComments: 4, numOfShares: 2, text: "SLOW PROGRESS IS STILL PROGRESS" ,imageURL: "https://i.pinimg.com/736x/04/73/31/047331fff2543d84b143b13cd4fcd564.jpg");

Post samplePost3 = Post(postAuthor: sampleAppUser3, numOfLikes: 17, numOfComments: 1, numOfShares: 5, text: "You don't have to control your thoughts. \nYou just have to stop letting them control you.\n - Dan Millman" ,imageURL: "https://blogimage.vantagefit.io/vfitimages/2022/08/21-Men-s-Mental-Health-Quotes-to-Mark-Men-s-Mental-Health-Week-.png");

Post samplePost4 = Post(postAuthor: sampleAppUser4, numOfLikes: 23, numOfComments: 0, numOfShares: 7, text: "" ,imageURL: "https://everydaypower.com/wp-content/uploads/2022/12/mental-health-quotes-2.png");

