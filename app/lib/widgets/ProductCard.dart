import 'dart:ffi';

import 'package:app/models/Product.dart';
import 'package:app/utils/Sizer.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required Product this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    return Padding(
        padding: EdgeInsets.all(Sizer.sbh * 2),
        child: Container(
            width: Sizer.screenWidth * 0.4,
            height: Sizer.sbv * 30,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(Sizer.sbh * 3),
                    child: Container(
                      height: Sizer.sbv * 21,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[700]),
                      child: Image.network(
                        product.cover_image,
                        fit: BoxFit.cover,
                      ),
                    )),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: Sizer.sbh * 3),
                            child: Text(product.name,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: Sizer.fss * 0.9,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                )),
                          )),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizer.sbh * 2),
                        child: InkWell(
                            onTap: () {},
                            child: Icon(Icons.add_circle_rounded,
                                color: Colors.black, size: Sizer.fss * 0.9)),
                      )
                    ]),
                Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width: Sizer.sbh * 2),
                          Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: Sizer.sbh),
                              child: Icon(
                                Icons.star_rounded,
                                color: Colors.amber,
                                size: Sizer.fss * 0.9,
                              )),
                          Text(
                            product.rating.toString(),
                            style: TextStyle(
                              fontSize: Sizer.fss * 0.69,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Sizer.sbh * 2,
                    ),
                    Container(
                      child: Text(
                        product.reviews_count.toString() + " reviews",
                        style: TextStyle(
                          fontSize: Sizer.fss * 0.69,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Sizer.sbh * 15,
                    ),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white)));
  }
}
