import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vital/constants/constans.dart';
import 'package:vital/providers/user_provider.dart';
import 'package:vital/screens/execution_screen.dart';

class BodyParts extends StatelessWidget {
  const BodyParts({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userPreference = userProvider.user?.trainingPreference;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Exercícios',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: bodyParts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                final part = bodyParts[index];
                
                // Determinar se este exercício é recomendado com base na preferência do usuário
                bool isRecommended = _isRecommended(part['name'], userPreference);
                
                return BodyPartCard(
                  name: part['name'],
                  imagePath: part['image'],
                  isRecommended: isRecommended,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomeScreen(bodyPart: part['name']),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BodyPartsNonScrollable extends StatelessWidget {
  const BodyPartsNonScrollable({super.key});

  @override
  Widget build(BuildContext context) {
    // Obter a preferência de treino do usuário
    final userProvider = Provider.of<UserProvider>(context);
    final userPreference = userProvider.user?.trainingPreference;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Exercícios',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          // Usando GridView.builder com shrinkWrap e physics para desativar o scroll
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bodyParts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (context, index) {
              final part = bodyParts[index];
              
              // Determinar se este exercício é recomendado com base na preferência do usuário
              bool isRecommended = _isRecommended(part['name'], userPreference);
              
              return BodyPartCard(
                name: part['name'],
                imagePath: part['image'],
                isRecommended: isRecommended,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomeScreen(bodyPart: part['name']),
                    ),
                  );
                },
              );
            },
          ),
          // Espaço adicional no final para melhor visualização com a barra de navegação
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

// Função auxiliar para verificar se um exercício é recomendado
bool _isRecommended(String partName, String? userPreference) {
  if (userPreference == null) return false;
  
  final name = partName.toLowerCase();
  
  if (userPreference == 'A' && 
     (name.contains('peito') || 
      name.contains('costa') || 
      name.contains('braço') ||
      name.contains('ombro') ||
      name.contains('tríceps') ||
      name.contains('bíceps'))) {
    return true;
  } 
  else if (userPreference == 'B' && 
     (name.contains('perna') || 
      name.contains('glúteo') || 
      name.contains('coxa') ||
      name.contains('panturrilha') ||
      name.contains('abdômen') ||
      name.contains('abdomen'))) {
    return true;
  }
  else if (userPreference == 'C') {
    return true;
  }
  
  return false;
}

// Classe BodyPartCard mantida igual
class BodyPartCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final bool isRecommended;
  final VoidCallback onTap;

  const BodyPartCard({
    super.key,
    required this.name,
    required this.imagePath,
    this.isRecommended = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Card principal
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: isRecommended 
                  ? Border.all(color: Colors.orange, width: 3)
                  : null,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Gradiente e nome
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(35),
              ),
            ),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // Badge "Recomendado"
          if (isRecommended)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: const Text(
                  'Recomendado',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}