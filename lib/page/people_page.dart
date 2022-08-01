import 'package:flutter/material.dart';
import 'package:navigator_drawer/page/Kalkulator.dart';
import 'package:navigator_drawer/page/inputPhone.dart';

class peoplePage extends StatefulWidget {
  const peoplePage({Key? key}) : super(key: key);
  @override
  _PeoplePageState createState() => _PeoplePageState();
}
 
 class _PeoplePageState extends State<peoplePage> {
  TextEditingController CtrUsername = new TextEditingController();
  TextEditingController Ctrnama = new TextEditingController();
  String phoneNumber = "000";

  Widget TxtInput(String Username, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: Username,
      ),
    );
  }

  Widget btnRegister(String text) {
    return Container(
      width: 150,
      child: ElevatedButton(
          onPressed: () {
            if (Ctrnama.text == "" || CtrUsername == "") {
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Kalkulator(
                            name: Ctrnama.text,
                          )));
            }
          },
          child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrasi")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TxtInput("Username", CtrUsername),
            SizedBox(
              height: 10,
            ),
            TxtInput("name", Ctrnama),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                
                Text(" Phone Number: " + phoneNumber  +'  '),
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const inputPhone()),
                    );
                    
                    setState(()  {
                      phoneNumber = result.toString();
                    });
                  },
                  child: Text("Input Phone Number"),
                )
              ],
            ),
            btnRegister("submit")
          ],
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
      );
