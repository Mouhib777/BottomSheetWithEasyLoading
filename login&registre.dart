import 'package:flutter/material.dart';
import 'package:....../providers/auth_provider.dart';
import 'package:....../screens/onBoardScreen.dart';
import 'package:....../screens/registreScreen.dart';
import 'package:....../screens/registre_sucess.dart';
import 'package:....../screens/splash/welcomePage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class WelcomeScreen extends StatelessWidget {
  //const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    String? email;

    String? password;

    // login bottom sheet
    void showBottomSheet(context) {
      showModalBottomSheet(
        backgroundColor: Color.fromARGB(255, 235, 234, 238),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(60), bottom: Radius.circular(60))),
        context: context,
        isScrollControlled: true,
        builder: (context) =>
            StatefulBuilder(builder: (context, StateSetter myState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter Your E-mail ',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Ex: flenfouleni@gmail.com',
                        ),
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 40,
                        onChanged: (data) {
                          email = data;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Ex : pass1234',
                        ),
                        autofocus: false,
                        keyboardType: TextInputType.visiblePassword,
                        maxLength: 10,
                        onChanged: (data) {
                          password = data;
                        },
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        Expanded(
                          child: FlatButton(
                            child: Text(
                              'Login ',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onPressed: () async {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              EasyLoading.showToast('Loading...');
                              try {
                                UserCredential user = await FirebaseAuth
                                    .instance
                                    .signInWithEmailAndPassword(
                                        email: email!.trim(),
                                        password: password!.trim());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WelcomeScreen()));
                                EasyLoading.showInfo("Enable The GPS ");
                              } on FirebaseAuthException catch (ex) {
                                if (ex.code == 'user-not-found') {
                                  EasyLoading.showError(
                                      'User Not Found, a3mel registre');
                                } else if (ex.code == 'wrong-password') {
                                  EasyLoading.showError("password ghalet");
                                } else if (ex.code == 'invalid-email') {
                                  EasyLoading.showError("7ot email s7i7");
                                }
                              }
                            },
                            color: Color.fromARGB(255, 165, 145, 219),
                          ),
                        ),
                      ])
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      );
      // registre bottom sheet
    }

    void showBottomSheet1(context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(60, 40),
                bottom: Radius.elliptical(60, 40))),
        builder: (context) =>
            StatefulBuilder(builder: (context, StateSetter myState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Registre',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter Your E-mail to Procees',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Ex: flenfouleni@gmail.com',
                          ),
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          maxLength: 40,
                          onChanged: (data) {
                            email = data;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Ex : pass1234',
                          ),
                          autofocus: false,
                          keyboardType: TextInputType.visiblePassword,
                          maxLength: 10,
                          onChanged: (data) {
                            password = data;
                          },
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          Expanded(
                            child: FlatButton(
                              child: Text(
                                'Registre Now !',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              onPressed: () async {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                EasyLoading.showToast('Loading...');

                                try {
                                  UserCredential user = await FirebaseAuth
                                      .instance
                                      .createUserWithEmailAndPassword(
                                          email: email!.trim(),
                                          password: password!.trim());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WelcomeScreen()));
                                  EasyLoading.showSuccess(
                                      'Registed , Now Login');
                                } catch (ex) {
                                  EasyLoading.showError('fama ghalta');
                                }
                              },
                              color: Color.fromARGB(255, 84, 153, 209),
                            ),
                          ),
                        ])
                      ],
                    ),
                  ]),
            ),
          );
        }),
      );
    }

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Stack(children: [
              //   Positioned(
              //       right: 20.0,
              //      top: 420.0,
              //     child: FlatButton(
              //       color: Colors.red[400],
              //      height: 20,
              //      minWidth: 5,
              //      child: Text(
              //        'SKIP',
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 15,
              //           fontWeight: FontWeight.w300),
              //    ),
              //    onPressed: () {
              //      Navigator.push(
              //          context,
              //         MaterialPageRoute(
              //             builder: (context) => welcomePage()));
              //   },
              //  )
              //  ),
              Column(
                children: [
                  Expanded(child: onBoardScreen()),
                  Text(
                    'Ready to order the nearest Transporter ? ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 119, 118, 118)),
                  ),
                  SizedBox(height: 20),
                  FlatButton(
                    color: Color.fromARGB(255, 148, 118, 230),
                    child: Text(
                      'Where Are You ?',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        //color: Color.fromARGB(255, 250, 214, 211)
                      ),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(height: 20),
                  FlatButton(
                    child: RichText(
                      text: TextSpan(
                          text: 'Already a User ?   ',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 137, 168, 138)),
                            ),
                          ]),
                    ),
                    onPressed: () {
                      showBottomSheet(context);
                    },
                  ),
                  SizedBox(),
                  FlatButton(
                    child: RichText(
                      text: TextSpan(
                          text: 'Your First Time ?   ',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Registre Now !',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 84, 153, 209)),
                            ),
                          ]),
                    ),
                    onPressed: () {
                      showBottomSheet1(context);
                    },
                  )
                ],
              ),
            ])));
  }
}
