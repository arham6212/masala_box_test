import 'package:flutter/material.dart';
import 'package:masala_box_test/components/cache-image-widget.dart';
import 'package:masala_box_test/models/images_model.dart';

import '../theme/app_colors.dart';
import '../utils/tools.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    Key? key, required this.image,
    
  }) : super(key: key);
final Images image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.raisinBlack, width: 2)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: Tools.isTablet(context)?150:100,
                child: ClipRRect(
                  borderRadius:  const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: CacheImageWidget((Tools.isTablet(context)? image.urls?.full:image.urls?.regular)??'', fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: Tools.isTablet(context)?148:114,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                     Text(
                      image.sponsorship?.sponsor?.name??'Not available',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      image.description??'-',
                      style: TextStyle(
                          color: AppColors.raisinBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Spacer(),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: AppColors.cadet,
                          onPressed: () {},
                          textColor: Colors.white,
                          child: const Text('Click Me'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 75,
            left: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CacheImageWidget(
                (Tools.isTablet(context)?image.sponsorship?.sponsor?.profileImage?.large: image.sponsorship?.sponsor?.profileImage?.medium)??'',
                fit: BoxFit.fill,
                height: 50,
                width: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
