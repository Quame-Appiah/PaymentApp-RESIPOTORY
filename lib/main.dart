import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment App'),
      ),
      body: Stack(
        children: [
          Container(color: Colors.grey[200]),
          headSection(),
          billsList(),
        ],
      ),
    );
  }

  Widget headSection() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/your_logo.png', height: 50), // Replace with your logo path
          SizedBox(height: 10),
          Text(
            'Payment App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search bills',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget billsList() {
    // Replace with actual bill data fetching logic (e.g., API call)
    List<Bill> bills = [
      Bill(name: 'Bill 1', dueDate: DateTime(2023, 12, 31), amount: 100.00),
      Bill(name: 'Bill 2', dueDate: DateTime(2024, 01, 15), amount: 150.00),
      // Add more bills with data from your source
    ];

    return ListView.builder(
      itemCount: bills.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentPage()),
            );
          },
          child: Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(bills[index].name),
              subtitle: Text('Due Date: ${bills[index].dueDate.toString()}'),
              trailing: Text('¢${bills[index].amount.toStringAsFixed(2)}'),
            ),
          ),
        );
      },
    );
  }
}

class Bill {
  final String name;
  final DateTime dueDate;
  final double amount;

  Bill({required this.name, required this.dueDate, required this.amount});
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      decoration: BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: const [Colors.blueAccent, Colors.lightBlueAccent], // Use named constructors for colors
    ),
    ),
    padding: EdgeInsets.all(40),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: