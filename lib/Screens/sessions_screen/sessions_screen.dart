import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Reusable%20Widgets/button_widget.dart';
import 'package:mental_health_app/screens/home_screen/home_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Home Screen',
      theme: ThemeData(
        primaryColor: Colors.blue.shade200,
        backgroundColor: Colors.lightBlue[50],
      ),
      home: HomeScreen2(),
    );
  }
}
class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen2> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // TODO: implement menu button onPressed callback
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // TODO: implement account button onPressed callback
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const Screen1(),
          Screen2(),
          const SelfCareScreen(),
          Screen4(),
          Screen5(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabController.index,
        onTap: (int index) {
          setState(() {
            _tabController.index = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Schedule',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            label: 'self care',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'chat',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'feed',
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Google',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Suggested',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150.0,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/audio_playlist_thumbnail.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Playlist ${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// Define the model for a therapist
class Therapist {
  final String name;
  final String photoUrl;
  final double rating;

  Therapist({required this.name, required this.photoUrl, required this.rating});
}


// Define the model for an appointment
class Appointment {
  final Therapist therapist;
  final DateTime date;
  final TimeOfDay time;

  Appointment({required this.therapist, required this.date, required this.time});
}

// Define the therapist list page
class TherapistListPage extends StatelessWidget {
  // Define a list of available therapists
  final List<Therapist> _availableTherapists = [
    Therapist(name: '   Dr. ahmed fathy', rating: 4.5, photoUrl: 'https://lakeforestgroup.com/wp-content/uploads/2014/11/doctor-profile-02.jpg'),
    Therapist(name: '   Dr. Jon Smith', rating: 3, photoUrl: 'https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg?w=826&t=st=1678924948~exp=1678925548~hmac=e00611ab08e56ca9d0e942c2ae265e184238e28d04e7c861a5cf4ded2e730cca'),
    Therapist(name: '   Dr. rasha dyaa', rating: 4, photoUrl: 'https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture_409827-254.jpg?w=1380&t=st=1678925023~exp=1678925623~hmac=cf472af178dcc58899010df13c761856dd2f978b69b2af2949e9b2457196eed9'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      body: ListView.builder(
        itemCount: _availableTherapists.length,
        itemBuilder: (context, index) {

          final therapist = _availableTherapists[index];

          return Card(
              color: lightOrange,

              clipBehavior: Clip.hardEdge,

              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              child: InkWell(
              onTap: () {


          },

          splashColor:  Colors.white38,

          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(

            width: 150,
            height: 90,

            child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
               Center(
                 child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(therapist.photoUrl),
                  ),

                  title: Text(therapist.name, style: const TextStyle(color: navyBlue),),


                  trailing:     RatingBarIndicator(
                    rating: _availableTherapists[index].rating,
                    itemCount: 5,
                    itemSize: 16.0,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, _) =>
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookingPage(therapist: therapist)),
                    );
                  },
              ),
               ),
            ),
            ),
          ),
          ),
          );



        },
      ),
    );
  }
}

// Define the booking page
class BookingPage extends StatefulWidget {
  final Therapist therapist;

  const BookingPage({required this.therapist});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final List<TimeOfDay> _availableTimes = [
    const TimeOfDay(hour: 9, minute: 0),
    const TimeOfDay(hour: 10, minute: 30),
    const TimeOfDay(hour: 12, minute: 0),
    const TimeOfDay(hour: 13, minute: 30),
    const TimeOfDay(hour: 15, minute: 0),
  //  const TimeOfDay(hour: 16, minute: 30),
  //  const TimeOfDay(hour: 18, minute: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: primaryColor, size: 30),
          backgroundColor: mainWhite,
          elevation: 0,
          title: const Text('Book an Appointment',
              style: TextStyle(color: Colors.black))
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height:12),
          Image.network('https://img.freepik.com/free-vector/woman-crying-therapy-session_74855-17143.jpg'),
          const SizedBox(height:12),



