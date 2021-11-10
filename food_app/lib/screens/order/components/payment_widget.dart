import 'package:flutter/material.dart';
import '../../../widgets/rounded_checkbox.dart';

class PaymentWidget extends StatelessWidget {
  final bool? isCash;
  final String? place;
  final String? adress;
  const PaymentWidget(
      {Key? key, this.place = "", this.adress, this.isCash = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isCash! ? 95 : 80,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: const LinearGradient(
          begin: Alignment(0.0, -1.0),
          end: Alignment(0.0, 1.0),
          colors: [Color(0xFFF5F5F5), Color(0xfff5f2f2)],
          stops: [0.0, 1.0],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: isCash!,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Text(
                  place!,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    isCash!
                        ? "assets/icons/cash.png"
                        : "assets/images/menus/ic_credit_card.png",
                    width: 50,
                    height: 50,
                  ),
                ),
                isCash!
                    ? const SizedBox(
                        width: 150,
                        child: Text(
                          " \$1008",
                          style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFF3a3a3b),
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.left,
                        ),
                      )
                    : SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              "****",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFF3a3a3b),
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "****",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFF3a3a3b),
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "3256",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFF3a3a3b),
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                RoundCheckBox(
                  onTap: (selected) {},
                  checkedColor: Theme.of(context).colorScheme.secondary,
                  animationDuration: const Duration(milliseconds: 200),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
