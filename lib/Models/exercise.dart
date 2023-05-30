
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




final Exercise childPose = Exercise(
  name: "Child Pose",
  youTubeVideoUrl: 'https://www.youtube.com/watch?v=2MJGg-dUKh0&t=37s&ab_channel=VENTUNOYOGA',
);