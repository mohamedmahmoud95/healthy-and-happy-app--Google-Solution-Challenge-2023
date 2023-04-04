class Article {
  final String title;
  final String? text;
  final String? brief;
  final String photoUrl;
  final String source;
  final String url;
  int numRead;
  int numOfShares;

  Article(   {
    required this.url,
    required this.source,
    required this.numOfShares,
    required this.brief,
    required this.numRead,
    required this.text,
    required this.photoUrl,
    required  this.title
  });
}


final List<Article> articlesAboutMentalHealth = [
  Article(
      title: "What is mental health?",
      url: "https://www.medicalnewstoday.com/articles/154543#definition",

      brief: 'The WHO states that mental health is\n '
          '“more than just the absence of mental \n'
          'disorders or disabilities.” \n'
          'Peak mental health is not only...',

      source: 'World Health Organization (WHO), Dec 23, 2022',

      numOfShares: 3,
      numRead: 42,
      photoUrl: 'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/04/GettyImages-1171160560_hero-1024x575.jpg',


  text: 'The WHO states that mental health is\n'
          '“more than just the absence of mental disorders or disabilities.”\n'
          'Peak mental health is not only about managing\n'
          'active conditions but also looking after\n'
          'ongoing wellness and happiness.\n\n'

      'It also emphasizes that preserving and\n'
      'restoring mental health is crucial individually\n'
      'and at a community and society level.\n\n'

      'In the United States, the National Alliance \n'
      'on Mental Illness estimates that almost 1 in 5 adults experience mental health problems each year.\n\n'

      'In 2020, an estimated 14.2 million adultsTrusted Source in the U.S.,\n or about 5.6%, had a serious psychological condition,\n according to the National Institute of Mental Health (NIMH).\n\n'

      'Risk factors for mental health conditions\n'
      'Everyone is at some risk of developing a mental health disorder, \nregardless of age, sex, income,\nor ethnicity. In the U.S.\n and much of the developed world, \nmental disorders are one of the leading causes of disability.\n\n'

      'Social and financial circumstances,\n adverse childhood experiences,\nbiological factors, and underlying medical conditions can all shape a person’s mental health.\n\n'

      'Many people with a mental health disorder have more than one condition at a time.\n\n'

      'It is important to note that good mental health depends on a delicate balance of factors and that several elements may contribute to developing these disorders.\n\n'

      'The following factors can contribute to mental health disruptions:\n\n'

      'Continuous social and economic pressure\n'

      'Having limited financial means or belonging to a marginalized or persecuted ethnic group can increase the risk of mental health disorders.\n\n'

      'A 2015 Iranian studyTrusted Source describes several socioeconomic causes of mental health conditions, including poverty and living on the outskirts of a large city.\n\n'

      'The researchers also described flexible (modifiable) and inflexible (nonmodifiable) factors that affect the availability and quality of mental health treatment for certain groups.\n\n',
),




  Article(
      title: "How to Stop a Panic Attack",
      url: "https://www.psycom.net/when-panic-attacks-how-to-stop",
      text: 'Panic attacks can be scary.\n'
          'Try these expert coping strategies when\n'
          'you sense that nauseating, sudden feeling\n'
          'of acute and disabling anxiety...',

      source: 'Anxiety DisordersAug 9, 2021',


      numOfShares: 1,

      numRead: 25,
      brief: 'Panic attacks can be scary.\n'
          'Try these expert coping strategies when\n'
          'you sense that nauseating, sudden feeling\n'
          'of acute and disabling anxiety...',

      photoUrl: 'https://images.ctfassets.net/zkw0qlnf0vqv/psycom_page_fid33327_asset_16313/77ddeeae839b982115ed3333cf11ffa1/Businessman_is_drowned_in_the_brain?fm=webp&fit=thumb&q=65&w=544&h=362',
  ),



  Article(
      title: "Cortisol: What It Does And Why\n It Matters for Mental Health?",
      url: "https://www.psycom.net/cortisol",

      text: 'Cortisol: What It Does And Why\n It Matters for Mental Health?',
      source: 'PSYCOM, Aug 9, 2021',
      brief: "Known as the stress hormone,\n cortisol can impact your sleep, \n your mood, and your energy level. \n When levels are off, your body and brain.. ",
      numRead: 45,
      photoUrl: 'https://images.ctfassets.net/zkw0qlnf0vqv/psycom_page_fid39050_asset_39041/b867759487ff4e572b8285176de4a58e/man_falling_down_from_a_hole_of_light__surreal_concept?fm=webp&fit=thumb&q=65&w=1728&h=1152',
      numOfShares: 3),


  Article(
      title: "How Long Does Grief Last?",
      url: "https://www.psycom.net/how-long-does-grief-last",

      text: "Acute grief is a natural and painful \n"
          "response to the loss of a loved one. \n\n"
          "In most cases adults experience this \n"
          "intense period of overwhelming emotion \n"
          "for about a year after bereavement,\n"
          " while children and adolescents tend to recover within 6 months.\n\n"

        "Yet while these figures tend to reflect the norm, \n"
          "it’s vital to note that the experience\n"
          " of acute grief varies from person to person\n"
          " and can depend on everything from the circumstances\n"
          " of the death to the mental health of the person experiencing the loss.\n\n"

         "Symptoms of acute grief include tearfulness, \n"
         "sadness, and insomnia and typically require no treatment.\n\n"

        "“However, many people seek professional help\n"
        "to get support for a difficult process without\n"
          " showing any unusual or severe symptoms,” \n"
          "says Elise Gaul, LPC, PT, \n"
          "a therapist who specializes in treating trauma and grief.\n\n"
          "“This is not because they are ‘unhealthy,’ \n"
          "but they want support to help process the loss and its challenges and maintain health.\n\n"
          "“There are no absolutes here,” says Gaul.\n\n"


      "It’s also important to point out that there are\n"
          "a number of false beliefs about grieving,\n"
          "including the notion that everyone progresses through distinct \n"
          "“stages” of grief. In reality, grief takes a different course for everyone.\n\n",



      source: 'PSYCOM, Aug 9, 2021',
      brief: "Grieving looks different for everyone, \n"
          "but there are some common features of the process, \n"
          "as well as signs it might be time to reach out for help.",
      numRead: 45,
      photoUrl: 'https://images.ctfassets.net/zkw0qlnf0vqv/1NCunVXjWF1YODOHJDpGVI/3e69516f7ece869fe87546172822133b/man-stands-on-bridge-on-foggy-winter-day-GettyImages-1263515334-3000x2000.jpg?fm=webp&fit=thumb&q=65&w=1728&h=1152',
      numOfShares: 3),


  Article(
      title: "Mental health of graduate\nstudents sorely overlooked",
      url: "https://www.nature.com/articles/d41586-021-01751-z",
      source: 'Nature, 28 June 2021',
      brief: "Many graduate students feel overwhelmed\n"
          "by their work situation, and don’t know\n"
          "where to turn for help.,.",


      numRead: 12,
      photoUrl: 'https://media.nature.com/lw767/magazine-assets/d41586-021-01751-z/d41586-021-01751-z_19282592.jpg?as=webp',
      numOfShares: 5,

      text: 'Graduate students around the world need more support to manage the mental-health issues, such as depression and anxiety, that they are experiencing at worrying rates, according to a report1 from two US non-profit organizations.'

'The study was co-produced by the Council of Graduate Schools (CGS) in Washington DC and the Jed Foundation (JED) in New York City. Nance Roy, JED’s chief clinical officer, says that the foundation, which works to protect emotional health in teenagers and young adults, wanted to examine the rise in mental-health problems among US graduate students. There are few targeted programmes or policies to mitigate those problems, she says. “We wanted to include the graduate-student voice in our report, but not place the burden of change on them.'

'CGS president Suzanne Ortega says that when the organization — which represents about 500 universities in the United States, Canada and elsewhere — realized that its member institutions were noticing mental-health struggles among students, it sought to address the problem. Those institutions “were looking for resources and guidance”, says Ortega.'

'The CGS–JED report identifies challenges faced by graduate students, such as poor mentorship, the inability to access counselling services and a lack of training for non-academic careers. It also urges university administrators and members of campus communities to improve mental-health support services, revise leave-of-absence policies, and provide mentorship training for faculty members.'

'Mental-health problems among junior researchers are not specific to the United States, and are driven, in part, by the immense pressure on academic scientists to win funding, publish and land jobs in a brutally competitive market, says Katia Levecque, a psychology and law researcher at Ghent University in Belgium. “The mindset in academia is very often one in which failure is not an option and where non-academic jobs are not an option,” she says. The pandemic has exacerbated the problem, but it existed well before that. A 2017 study2 that Levecque co-authored found that one in three PhD students is at risk of developing a mental-health disorder, especially depression.'

'Other studies have corroborated these findings. A 2020 mental-health survey3 of 13,000 junior researchers conducted by Cactus Communications, a scientific-communications company based in Mumbai, India, found that more than one-third (38%) of respondents often felt overwhelmed by their work situation. In a follow-up survey4 by Cactus, one anonymous PhD student in Europe said in a free-text response that being honest and open about mental-health struggles in academia is an important step towards tackling them.'

'Graduate students worldwide are starting to add their own voices to discussions on mental health: they are talking about their personal challenges, and saying that they can’t master them alone.',

  ),

];






