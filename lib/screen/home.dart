import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFF1b1c30),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          Color(0XFFf77954),
                          Color(0XFF9f4df6),
                          Color(0XFF7b7ef9),
                          Color(0XFF639efa)
                        ])),
              )
            ],
          ),
        ));
  }
}
