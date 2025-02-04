import 'package:flutter/material.dart';
import 'package:peliculas/delegate/delegate.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cine'),
        actions: [
          IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate(),),
              icon: const Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CardSwiper(movies: movieProvider.movies),
              MovieSlider(
                movies: movieProvider.moviesPopulares,
                titulo: '¡Populares!',
                onNextPage: movieProvider.obtenerPeliculasEnTendencia,
              )
            ],
          ),
        ),
      ),
    );
  }
}
