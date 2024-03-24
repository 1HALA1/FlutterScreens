import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interfaces/widgets/Appbuttons.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class VoicePage extends StatefulWidget {
  const VoicePage({Key? key}) : super(key: key);

  @override
  _VoicePageState createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> with TickerProviderStateMixin {
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    initRecorder();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation =
        Tween<double>(begin: 64, end: 80).animate(_animationController);
  }

  @override
  void dispose() {
    recorder.stopRecorder();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }
    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(
      const Duration(milliseconds: 500),
    );
  }

  Future<void> record() async {
    await recorder.startRecorder(toFile: 'audio');
    setState(() {
      isRecording = true;
    });
    _animationController.repeat(reverse: true);
  }

  Future<void> stop() async {
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    final audioFile = File(path!);
    print('Recorded audio: $audioFile');
    setState(() {
      isRecording = false;
    });
    _animationController.reset();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.grey[200],
        ),
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Record Your Voice',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                Text(
                  'tap the microphone icon and read the following sentence:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Text(
                  '"I am a human and I want to register in this application"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 100),
                AvatarGlow(
                  animate: isRecording,
                  glowColor: const Color(0xFF2F66F5),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isRecording
                          ? const Color(0xFF2F66F5)
                          : const Color(
                              0xFF2F66F5), 
                    ),
                    padding: EdgeInsets.all(12),
                    child: IconButton(
                      onPressed: () async {
                        if (isRecording) {
                          await stop();
                        } else {
                          await record();
                        }
                      },
                      icon: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) => Icon(
                          isRecording ? Icons.mic : Icons.mic_none,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 150),
                SizedBox(
                  child: Appbuttons(
                    text: "Continuo",
                    routeName: '/Speechtotext',
                    width: 350,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
