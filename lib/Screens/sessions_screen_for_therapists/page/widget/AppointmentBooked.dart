import 'package:flutter/material.dart';
import 'package:mental_health_app/Screens/screens_wrapper/screens_wrapper.dart';

class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(flex: 3, child: Image.asset('assets/images/mark.jpeg')),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  'Successfully Booked an appointment',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(width: 50),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  ScreensWrapper(passedIndex: 0,), // Replace YourNextPage with the desired page you want to navigate to
                          ),
                        );
                      },
                      child: const Text(
                        'Go back to home',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
}