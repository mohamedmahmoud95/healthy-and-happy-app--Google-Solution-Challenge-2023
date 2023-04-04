import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Constants/project_colors.dart';
import '../../Reusable Widgets/workout_card_widget.dart';




YoutubePlayerController _controller = YoutubePlayerController(
  initialVideoId: 'f2O6mQkFiiw',
  flags: const YoutubePlayerFlags(
    autoPlay: false,
    mute: true,
  ),
);


class YogaScreen extends StatefulWidget {
  const YogaScreen({Key? key}) : super(key: key);

  @override
  _YogaScreenState createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

 home: Scaffold(

      backgroundColor: mainWhite,


      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

      YoutubePlayerBuilder(
      player: YoutubePlayer(
      controller: _controller,
      ),
        builder: (context, player) {
          return Column(
            children: [
              // some widgets
           //   player,
              //some other widgets
            ],
          );
        },
    ),




          Container(
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://t3.ftcdn.net/jpg/03/51/12/98/360_F_351129860_I95uGc6ztv8mg5oXPivi9ljXkEZYnpov.jpg',
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  WorkoutCardWidget(
                    text: 'Child pose',
                    imageUrl: 'https://static.vecteezy.com/system/resources/previews/012/598/361/original/child-pose-yoga-free-png.png',

                    onClicked: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ChildPoseScreen())
                      );
                    },
                  ),

                  WorkoutCardWidget(
                    text: 'forward bend',
                    imageUrl: 'https://www.pngkit.com/png/full/936-9362435_forward-fold-yoga-pose-forward-bend-cartoon.png',

                    onClicked: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FWbend())
                      );
                    },
                  ),

                  WorkoutCardWidget(
                    text: 'Cat Cow pose',
                    imageUrl: 'https://pbs.twimg.com/media/CgKJTktUIAASQs5.png',

                    onClicked: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Cat())
                      );
                    },
                  ),

                  WorkoutCardWidget(
                    text: 'Restorative bridge',
                    imageUrl: 'https://cdn0.iconfinder.com/data/icons/yoga-5/545/yoga6-512.png',

                    onClicked: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Bridge())
                      );
                    },
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
 ),
    );
  }
}



class FWbend extends StatefulWidget {
  const FWbend({Key? key}) : super(key: key);

  @override
  _FWbendState createState() => _FWbendState();
}

class _FWbendState extends State<FWbend> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=2MJGg-dUKh0&t=37s&ab_channel=VENTUNOYOGA')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      appBar: AppBar(
        leading: BackButton(color: mainPurple,onPressed: ()=> Navigator.of(context).pop(),),
        backgroundColor: mainWhite,
        elevation: 0,

        title: const Text('forward bend pose', style: TextStyle(color: mainPurple),),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              'http://cdn.shopify.com/s/files/1/0085/4373/1759/articles/blog-childsPose_600x.jpg',
              height: 300,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            const Text(
              'How to ?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: mainPurple),
            ),
            const SizedBox(height: 8),
            const Text(
              'Stand with both feet on the mat. Your feet are together or hip width apart inhale and raise your straight arms over your head, palms are facing each other. Keep your arms active until the fingertips. Bring your shoulderblades together and shoulders away from the ears. Lift yourself through the crown of your head up to the sky, lengthening the spine.Exhale and start to bend forward starting with your hips. Bend down as far as you can with a straigh back. Keep your legs straight, lift your kneecaps up. If possible place the hands on the ground or let them easily hang down. You can also interlace your arms.Take care not to lean backwards, keep your body weight over the balls of your feet. The muscle strength comes from your legs not from your torso.  This is relaxed and hangs freely down to the floor, feeling how gravity works on lengthening your spine. Keep your head relaxed without tension in neck or shoulders. Observe how with every exhalation the gaps between your vertebra in the cervical spine opens.Start with holding the pose for several breaths and with practice increase the time to one minute.To come out of the pose, slowly roll your body up with an inhalation, vertebra for vertebra. Your head lifts up at last. ',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 16),
            const Text(
              'Benefits',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,  color: mainPurple),
            ),
            const SizedBox(height: 8),
            const Text(
              ' Calms the brain and helps with frequent headachesrelieves stress and mild depressionStimulates the liver and kidneysStretches the hamstrings, calves, and hipsStrengthens the thighs and kneesImproves digestionReduces fatigue, anxiety, insomnia'
              ,  style: TextStyle(fontSize: 16,  color: Colors.black),
            ),


          ],
        ),
      ),
    );
  }
}



class ChildPoseScreen extends StatefulWidget {
  const ChildPoseScreen({Key? key}) : super(key: key);

  @override
  _ChildPoseScreenState createState() => _ChildPoseScreenState();
}

