import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class JobService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<void> addJobExperience(JobExperienceModel jobExperience) async {
    try {
      final user = currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final jobData = {
        'id': jobExperience.id,
        'jobTitle': jobExperience.jobTitle,
        'companyName': jobExperience.companyName,
        'startDate': Timestamp.fromDate(jobExperience.startDate),
        'endDate': Timestamp.fromDate(jobExperience.endDate),
      };

      final userDoc = await _firestore.collection('users').doc(user.uid).get();

      if (!userDoc.exists) {
        throw Exception('User profile not found');
      }

      final currentData = userDoc.data()!;
      List<dynamic> jobExperienceList = List<dynamic>.from(
        currentData['jobExperience'] ?? [],
      );

      jobExperienceList.add(jobData);

      await _firestore.collection('users').doc(user.uid).update({
        'jobExperience': jobExperienceList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to add job experience: $e');
    }
  }

  Future<List<JobExperienceModel>> getUserJobExperience() async {
    try {
      final user = currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final doc = await _firestore.collection('users').doc(user.uid).get();

      if (!doc.exists) {
        return [];
      }

      final data = doc.data()!;
      final jobExperienceList = List<dynamic>.from(data['jobExperience'] ?? []);

      return jobExperienceList.map((job) {
        return JobExperienceModel(
          id: job['id'],
          jobTitle: job['jobTitle'],
          companyName: job['companyName'],
          startDate: (job['startDate'] as Timestamp).toDate(),
          endDate: (job['endDate'] as Timestamp).toDate(),
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to get job experience: $e');
    }
  }

  Future<void> updateJobExperience(
    String jobId,
    JobExperienceModel updatedJob,
  ) async {
    try {
      final user = currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final userDoc = await _firestore.collection('users').doc(user.uid).get();

      if (!userDoc.exists) {
        throw Exception('User profile not found');
      }

      final currentData = userDoc.data()!;
      List<dynamic> jobExperienceList = List<dynamic>.from(
        currentData['jobExperience'] ?? [],
      );

      final jobIndex = jobExperienceList.indexWhere(
        (job) => job['id'] == jobId,
      );

      if (jobIndex == -1) {
        throw Exception('Job experience not found');
      }

      jobExperienceList[jobIndex] = {
        'id': updatedJob.id,
        'jobTitle': updatedJob.jobTitle,
        'companyName': updatedJob.companyName,
        'startDate': Timestamp.fromDate(updatedJob.startDate),
        'endDate': Timestamp.fromDate(updatedJob.endDate),
      };

      await _firestore.collection('users').doc(user.uid).update({
        'jobExperience': jobExperienceList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update job experience: $e');
    }
  }

  Future<void> deleteJobExperience(String jobId) async {
    try {
      final user = currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final userDoc = await _firestore.collection('users').doc(user.uid).get();

      if (!userDoc.exists) {
        throw Exception('User profile not found');
      }

      final currentData = userDoc.data()!;
      List<dynamic> jobExperienceList = List<dynamic>.from(
        currentData['jobExperience'] ?? [],
      );

      jobExperienceList.removeWhere((job) => job['id'] == jobId);

      await _firestore.collection('users').doc(user.uid).update({
        'jobExperience': jobExperienceList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to delete job experience: $e');
    }
  }
}
