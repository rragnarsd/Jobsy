import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ApplicationException implements Exception {
  final String message;
  ApplicationException(this.message);

  @override
  String toString() => message;
}

/// Service class for managing user job application data in Firestore.
/// This service provides CRUD operations for application records associated
/// with the current authenticated user. It stores application data as an array
/// within the user's profile document in Firestore.
class ApplicationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  /// Gets a reference to the current user's document in Firestore.
  /// Throws an [ApplicationException] if the user is not authenticated.
  Future<DocumentReference<Map<String, dynamic>>> _getUserDoc() async {
    final user = currentUser;
    if (user == null) throw ApplicationException('User not authenticated');
    return _firestore.collection('users').doc(user.uid);
  }

  List<dynamic> _getApplicationList(DocumentSnapshot userDoc) {
    final data = userDoc.data() as Map<String, dynamic>? ?? {};
    debugPrint('data: ${data['applications']}');
    return List<dynamic>.from(data['applications'] ?? []);
  }

  Map<String, dynamic> _applicationToMap(ApplicationModel application) => {
    'id': application.id,
    'jobId': application.jobId,
    'workplaceId': application.workplaceId,
    'jobTitle': application.jobTitle,
    'companyName': application.companyName,
    'status': application.status,
    'appliedDate': Timestamp.fromDate(application.appliedDate),
  };

  /// Adds a new application record to the user's profile.
  /// Throws an [ApplicationException] if validation fails or the operation fails.
  Future<void> addApplication(ApplicationModel application) async {
    final userDoc = await _getUserDoc();

    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDoc);

      if (!snapshot.exists) {
        throw ApplicationException('User profile not found');
      }

      final applications = _getApplicationList(snapshot);
      if (applications.any((app) => app['jobId'] == application.jobId)) {
        throw ApplicationException('Application already exists for this job');
      }

      applications.add(_applicationToMap(application));
      transaction.update(userDoc, {'applications': applications});
    });
  }

  /// Gets all application records for the current user.
  /// Returns an empty list if no applications are found.
  /// Throws an [ApplicationException] if the operation fails.
  Future<List<ApplicationModel>> getUserApplications() async {
    try {
      final userDoc = await _getUserDoc();
      final userSnapshot = await userDoc.get();

      if (!userSnapshot.exists) return [];
      final applications = _getApplicationList(userSnapshot);

      return applications.map((app) => ApplicationModel.fromJson(app)).toList();
    } catch (e) {
      if (e is ApplicationException) rethrow;
      throw ApplicationException('Failed to get applications: $e');
    }
  }

  /// Checks if a user has already applied to a specific job.
  /// Returns true if the user has applied, false otherwise.
  Future<bool> hasAppliedToJob(String jobId) async {
    try {
      final applications = await getUserApplications();
      return applications.any((app) => app.jobId == jobId);
    } catch (e) {
      return false;
    }
  }
}
