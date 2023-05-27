import 'package:mental_health_app/Screens/workouts_and_yoga_screen/yoga_screen.dart';

class PostCategory{
  String categoryName;
  bool selected;

  PostCategory({
    required this.categoryName,
    required this.selected,
});
}
PostCategory selfCare  = PostCategory(categoryName: 'Self-Care', selected: false);
PostCategory nutrition = PostCategory(categoryName: 'Nutrition', selected: false);
PostCategory other  = PostCategory(categoryName: 'Other', selected: false);
PostCategory trending  = PostCategory(categoryName: 'trending', selected: false);
PostCategory all = PostCategory(categoryName: 'All', selected: false);

List<PostCategory> listOfPostCategories = [selfCare, trending, other, nutrition, all];