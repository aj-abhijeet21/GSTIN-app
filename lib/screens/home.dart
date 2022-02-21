import 'package:flutter/material.dart';
import 'package:gstin_app/services/constants.dart';
import 'package:gstin_app/screens/search_return_status.dart';
import 'package:gstin_app/screens/search_gst.dart';
import 'package:gstin_app/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = [
    const Tab(
      child: Text('Search GST Number'),
    ),
    const Tab(
      child: Text('GST Return Status'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: green,
          elevation: 0,
          actions: const [
            Icon(
              Icons.more_vert,
            ),
          ],
        ),
        body: Column(
          children: [
            RoundedHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select the type for',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'GST Number Search Tool',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TabBar(
                    overlayColor: MaterialStateProperty.all(
                      green,
                    ),
                    labelColor: green,
                    indicatorColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      shape: BoxShape.rectangle,
                    ),
                    automaticIndicatorColorAdjustment: true,
                    tabs: myTabs,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SearchGst(),
                  const ReturnStatus(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
