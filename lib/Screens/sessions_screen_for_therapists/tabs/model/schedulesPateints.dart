enum FilterStatusPatient { Upcoming, Complete, Cancel }

List<Map> schedulesPatient = [
  {
    'img': 'assets/images/patient.png',
    'patientName': 'Ahmed Ali',
   
    'reservedDate': 'Monday, Aug 22',
    'reservedTime': '02:00 - 12:00',
    'status': FilterStatusPatient.Upcoming
  },
  {
    'img': 'assets/images/patient.png',
    'patientName': 'Abdelrahman Eohamed',
    
    'reservedDate': 'Monday, Sep 23',
    'reservedTime': '8:00 - 9:00',
    'status': FilterStatusPatient.Upcoming
  },
  {
    'img': 'assets/images/patient.png',
    'patientName':'Manal Essam',
   
    'reservedDate': 'Monday, Jul 27',
    'reservedTime': '9:00 - 10:00',
    'status': FilterStatusPatient.Upcoming
  },
  {
    'img': 'assets/images/patient.png',
    'patientName':'Somia Ahmed',
   
    'reservedDate': 'Monday, Jul 21',
    'reservedTime': '10:00 - 11:00',
    'status': FilterStatusPatient.Complete
  },
  {
    'img': 'assets/images/patient.png',
    'patientName': 'Ahmed mohsen',
   
    'reservedDate': 'Monday, Jul 11',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatusPatient.Cancel
  },
];