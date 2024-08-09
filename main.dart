import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(GrowwCloneApp());
}

class GrowwCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groww Clone',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  List<dynamic> _portfolio = [];

  @override
  void initState() {
    super.initState();
    fetchPortfolio();
  }

  Future<void> fetchPortfolio() async {
    final response = await http.get(Uri.parse('http://localhost:3000/portfolio'));

    if (response.statusCode == 200) {
      setState(() {
        _portfolio = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load portfolio');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfolio Overview'),
      ),
      body: _portfolio.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _portfolio.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_portfolio[index]['name']),
                  subtitle: Text('Quantity: ${_portfolio[index]['quantity']}'),
                  trailing: Text('₹${_portfolio[index]['value']}'),
                );
              },
            ),
    );
  }
}
