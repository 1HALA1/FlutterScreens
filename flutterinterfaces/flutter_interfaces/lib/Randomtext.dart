import 'package:flutter/material.dart';
import 'package:flutter_interfaces/widgets/Appbuttons.dart';
import 'package:flutter_interfaces/widgets/Apptextfield.dart';

class Randomtext extends StatefulWidget {
  @override
  RandomTextState createState() => RandomTextState();
}

class RandomTextState extends State<Randomtext> {
  final RandomTextManager _manager = RandomTextManager();
  final TextEditingController _textController = TextEditingController();
  bool _isAddingText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.grey[200],
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _manager.randomTexts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Apptextfield(
                              hintText: 'Enter Text',
                              controller: TextEditingController(
                                  text: _manager.randomTexts[index]),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Appbuttons(
                                        text: 'Edit',
                                        width: 70,
                                        height: 30,
                                        onPressed: () {
                                          _showEditDialog(index);
                                        },
                                        borderColor: Colors.green,
                                        backgroundColor: Colors.green,
                                      ),
                                      SizedBox(width: 8.0),
                                      Appbuttons(
                                        text: 'Delete',
                                        width: 70,
                                        height: 30,
                                        onPressed: () {
                                          _manager.deleteRandomText(index);
                                          setState(() {});
                                        },
                                        borderColor: Colors.red,
                                        backgroundColor: Colors.red,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!_isAddingText)
                    Appbuttons(
                      text: 'Add Random Text',
                      width: 200,
                      height: 40,
                      onPressed: () {
                        setState(() {
                          _isAddingText = true;
                        });
                      },
                    ),
                  if (_isAddingText)
                    Expanded(
                      child: Column(
                        children: [
                          Apptextfield(
                            hintText: 'Enter Random Text',
                            controller: _textController,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Appbuttons(
                                text: 'Add',
                                width: 100,
                                height: 30,
                                onPressed: () {
                                  String newText = _textController.text;
                                  _manager.addRandomText(newText);
                                  _textController.clear();
                                  setState(() {
                                    _isAddingText = false;
                                  });
                                },
                              ),
                              SizedBox(width: 8.0),
                              Appbuttons(
                                text: 'Cancel',
                                width: 100,
                                height: 30,
                                onPressed: () {
                                  _textController.clear();
                                  setState(() {
                                    _isAddingText = false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(int index) {
    String text = _manager.randomTexts[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Text'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Apptextfield(
                hintText: 'Enter Text',
                controller: TextEditingController(text: text),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  SizedBox(width: 8.0),
                  TextButton(
                    onPressed: () {
                      String newText = _textController.text;
                      _manager.updateRandomText(index, newText);
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class RandomTextManager {
  List<String> _randomTexts = [];

  List<String> get randomTexts => _randomTexts;

  void addRandomText(String text) {
    _randomTexts.add(text);
  }

  void deleteRandomText(int index) {
    _randomTexts.removeAt(index);
  }

  void updateRandomText(int index, String newText) {
    _randomTexts[index] = newText;
  }
}
