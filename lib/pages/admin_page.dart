import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _formKey = GlobalKey<FormState>();
  final _titulo = TextEditingController();
  final _anio = TextEditingController();
  final _director = TextEditingController();
  final _genero = TextEditingController();
  final _sinopsis = TextEditingController();
  final _imagenUrl = TextEditingController();

  @override
  void dispose() {
    _titulo.dispose();
    _anio.dispose();
    _director.dispose();
    _genero.dispose();
    _sinopsis.dispose();
    _imagenUrl.dispose();
    super.dispose();
  }

  void _guardar() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Película guardada (ejemplo). Integra tu lógica aquí.'),
        ),
      );
      _formKey.currentState?.reset();
      _titulo.clear();
      _anio.clear();
      _director.clear();
      _genero.clear();
      _sinopsis.clear();
      _imagenUrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titulo,
              decoration: const InputDecoration(labelText: 'Título'),
              validator: (v) => (v == null || v.isEmpty) ? 'Requerido' : null,
            ),
            TextFormField(
              controller: _anio,
              decoration: const InputDecoration(labelText: 'Año'),
              keyboardType: TextInputType.number,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Requerido';
                final n = int.tryParse(v);
                if (n == null || n < 1888) return 'Año inválido';
                return null;
              },
            ),
            TextFormField(
              controller: _director,
              decoration: const InputDecoration(labelText: 'Director'),
              validator: (v) => (v == null || v.isEmpty) ? 'Requerido' : null,
            ),
            TextFormField(
              controller: _genero,
              decoration: const InputDecoration(labelText: 'Género'),
              validator: (v) => (v == null || v.isEmpty) ? 'Requerido' : null,
            ),
            TextFormField(
              controller: _sinopsis,
              decoration: const InputDecoration(labelText: 'Sinopsis'),
              maxLines: 3,
              validator: (v) => (v == null || v.isEmpty) ? 'Requerido' : null,
            ),
            TextFormField(
              controller: _imagenUrl,
              decoration: const InputDecoration(labelText: 'URL de imagen'),
              validator: (v) => (v == null || v.isEmpty) ? 'Requerido' : null,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _guardar,
              icon: const Icon(Icons.save),
              label: const Text('Guardar'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Baja de película (pendiente de integrar).'),
                  ),
                );
              },
              icon: const Icon(Icons.delete_outline),
              label: const Text('Dar de baja'),
            ),
          ],
        ),
      ),
    );
  }
}
