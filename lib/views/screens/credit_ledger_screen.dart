import 'package:flutter/material.dart';
import 'package:ui_layout_flutter/core/models/customer_model.dart';
import 'package:ui_layout_flutter/utilities/constants/themes_constants.dart';
import 'package:ui_layout_flutter/views/commons/buttons_common.dart';
import 'package:ui_layout_flutter/views/commons/inputs_common.dart';

class CreditLedgerScreen extends StatefulWidget {
  const CreditLedgerScreen({super.key, required this.title});

  final String title;

  @override
  State<CreditLedgerScreen> createState() => _CreditLedgerScreenState();
}

class _CreditLedgerScreenState extends State<CreditLedgerScreen> {
  List<CustomerModel> customers = allCustomers;
  TextEditingController dueDateTextController = TextEditingController();
  String activeButton = '';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    double totalBalance = 0.00;

    for (var customer in customers) {
      totalBalance += customer.balance;
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CColors.trueWhite,
        appBar: AppBar(
          backgroundColor: CColors.trueWhite,
          title: Text(
            style: const TextStyle(color: CColors.primaryTextLightColor),
            widget.title,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.sort_by_alpha_rounded,
                color: CColors.primaryColor,
                size: 25.0,
              ),
              onPressed: () {
                debugPrint('✅ I was pressed!');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.search_rounded,
                color: CColors.primaryColor,
                size: 25.0,
              ),
              onPressed: () {
                debugPrint('✅ I was pressed!');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.mail_outline_rounded,
                color: CColors.primaryColor,
                size: 25.0,
              ),
              onPressed: () {
                debugPrint('✅ I was pressed!');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.settings_rounded,
                color: CColors.primaryColor,
                size: 25.0,
              ),
              onPressed: () {
                debugPrint('✅ I was pressed!');
              },
            ),
          ],
        ),
        body: Container(
          color: CColors.trueWhite,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    // SECTION - Total Balance
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: SizedBox(
                        height: 150.0,
                        width: screenSize - 40.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                CColors.primaryColor,
                                CColors.secondaryColor,
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 35.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    '₱${totalBalance.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        color: CColors.trueWhite,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50.0),
                                  ),
                                  const Text(
                                    'Total Balance',
                                    style: TextStyle(
                                        color: CColors.trueWhite,
                                        fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // !SECTION

                    // SECTION - Total Payments, Credits, and Customers
                    Card(
                      elevation: 10.0,
                      color: CColors.trueWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: <Widget>[
                            // SECTION - Customer List
                            Column(
                              children: [
                                const Text(
                                  'Customer List',
                                  style: TextStyle(
                                      color: CColors.primaryTextLightColor,
                                      fontSize: 15.0),
                                ),
                                Text(
                                  '${customers.length.toString()} Entries',
                                  style: const TextStyle(
                                      color: CColors.primaryTextLightColor,
                                      fontSize: 20.0),
                                ),
                              ],
                            ),
                            // !SECTION
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  // SECTION - Total Payment
                                  Column(
                                    children: const [
                                      Text(
                                        'Total Payment',
                                        style: TextStyle(
                                            color:
                                                CColors.primaryTextLightColor,
                                            fontSize: 15.0),
                                      ),
                                      Text(
                                        '₱0.00',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  // !SECTION

                                  // SECTION - Total Credit
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Total Credit',
                                          style: TextStyle(
                                              color:
                                                  CColors.primaryTextLightColor,
                                              fontSize: 15.0),
                                        ),
                                        Text(
                                          '₱${totalBalance.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // !SECTION
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // !SECTION

                    // SECTION - Filter Buttons and Due Date
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // SECTION - All Button Filter
                          CustomListFilterButton(
                            text: 'ALL',
                            activeButton: activeButton,
                            doOnPressed: () {
                              setState(() {
                                activeButton = 'ALL';
                              });
                            },
                          ),
                          // !SECTION

                          // SECTION - Unpaid Button Filter
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CustomListFilterButton(
                              text: 'UNPAID',
                              activeButton: activeButton,
                              doOnPressed: () {
                                setState(() {
                                  activeButton = 'UNPAID';
                                });
                              },
                            ),
                          ),
                          // !SECTION

                          // SECTION - Paid Button Filter
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CustomListFilterButton(
                              text: 'PAID',
                              activeButton: activeButton,
                              doOnPressed: () {
                                setState(() {
                                  activeButton = 'PAID';
                                });
                              },
                            ),
                          ),
                          // !SECTION
                        ],
                      ),
                    ),
                    // SECTION - Due Date Text Field
                    CustomDateTextField(
                      controller: dueDateTextController,
                      hintText: 'Due Date',
                    ),
                    // !SECTION
                    // !SECTION

                    // SECTION - List Header
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Reminder',
                              style: TextStyle(
                                  color: CColors.primaryTextLightColor,
                                  fontSize: 15.0),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text(
                              'Customer Name',
                              style: TextStyle(
                                  color: CColors.primaryTextLightColor,
                                  fontSize: 15.0),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 40.0),
                                  child: Text(
                                    'Balance',
                                    style: TextStyle(
                                        color: CColors.primaryTextLightColor,
                                        fontSize: 15.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // !SECTION

                    // SECTION - Customer List
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        height: 200.0,
                        width: screenSize,
                        child: ListView.builder(
                            itemCount: customers.length,
                            itemBuilder: (BuildContext context, int index) {
                              final customer = customers[index];
                              return SizedBox(
                                height: 75.0,
                                child: Card(
                                  elevation: 15.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                              backgroundColor: customer
                                                          .remind ==
                                                      true
                                                  ? CColors
                                                      .primaryButtonLightColor
                                                  : CColors
                                                      .secondaryTextLightColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0))),
                                          child: SizedBox(
                                            height: 30.0,
                                            child: Row(
                                              children: const [
                                                Text(
                                                    style: TextStyle(
                                                        color:
                                                            CColors.trueWhite,
                                                        fontSize: 12.0),
                                                    'Remind'),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 2.0),
                                                  child: Icon(
                                                    Icons
                                                        .circle_notifications_rounded,
                                                    color: CColors.trueWhite,
                                                    size: 20.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Text(
                                          customer.customerName,
                                          style: const TextStyle(
                                              color:
                                                  CColors.primaryTextLightColor,
                                              fontSize: 16.0),
                                        ),
                                      ),
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Text(
                                                '₱${customer.balance.toStringAsFixed(2)}',
                                                style: const TextStyle(
                                                    color: CColors
                                                        .primaryTextLightColor,
                                                    fontSize: 17.0),
                                              )),
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0),
                                            child: Icon(
                                              Icons.keyboard_arrow_right,
                                              color: CColors
                                                  .primaryButtonLightColor,
                                              size: 15.0,
                                            ),
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    // !SECTION

                    const SizedBox(
                      width: 50.0,
                      height: 50.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          tooltip: 'Add Customer',
          label: const Text('ADD CUSTOMER'),
          icon: const Icon(Icons.add),
          backgroundColor: CColors.primaryButtonLightColor,
          onPressed: () {
            debugPrint('✅ Add customer button was pressed!');
          },
        ),
      ),
    );
  }
}
