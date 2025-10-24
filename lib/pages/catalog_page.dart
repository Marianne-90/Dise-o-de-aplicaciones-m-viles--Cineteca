import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';
import 'movie_detail_page.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  List<Movie> get _demo => <Movie>[
    Movie(
      id: '1',
      titulo: 'El Viaje de Chihiro',
      anio: 2001,
      director: 'Hayao Miyazaki',
      genero: 'Animación / Fantasía',
      sinopsis:
          'Chihiro se adentra en un mundo mágico para salvar a sus padres.',
      imagenUrl: 'https://picsum.photos/id/1011/400/600',
    ),
    Movie(
      id: '2',
      titulo: 'La La Land',
      anio: 2016,
      director: 'Damien Chazelle',
      genero: 'Musical / Romance',
      sinopsis: 'Actriz y músico persiguen sus sueños en Los Ángeles.',
      imagenUrl: 'https://picsum.photos/id/1015/400/600',
    ),
    Movie(
      id: '3',
      titulo: 'Roma',
      anio: 2018,
      director: 'Alfonso Cuarón',
      genero: 'Drama',
      sinopsis: 'Retrato íntimo en la CDMX de los años 70.',
      imagenUrl: 'https://picsum.photos/id/1016/400/600',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Movie> movies = _demo;

    if (movies.isEmpty) {
      return const Center(child: Text('No hay películas aún'));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: movies.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieCard(
          movie: movie,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => MovieDetailPage(movie: movie)),
            );
          },
        );
      },
    );
  }
}
