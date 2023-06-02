class Therapist {
  final String name;
  final String photoUrl;
  final String jobTitle;
  final double rating;

  Therapist(
      {
        required this.jobTitle,
      required this.name,
      required this.photoUrl,
      required this.rating
      });
}

List<Therapist> availableTherapists = [
  Therapist(
    name: 'Dr. ahmed fathy',
    jobTitle: 'Psychiatrist',
    rating: 4.5,
    photoUrl:
        'https://lakeforestgroup.com/wp-content/uploads/2014/11/doctor-profile-02.jpg',
  ),
  Therapist(
      name: 'Dr. Jon Smith',
      jobTitle: 'Certified Alcohol and Drug Counselor',
      rating: 3,
      photoUrl:
          'https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg?w=826&t=st=1678924948~exp=1678925548~hmac=e00611ab08e56ca9d0e942c2ae265e184238e28d04e7c861a5cf4ded2e730cca'),
  Therapist(
      name: 'Dr. rasha dyaa',
      jobTitle: 'Marriage and Family Therapist',
      rating: 4,
      photoUrl:
          'https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture_409827-254.jpg?w=1380&t=st=1678925023~exp=1678925623~hmac=cf472af178dcc58899010df13c761856dd2f978b69b2af2949e9b2457196eed9'),

];
