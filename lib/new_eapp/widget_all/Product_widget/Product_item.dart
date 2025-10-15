import 'package:flutter/material.dart';

class CustomItemContainer extends StatelessWidget {
  const CustomItemContainer({
    super.key,
    this.image,
    this.title,
    this.quantity,
    this.ratings,
    this.review,
    this.dailyprice,
    this.disPrice,
    this.ontap,
  });
  final String? image;
  final String? title;
  final String? quantity;
  final double? ratings;
  final int? review;
  final double? dailyprice;
  final double? disPrice;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 2.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: BoxBorder.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Container(
              height: 130,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withAlpha(100),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("$image"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7, right: 7),
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Text(
                          maxLines: 1,
                          "${title}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          maxLines: 1,
                          "${quantity}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    maxLines: 1,
                    "⭐$ratings($review reviews)",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$$dailyprice",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "\$$disPrice",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: InkWell(
                      onTap: ontap,
                      child: Container(
                        height: 25,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pink,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: Colors.white, size: 18),
                            Text(
                              "Add to cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
