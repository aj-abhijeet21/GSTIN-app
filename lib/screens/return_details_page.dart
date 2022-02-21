import 'package:flutter/material.dart';
import 'package:gstin_app/models/gst_model.dart';
import 'package:gstin_app/services/constants.dart';
import 'package:gstin_app/services/state_provider.dart';
import 'package:gstin_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ReturnDetailsPage extends StatelessWidget {
  // final String gstNumber;
  // ReturnDetails({required this.gstNumber});
  // GstService gstService = GstService();
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
      body: Consumer<StateNotifier>(
        builder: (_, notifier, __) {
          if (notifier.state == AppState.initial) {
            return const Center(
              child: Text('Enter GST Number to check Return Status'),
            );
          } else if (notifier.state == AppState.loading) {
            return Center(
              child: CircularProgressIndicator(
                color: green,
              ),
            );
          } else {
            if (notifier.failure != null) {
              // print('Failure captured: ${notifier.failure}');
              return ShowAlertDialog(
                notifier.failure.toString(),
              );
              // return Center(
              //   child: Text(
              //     notifier.failure.toString(),
              //   ),
              // );
            } else {
              return SingleChildScrollView(
                child: BuildReturnDetails(
                  gstReturnStatus: notifier.gstReturnStatus,
                ),
              );
            }
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