          const SizedBox(height: 20),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.0),
          //   child: Center(
          //     child: Text(
          //       'Choose a date',
          //       style: TextStyle(fontSize: 18, color: Colors.black),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
            Center(
              child: ButtonWidget(
                  text:  _selectedDate == null ? 'Click to select a date' : _selectedDate.toString().substring(0, 10),
                onClicked: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 14)),
                ).then((value) {
                  setState(() {
                    _selectedDate = value;
                  });
                });
              },

              ),
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Choose a time:',
              style: TextStyle(fontSize: 18,  color: Colors.black),
            ),
          ),

          const SizedBox(height: 10),
          Expanded(

            child: ListView.builder(
              itemCount: _availableTimes.length,
              itemBuilder: (context, index) {
                final time = _availableTimes[index];
                return Column(
                  children: [
                    const Divider(),
                    ListTile(
                      title: Text(time.format(context),
                        style: const TextStyle(fontSize: 18,  color: Colors.black),),
                      trailing: _selectedTime == time ? const Icon(Icons.check) : null,
                      onTap: () {
                        setState(() {
                          _selectedTime = time;
                        });
                      },
                    ),
                  ],
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:      Center(
              child: ButtonWidget(text: 'Book now', onClicked: () {
                  if (_selectedDate == null || _selectedTime == null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Missing Information',
                          style: TextStyle(fontSize: 18,  color: Colors.black),),
                        content: const Text('Please select a date and time',
                          style: TextStyle(fontSize: 18,  color: Colors.black),),
                        actions: [

                          Center(child: ButtonWidget(text: 'OK', onClicked: () => Navigator.pop(context)))

                        ],
                      ),
                    );
                  } else {
                    final appointment = Appointment(
                      therapist: widget.therapist,
                      date: _selectedDate!,
                      time: _selectedTime!,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookingConfirmedPage(appointment: appointment)),
                    );
                  }
                },

              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

// Define the booking confirmation page
class BookingConfirmedPage extends StatelessWidget {
  final Appointment appointment;

  const BookingConfirmedPage({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainWhite,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: primaryColor, size: 30),
          backgroundColor: mainWhite,
          elevation: 0,
          title: const Text('confirm booking',
              style: TextStyle(color: Colors.black))
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(appointment.therapist.photoUrl),
              radius: 80,
            ),
            const SizedBox(height: 20),

            Text(
              appointment.therapist.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: mainPurple),
            ),
            const SizedBox(height: 75),

            Text(
              'Date: ${appointment.date.toString().substring(0, 10)}',
              style: const TextStyle(fontSize: 18, color: Colors.black),
              ),

            const SizedBox(height: 20),
            Text(
              'Time: ${appointment.time.format(context)}',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 75),
            ButtonWidget(text: 'Confirm', onClicked: ()
              {

                Navigator.pop(context);

                // TODO: Save the booking and return to the home page
              //  Navigator.popUntil(context, ModalRoute.withName('/HomeScreen'));
              },

            ),
            const SizedBox(height: 10),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.red),),
            ),
          ],
        ),
      ),
    );
  }
}

// Define the home page
class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text('Therapy App'),
      // ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TherapistListPage()),
            );
          },
          child: const Text('Find a Therapist'),
        ),
      ),
    );
  }
}





class TipsScreen extends StatefulWidget {
  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    const Screen1(), // add the const keyword
    const Text('Screen 2'),
    const Text('Screen 3'),
    const Text('Screen 4'),
    const Text('Screen 5'),
  ];

  List<Tab> _tabs = [
    const Tab(
      icon: Icon(Icons.home),
      text: 'Home',
    ),
    const Tab(
      icon: Icon(Icons.search),
      text: 'Search',
    ),
    const Tab(
      icon: Icon(Icons.favorite),
      text: 'self care',
    ),
    const Tab(
      icon: Icon(Icons.schedule),
      text: 'Schedule',
    ),
    const Tab(
      icon: Icon(Icons.person),
      text: 'Profile',
    ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips Screen'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
          indicatorColor: Colors.green[800],
          labelColor: Colors.green[800],
          unselectedLabelColor: Colors.grey[600],
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _widgetOptions,
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key); // add the const keyword

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('This is Screen 1'),
    );
  }
}


class SelfCareScreen extends StatefulWidget {
  const SelfCareScreen({Key? key}) : super(key: key);

  @override
  _SelfCareScreenState createState() => _SelfCareScreenState();
}

class _SelfCareScreenState extends State<SelfCareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMVcFN_fcGtdwJaDVRLZr3pCwTu3_wsfHmSw&usqp=CAU',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(
                    context,
                    Icons.video_library,
                    'Video',
                    Screen4()

                ),


                _buildButton(
                    context,
                    Icons.audiotrack,
                    'Audio',
                    Screen2()
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(
                    context,
                    Icons.spa,
                    'Mind and Body',
                    Screen2()

                ),
                _buildButton(
                    context,
                    Icons.lightbulb_outline,
                    'Tips',
                    Screen2()
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, IconData icon, String text, Widget screen) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

      },
      child: Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 2.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 10.0),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: const Center(
        child: Text(
          'Screen 4',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

}


class Screen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: const Center(
        child: Text(
          'Screen 5',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

}



/*class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button action
          },
        ),
        title: Text('Video'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://example.com/welcome-image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search on YouTube',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (value) {
                // Handle search query submission
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildSectionTitle('Suggested ASMR Videos'),
                  _buildSuggestedVideosList(),
                  _buildSectionTitle('Suggested Relaxing Videos'),
                  _buildSuggestedVideosList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildSuggestedVideosList() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://example.com/video-$index.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
*/