class _ChildPoseScreenState extends State<ChildPoseScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=2MJGg-dUKh0&t=37s&ab_channel=VENTUNOYOGA')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: mainWhite,
      appBar: AppBar(
        backgroundColor: mainWhite,
        elevation: 0,
        title: const Text('Child pose', style: TextStyle(color: mainPurple),),
        leading: BackButton(color: mainPurple,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              'https://static.vecteezy.com/system/resources/previews/012/598/361/original/child-pose-yoga-free-png.png',
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text(
              'How to ?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Start kneeling on your hands and knees. The arch of the foot is placed on the floor and your big toes are touching each other. You can perform the pose with your knees together or separate them to the sides, opening the hips.Exhale and lower down your buttocks to your heels and your forehead to the ground. In child pose your arms can be reached out over your head with the palms facing the ground. Or let them rest along side the body with the palms facing upwards.If you have the knees separated lower your chest to the ground as far as you can without lifting your buttocks from the heels.Rest in child pose and focus on full breaths. Inhale and feel your torso expanding, belly pressing on your thighs. Exhale and release your spine to lengthen, softening with your chest to the floor and sinking deeper with your buttocks onto your heels.Stay in the pose from 30sec. to several minutes.To get out of the pose: place your hands next to your knees and on an inhale roll your back slowly up into a seated position.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Benefits',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'gently stretches the low back, hips and legsrelaxes shoulders, neck and spinestimulates digestion and eliminationcalms the mind and central nervous systemrelieves stress and fatigue',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}







class Cat extends StatefulWidget {
  const Cat({Key? key}) : super(key: key);

  @override
  _CatState createState() =>  _CatState();
}

class  _CatState extends State<Cat> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=2MJGg-dUKh0&t=37s&ab_channel=VENTUNOYOGA')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      appBar: AppBar(
        backgroundColor: mainWhite,
        elevation: 0,
        title: const Text('Cat Cow pose', style: TextStyle(color: mainPurple),),
        leading: BackButton(color: mainPurple,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              'https://www.matherhospital.org/wp-content/uploads/2020/05/Yoga-pose-cat-cow-illustration.jpg',
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text(
              ' How to ?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Start in tabletop position on your fours, \n'
                    'Wrists under your shoulders, knees under your hips. \n'
                    'Knees, legs, feet are hip width apart.\n\n'
                    'Keep shoulders back and down, relaxed neck.\n\n'
                    'Center your head in a neutral position,\n'
                    ' gaze softens downward.\n\n'
                    ' Visualize your spine moving softly like the flow of a wave.\n\n'
                    'On an inhale you move into cow pose.\n\n'
                    'Begin to lift your sitting bones and your\n'
                    ' chest towards the ceiling, \n'
                    'while your belly sinks to the floor. \n\n'
                    'Lift your chin, curving slightly your neck. \n\n'
                    'Look towards the ceiling. \n\n'
                    'Keep the shoulders away from the ears, \n\n'
                    'and bring shoulderblades together to open your chest.\n\n'
                    'On an exhale reversely move into cat: \n\n'
                    'Pull your belly button to your spine, \n\n'
                    'curving your back towards the ceiling.\n\n'
                    'Repeat cat-cow several times together with your breath. \n\n'
                    'Try to stay firm in arms and legs. \n\n'
                    'The movement comes from your back and abdomen muscles. \n\n'
                    'Focus on the coordination of breath and movement.\n\n',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Benefits',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'gentle flow to increase flexibility and mobility \n'
                  'of your spine stretches front torso and neck massages \n'
                  'spine and internal organs increases awareness of \n'
                  'your spine and body coordination\n\n'
                  ,
              style: TextStyle(fontSize: 16),
            ),


          ],
        ),
      ),
    );
  }
}






class Bridge extends StatefulWidget {
  const Bridge({Key? key}) : super(key: key);

  @override
  _BridgeState  createState() =>  _BridgeState();
}

class  _BridgeState extends State<Bridge> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=2MJGg-dUKh0&t=37s&ab_channel=VENTUNOYOGA')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      appBar: AppBar(
        backgroundColor: mainWhite,
        elevation: 0,
        title: const Text('Restorative bridge pose', style: TextStyle(color: mainPurple),),
        leading: BackButton(color: mainPurple,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              'https://thumbs.dreamstime.com/b/bridge-pose-vector-illustration-decorative-design-189656202.jpg',
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text(
              'How to ?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              ' Lie on your back with your knees bent and the soles of your feet flat on the floor.Extend your arms on the floor with your fingers reaching toward your heels. You should be able to just barely touch the backs of your heels with your fingertips.Keep your feet parallel. Maintain that position throughout the pose.Press down into the soles of your feet to lift your hips off the floor.Slide your yoga block under your back directly under your sacrum, letting it rest securely on the bolster. Your arms can stay outstretched on the floor next to your body.This should be a comfortable position. You may want to stay here several minutes as your body settles into the stretch and gets the benefits of a passive backbend. If the pose causes your back to hurt, remove the block and come down.To come out, press down into your feet and lift your hips again. Slide the block out from under your sacrum and gently lower your back to the floor.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 16),
            const Text(
              'Benefits',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              'Relieves headaches.Promotes deep relaxation.Soothes the nervous system.Relieves anxiety, depression and irritability.Improves digestion, respiration and circulation.Stretches the neck and shoulders.Reduces “heaviness” in the abdomen and reproductive system. ',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),


          ],
        ),
      ),
    );
  }
}