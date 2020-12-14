import 'package:flutter/material.dart';
import 'package:grab/constant.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  final double width;
  final double height;

  const SearchBar({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: width * 0.8,
          height: kSpacingUnit.w * 5.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: kGreyDarker,
                blurRadius: 2.0,
                offset: Offset(0.0, 2.0),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: kSpacingUnit.w * 5.4,
                height: kSpacingUnit.w * 5.5,
                decoration: BoxDecoration(
                    color: kGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )),
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                  color: kGreyDarker,
                ),
              ),
              Expanded(
                child: Center(
                  child: TextField(
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black87,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search the Grab app",
                      hintStyle: TextStyle(
                        color: kGreyDarker,
                        fontSize: kSpacingUnit.w * 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
