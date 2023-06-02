
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
  youTubeVideoUrl: 'https://www.youtube.com/watch?v=qYvYsFrTI0U',

  imageUrl:
  'https://static.vecteezy.com/system/resources/previews/012/598/361/original/child-pose-yoga-free-png.png',

  videoId: 'qYvYsFrTI0U',

  howTo:
  'Start kneeling on your hands and knees.\n\n'
      'The arch of the foot is placed on the floor and your big toes are touching each other.\n\n'
      'You can perform the pose with your knees together or separate them to the sides,\n'
      'opening the hips.Exhale and lower down your buttocks to your heels and your forehead to the ground.\n\n'
      'In child pose your arms can be reached out over your head with the palms facing the ground.\n\n'
      'Or let them rest along side the body with the palms facing upwards.\n\n'
      'If you have the knees separated lower your chest to the ground as far as you can without lifting your buttocks from the heels.\n\n'
      'Rest in child pose and focus on full breaths.\n\n'
      'Inhale and feel your torso expanding, \n'
      'belly pressing on your thighs. \n\n'
      'Exhale and release your spine to lengthen, \n'
      'softening with your chest to the floor and sinking deeper with your buttocks onto your heels.\n\n'
      'Stay in the pose from 30sec. \n\n'
      'to several minutes.\n\n'
      'To get out of the pose: \n'
      'place your hands next to your knees and on an inhale roll your back slowly up into a seated position.\n\n',

  benefits:
  '- gently stretches the lower back, hips and legs\n\n'
      '- relaxes shoulders, neck and spine\n\n'
      '- stimulates digestion and elimination\n\n'
      '- calms the mind and central nervous system\n\n'
      '- relieves stress and fatigue\n',
);

Exercise bridgePose = Exercise(
  name: "Bridge Pose",

  youTubeVideoUrl: 'https://www.youtube.com/watch?v=NnbvPeAIhmA',
  videoId: 'NnbvPeAIhmA',

  imageUrl:
  'https://thumbs.dreamstime.com/b/bridge-pose-vector-illustration-decorative-design-189656202.jpg',

  howTo:
  'Lie on your back with your knees bent and the soles of your feet flat on the floor.\n\n'
      'Extend your arms on the floor with your fingers reaching toward your heels. \n\n'
      'You should be able to just barely touch the backs of your heels with your fingertips.\n\n'
      'Keep your feet parallel. \n\n'
      'Maintain that position throughout the pose.\n\n'
      'Press down into the soles of your feet to lift your hips off the floor.\n\n'
      'Slide your yoga block under your back directly under your sacrum, \n\n'
      'letting it rest securely on the bolster. \n\n'
      'Your arms can stay outstretched on the floor next to your body.\n\n'
      'This should be a comfortable position. \n\n'
      'You may want to stay here several minutes as your body settles into the stretch and gets the benefits of a passive back-bend. \n\n'
      'If the pose causes your back to hurt, \n'
      'remove the block and come down.\n\n'
      'To come out, \n'
      'press down into your feet and lift your hips again. \n\n'
      'Slide the block out from under your sacrum and gently lower your back to the floor.\n',

  benefits:
  '- Relieves headaches.\n\n'
      '- Promotes deep relaxation.\n\n'
      '- Soothes the nervous system.\n\n'
      '- Relieves anxiety, depression and irritability.\n\n'
      '- Improves digestion, respiration and circulation.\n\n'
      '- Stretches the neck and shoulders.\n\n'
      '- Reduces “heaviness” in the abdomen and reproductive system.\n',



);