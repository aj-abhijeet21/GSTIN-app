import 'package:flutter/material.dart';
import 'package:gstin_app/models/gst_model.dart';
import 'package:gstin_app/services/constants.dart';
import 'package:gstin_app/services/state_provider.dart';
import 'package:gstin_app/widgets/widgets.dart';

import 'package:provider/provider.dart';

class GstDetailsPage extends StatelessWidget {
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
        title: const Text('GST Profile'),
      ),
      body: Consumer<StateNotifier>(
        builder: (_, notifier, __) {
          if (notifier.state == AppState.initial) {
            return const Center(
              child: Text('Enter GST Number to check GST Details'),
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
                child: TaxDetails(
                  gstModel: notifier.gstModel,
                ),
              );
            }
          }
        },
      ),
    );
  }
}

class TaxDetails extends StatelessWidget {
  GstModel gstModel;
  TaxDetails({required this.gstModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedHeader(
          child: buildHeaderDetails(),
        ),
        buildAddressCard(),
        buildJurisdictionCard(),
        buildBusinessTypeCard(),
        buildDateCard(),
        const SizedBox(
          height: 50,
        ),
        buildReturnFilingButton(),
      ],
    );
  }

  Column buildHeaderDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GSTIN of the Tax Payer',
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '${gstModel.gstNumber}',
          // '07AACM010C1ZP',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          '${gstModel.firstName} ${gstModel.lastName}',
          // 'Masters India Private Limited',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: green,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                gstModel.status,
                style: TextStyle(
                  color: green,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Padding buildReturnFilingButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextButtonGreen(
              title: 'Get Return Filing Status',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  CardWidget buildAddressCard() {
    return CardWidget(
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: green,
                size: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                // gstModel.address1,
                'Principal Place of Business',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text(
                    gstModel.address1,
                    // 'K-27, florr, mandolidklnlads dlkasd lnsasadfsfdaad',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.business_outlined,
                color: green,
                size: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Additional Place of Business',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text(
                    gstModel.address2,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildJurisdictionCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'State Jurisdiction',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  gstModel.stateJuri,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Center Jurisdiction',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  gstModel.centerJuri,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tax Payer Type',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  gstModel.taxPayerType,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CardWidget buildBusinessTypeCard() {
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Constitution of Business',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            gstModel.businessType,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  CardWidget buildDateCard() {
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Date of Registration',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                ),
              ),
              Text(
                'Date of Cancellation',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                gstModel.date,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Text(
                '--',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
