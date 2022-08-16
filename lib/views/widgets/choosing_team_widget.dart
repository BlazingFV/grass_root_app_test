
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../configs/app_styling.dart';

class ChoosingTeamTextWidget extends StatelessWidget {
  const ChoosingTeamTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      // height: 35.h,
      // width: 180.w,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AutoSizeText(
            'Mobile Team',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            maxFontSize: 26,
            minFontSize: 24,
          ),
          const SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(
                width: 6,
                height: 6,
                child: Icon(
                  Icons.keyboard_arrow_up_outlined,
                  color: subtitleTextColor,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              SizedBox(
                width: 6,
                height: 6,
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: subtitleTextColor,
                ),
              ),
              SizedBox(
                height: 13,
              )
            ],
          )
        ],
      ),
    );
  }
}
