import 'package:flutter/material.dart';

class TopGainersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> _topGainers = [
      "Stock A - +10%",
      "Stock B - +8%",
      "Stock C - +7%",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Top Gainers"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: _topGainers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_topGainers[index]),
          );
        },
      ),
    );
  }
}

class TopLosersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> _topLosers = [
      "Stock X - -10%",
      "Stock Y - -8%",
      "Stock Z - -7%",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Top Losers"),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: _topLosers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_topLosers[index]),
          );
        },
      ),
    );
  }
}
