import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_eapp/new_eapp/controller/product_controller/product_controller.dart';
import 'package:new_eapp/new_eapp/model/Product_model.dart';

import '../../controller/api_controller/api.dart';
import '../../widget_all/Product_widget/Product_item.dart';
import '../../widget_all/textfield_widget/txtfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> finalData = [];

  getData() async {
    log("===============11111");
    var data = await ProductCon().makeModel();
    finalData = data;
    log("===============33333");
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  double appbarwidth = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width, appbarwidth),
        child: Container(
          height: appbarwidth,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(55.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 8),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 30,
                  width: 30,
                  color: Colors.white.withOpacity(0.4),
                  child: Center(
                    child: InkWell(
                      child: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                ),

                // Title
                Text(
                  "Search",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // Example Action Button
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 30,
                  width: 30,
                  color: Colors.white.withOpacity(0.4),
                  child: Center(
                    child: InkWell(
                      child: Badge.count(
                        count: 3,
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
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
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextfield(
              hinttext: "Search here...",
              preIcon: Icon(Icons.search, color: Colors.grey),
              sufIcon: InkWell(
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Search results for ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '"fruits"',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.64,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: finalData.length,
                itemBuilder: (context, index) {
                  final item = finalData[index];
                  return CustomItemContainer(
                    image: item.image,
                    title: item.name,
                    quantity: item.quantity,
                    dailyprice: item.regularPrice,
                    disPrice: item.discountPrice,
                    ratings: item.rating,
                    review: item.reviews,
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
