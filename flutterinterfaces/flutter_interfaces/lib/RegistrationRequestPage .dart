import 'package:flutter/material.dart';
import 'package:flutter_interfaces/widgets/Appbuttons.dart';

class RegistrationRequestsPage extends StatefulWidget {
  const RegistrationRequestsPage({Key? key}) : super(key: key);

  @override
  _RegistrationRequestsPageState createState() =>
      _RegistrationRequestsPageState();
}

class _RegistrationRequestsPageState extends State<RegistrationRequestsPage> {
  List<String> registrationRequests = [
    "User 1 voice request",
    "User 2 voice request",
    "User 3 voice request",
  ];

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
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: registrationRequests.length,
          itemBuilder: (context, index) {
            final request = registrationRequests[index];
            return Column(
              children: [
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.grey[400]!,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Color(0xFF2F66F5),
                      ),
                    ),
                    title: Text(request),
                    trailing: IconButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      onPressed: () {
                        // for tje user request details

                        print("Show details for $request");
                      },
                    ),
                    onTap: () {},
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Appbuttons(
                      text: "Accept",
                      height: 30,
                      width: 70,
                      backgroundColor: Colors.green,
                      borderColor: Colors.green,
                      onPressed: () {
                        setState(() {
                          registrationRequests.removeAt(index);
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    Appbuttons(
                      text: "Reject",
                      backgroundColor: Colors.red,
                      borderColor: Colors.red,
                      height: 30,
                      width: 70,
                      onPressed: () {
                        setState(() {
                          registrationRequests.removeAt(index);
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
