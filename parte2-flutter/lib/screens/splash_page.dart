import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math; // Importação para animar a boca do Pac-Man!
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    _timer = Timer(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01050F),
      body: Stack(
        children: [
          // --- EFEITOS DE FUNDO (MARCA D'ÁGUA) ---
          Positioned(
            bottom: -30,
            right: -30,
            child: Transform.rotate(
              angle: -0.2,
              child: Icon(Icons.gamepad,
                  size: 250, color: Colors.blueAccent.withValues(alpha: 0.03)),
            ),
          ),
          Positioned(
            top: 100,
            left: -40,
            child: Transform.rotate(
              angle: 0.4,
              child: Icon(Icons.videogame_asset,
                  size: 150, color: Colors.blueAccent.withValues(alpha: 0.03)),
            ),
          ),

          // --- CONTEÚDO PRINCIPAL ---
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),

                const Text(
                  'Play',
                  style: TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 2),
                ),
                const Text(
                  'Retrô',
                  style: TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 52,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueAccent,
                      letterSpacing: 2,
                      height: 0.9),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildColorBar(Colors.blueAccent.shade700),
                    _buildColorBar(Colors.redAccent),
                    _buildColorBar(Colors.greenAccent.shade700),
                    _buildColorBar(Colors.amber),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  'PASSADO  •  PRESENTE  •  SEMPRE PLAY',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                ),

                const Spacer(flex: 2),

                // --- NOVA BARRA DO PAC-MAN (PERFEITA) ---
                _buildPacmanProgressBar(),

                const SizedBox(height: 24),
                const Text(
                  'CARREGANDO GRANDES MEMÓRIAS...',
                  style: TextStyle(
                      color: Colors.white54, fontSize: 10, letterSpacing: 2),
                ),

                const Spacer(flex: 3),
                const Text(
                  'JOGOS  •  FIGURAS  •  CARTAS',
                  style: TextStyle(
                      color: Colors.white38, fontSize: 10, letterSpacing: 4),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorBar(Color color) {
    return Container(width: 35, height: 6, color: color);
  }

  // NOVA BARRA COM DESENHO CUSTOMIZADO
  Widget _buildPacmanProgressBar() {
    const double barWidth = 280.0;
    const double pacmanSize = 24.0; // Tamanho do Pac-Man

    return Container(
      width: barWidth,
      height: 34,
      decoration: BoxDecoration(
        color: const Color(0xFF030B17), // Cor de fundo do trilho
        border: Border.all(color: Colors.blueAccent.shade700, width: 2),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // 1. Pastilhas (bolinhas brancas) distribuídas igualmente
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  12,
                  (index) => const CircleAvatar(
                      radius: 3, backgroundColor: Colors.white70)),
            ),
          ),

          // 2. Animação real do Pac-Man
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double progress = _controller.value;

              // Posição do Pac-man andando da esquerda para a direita
              double pacmanPosition = progress * (barWidth - pacmanSize - 8);

              // Fórmula matemática para fazer a boca abrir e fechar (onda senoide)
              // Multiplicamos por 40 para que ele faça várias mordidas ao longo do trajeto
              double mouthAngle =
                  (math.sin(progress * math.pi * 40).abs() * (math.pi / 3));

              return Stack(
                children: [
                  // Rastro escuro que vai cobrindo as bolinhas (fingindo que ele comeu)
                  Container(
                    width: pacmanPosition + (pacmanSize / 2) + 4,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xFF030B17), // Mesma cor do fundo
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  // O nosso Pac-Man desenhado a mão no Canvas!
                  Positioned(
                    left:
                        pacmanPosition + 4, // O +4 é um espaçamento do cantinho
                    top: 3, // Centraliza a bolinha no eixo vertical da barra
                    child: CustomPaint(
                      size: const Size(pacmanSize, pacmanSize),
                      painter: PacmanPainter(mouthAngle: mouthAngle),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// =========================================================================
// O SEGREDO ESTÁ AQUI: Nossa classe que "Pinta" o Pac-Man na tela!
// =========================================================================
class PacmanPainter extends CustomPainter {
  final double mouthAngle; // Ângulo de abertura da boca

  PacmanPainter({required this.mouthAngle});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.fill;

    // Criamos um quadrado do tamanho exato da nossa bolinha (24x24)
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Calcula onde a boca começa e quanto ela recorta do círculo
    final startAngle = mouthAngle / 2;
    final sweepAngle = (2 * math.pi) - mouthAngle;

    // A mágica acontece aqui: desenhamos um arco amarelo com o espaço da boca cortado!
    canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
  }

  @override
  bool shouldRepaint(covariant PacmanPainter oldDelegate) {
    return oldDelegate.mouthAngle !=
        mouthAngle; // Atualiza a cada frame do "nhac nhac"
  }
}
