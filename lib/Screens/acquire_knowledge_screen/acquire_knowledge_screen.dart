
import 'package:flutter/material.dart';
import 'package:mental_health_app/Screens/acquire_knowledge_screen/videos_screen.dart';
import '../../../Constants/project_colors.dart';
import 'health_articles_screen.dart';
import 'mental_health_articles_screen.dart';



class ArticlesScreen extends StatefulWidget {

  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
               backgroundColor: mainWhite,
               elevation: 0,
               title: const Text('Know more',
                   style: TextStyle(color: mainPurple,fontWeight: FontWeight.normal)),

          bottom:  TabBar(
            indicatorColor: mainPurple,
            labelColor: mainPurple,
              tabs: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(child:  Text('Mental health')),
                    Tab(icon: Image.asset('assets/icons/mental_health_icon.png', color: mainPurple, scale: 5,),),
                  ],
                ),
                Row(
                  children: [
                    const Text('   health '),
                    Tab(icon: Image.asset('assets/icons/health_icon.png', color: mainPurple,scale: 1.5,),),
                  ],
                ),

                Row(
                  children: const [
                    Text('   Videos '),
                    Tab(icon: Icon(Icons.video_camera_back_outlined, color: mainPurple, size: 30,),),
                  ],
                ),

              ],
            ),
          ),

      body:   TabBarView(
        children: [
          const MentalHealthArticlesScreen(),
          const HealthArticlesScreen(),
          VideoScreen(),
        ],
      ),
    ),
    ),
    );
  }
}
