//Usuario: Multiplataforma
//Contraseña: 12345

import 'package:flutter/material.dart';

void main() {
  runApp(const NetgramApp());
}

class NetgramApp extends StatelessWidget {
  const NetgramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netgram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfff4f6fb),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

// =======================
// PANTALLA DE LOGIN
// =======================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void iniciarSesion() {
    String usuario = usuarioController.text.trim();
    String password = passwordController.text.trim();

    if (usuario == 'Multiplataforma' && password == '12345') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NetgramHome()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario o contraseña incorrectos'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    usuarioController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const NetgramBigLogo(),

                const SizedBox(height: 18),

                const Text(
                  'Bienvenido a Netgram',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff20283f),
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Inicia sesión para continuar',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),

                const SizedBox(height: 28),

                TextField(
                  controller: usuarioController,
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: iniciarSesion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4767d8),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =======================
// PANTALLA PRINCIPAL
// =======================

class NetgramHome extends StatelessWidget {
  const NetgramHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),
      appBar: AppBar(
        backgroundColor: const Color(0xff20283f),
        elevation: 0,
        title: const Row(
          children: [
            NetgramMiniLogo(),
            SizedBox(width: 10),
            Text(
              'Netgram',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.favorite_border, color: Colors.white),
          SizedBox(width: 18),
          Icon(Icons.chat_bubble_outline, color: Colors.white),
          SizedBox(width: 14),
        ],
      ),
      body: ListView(
        children: const [
          NetgramHeader(),
          SizedBox(height: 12),
          StoriesSection(),
          SizedBox(height: 12),

          PostCard(
            user: 'daniela.cruz',
            location: 'Montañas del norte',
            description:
                'Un paisaje para compartir momentos visuales dentro de Netgram.',
            avatarImage: 'assets/daniela.jpg',
            landscapeUrl:
                'https://picsum.photos/seed/netgram-montanas/1200/800',
            likes: '1,248',
          ),

          PostCard(
            user: 'josue.dev',
            location: 'Lago al atardecer',
            description:
                'Explorando nuevos lugares y compartiendo contenido con la comunidad.',
            avatarImage: 'assets/josue.jpg',
            landscapeUrl: 'https://picsum.photos/seed/netgram-lago/1200/800',
            likes: '986',
          ),

          PostCard(
            user: 'jehovanny.art',
            location: 'Bosque natural',
            description:
                'La naturaleza también forma parte de la identidad visual de Netgram.',
            avatarImage: 'assets/jehovanny.jpg',
            landscapeUrl: 'https://picsum.photos/seed/netgram-bosque/1200/800',
            likes: '2,031',
          ),

          SizedBox(height: 90),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xff4767d8),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Crear',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class NetgramHeader extends StatelessWidget {
  const NetgramHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        children: [
          NetgramBigLogo(),
          SizedBox(height: 14),
          Text(
            'NETGRAM',
            style: TextStyle(
              color: Color(0xff20283f),
              fontSize: 36,
              fontWeight: FontWeight.w600,
              letterSpacing: 6,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'RED SOCIAL',
            style: TextStyle(
              color: Color(0xff20283f),
              fontSize: 19,
              letterSpacing: 3,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'TÚ Y TU COMUNIDAD',
            style: TextStyle(
              color: Color(0xff20283f),
              fontSize: 14,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class NetgramMiniLogo extends StatelessWidget {
  const NetgramMiniLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 42, height: 42, child: NetgramLogoShape());
  }
}

class NetgramBigLogo extends StatelessWidget {
  const NetgramBigLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 135, height: 135, child: NetgramLogoShape());
  }
}

class NetgramLogoShape extends StatelessWidget {
  const NetgramLogoShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff4767d8),
            Color(0xffb94bd6),
            Color(0xffff4f74),
            Color(0xffffa43a),
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 82,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          const Positioned(
            top: 38,
            child: Icon(
              Icons.people_alt_rounded,
              color: Color(0xffb94bd6),
              size: 44,
            ),
          ),
          const Positioned(
            right: 28,
            bottom: 24,
            child: Icon(Icons.chat_bubble, color: Colors.white, size: 34),
          ),
          const Positioned(
            top: 22,
            right: 25,
            child: Icon(Icons.wb_twilight, color: Colors.white, size: 32),
          ),
        ],
      ),
    );
  }
}

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: const [
          StoryItem(name: 'Tu historia', icon: Icons.add),
          StoryItem(name: 'Daniela', imagePath: 'assets/daniela.jpg'),
          StoryItem(name: 'Josué', imagePath: 'assets/josue.jpg'),
          StoryItem(name: 'Jehovanny', imagePath: 'assets/jehovanny.jpg'),
          StoryItem(name: 'Campus', icon: Icons.school),
          StoryItem(name: 'Viajes', icon: Icons.flight_takeoff),
        ],
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  final String name;
  final String? imagePath;
  final IconData? icon;

  const StoryItem({super.key, required this.name, this.imagePath, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xff4767d8),
                  Color(0xfff04a8a),
                  Color(0xffff8a45),
                ],
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white,
              backgroundImage: imagePath != null
                  ? AssetImage(imagePath!)
                  : null,
              child: imagePath == null
                  ? Icon(
                      icon ?? Icons.person,
                      color: const Color(0xff20283f),
                      size: 30,
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String user;
  final String location;
  final String description;
  final String avatarImage;
  final String landscapeUrl;
  final String likes;

  const PostCard({
    super.key,
    required this.user,
    required this.location,
    required this.description,
    required this.avatarImage,
    required this.landscapeUrl,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage(avatarImage)),
            title: Text(
              user,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(location),
            trailing: const Icon(Icons.more_horiz),
          ),
          Container(
            height: 360,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xffdfe3f2),
            ),
            child: Image.network(
              landscapeUrl,
              width: double.infinity,
              height: 360,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff4767d8), Color(0xfff04a8a)],
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.landscape, color: Colors.white, size: 95),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 10),
            child: Row(
              children: [
                Icon(Icons.favorite_border, size: 28),
                SizedBox(width: 16),
                Icon(Icons.mode_comment_outlined, size: 28),
                SizedBox(width: 16),
                Icon(Icons.send_outlined, size: 28),
                Spacer(),
                Icon(Icons.bookmark_border, size: 28),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 8),
            child: Text(
              '$likes me gusta',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black87, fontSize: 14),
                children: [
                  TextSpan(
                    text: '$user ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
