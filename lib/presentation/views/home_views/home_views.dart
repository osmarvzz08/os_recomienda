import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:os_recomienda/presentation/providers/providers.dart';

import 'package:os_recomienda/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topratedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topratedMovies = ref.watch(topratedMoviesProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppBar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            // const CustomAppBar(),
            MovieSlideshow(movies: slideShowMovies),
            MovieHorizontalListView(
              movies: nowPlayingMovies,
              title: 'En cines',
              subTitle: 'Marte 17',
              loadNextPage: () {
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontalListView(
              movies: upcomingMovies,
              title: 'Proximamente',
              subTitle: 'En este es',
              loadNextPage: () {
                ref.read(upcomingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontalListView(
              movies: popularMovies,
              title: 'Populares',
              // subTitle: 'En este es',
              loadNextPage: () {
                ref.read(popularMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontalListView(
              movies: topratedMovies,
              title: 'Mejor calificadas',
              subTitle: 'Desde Siempre',
              loadNextPage: () {
                ref.read(topratedMoviesProvider.notifier).loadNextPage();
              },
            )
          ],
        );
      }, childCount: 1))
    ]);
  }
}
