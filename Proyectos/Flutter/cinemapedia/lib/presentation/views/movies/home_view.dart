import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

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
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading= ref.watch(initialLoadingProvider);
    if ( initialLoading ) return const FullScreenLoader();

    final moviesSlideshow=ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies=ref.watch(popularMoviesProvider);
    final upcomingMovies=ref.watch(upcomingMoviesProvider);
    final topRatedMovies=ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
            centerTitle: true,
          ),
        ),

        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return 
        Column(
        children: [      
          MoviesSlideshow(movies: moviesSlideshow),
      
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'En cines',
            subtitle: 'Lunes 20',
            loadNextPage: () =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
      
          MovieHorizontalListview(
            movies: upcomingMovies,
            title: 'Proximamente',
            subtitle: 'En este mes',
            loadNextPage: () =>ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: popularMovies,
            title: 'Populares',
            // subtitle: '',
            loadNextPage: () =>ref.read(popularMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: topRatedMovies,
            title: 'Mejor calificadas',
            subtitle: 'Desde siempre',
            loadNextPage: () =>ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
          ),
      SizedBox(height: 25,)
        ],
      );
        },
        childCount: 1
        ))
      ]

    );
  }
}