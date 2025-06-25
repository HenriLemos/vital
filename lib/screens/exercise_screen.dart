import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vital/components/body_parts.dart';
import 'package:vital/components/image_slider.dart';
import 'package:vital/main.dart';
import 'package:vital/providers/exercises_provider.dart';
import 'package:vital/providers/user_provider.dart';

class ExerciseScreen extends StatefulWidget {
  final String bodyPart;

  const ExerciseScreen({super.key, required this.bodyPart});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ExerciseProvider>(context, listen: false)
            .loadExercises(widget.bodyPart));
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // Usando CustomScrollView para unificar o comportamento de scroll
        child: CustomScrollView(
          slivers: [
            // Header Section como SliverToBoxAdapter
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Welcome Text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'COMECE SEU',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Treino',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    // Avatar & Notification Icons
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/perfil');
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 3,
                              ),
                              // Adiciona a imagem se estiver disponível
                              image: user?.profileImagePath != null
                                  ? DecorationImage(
                                      image: FileImage(File(user!.profileImagePath!)),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            // Mostra o ícone de pessoa apenas se não houver imagem
                            child: user?.profileImagePath == null
                                ? const Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                    size: 28,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 15), // Espaçamento entre os ícones
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 3,
                            ),
                          ),
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.grey,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            // Image Slider como SliverToBoxAdapter
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ImageSliderNonScrollable(), // Seu componente de slider
              ),
            ),
            
            // Body Parts
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: BodyPartsNonScrollable(), // Componente sem scroll próprio
              ),
            ),
          ],
        ),
      ),
      // Adicionando o BottomNavigationBar
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}