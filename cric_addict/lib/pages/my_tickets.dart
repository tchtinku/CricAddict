import 'package:flutter/material.dart';

class MyTicket extends StatefulWidget {
  const MyTicket({Key? key}) : super(key: key);

  @override
  _MyTicketState createState() => _MyTicketState();
}

class _MyTicketState extends State<MyTicket> {
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
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return buildTicketCard();
        },
      ),
    );
  }

  Widget buildTicketCard() {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          title: Text('Ind vs Aus'),
          subtitle: Text('Melbourne Cricket ground'),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Watcher: Rashmi Desai"),
            const SizedBox(width: 8),
            Text("Time: 6:00pm"),
            const SizedBox(width: 8),
          ],
        ),
      ],
    ));
  }
}
