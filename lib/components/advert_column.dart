import 'package:flutter/material.dart';
import 'package:grab/constant.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 26,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/mcd.jpg',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0, 0),
                  child: Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          fontSize: kSpacingUnit.w * 1.4,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: kSpacingUnit.w * 1),
            Text(
              'Get McDonald Big Mac Now at 40% Off',
              style: TextStyle(
                fontSize: kSpacingUnit.w * 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: kSpacingUnit.w * 0.3),
            Text(
              'Not Sponsored by McDonald',
              style: TextStyle(
                fontSize: kSpacingUnit.w * 1.2,
                color: Colors.grey[600],
              ),
            )
          ],
        ),
      ),
    );
  }
}
