import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/models/workplace_model.dart';

class WorkplaceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<WorkplaceModel>> getWorkplaces() async {
    var querySnapshot = await _firestore.collection('workplace').get();
    print('querySnapshot.docs.length: ${querySnapshot.docs.length}');
    return querySnapshot.docs
        .map((doc) => WorkplaceModel.fromJson(doc.data()))
        .toList();
  }

  Future<List<JobModel>> getJobs() async {
    var querySnapshot = await _firestore.collection('jobs').get();
    print('Jobs length: ${querySnapshot.docs.length}');
    return querySnapshot.docs
        .map((doc) => JobModel.fromJson(doc.data()))
        .toList();
  }
}
