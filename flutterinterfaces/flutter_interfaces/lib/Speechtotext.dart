import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_interfaces/widgets/Appbuttons.dart';
import 'package:word_generator/word_generator.dart';

final RandomWord = WordGenerator();
String noun = RandomWord.randomNoun();

class Speechtotext extends StatefulWidget {
  const Speechtotext({Key? key}) : super(key: key);

  @override
  State<Speechtotext> createState() => _SpeechtotextState();
}

class _SpeechtotextState extends State<Speechtotext> {
  SpeechToText _speechToText = SpeechToText();
  String _lastWords = '';
  SpeechToText speechToText = SpeechToText();
  bool isListening = false;

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechToText.initialize(onError: (error) {
      print('Error: $error');
    });
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  Widget build(BuildContext context) {
    void regren() {
      setState(() {
        noun = RandomWord.randomNoun();
        _lastWords = '';
      });
    }

    bool verifyText() {
      if (_lastWords.contains(noun)) {
        return true;
      }
      return false;
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
                  'Read the following text for authentication: $noun',
                  style: TextStyle(
                    fontSize: 24,
                    color: isListening ? Colors.black87 : Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  _speechToText.isListening
                      ? _lastWords
                      : _speechToText.isAvailable
                          ? 'Tap the microphone to start listening...'
                          : 'Speech not available',
                ),
              ),
              Expanded(
                child: verifyText()
                    ? const Text("Success")
                    : const Text("Failed"),
              ),
              const SizedBox(height: 200),
              AvatarGlow(
                animate: isListening,
                duration: const Duration(milliseconds: 2000),
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
                            // Handle recognized text here if needed
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
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFF2F66F5),
                        radius: 50,
                        child: Icon(
                          isListening ? Icons.mic : Icons.mic_none,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Appbuttons(
                onPressed: () {
                  regren();
                },
                text: 'Click to regenerate a word',
              ),
              const SizedBox(height: 20),
              Appbuttons(text: "Submit", routeName: '/Congrats'),
            ],
          ),
        ),
      ),
    );
  }
}
