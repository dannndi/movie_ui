import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_ui/core/route/app_route_name.dart';
import 'package:movie_ui/core/theme/app_color.dart';
import 'package:movie_ui/feature/home/model/movie_model.dart';

class NowPlayingMovieWidget extends StatefulWidget {
  const NowPlayingMovieWidget({super.key});

  @override
  State<NowPlayingMovieWidget> createState() => _NowPlayingMovieWidgetState();
}

class _NowPlayingMovieWidgetState extends State<NowPlayingMovieWidget> {
  int centerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: CarouselSlider.builder(
        itemCount: upcoming.length,
        options: CarouselOptions(
          height: 400,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          initialPage: centerIndex,
          viewportFraction: 0.7,
          onPageChanged: (index, reason) {
            setState(() {
              centerIndex = index;
            });
          },
        ),
        itemBuilder: (context, index, _) {
          return _NowPlayingItem(
            movie: nowPlayingMovie[index],
            isCenter: index == centerIndex,
          );
        },
      ),
    );
  }
}

class _NowPlayingItem extends StatefulWidget {
  const _NowPlayingItem({
    required this.movie,
    this.isCenter = false,
  });

  final Movie movie;
  final bool isCenter;

  @override
  State<_NowPlayingItem> createState() => __NowPlayingItemState();
}

class __NowPlayingItemState extends State<_NowPlayingItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouteName.movieDetail,
          arguments: widget.movie,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(
                    widget.movie.assetImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: widget.isCenter
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColor.secondaryColor,
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(16),
                          ),
                        ),
                        child: Text(
                          "Buy Ticket",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColor.primaryColor),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.movie.title,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
