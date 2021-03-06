import 'package:flutter/material.dart';
import 'package:gstin_app/screens/return_details_page.dart';
import 'package:gstin_app/services/constants.dart';
import 'package:gstin_app/services/state_provider.dart';
import 'package:provider/provider.dart';

class ReturnStatus extends StatefulWidget {
  const ReturnStatus({Key? key}) : super(key: key);

  @override
  State<ReturnStatus> createState() => _ReturnStatusState();
}

class _ReturnStatusState extends State<ReturnStatus> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController = TextEditingController();
    String searchText = '';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter GST Number',
              style: TextStyle(
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(
                fontSize: 15,
                color: green,
              ),
              cursorColor: green,
              controller: _textController,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.grey.shade200,
                hintText: 'Ex: 07AACM010C1ZP',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 15,
                ),
                filled: true,
                contentPadding: const EdgeInsets.all(20.0),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        searchText = _textController.text.trim();
                      });

                      StateNotifier provider =
                          Provider.of<StateNotifier>(context, listen: false);
                      provider.setGstId(searchText);
                      provider.getReturnDetails();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReturnDetailsPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Check Status',
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        green,
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                          vertical: 25,
                        ),
                      ),
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
