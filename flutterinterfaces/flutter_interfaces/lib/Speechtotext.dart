import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interfaces/widgets/Appbuttons.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Speechtotext extends StatefulWidget {
  const Speechtotext({Key? key}) : super(key: key);

  @override
  State<Speechtotext> createState() => _SpeechtotextState();
}

class _SpeechtotextState extends State<Speechtotext> {
  SpeechToText speechToText = SpeechToText();
  bool isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      backgroundColor: Colors.grey[200],
        ),
        backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          margin: const EdgeInsets.only(bottom: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Read the following text for authentication:',
                  style: TextStyle(
                    fontSize: 24,
                    color: isListening ? Colors.black87 : Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 200,
              ),
              AvatarGlow(
                animate: isListening,
                duration: Duration(milliseconds: 2000),
                glowColor: const Color(0xFF2F66F5),
                repeat: true,
                child: GestureDetector(
                  onDoubleTapDown: (details) async {
                    if (!isListening) {
                      var available = await speechToText.initialize();
                      if (available) {
                        setState(() {
                          isListening = true;
                          speechToText.listen(onResult: (result) {
                            setState(() {
                              // Handle recognized text here if needed
                            });
                          });
                        });
                      }
                    }
                  },
                  onTapUp: (details) {
                    setState(() {
                      isListening = false;
                    });
                    speechToText.stop();
                  },
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFF2F66F5),
                    radius: 50,
                    child: Icon(
                      isListening ? Icons.mic : Icons.mic_none,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 45),
              Appbuttons(
                  text: "Regenerate random text", routeName: '/Speechtotext'),
              SizedBox(height: 20),
              Appbuttons(text: "Submit", routeName: '/Congrats'),
            ],
          ),
        ),
      ),
    );
  }
}
