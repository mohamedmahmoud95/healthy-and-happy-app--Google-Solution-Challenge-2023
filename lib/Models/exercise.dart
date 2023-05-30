
import 'package:mental_health_app/Models/video.dart';

class Exercise{
  String? name;
  String? youTubeVideoUrl;
  String? videoId;
  String? imageUrl;
  String? howTo; // Exercise instructions
  String? benefits;

  Exercise({
    this.name,
    this.youTubeVideoUrl,
    this.imageUrl,
    this.howTo,
    this.benefits,
    this.videoId,
});

}


final Exercise catCowPose = Exercise(
  name: 'Cat Cow pose',
  youTubeVideoUrl: 'https://www.youtube.com/watch?v=y39PrKY_4JM',
  imageUrl: 'https://pbs.twimg.com/media/CgKJTktUIAASQs5.png',

  videoId: 'y39PrKY_4JM',

  howTo:  'Start in tabletop position on your fours, \n'
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

  benefits:   'gentle flow to increase flexibility and mobility \n'
      'of your spine stretches front torso and neck massages \n\n'
      'spine and internal organs increases awareness of \n'
      'your spine and body coordination\n\n',

);


final Exercise forwardBendPose = Exercise(
  name: 'Forward Bend',
  youTubeVideoUrl: 'https://www.youtube.com/watch?v=g7Uhp5tphAs',
  imageUrl: 'http://cdn.shopify.com/s/files/1/0085/4373/1759/articles/blog-childsPose_600x.jpg',

  videoId: 'g7Uhp5tphAs',

  howTo:
  'Stand with both feet on the mat.\n'
      'Your feet are together or hip width apart\n'
      'inhale and raise your straight arms over your head,\n'
      'palms are facing each other.\n\n'
      'Keep your arms active until the fingertips.\n\n'
      'Bring your shoulderblades together and shoulders away from the ears.\n\n'
      'Lift yourself through the crown of your head up to the sky,\n'
      'lengthening the spine.Exhale and start to bend forward starting with your hips.\n\n'
      'Bend down as far as you can with a straigh back.\n\n'
      'Keep your legs straight,\n'
      'lift your kneecaps up.\n\n'
      'If possible place the hands on the ground or let them easily hang down.\n\n'
      'You can also interlace your arms.\n\n'
      'Take care not to lean backwards,\n'
      'keep your body weight over the balls of your feet.\n\n'
      'The muscle strength comes from your legs not from your torso.\n\n'
      'This is relaxed and hangs freely down to the floor,\n'
      'feeling how gravity works on lengthening your spine.\n\n'
      'Keep your head relaxed without tension in neck or shoulders.\n\n'
      'Observe how with every exhalation the gaps between your vertebra in the cervical spine opens.\n\n'
      'Start with holding the pose for several breaths and with practice increase the time to one minute.\n\n'
      'To come out of the pose,\n'
      'slowly roll your body up with an inhalation,\n'
      'vertebra for vertebra.\n'
      'Your head lifts up at last.\n',


  benefits:
      '- Calms the brain and helps with frequent headaches\n\n'
      '- relieves stress and mild depression\n\n'
          '- Stimulates the liver and kidneys'
          '- Stretches the hamstrings, calves, and hips\n\n'
          '- Strengthens the thighs and knees\n\n'
          '- Improves digestion'
          '- Reduces fatigue, anxiety, insomnia\n',


);

final Exercise childPose = Exercise(
  name: "Child Pose",
  youTubeVideoUrl: 'https://www.youtube.com/watch?v=2MJGg-dUKh0&t=37s&ab_channel=VENTUNOYOGA',
);