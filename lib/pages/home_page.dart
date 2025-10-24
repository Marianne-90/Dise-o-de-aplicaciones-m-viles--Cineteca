import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Función temporal para simular acciones (registro / ingreso)
  void _dummy(BuildContext context, String action) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$action (pendiente de integrar)')));
  }

  @override
  Widget build(BuildContext context) {
    // Uso SingleChildScrollView para que no truene en pantallas pequeñas
    // si la columna crece (evito overflow).
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        // >>> COLUMN: organizo todo el contenido de arriba hacia abajo
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ------------------- HEADER CON STACK -------------------
            // Quiero un encabezado “hero” que combine varios widgets apilados:
            // - Un fondo decorado (Container)
            // - Unos circulitos decorativos (Positioned dentro de Stack)
            // - Un ícono de cine y textos encima
            SizedBox(
              height: 220, // Alto fijo para que el Stack tenga límites
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // CONTAINER: fondo con degradado y bordes redondeados
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      // Un pequeño degradado para que se vea más “app”
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.25),
                          Theme.of(
                            context,
                          ).colorScheme.secondary.withOpacity(0.15),
                        ],
                      ),
                    ),
                  ),
                  // Un circulito decorativo arriba a la izquierda
                  Positioned(
                    top: -20,
                    left: -20,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withOpacity(0.2),
                      ),
                    ),
                  ),
                  // Otro circulito decorativo abajo a la derecha
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(
                          context,
                        ).colorScheme.secondary.withOpacity(0.2),
                      ),
                    ),
                  ),
                  // Contenido principal centrado: ícono + textos
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.local_movies, size: 72),
                        const SizedBox(height: 12),
                        // TEXT: título principal
                        const Text(
                          '¡Bienvenida/o a la Cineteca!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // TEXT: subtítulo
                        Text(
                          'Explora, registra e ingresa para guardar tus favoritas.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ------------------- BLOQUE DE ACCIONES -------------------
            // CONTAINER: tarjeta simple para agrupar botones de acción
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).dividerColor.withOpacity(0.4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // TEXT: explicación de las acciones
                  const Text(
                    'Empieza aquí',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Regístrate si es tu primera vez o ingresa si ya tienes cuenta.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // ROW: coloco ambos botones en línea horizontal
                  Row(
                    children: [
                      // Uso Expanded para que ambos botones ocupen el mismo ancho
                      Expanded(
                        child: FilledButton(
                          onPressed: () => _dummy(context, 'Registrar'),
                          child: const Text('Registrarse'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => _dummy(context, 'Ingresar'),
                          child: const Text('Ingresar'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ------------------- BLOQUE DE WIDGETS BÁSICOS -------------------
            // Aquí demuestro el uso explícito de Text, Row, Column y Container
            // con un ejemplo tipo "features" para la tarea.
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Widgets básicos usados en esta pantalla',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  // ROW: fila de “chips” informativos
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        _FeatureChip(label: 'Text'),
                        SizedBox(width: 8),
                        _FeatureChip(label: 'Row'),
                        SizedBox(width: 8),
                        _FeatureChip(label: 'Column'),
                        SizedBox(width: 8),
                        _FeatureChip(label: 'Stack'),
                        SizedBox(width: 8),
                        _FeatureChip(label: 'Container'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    // TEXT: explico con mis palabras (como si fuera un comentario de entrega)
                    'En el header usé un Stack para apilar el fondo decorado y los elementos posicionados, '
                    'luego una Column para alinear el ícono y los textos. Abajo, en acciones, usé un Row '
                    'para acomodar los botones horizontalmente dentro de un Container con borde. '
                    'También coloqué estos “chips” dentro de otra Column para mostrar que entiendo el uso de Container + Row + Text.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // ------------------- NOTA FINAL -------------------
            // Un último Text dentro de un Container para cerrar la sección
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.50),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Esto es una advertencia ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget auxiliar para no repetir estilos de “chip” de características
class _FeatureChip extends StatelessWidget {
  final String label;
  const _FeatureChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      // CONTAINER: usado como chip simple con padding y borde
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.25),
        ),
      ),
      child: Text(label),
    );
    // (Uso Text aquí también para que quede explícito en la evidencia)
  }
}
