import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PeriodDetailsSection extends StatelessWidget {
  const PeriodDetailsSection(
      {super.key,
      required this.periodName,
      required this.description,
      required this.imageUrl});
  final String periodName;
  final String description;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            SvgPicture.asset(Assets.imagesDetails1),
           
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                "عن $periodName",
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 13,
                fontWeight:FontWeight.w900, ),
                
              ),
            ),
           

          ],
        ),
        const SizedBox(height: 47),
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    top: -24, child: SvgPicture.asset(Assets.imagesDetails2)),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: SizedBox(
                      width: 255,
                      height: 300,
                      child: Text(
                        description,
                        maxLines: 20,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.poppins500style14.copyWith(
                            color: AppColors.black, fontFamily: 'Almarai'),
                      )),
                ),
              ],
            ),
            const SizedBox(width: 16),
          ],
        ),
            const SizedBox(height: 20),

        SizedBox(
          width: 320,
          
          child: CachedNetworkImage(imageUrl: imageUrl,fit: BoxFit.cover,),
        )
      ],
    );
  }
}
