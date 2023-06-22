import 'package:app/models/Product.dart';
import 'package:app/screens/shop/checkOut.dart';
import 'package:app/utils/Sizer.dart';
import 'package:app/widgets/NavBar.dart';
import 'package:app/widgets/ProductCard.dart';
import 'package:flutter/material.dart';

class ShoppingHome extends StatefulWidget {
  const ShoppingHome({Key? key}) : super(key: key);
  @override
  State<ShoppingHome> createState() => _ShoppingHomeState();
}

class _ShoppingHomeState extends State<ShoppingHome> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool cartUnchanged = false;
    Sizer.init(context);
    List<Product> products = Product.products;
    return Localizations(
        locale: Locale('en', 'US'),
        delegates: const <LocalizationsDelegate<dynamic>>[
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        child: Scaffold(
            bottomNavigationBar: NavBar(selected_index: 3),
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
                elevation: 0.3,
                backgroundColor: Colors.white,
                title: Text(
                  "Merchandise",
                  style:
                      TextStyle(color: Colors.black, fontSize: Sizer.fsm * 0.9),
                ),
                centerTitle: true,
                leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:
                        Icon(Icons.chevron_left_rounded, color: Colors.black)),
                actions: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckoutPage()));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizer.sbh * 3),
                      child: cartUnchanged
                          ? Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.black,
                            )
                          : Padding(
                              padding: EdgeInsets.all(Sizer.sbh * 4),
                              child: Stack(
                                children: <Widget>[
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.black,
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red[900],
                                        radius: 3,
                                      )),
                                ],
                              )),
                    ),
                  )
                ]),
            body: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: Sizer.sbh),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.9),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index % 2],
                  );
                }))
        // body: SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: Sizer.sbv * 2.5,
        //       ),
        //       Padding(
        //           padding: EdgeInsets.symmetric(horizontal: Sizer.sbv * 6),
        //           child: Container(
        //               alignment: Alignment.center,
        //               // color: Colors.amber,
        //               width: Sizer.screenWidth,
        //               height: Sizer.sbv * 5,
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Text(
        //                     "Products",
        //                     style: TextStyle(
        //                         fontSize: Sizer.fsm,
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.bold),
        //                   ),
        //                   InkWell(
        //                     onTap: () {},
        //                     child: Icon(Icons.filter_list_rounded,
        //                         color: Colors.black),
        //                   )
        //                 ],
        //               ))),
        //       SizedBox(
        //         height: Sizer.sbv * 1.5,
        //       ),
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: Sizer.sbv * 6),
        //         child: Container(
        //           alignment: Alignment.center,
        //           width: Sizer.screenWidth,
        //           child: TextField(
        //             controller: _searchController,
        //             decoration: InputDecoration(
        //               filled: true,
        //               fillColor: Color(0XffFAFAFA),
        //               hintText: 'Search Product Name',
        //               hintStyle: TextStyle(
        //                 color: Color(0XffC4C5C4),
        //               ),
        //               // Add a clear button to the search bar
        //               suffixIcon: IconButton(
        //                 icon: Icon(
        //                   Icons.search,
        //                   color: Colors.black,
        //                 ),
        //                 onPressed: () {
        //                   // Perform the search here
        //                 },
        //               ),
        //               border: InputBorder.none,
        //             ),
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: Sizer.sbv * 4,
        //       ),
        // Container(
        //     color: Color.fromARGB(255, 213, 213, 213),
        //     width: Sizer.screenWidth,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         ProductCard(),
        //         ProductCard(),
        //       ],
        //     )),

        );
  }
}
