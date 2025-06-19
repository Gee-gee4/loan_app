// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:loan_app/model/loan_model.dart';
import 'package:loan_app/model/member_model.dart';
import 'package:loan_app/module/loan_service.dart';
import 'package:loan_app/utils/color_convert.dart';
import 'package:loan_app/widgets/reusable_widgets.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.member});
  final MemberModel member;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<LoanModel> myLoans = [];
  bool isLoading = true;

  final LoanService _loanService = LoanService();

  @override
  void initState() {
    super.initState();
    fetchLoansForMember();
  }

  void fetchLoansForMember() async {
    try {
      final allLoans = await _loanService.fetchLoans();

      final filteredLoans =
          allLoans
              .where((loan) => loan.member.idNo == widget.member.idNo)
              .toList();

      setState(() {
        myLoans = filteredLoans;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching members: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

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
                height: 240,
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
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name: ${widget.member.memberName}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                ),
                              ),
                              Text(
                                'ID: ${widget.member.idNo}',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'No: ${widget.member.phoneNumber}',
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
                        'Account No: ${widget.member.accountNumber}',
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                      Text(
                        'Shares: ${widget.member.memberShares}',
                        style: TextStyle(color: Colors.white60, fontSize: 17),
                      ),
                      Text(
                        'Savings: Ksh ${widget.member.memberSavings}',
                        style: TextStyle(color: Colors.white60, fontSize: 17),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              'Loan Limit :6000',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                // color: Colors.green
                              ),
                            ),
                          ),
                        ),
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
            Expanded(
              child:
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : myLoans.isEmpty
                      ? Center(
                        child: Text(
                          'No loans found.',
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        ),
                      )
                      : ListView.builder(
                        itemCount: myLoans.length,
                        itemBuilder: (context, index) {
                          final loan = myLoans[index];
                          return Padding(
                            padding: EdgeInsetsGeometry.only(bottom: 10.0),
                            child: Card(
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
                                      child: Text(
                                        '${loan.loanId}',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(width: 12),

                                    // Title Column (Main Info)
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Amount:${loan.loanAmount}',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            'Interest: Ksh ${loan.loanInterest}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          PopupMenuButton<String>(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            color: hexToColor('5f83b1'),
                                            itemBuilder: (context) {
                                              final names = getGuarantorNames(
                                                loan.guarantors,
                                              );

                                              return names.map((name) {
                                                return PopupMenuItem<String>(
                                                  enabled: false,
                                                  value:
                                                      name, // value is required if you want this to ever be selectable
                                                  child: Text(
                                                    name,
                                                    style: const TextStyle(
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                );
                                              }).toList();
                                            },
                                            offset: const Offset(0, 32),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                  ),
                                              height: 30,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: hexToColor('8aaee0'),
                                              ),
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Guarantee',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.keyboard_arrow_down,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(width: 12),

                                    // Trailing Column (Date + Status)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Date Due:',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          loan.loanDueDate,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              25,
                                            ),
                                            color: getLoanStatusColor(
                                              loan.loanStatus,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              loan.loanStatus,
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
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
