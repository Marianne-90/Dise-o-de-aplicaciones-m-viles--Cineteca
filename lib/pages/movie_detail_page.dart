import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.titulo)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(movie.imagenUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Título: ${movie.titulo}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text('Año: ${movie.anio}'),
            const SizedBox(height: 8),
            Text('Director: ${movie.director}'),
            const SizedBox(height: 8),
            Text('Género: ${movie.genero}'),
            const SizedBox(height: 16),
            const Text(
              'Sinopsis',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(movie.sinopsis),
          ],
        ),
      ),
    );
  }
}
