// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:loan_app/model/member_model.dart';
import 'package:loan_app/module/members_service.dart';
import 'package:loan_app/pages/details_page.dart';
import 'package:loan_app/utils/color_convert.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final TextEditingController _searchTextController = TextEditingController();
  List<MemberModel> members = [];
  bool isLoading = true;

  //creates an instance of your service class so you can call: _membersService.fetchMembers()
  final MembersService _membersService = MembersService();

  @override
  void initState() {
    super.initState();
    _fetchMembers();
  }

  void _fetchMembers() async {
    try {
      // print('Fetching members...');
      final fetched = await _membersService.fetchMembers();
      // print('Fetched ${fetched.length} members');

      setState(() {
        members = fetched;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching members: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor('d5deef'),
      extendBody: true,
      appBar: AppBar(
        actions: [
          SearchAnchor(
            viewBackgroundColor:hexToColor('d5deef'),
            builder: (BuildContext context, SearchController controller) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  controller.openView(); // Opens the search dropdown
                },
              );
            },
            suggestionsBuilder: (context, controller) {
              final query = controller.text.toLowerCase();

              final results =
                  members
                      .where(
                        (member) =>
                            member.memberName.toLowerCase().contains(query) ||
                            member.idNo.toLowerCase().contains(query) ||
                            member.phoneNumber.toLowerCase().contains(query),
                      )
                      .toList();

              if (results.isEmpty && query.isNotEmpty) {
                return [const ListTile(title: Text('No matches'))];
              }

              return results.map((member) {
                return ListTile(
                  title: Text(member.memberName),
                  subtitle: Text('ID: ${member.idNo}'),
                  onTap: () {
                    controller.closeView(member.memberName); // closes dropdown
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsPage(member: member),
                      ),
                    );
                  },
                );
              }).toList();
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
            Expanded(
              child:
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : members.isEmpty
                      ? Center(child: Text('No members found'))
                      : ListView.builder(
                        itemCount: members.length,
                        itemBuilder: (context, index) {
                          final member = members[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: hexToColor('5f83b1'),
                                child: Text(getInitials(member.memberName)),
                              ),
                              title: Text(
                                member.memberName,
                                style: TextStyle(fontSize: 19),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ID: ${member.idNo}',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    'No:${member.phoneNumber}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              trailing: Text(
                                'Shares ${member.memberShares}',
                                style: TextStyle(fontSize: 16),
                              ),
                              tileColor: hexToColor('b1c9ef'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              onTap:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              DetailsPage(member: member),
                                    ),
                                  ),
                            ),
                          );
                        },
                      ),
            ),
            SizedBox(height: 13),
          ],
        ),
      ),
    );
  }
}
