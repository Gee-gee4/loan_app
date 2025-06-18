import 'package:flutter/material.dart';
import 'package:loan_app/pages/details_page.dart';
import 'package:loan_app/widgets/reusable_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final TextEditingController _searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor('d5deef'),
      extendBody: true,
      appBar: AppBar(
        actions: [Icon(Icons.search)],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Members:',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          color: Colors.blueGrey[400],
                        ),
                        child: Center(child: Text('Sort')),
                      ),
                      Container(
                        height: 45,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          color: Colors.blueGrey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Text('A-Z'),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_down),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: hexToColor('5f83b1'),
                  child: Text('GM'),
                ),
                title: Text('Gladys Murugi', style: TextStyle(fontSize: 19)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID:23542376', style: TextStyle(fontSize: 17)),
                    Text('No:0739293729', style: TextStyle(fontSize: 15)),
                  ],
                ),
                trailing: Text('Shares: 4', style: TextStyle(fontSize: 16)),
                tileColor: hexToColor('b1c9ef'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsPage()),
                    ),
              ),
              SizedBox(height: 13),
            ],
          ),
        ),
      ),
    );
  }
}
 // Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(25),
            //   ),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(25),
            //       color: Colors.grey[350],
            //     ),
            //     height: 120,
            //     width: double.infinity,
            //     padding: EdgeInsets.all(8),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text('Gladys Murugi'),
            //         Text('ID: 41266149'),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text('Phone: 0768848185'),
            //             Container(
            //               height: 45,
            //               width: 120,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(25),
            //                 color: Colors.grey,
            //               ),
            //               child: Center(child: Text('Shares: 5')),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),