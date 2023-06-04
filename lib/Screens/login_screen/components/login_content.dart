import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mental_health_app/Reusable%20Widgets/button_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Constants/project_colors.dart';
import '../../../Models/appUser.dart';
import '../../../Reusable Widgets/show_popup_dialog.dart';
import '../../../Reusable Widgets/show_snackbar_widget.dart';
import '../../../firebase_services/firebase_auth_methods.dart';
import '../../../screens/login_screen/animations/helper_functions.dart';
import '../../screens_wrapper/screens_wrapper.dart';
import '../animations/change_screen_animation.dart';
import 'bottom_text.dart';
import 'top_text.dart';


enum Screens {
  createAccount,
  welcomeBack,
}

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent>
    with TickerProviderStateMixin {


  late final List<Widget> createAccountContent;
  late final List<Widget> loginContent;
  bool _passwordVisible = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool userLoggedIn = false;

  Future<AppUser?> loginUser() {
    return FirebaseAuthMethods().loginWithEmailAndPassword(
      emailController.text,
      passwordController.text,
      // onLoginSuccess

      () {
        setState(() {
          userLoggedIn = true;
          Navigator.of(context).push( MaterialPageRoute(builder: (context) => ScreensWrapper()));

        });
      },

     // onLoginFailed
      () {
        setState(() {
          userLoggedIn = false;
        });
      },
    );
  }

  void registerNewUser() {
    FirebaseAuthMethods().registerWithEmailAndPassword(
      emailController.text,
      passwordController.text,
      // onLoginSuccess

          () {
        setState(() {
          userLoggedIn = true;
          Navigator.of(context).push( MaterialPageRoute(builder: (context) => ScreensWrapper()));

        });
      },

      // onLoginFailed
          () {
        setState(() {
          userLoggedIn = false;
        });
      },
    );

  }

  Widget inputField(String hint, IconData iconData, bool isPasswordField,
      TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.black),
            obscureText: isPasswordField,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: mainWhite,
              hintText: hint,
              prefixIcon: Icon(iconData),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(
    String title,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          loginUser();
          setState(() {
            currentAppUser.isTherapist = false; //regular user, not a therapist
          });
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ScreensWrapper()));
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
          //  primary: kSecondaryColor,
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'or',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget logos() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 36,
            height: 36,
            child: Image.asset('assets/images/facebook.png'),
          ),
          const SizedBox(width: 30),
          SizedBox(
              width: 33.5,
              height: 33.5,
              child: Image.asset(
                'assets/images/google.png',
              )),
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return Center(
      child: TextButton(
        onPressed: () {
         resetPasswordPopUpDialog(context: context);
        },
        child: const Center(
          child: Text(
            'Forgot Password?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }




  @override
  void initState() {

    createAccountContent = [
      CustomInputField(
        hint: 'Name',
        iconData: Ionicons.person_outline,
        isPasswordField: false,
        controller: nameController,
      ),
      CustomInputField(
        hint: 'Email',
        iconData: Ionicons.mail_outline,
        isPasswordField: false,
        controller: emailController,
      ),
      CustomInputField(
        hint: 'Password',
        iconData: Ionicons.lock_closed_outline,
        isPasswordField: true,
        controller: passwordController,
      ),

      BlueButton(
          text: 'Sign Up',
          onPressed: () {
            registerNewUser();
            setState(() {
              currentAppUser.isTherapist = false;
            });

          }),

      BlueButton(
          text: "Therapist signup",
          onPressed: () {
            setState(() {
              therapistRegistrationForm(context: context);
            });
          }),

      orDivider(),
      logos(),
    ];



    loginContent = [
      CustomInputField(
        hint: 'Email',
        iconData: Ionicons.mail_outline,
        isPasswordField: false,
        controller: emailController,
      ),
      CustomInputField(
        hint: 'Password',
        iconData: Ionicons.lock_closed_outline,
        isPasswordField: true,
        controller: passwordController,
      ),

      BlueButton(
          text: 'Login',
          onPressed: () {
            setState(() {
              currentAppUser.isTherapist = false;
            });
            loginUser();

            userLoggedIn == true
                ? Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ScreensWrapper()))
                : showSnackBar(context, "Incorrect email or password!");
          }),

      BlueButton(
          text: 'Therapist login',
          onPressed: () {
            loginUser();
            setState(() {
              currentAppUser.isTherapist = true;
            });
            userLoggedIn == true
                ? Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ScreensWrapper(passedIndex: 0,)))
                : showSnackBar(context, "Incorrect email or password!");
          }),

      forgotPassword(),
    ];

    ChangeScreenAnimation.initialize(
      vsync: this,
      createAccountItems: createAccountContent.length,
      loginItems: loginContent.length,
    );

    for (var i = 0; i < createAccountContent.length; i++) {
      createAccountContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.createAccountAnimations[i],
        child: createAccountContent[i],
      );
    }

    for (var i = 0; i < loginContent.length; i++) {
      loginContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.loginAnimations[i],
        child: loginContent[i],
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    ChangeScreenAnimation.dispose();

    super.dispose();
  }

  Future<void> _launchUrl() async {
    const String url = 'https://docs.google.com/forms/d/e/1FAIpQLSfUX_gEorivdZU2rCmWQYOLNeaRf05tIZzw-429BomUtir_ng/viewform?usp=pp_url';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      debugPrint('Could not launch $url');
      throw Exception('Could not launch $url');
    }
  }


  void therapistRegistrationForm({
    required BuildContext context,
  }) {
    showDialog(

      context: context,
      barrierDismissible: true,
      builder: (context) =>
          AlertDialog(

            title: const Text("Therapist registration",
              style: TextStyle(color: mainPurple, fontSize: 20),),
            backgroundColor: mainWhite,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("You need to fill out a registration form to register as a therapist, please click the button below to register as a therapist",
                  style: TextStyle(color: mainPurple, fontSize: 16),),

              ],
            ),
            actions: <Widget>[

              TextButton(
                onPressed: () {
                  _launchUrl();
                },

                child: const Text(
                    "Register", style: TextStyle(color: mainBlue,)),
              ),

              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                    "Cancel", style: TextStyle(color: Colors.red,)),
              )
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: 150,
          left: 24,
          child: TopText(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: createAccountContent,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: loginContent,
              ),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: BottomText(),
          ),
        ),
      ],
    );
  }
}

class CustomInputField extends StatefulWidget {
  final String hint;
  final IconData iconData;
  final bool isPasswordField;
  TextEditingController controller;

  CustomInputField(
      {Key? key,
      required this.hint,
      required this.iconData,
      required this.isPasswordField,
      required this.controller})
      : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextField(
            controller: widget.controller,
            style: const TextStyle(color: Colors.black),
            obscureText: widget.isPasswordField,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: mainWhite,
              hintText: widget.hint,
              prefixIcon: Icon(widget.iconData),
            ),
          ),
        ),
      ),
    );
  }
}

class BlueButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const BlueButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  State<BlueButton> createState() => _BlueButtonState();
}

class _BlueButtonState extends State<BlueButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Text(
          widget.text,
          style:  TextStyle(
            fontSize:  widget.text.length >= 10 ? 14 : 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
