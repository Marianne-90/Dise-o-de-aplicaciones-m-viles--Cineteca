import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold da estructura base: AppBar, body, etc.
    return Scaffold(
      // Para mostrar la imagen de fondo uso un Stack:
      body: Stack(
        fit: StackFit.expand, // hace que la imagen cubra toda la pantalla
        children: [
          // ----------------- IMAGEN DE FONDO -----------------
          Image.asset(
            'assets/images/cineteca_bg.jpg', // 👈 asegúrate del nombre correcto
            fit: BoxFit.cover, // hace que la imagen llene todo el fondo
          ),

          // ----------------- CAPA OSCURA SEMITRANSPARENTE -----------------
          // (para que el texto sea legible sobre la imagen)
          Container(color: Colors.black.withValues(alpha: 0.4)),

          // ----------------- CONTENIDO PRINCIPAL -----------------
          // Uso un Center + Column para centrar vertical y horizontalmente
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // NOMBRE DE LA APLICACIÓN
                Text(
                  'CINETeca App',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 20),

                // MENSAJE DE BIENVENIDA
                const Text(
                  '¡Bienvenida/o! Disfruta del mejor catálogo de cine',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 40),

                // BOTÓN DE CONTINUAR (opcional)
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Entrando a la aplicación...'),
                      ),
                    );
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