final List<Article> articlesAboutHealth = [
Article(
  title: "Effect of Sports on General \nHealth",
url: "https://manhattanmedicalarts.com/blog/effect-of-sports-on-general-health/",
text: 'Sports have an immense impact \n '
    'on a person’s daily life and health.\n'
    'They do not just give you an\n'
    'interesting routine, but also..',

  brief: 'Sports have an immense impact \n '
'on a person’s daily life and health.\n'
'They do not just give you an\n'
'interesting routine, but also..',

source: 'Manhattan medical arts, September 25, 2019',

numOfShares: 3,
numRead: 42,
photoUrl: 'https://manhattanmedicalarts.com/wp-content/uploads/2019/09/effect.webp',
),

  Article(
    title: "12 Daily Habits to Achieve\n a Healthier 2023",
    url: "https://www.cnet.com/health/12-daily-habits-to-achieve-a-healthier-2023",
    text: 'Make this year the one\n'
        'when you finally take control\n'
        'of your health with these\n'
        'simple daily habits.',

    brief: 'Make this year the one\n'
        'when you finally take control\n'
        'of your health with these\n'
        'simple daily habits.',

    source: 'CNET, Jan. 12, 2023',

    numOfShares: 4,
    numRead: 30,
    photoUrl: 'https://www.cnet.com/a/img/resize/f2b69d7f43775311ea9069c6aabc8547bba91dbc/hub/2022/12/08/dd293dba-d51b-4d52-96fe-876b29edbf67/gettyimages-1311842234.jpg?auto=webp&fit=crop&height=675&width=1200',
  ),
];