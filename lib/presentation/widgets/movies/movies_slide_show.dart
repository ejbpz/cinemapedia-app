import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesSlideShow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideShow({
    super.key, 
    required this.movies
    });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        scale: 0.88,
        autoplay: true,
        viewportFraction: 0.8,
        pagination: SwiperPagination(
          margin: EdgeInsets.only(top: 3),
          builder: DotSwiperPaginationBuilder(
            color: colors.primaryContainer,
            activeColor: colors.primary,
          )
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _Slide(movie: movie);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10)
        ),
      ]
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: boxDecoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: () => context.push('/home/0/movie/${movie.id}'),
            child: Image.network(
              movie.backdropPath,
              fit: BoxFit.cover
            ),
          ),
        ),
      ),
    );
  }
}