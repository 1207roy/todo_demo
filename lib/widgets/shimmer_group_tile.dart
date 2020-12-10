import 'package:flutter/material.dart';
import 'package:tododemo/utils/extensions/extension.dart';
import 'package:tododemo/widgets/shimmer_widget.dart';

class ShimmerGroupTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: context.responsiveHeight(20), left: context.responsiveWidth(20), right: context.responsiveWidth(20)),
//      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget(height: context.responsiveHeight(10), width: context.responsiveWidth(80)),
                    SizedBox(height: context.responsiveHeight(8)),
                    ShimmerWidget(height: context.responsiveHeight(20)),
                    SizedBox(height: context.responsiveHeight(8)),
                    ShimmerWidget(height: context.responsiveHeight(20)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: context.responsiveHeight(8)),
          ShimmerWidget(height: context.responsiveHeight(10), width: context.responsiveWidth(120)),
          SizedBox(height: context.responsiveHeight(20))
        ],
      ),
    );
  }
}
