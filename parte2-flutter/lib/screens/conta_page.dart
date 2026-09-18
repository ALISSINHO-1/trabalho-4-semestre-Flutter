import 'package:flutter/material.dart';

class ContaPage extends StatefulWidget {
  const ContaPage({super.key});

  @override
  State<ContaPage> createState() => _ContaPageState();
}

class _ContaPageState extends State<ContaPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01040A),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // --- EFEITOS NEON DE FUNDO ---
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent.withValues(alpha: 0.15),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -50,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purpleAccent.withValues(alpha: 0.1),
              ),
            ),
          ),

          // --- CONTEÚDO PRINCIPAL ---
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 450),
                // --- CARTÃO ESTILO "VIDRO" ---
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: const Color(0xFF080D1A).withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                        color: Colors.blueAccent.withValues(alpha: 0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // --- ÍCONE E TÍTULO ---
                      Icon(Icons.sports_esports,
                          size: 60, color: Colors.blueAccent.shade400),
                      const SizedBox(height: 16),
                      const Text(
                        'Play Retrô',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        isLogin
                            ? 'Bem-vindo de volta, jogador!'
                            : 'Crie sua conta e dê um Start!',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 14),
                      ),
                      const SizedBox(height: 32),

                      // --- ALTERNADOR ANIMADO TIPO "PÍLULA" ---
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF030B17),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.05)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => isLogin = true),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                    color: isLogin
                                        ? Colors.blueAccent.shade400
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'ENTRAR',
                                    style: TextStyle(
                                      color: isLogin
                                          ? Colors.white
                                          : Colors.white54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => isLogin = false),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                    color: !isLogin
                                        ? Colors.blueAccent.shade400
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'CADASTRAR',
                                    style: TextStyle(
                                      color: !isLogin
                                          ? Colors.white
                                          : Colors.white54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // --- CAMPOS DO FORMULÁRIO ---
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: Column(
                          children: [
                            if (!isLogin) ...[
                              _buildTextField(
                                  label: 'Nome de Usuário',
                                  icone: Icons.person_outline),
                              const SizedBox(height: 16),
                            ],
                          ],
                        ),
                      ),

                      _buildTextField(
                          label: 'E-mail',
                          icone: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress),
                      const SizedBox(height: 16),
                      _buildTextField(
                          label: 'Senha',
                          icone: Icons.lock_outline,
                          isPassword: true),

                      // Link "Esqueceu a senha?" (Apenas no login)
                      if (isLogin) ...[
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Esqueceu a senha?',
                                style: TextStyle(color: Colors.white54)),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ] else ...[
                        const SizedBox(height: 32),
                      ],

                      // --- BOTÃO DE AÇÃO COM GRADIENTE E SOMBRA ---
                      Container(
                        height: 52,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueAccent.shade400,
                              Colors.blueAccent.shade700
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueAccent.withValues(alpha: 0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(isLogin
                                    ? 'Login realizado com sucesso!'
                                    : 'Conta criada com sucesso!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            isLogin ? 'ACESSAR CONTA' : 'CRIAR CONTA',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1),
                          ),
                        ),
                      ),

                      // --- LOGIN SOCIAL (Divisória e Botões falsos) ---
                      const SizedBox(height: 32),
                      const Row(
                        children: [
                          Expanded(
                              child:
                                  Divider(color: Colors.white10, thickness: 1)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text('OU CONTINUAR COM',
                                style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                              child:
                                  Divider(color: Colors.white10, thickness: 1)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialButton('Google', Icons.g_mobiledata),
                          const SizedBox(width: 16),
                          _buildSocialButton('Apple', Icons.apple),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required String label,
      required IconData icone,
      bool isPassword = false,
      TextInputType? keyboardType}) {
    return TextField(
      obscureText: isPassword,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        prefixIcon: Icon(icone, color: Colors.blueAccent.shade200),
        filled: true,
        fillColor: const Color(0xFF030B17),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blueAccent.shade400)),
      ),
    );
  }

  // Widgezinho pra desenhar os botões sociais
  Widget _buildSocialButton(String texto, IconData icone) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF030B17),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icone, color: Colors.white, size: 24),
            const SizedBox(width: 8),
            Text(texto,
                style: const TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
