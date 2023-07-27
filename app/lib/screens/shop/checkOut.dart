import 'package:app/models/Product.dart';
import 'package:app/screens/shop/couponPage.dart';
import 'package:app/utils/Sizer.dart';
import 'package:app/utils/paymentResult.dart';
import 'package:counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  var _razorpay = Razorpay();
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PaymentResult(result: true, message: "Payment Successful")));
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    List<Product> cart_products = Product.products;

    void _openBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: Center(
              child: Text('This is a modal bottom sheet'),
            ),
          );
        },
      );
    }

    int CartSubTotal() {
      int total = 0;
      for (int i = 0; i < cart_products.length; i++) {
        total += cart_products[i].price;
      }
      return total;
    }

    return Localizations(
        locale: Locale('en', 'US'),
        delegates: const <LocalizationsDelegate<dynamic>>[
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        child: Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Text(
                "Checkout",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Sizer.fsm * 0.9,
                    letterSpacing: 1.0),
              ),
              centerTitle: true,
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.chevron_left_rounded, color: Colors.black)),
            ),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Expanded(
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Sizer.sbh * 10,
                              vertical: Sizer.sbv * 3),
                          child: Text(
                            "Order Details",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: Sizer.fssm,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          )),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizer.sbh * 5),
                        child: Container(
                          width: Sizer.screenWidth * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                                cart_products.length,
                                (index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Sizer.sbv,
                                        horizontal: Sizer.sbh),
                                    child: Row(children: [
                                      Container(
                                        width: Sizer.sbv * 15,
                                        height: Sizer.sbv * 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[600],
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  cart_products[index]
                                                      .cover_image),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Sizer.sbh * 2),
                                        child: Container(
                                          height: Sizer.sbv * 15,
                                          width: Sizer.sbh * 60,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: Sizer.sbh * 5),
                                                child: Text(
                                                  cart_products[index].name,
                                                  style: TextStyle(
                                                      fontSize: Sizer.fssm,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black87),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: Sizer.sbh * 5),
                                                child: Text(
                                                  "₹ " +
                                                      cart_products[index]
                                                          .price
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: Sizer.fss,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.grey[600]),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Transform.scale(
                                                    scale: 0.65,
                                                    child: Counter(
                                                      min: 1,
                                                      max: 10,
                                                    ),
                                                  ),
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          Colors.grey[200],
                                                      radius: 10,
                                                      child: Icon(
                                                        Icons.delete_rounded,
                                                        color: Colors.grey[600],
                                                        size: Sizer.fss,
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Sizer.sbv * 3,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Sizer.sbv),
                        child: Container(
                          width: Sizer.screenWidth * 0.8,
                          child: Row(children: <Widget>[
                            Expanded(
                              child: new Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: Divider(
                                    color: Colors.grey[400],
                                    thickness: 1.0,
                                    height: 36,
                                  )),
                            ),
                            Text(
                              "Delivery Location",
                              style: TextStyle(
                                  fontSize: Sizer.fss,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[500],
                                  letterSpacing: 2),
                            ),
                            Expanded(
                              child: new Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 10.0),
                                  child: Divider(
                                    color: Colors.grey[400],
                                    thickness: 1.0,
                                    height: 36,
                                  )),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: Sizer.sbv * 2,
                      ),
                      Container(
                        width: Sizer.screenWidth * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: Sizer.sbv * 2.5),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Sizer.sbh * 5),
                                child: Container(
                                  width: Sizer.sbv * 5,
                                  height: Sizer.sbv * 5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[100],
                                  ),
                                  child: Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.amber[600],
                                    size: Sizer.fss * 2,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: Sizer.sbh * 40,
                                    child: Text(
                                      "Home",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: Sizer.fss * 0.8,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Container(
                                      width: Sizer.sbh * 40,
                                      child: Text(
                                        "Flat no. 3, Vinay Marg, Chanakyapuri",
                                        style: TextStyle(
                                            fontSize: Sizer.fss * 0.7,
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w600),
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: Sizer.sbh * 25,
                              ),
                              InkWell(
                                  onTap: () {
                                    _openBottomSheet();
                                  },
                                  child: Icon(
                                    Icons.chevron_right_rounded,
                                    color: Colors.grey[850],
                                    size: Sizer.fss * 2,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Sizer.sbv * 2,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Sizer.sbv),
                        child: Container(
                          width: Sizer.screenWidth * 0.8,
                          child: Row(children: <Widget>[
                            Expanded(
                              child: new Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: Divider(
                                    color: Colors.grey[400],
                                    thickness: 1.0,
                                    height: 36,
                                  )),
                            ),
                            Text(
                              "Apply Coupon",
                              style: TextStyle(
                                  fontSize: Sizer.fss,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[500],
                                  letterSpacing: 2),
                            ),
                            Expanded(
                              child: new Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 10.0),
                                  child: Divider(
                                    color: Colors.grey[400],
                                    thickness: 1.0,
                                    height: 36,
                                  )),
                            ),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Sizer.sbv),
                        child: Container(
                            width: Sizer.screenWidth * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Sizer.sbv,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Sizer.sbv),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: Sizer.sbh * 5),
                                                child: Icon(
                                                  Icons.money,
                                                  color: Colors.amber[600],
                                                  size: Sizer.fss,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: Sizer.sbh),
                                                child: Text(
                                                    "Saved ₹ 100 with the applied code!",
                                                    style: TextStyle(
                                                        fontSize:
                                                            Sizer.fss * 0.9,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black87)),
                                              )
                                            ],
                                          )),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Sizer.sbh * 3),
                                        child: Text(
                                          "Remove",
                                          style: TextStyle(
                                              fontSize: Sizer.fss * 0.9,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(
                                                  221, 94, 1, 112)),
                                        )),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Sizer.sbv,
                                        vertical: Sizer.sbv),
                                    child: Text("Coupon : FIRST_ORDER",
                                        style: TextStyle(
                                            fontSize: Sizer.fss * 0.6,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey[500],
                                            letterSpacing: 1))),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: Sizer.sbv),
                                  child: Container(
                                      width: Sizer.screenWidth * 0.8,
                                      height: Sizer.sbv,
                                      child: Divider(
                                        color: Colors.grey[100],
                                        thickness: 1.0,
                                        height: 36,
                                      )),
                                ),
                                InkWell(
                                  onTap: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CouponPage()))
                                  },
                                  child: Container(
                                    // color: Colors.blue,
                                    width: Sizer.screenWidth * 0.6,
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: Sizer.sbh * 18,
                                        ),
                                        Text("View All Coupons",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: Sizer.fss * 0.8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey[500],
                                                letterSpacing: 1)),
                                        Icon(
                                          Icons.chevron_right_rounded,
                                          color: Colors.grey[850],
                                          size: Sizer.fss * 0.8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: Sizer.sbv * 2)
                              ],
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Sizer.sbv),
                        child: Container(
                          width: Sizer.screenWidth * 0.8,
                          child: Row(children: <Widget>[
                            Expanded(
                              child: new Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: Divider(
                                    color: Colors.grey[400],
                                    thickness: 1.0,
                                    height: 36,
                                  )),
                            ),
                            Text(
                              "Bill Summary",
                              style: TextStyle(
                                  fontSize: Sizer.fss,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[500],
                                  letterSpacing: 2),
                            ),
                            Expanded(
                              child: new Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 10.0),
                                  child: Divider(
                                    color: Colors.grey[400],
                                    thickness: 1.0,
                                    height: 36,
                                  )),
                            ),
                          ]),
                        ),
                      ),
                      Container(
                          width: Sizer.screenWidth * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(children: [
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Sizer.sbh * 5,
                                    vertical: Sizer.sbv * 2),
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Order Info",
                                        style: TextStyle(
                                            fontSize: Sizer.fssm,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87)))),
                            SizedBox(
                              height: Sizer.sbv * 2,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Sizer.sbh * 5,
                                          vertical: Sizer.sbv,
                                        ),
                                        child: Text(
                                          "Subtotal",
                                          style: TextStyle(
                                              fontSize: Sizer.fsm,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Sizer.sbh * 5,
                                              vertical: Sizer.sbv),
                                          child: Text(
                                              "₹ " + CartSubTotal().toString(),
                                              style: TextStyle(
                                                  fontSize: Sizer.fsm,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54))),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Sizer.sbh * 5,
                                        ),
                                        child: Text(
                                          "Shipping",
                                          style: TextStyle(
                                              fontSize: Sizer.fss,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey[500]),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: Sizer.sbh * 5,
                                          ),
                                          child: Text("+ ₹ 350",
                                              style: TextStyle(
                                                  fontSize: Sizer.fss,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey[500]))),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Sizer.sbh * 5,
                                          vertical: Sizer.sbv,
                                        ),
                                        child: Text(
                                          "Discounts",
                                          style: TextStyle(
                                              fontSize: Sizer.fss,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey[500]),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Sizer.sbh * 5,
                                              vertical: Sizer.sbv),
                                          child: Text("- ₹ 150",
                                              style: TextStyle(
                                                  fontSize: Sizer.fss,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey[500]))),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Sizer.sbh * 5),
                                    child: Divider(
                                      color: Colors.grey[350],
                                      thickness: 1,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Sizer.sbh * 5,
                                          vertical: Sizer.sbv * 2,
                                        ),
                                        child: Text(
                                          "Grand Total",
                                          style: TextStyle(
                                              fontSize: Sizer.fss,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Sizer.sbh * 5,
                                              vertical: Sizer.sbv * 2),
                                          child: Text("₹ 650",
                                              style: TextStyle(
                                                  fontSize: Sizer.fss,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ])),
                      SizedBox(
                        height: Sizer.sbv * 3,
                      ),
                      Container(
                          width: Sizer.sbh * 80,
                          height: Sizer.sbh * 12,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: InkWell(
                            onTap: () {
                              /// make payment ///
                              ///
                              var options = {
                                'key': 'rzp_test_LlKxiKQ73SDi8j',
                                //amount will be in paise, need to be multiple of 100//
                                'amount': 100,
                                'name': 'Acme Corp.',
                                'description': 'Fine T-Shirt',
                                'prefill': {
                                  'contact': '8888888888',
                                  'email': 'test@razorpay.com'
                                }
                              };
                              _razorpay.open(options);
                            },
                            child: Text(
                              "Checkout (₹ 650.00)",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Sizer.fss,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: Sizer.sbv * 5,
                      ),
                    ],
                  ),
                ))));
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
