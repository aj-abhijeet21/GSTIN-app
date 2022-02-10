import 'package:flutter/material.dart';
import 'package:gstin_app/models/gst_model.dart';
import 'package:gstin_app/services/constants.dart';
import 'package:gstin_app/services/gst_service.dart';
import 'package:gstin_app/widgets/card_widget.dart';

class ReturnDetails extends StatelessWidget {
  final String gstNumber;
  ReturnDetails({required this.gstNumber});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        backgroundColor: green,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('GST Return Status'),
      ),
      body: FutureBuilder<GstReturnStatus?>(
        future: getReturnDetails(gstNumber),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: green,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: BuildReturnDetails(
                gstReturnStatus: snapshot.data!,
              ),
            );
          } else {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
        },
      ),
    );
  }
}

class BuildReturnDetails extends StatelessWidget {
  final GstReturnStatus gstReturnStatus;
  BuildReturnDetails({required this.gstReturnStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'GSTIN No: ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${gstReturnStatus.gstNumber}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Status: ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${gstReturnStatus.status}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
