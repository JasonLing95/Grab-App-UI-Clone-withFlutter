import 'package:flutter/material.dart';
import 'package:grab/constant.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopUpBar extends StatelessWidget {
  final double width;

  const TopUpBar({Key key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Container(
          width: width * 0.5,
          height: kSpacingUnit.w * 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: kGreyDarker,
                offset: Offset(0.0, 2.0),
                blurRadius: 4.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image(
                      image: AssetImage('assets/wallet.png'),
                      fit: BoxFit.contain,
                      width: kSpacingUnit.w * 2.0,
                      height: kSpacingUnit.w * 2.0,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: kSpacingUnit.w * 1.0,
                      height: kSpacingUnit.w * 1.0,
                      decoration: BoxDecoration(
                        color: kGreen,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: kSpacingUnit.w * 0.8,
                      ),
                    ),
                  )
                ]),
                Text(
                  'Top Up',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: kSpacingUnit.w * 1.5,
                  ),
                ),
                Container(
                    width: 2.0,
                    height: 2.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    )),
                Text(
                  'Wallet',
                  style: TextStyle(
                    fontSize: kSpacingUnit.w * 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
