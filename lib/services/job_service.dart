import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class JobService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<DocumentReference<Map<String, dynamic>>> _getUserDoc() async {
    final user = currentUser;
    if (user == null) throw Exception('User not authenticated');
    return _firestore.collection('users').doc(user.uid);
  }

  List<dynamic> _getJobList(DocumentSnapshot userDoc) {
    final data = userDoc.data() as Map<String, dynamic>? ?? {};
    return List<dynamic>.from(data['jobExperience'] ?? []);
  }

  Map<String, dynamic> _jobToMap(JobExperienceModel job) => {
    'id': job.id,
    'jobTitle': job.jobTitle,
    'companyName': job.companyName,
    'startDate': Timestamp.fromDate(job.startDate),
    'endDate': Timestamp.fromDate(job.endDate),
  };

  Future<void> addJobExperience(JobExperienceModel job) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final jobList = _getJobList(userDoc);
      jobList.add(_jobToMap(job));

      await userDocRef.update({
        'jobExperience': jobList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to add job experience: $e');
    }
  }

  Future<List<JobExperienceModel>> getUserJobExperience() async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) return [];

      final jobList = _getJobList(userDoc);

      return jobList.map((job) {
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
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final jobList = _getJobList(userDoc);
      final index = jobList.indexWhere((job) => job['id'] == jobId);

      if (index == -1) throw Exception('Job experience not found');

      jobList[index] = _jobToMap(updatedJob);

      await userDocRef.update({
        'jobExperience': jobList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update job experience: $e');
    }
  }

  Future<void> deleteJobExperience(String jobId) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final jobList = _getJobList(userDoc);
      jobList.removeWhere((job) => job['id'] == jobId);

      await userDocRef.update({
        'jobExperience': jobList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to delete job experience: $e');
    }
  }
}
