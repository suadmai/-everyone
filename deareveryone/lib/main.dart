// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; 
import 'package:animated_text_kit/animated_text_kit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class Letter{
  String? code;
  String? recipient;
  String? message;
  bool? isRead;
  String? response;

  Letter({this.code, this.recipient, this.message, this.isRead});//response is optional
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '@everyone',
      theme: ThemeData(
        fontFamily: 'Bahnschrift',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dear, @everyone'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? code;
  List<Letter> letters = [];
  Letter currentLetter = Letter();
  final _formKey = GlobalKey<FormState>();
  
  @override
  void initState() {
    letters.add(myLetter);
    letters.add(myLetter2);
    super.initState();
  }

  //example letter
  Letter myLetter = Letter(
    code: '1234',
    recipient: 'Farhanah Huda',
    message: """I'm sorry things didn't work out between us.\nI hope you find someone who can make you happy.\nI wish you all the best. Goodbye.""",
    isRead: false, 
    );
  
  Letter myLetter2 = Letter(
    code: '5678',
    recipient: 'Aireen',
    message: 'I hope you read this letter',
    isRead: false, 
    );

  void findLetter(String? code){
    print('Finding letter');
    for (var letter in letters){
      if (letter.code == code){
        print('Letter found!');
        currentLetter = letter;
      }
      print('Letter not found');
    }
  }

  void openLetter(String? code){
    findLetter(code);
    if(currentLetter.code == code){
      showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text('To ${currentLetter.recipient}'),
          content: 
          SingleChildScrollView(
            child: AnimatedTextKit(
              isRepeatingAnimation: false,
              animatedTexts: [
                TyperAnimatedText(
                  currentLetter.message!, 
                  speed: const Duration(milliseconds: 30), 
                  curve: Curves.easeInOutSine
                  //change font to bahnschrift

                  ),
              ],
            ),
          ),
          actions: [
            //add response text field with send button
            ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3C3C3C)
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text('Close', style: TextStyle(color: Color(0xFF8ddce3)),),
            )
          ],
        );
      },
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('images/@everyone.png'),
                width: 250,
              ),
              const SizedBox(height: 20,),
               const Text(
                'Please enter your 4-digit code to view your letter',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),
              Form(
              key: _formKey,
              child: Column(
                children: [
                SizedBox(
                  width: 90,
                  child: TextFormField(
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Please enter a code';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      counterText: '',
                    ),
                    onChanged: (value){
                      setState(() {
                        code = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3C3C3C)
                  ),
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                        setState(() {
                        openLetter(code);
                      });
                    }
                  },
                  child: const Text('View Letter', style: TextStyle(color: Color(0xFF8ddce3)),),
                ),
              ],
              )
              ),
            ],
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
