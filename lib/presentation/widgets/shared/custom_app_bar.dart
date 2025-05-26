import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text('Cinemapedia', style: titleStyle),
              const Spacer(),
              IconButton(
                onPressed: () {
                  final searchMoviesProvider = ref.read(searchedMoviesProvider);
                  final searchMovie = ref.watch(searchMovieProvider);

                  showSearch<Movie?>(
                    query: searchMovie,
                    context: context, 
                    delegate: SearchMovieDelegate(
                      initialMovies: searchMoviesProvider,
                      searchMovies: ref.read(searchedMoviesProvider.notifier).searchMoviesByQuery
                    )
                  ).then((movie) {
                    if(movie == null) return;
                    if(context.mounted) {
                      context.push('/movie/${movie.id}');
                    }
                  });

                }, 
                icon: Icon(Icons.search_outlined)
              )
            ],
          ),
        ),
      ),
    );
  }
}