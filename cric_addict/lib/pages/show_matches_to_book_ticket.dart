import 'package:cric_addict/pages/book_your_tickets_form.dart';
import 'package:flutter/material.dart';

class ShowMatchesToBookTicket extends StatefulWidget {
  const ShowMatchesToBookTicket({Key? key}) : super(key: key);

  @override
  _ShowMatchesToBookTicketState createState() =>
      _ShowMatchesToBookTicketState();
}

class _ShowMatchesToBookTicketState extends State<ShowMatchesToBookTicket> {
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
                "My Tickets",
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
          Text(
            "Select Match",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return buildSelectMatch();
            },
          ),
        ],
      ),
    );
  }

  Widget buildSelectMatch() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookYourTicketsForm()),
        );
      },
      child: Card(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            title: Text('Ind vs Aus'),
            subtitle: Text('Melbourne Cricket ground'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Time : 12 hrs"),
              const SizedBox(width: 8),
              Text("Start at: 6:00pm"),
              const SizedBox(width: 8),
            ],
          ),
        ],
      )),
    );
  }
}
