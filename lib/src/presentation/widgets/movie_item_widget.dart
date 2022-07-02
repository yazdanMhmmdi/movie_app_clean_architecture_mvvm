import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/core.dart';
import '../../domain/domain.dart';

class MovieItemWidget extends StatelessWidget {
  MovieItemWidget({Key? key, required this.movieModel, required this.onTap})
      : super(key: key);
  Movie movieModel;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        width: 119.h,
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: 119.h,
                    height: 158.h,
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      fadeInCurve: Curves.ease,
                      placeholder: Assets.placeholder,
                      image: ImageSizer.w200(movieModel.posterPath!),
                    ),
                  ),
                ),
                Text(
                  movieModel.title.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: IColors.titleColor,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  movieModel.releaseDate.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: IColors.subTitleColor,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
