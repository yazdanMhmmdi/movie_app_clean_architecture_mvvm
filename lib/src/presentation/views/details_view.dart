import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/resources/image_sizer.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/utils/assets.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/utils/colors.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/entities/movie.dart';

class DetailsView extends StatefulWidget {
  final Movie movie;
  const DetailsView({Key? key, required this.movie}) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundImage(),
          _header(),
          _footer(children: [
            SizedBox(height: 24.h),
            Center(
              child: Container(
                width: 300.w,
                child: Text(
                  widget.movie.title!,
                  style: TextStyle(
                    color: IColors.titleColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: Text(
                widget.movie.releaseDate!,
                style: TextStyle(
                  color: IColors.subTitleColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            if (widget.movie.overview!.isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Text(widget.movie.overview!,
                    style: TextStyle(
                      color: IColors.subTitleColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right),
              ),
            ] else ...[
              Center(
                child: Text(
                  "متنی جهت نمایش وجود ندارد",
                  style: TextStyle(
                    color: IColors.subTitleColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ]
          ])
        ],
      ),
    );
  }

  Widget _backgroundImage() {
    return Container(
      width: double.infinity,
      height: 392.h,
      child: FadeInImage.assetNetwork(
          fit: BoxFit.cover,
          placeholder: Assets.placeholderLarge,
          image: ImageSizer.original(widget.movie.backdropPath!)),
    );
  }

  Widget _footer({required List<Widget> children}) {
    return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.5,
        builder: (_, __) {
          return SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                color: IColors.background,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(0.0, 0.1),
                  stops: const [0.0, .1, 0.2],
                  // repeats the gradient over the canvas
                  colors: [
                    IColors.background.withOpacity(0.0),
                    IColors.background.withOpacity(.49),
                    IColors.background,
                  ],
                ),
              ),
              child: SingleChildScrollView(
                controller: __,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: children,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                size: 34,
                color: IColors.titleColor,
                textDirection: TextDirection.rtl,
              )),
        ),
      ],
    );
  }
}
