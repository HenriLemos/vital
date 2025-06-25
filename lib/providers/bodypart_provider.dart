import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyPartProvider extends ChangeNotifier {
  List<String> _bodyParts = [];

  List<String> get bodyParts => _bodyParts;

  void setBodyParts(List<String> parts) {
    _bodyParts = parts;
    notifyListeners();
  }
}

class BodyPartProviderWrapper extends StatelessWidget {
  final Widget child;
  const BodyPartProviderWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BodyPartProvider(),
      child: child,
    );
  }
}