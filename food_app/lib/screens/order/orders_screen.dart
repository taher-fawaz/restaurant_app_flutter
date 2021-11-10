import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/adress_widget.dart';
import 'components/payment_widget.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/OrdersScreen';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(
            // fontFamily: 'Valken',
            fontSize: 30,
            color: Color(0xff161616),
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF3a3737),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/cm1.jpeg',
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Text(
              'Address',
              style: TextStyle(
                // fontFamily: 'Verdana',
                fontSize: 25,
                color: Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const AdressWidget(
              place: 'Home',
              adress:
                  'Sydney Opera House, Sydney,\nNew South Wales, 2000, AUS'),
          const AdressWidget(
              place: 'Office',
              adress:
                  'GPO Cheese and Wine Room,\n1 Martin Pl, Sydney 2000, AUS'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Text(
              'Payment',
              style: TextStyle(
                // fontFamily: 'Verdana',
                fontSize: 25,
                color: Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const PaymentWidget(
              place: 'Home',
              adress:
                  'Sydney Opera House, Sydney,\nNew South Wales, 2000, AUS'),
          const PaymentWidget(
              place: 'Cash on Delivery',
              isCash: true,
              adress:
                  'GPO Cheese and Wine Room,\n1 Martin Pl, Sydney 2000, AUS'),
          const Spacer(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '\$1008',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 55.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        border: Border.all(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                        child: Text(
                          "Place Order",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
