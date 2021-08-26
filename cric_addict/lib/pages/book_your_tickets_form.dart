import 'package:cric_addict/components/inputField.dart';
import 'package:cric_addict/utils/constants.dart';
import 'package:flutter/material.dart';

class BookYourTicketsForm extends StatefulWidget {
  const BookYourTicketsForm({Key? key}) : super(key: key);

  @override
  _BookYourTicketsFormState createState() => _BookYourTicketsFormState();
}

class _BookYourTicketsFormState extends State<BookYourTicketsForm> {
  final List<String> members = ['0', '1', '2', '3', '4'];
  final List<String> paymentMode = ['GPay', 'PayPal', 'PayTM', 'GPay', 'PayTM'];
  late String _currentmembers;
  late String _currentPaymentMode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
            padding: EdgeInsets.all(7), child: Icon(Icons.arrow_back_ios)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Book your Tickets",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          DropdownButtonFormField(
            value: _currentmembers ?? '0',
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.all(12.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.pink, width: 2.0),
              ),
            ),
            items: members.map((members) {
              return DropdownMenuItem(
                value: members,
                child: Text('$members members'),
              );
            }).toList(),
            // onChanged: (val) => setState(() => _currentSugars = val ),
          ),
          SizedBox(
            height: 8.0,
          ),
          // buildBookTicketForm(),
          ListView.builder(
            itemCount: members.length,
            itemBuilder: (context, index) {
              return buildBookTicketForm();
            },
          ),

          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Login()),
                // );
              },
              child: Text("Submit"),
              style: TextButton.styleFrom(
                primary: greenColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildBookTicketForm() {
    return Column(
      children: [
        Text(' member $members'),
        inputFields(
            "Full name",
            Icon(
              Icons.person,
              color: greyColor,
            ),
            false),
        inputFields(
            "Phone",
            Icon(
              Icons.phone_android,
              color: greyColor,
            ),
            false),
        inputFields(
            "Email",
            Icon(
              Icons.mail_outline,
              color: greyColor,
            ),
            false),
        DropdownButtonFormField(
          value: _currentPaymentMode ?? '0',
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.all(12.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink, width: 2.0),
            ),
          ),
          items: members.map((paymentMode) {
            return DropdownMenuItem(
              value: paymentMode,
              child: Text('$paymentMode'),
            );
          }).toList(),
          // onChanged: (val) => setState(() => _currentSugars = val ),
        ),
      ],
    );
  }
}
