import 'package:flutter/material.dart';
import 'package:loan_app/widgets/reusable_widgets.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor('d5deef'),
      extendBody: true,
      appBar: AppBar(
        title: Text('Details'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 3,
              color: hexToColor('395886'),
              child: SizedBox(
                height: 220,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: hexToColor('8aaee0'),
                            ),
                            child: myImages('assets/images/person.png'),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name: Gladys Mbuthia',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                ),
                              ),
                              Text(
                                'ID: 41266278',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'No: 0765382926',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Account No: 1008',
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                      Text(
                        'Shares: 4',
                        style: TextStyle(color: Colors.white60, fontSize: 17),
                      ),
                      Text(
                        'Savings: Ksh 300',
                        style: TextStyle(color: Colors.white60, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'My Loans',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: hexToColor('b1c9ef'),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Leading Avatar
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: hexToColor('5f83b1'),
                    ),
                    const SizedBox(width: 12),

                    // Title Column (Main Info)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Value: Ksh 300',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Interest: Ksh 100',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 30,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: hexToColor('8aaee0'),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Guarantee',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Trailing Column (Date + Status)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date Due:', style: TextStyle(fontSize: 14)),
                        Text('20/06/2025', style: TextStyle(fontSize: 14)),
                        const SizedBox(height: 4),
                        Container(
                          padding: EdgeInsets.all(5),
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.green[300],
                          ),
                          child: const Center(
                            child: Text(
                              'Approved',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
