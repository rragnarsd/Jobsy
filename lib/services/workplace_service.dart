import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:flutter/foundation.dart';

class WorkplaceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<WorkplaceModel>> getWorkplaces() async {
    try {
      final querySnapshot = await _firestore.collection('workplaces').get();

      return querySnapshot.docs
          .map((doc) {
            try {
              return WorkplaceModel.fromJson(doc.data());
            } catch (e) {
              debugPrint(
                'Failed to parse workplace document: ${doc.id}, error: $e',
              );
              return null;
            }
          })
          .whereType<WorkplaceModel>()
          .toList();
    } catch (e, stackTrace) {
      debugPrint('Error fetching workplaces: $e\n$stackTrace');
      return [];
    }
  }

  Future<List<JobModel>> getJobs() async {
    try {
      final querySnapshot = await _firestore.collection('jobs').get();

      return querySnapshot.docs
          .map((doc) {
            try {
              return JobModel.fromJson(doc.data());
            } catch (e) {
              debugPrint('Failed to parse job document: ${doc.id}, error: $e');
              return null;
            }
          })
          .whereType<JobModel>()
          .toList();
    } catch (e, stackTrace) {
      debugPrint('Error fetching jobs: $e\n$stackTrace');
      return [];
    }
  }
}
