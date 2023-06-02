class Therapist {
  final String name;
  final String photoUrl;
  final String jobTitle;
  final double rating;
  double pricePerSession;
  String sessionsLocation;
  bool onlineSessionsAvailability;
  String clinicPhoneNumber;

  Therapist({
    required this.jobTitle,
    required this.name,
    required this.photoUrl,
    required this.rating,
    required this.pricePerSession,
    required this.sessionsLocation,
    required this.onlineSessionsAvailability,
    required this.clinicPhoneNumber,
  });
}

Therapist sampleTherapist1 = Therapist(
  name: 'Dr. ahmed fathy',
  jobTitle: 'Psychiatrist',
  rating: 4.5,
  pricePerSession: 400,
  sessionsLocation: 'Dokki, Cairo',
  onlineSessionsAvailability: true,
  clinicPhoneNumber: '02-24864232',
  photoUrl:
  'https://img.freepik.com/free-photo/mid-shot-counselor-cabinet_23-2148759108.jpg',
);

Therapist sampleTherapist2 = Therapist(
  name: 'Dr. Ali Rashdan',
  jobTitle: 'Psychiatris',
  rating: 3,
  pricePerSession: 550,
  sessionsLocation: 'Mohandseen, Cairo',
  onlineSessionsAvailability: true,
  clinicPhoneNumber: '02-24854278',
  photoUrl:
  'https://img.freepik.com/free-photo/two-doctors-talking-discuss-treatment_651396-1110.jpg',
);

Therapist sampleTherapist3 = Therapist(
  name: 'Dr. rasha dyaa',
  jobTitle: 'Marriage and Family Therapist',
  rating: 5,
  pricePerSession: 600,
  sessionsLocation: '5th settlement, Cairo',
  onlineSessionsAvailability: false,
  clinicPhoneNumber: '02-24832758',
  photoUrl:
  'https://img.freepik.com/free-photo/mid-shot-woman-therapist-with-clipboard_23-2148759113.jpg',
);

Therapist sampleTherapist4 = Therapist(
  name: 'Dr. Sara Ali',
  jobTitle: 'Psychiatrist',
  rating: 5,
  pricePerSession: 500,
  sessionsLocation: '5th settlement, Cairo',
  onlineSessionsAvailability: false,
  clinicPhoneNumber: '02-24832458',
  photoUrl:
  'https://img.freepik.com/free-photo/medium-shot-woman-holding-pen_23-2148938322.jpg',
);
List<Therapist> listOfAvailableTherapists = [
  sampleTherapist1,
  sampleTherapist2,
  sampleTherapist3,
  sampleTherapist4
];
