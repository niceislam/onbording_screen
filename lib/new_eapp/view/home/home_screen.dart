import 'package:flutter/material.dart';
import 'package:new_eapp/new_eapp/controller/api_controller/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic b = "";
  getData() {

  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.menu, size: 28, color: Colors.white),
        centerTitle: true,
        title: Text(
          "${b.body}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            Container(
              height: 250,
              width: MediaQuery.sizeOf(context).width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  spacing: 10,
                  children: [
                    Text(
                      maxLines: 1,
                      "la;ksd",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    Text(
                      "la;ksd",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
