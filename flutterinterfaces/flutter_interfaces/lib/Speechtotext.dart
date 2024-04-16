import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interfaces/widgets/Appbuttons.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:word_generator/word_generator.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart';
import 'dart:html';

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

  /// This has to happen only once per app
  void _initSpeech() async {
    await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      isListening = true;
    });
  }

  /// Manually stop the active speech recognition session
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {
      isListening = false;
    });
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
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
                  // If listening is active show the recognized words
                  _speechToText.isListening
                      ? _lastWords
                      // If listening isn't active but could be tell the user
                      // how to start it, otherwise indicate that speech
                      // recognition is not yet ready or not supported on
                      // the target device
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
              const SizedBox(
                height: 200,
              ),
              AvatarGlow(
                animate: isListening,
                duration: const Duration(milliseconds: 2000),
                glowColor: const Color(0xFF2F66F5),
                repeat: true,
                child: GestureDetector(
                  onTap: () {
                    _speechToText.isNotListening
                        ? _startListening()
                        : _stopListening();
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
              const SizedBox(height: 45),
              Appbuttons(
                onPressed: () {
                  regren();
                },
                text: "Click to regenerate a word",
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
