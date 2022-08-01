import 'package:flutter/material.dart';
import 'package:navigator_drawer/main.dart';

class inputPhone extends StatefulWidget {
  const inputPhone({Key? key}) : super(key: key);

  @override
  State<inputPhone> createState() => _inputPhoneState();
}

class _inputPhoneState extends State<inputPhone> {
  late TextEditingController controller;
  String phone = '';

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Phone Number:  ',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(phone),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text('Input Phone Number'),
                onPressed: () async {
                  final phone = await openDialog();
                  if (phone == null || phone.isEmpty) {
                    return;
                  }
                  setState(() => this.phone = phone);
                },
              ),
            ],
          )));

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Input Phone'),
            content: TextField(
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: InputDecoration(hintText: 'Input Your Phone Number'),
              controller: controller,
              onSubmitted: (inputPhoneState) => submit(),
            ),
            actions: [
              TextButton(
                child: Text('Submit'),
                onPressed: submit,
              )
            ],
          ));

  void submit() {
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }
}
