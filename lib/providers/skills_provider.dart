import 'dart:async';

import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/services/skills_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SkillsProvider extends ChangeNotifier {
  final List<SkillsModel> _skills = [];
  final List<Map<String, dynamic>> _skillsDocuments = [];

  final SkillsService _skillsService = SkillsService();
  StreamSubscription<List<SkillsModel>>? _userSkillsSubscription;
  StreamSubscription<List<Map<String, dynamic>>>? _skillsDocumentsSubscription;
  StreamSubscription<User?>? _authSubscription;

  SkillsProvider() {
    _authSubscription = FirebaseAuth.instance.authStateChanges().listen((user) {
      _listenToUserSkills();
    });

    _skillsDocumentsSubscription = _skillsService
        .getSkillsDocumentsStream()
        .listen((docs) {
          _skillsDocuments
            ..clear()
            ..addAll(docs);
          notifyListeners();
        });

    _listenToUserSkills();
  }

  void _listenToUserSkills() {
    _userSkillsSubscription?.cancel();
    _userSkillsSubscription = _skillsService.getUserSkillsStream().listen((
      skills,
    ) {
      _skills
        ..clear()
        ..addAll(skills);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _userSkillsSubscription?.cancel();
    _skillsDocumentsSubscription?.cancel();
    _authSubscription?.cancel();
    super.dispose();
  }

  List<SkillsModel> get skills => List.unmodifiable(_skills);

  List<Map<String, dynamic>> get skillsDocuments =>
      List.unmodifiable(_skillsDocuments);

  Future<void> addUserSkill(SkillsModel skill) async {
    await _skillsService.addUserSkill(skill);
  }

  Future<void> removeUserSkill(SkillsModel skill) async {
    await _skillsService.deleteUserSkill(skill);
  }
}
