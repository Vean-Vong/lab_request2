class Request {
  final int requestId;
  final LabInfo labInfo;
  final List<SessionInfo> sessionInfo;
  final UserInfo userInfo;
  final RequestDetails requestDetails;

  Request({
    required this.requestId,
    required this.labInfo,
    required this.sessionInfo,
    required this.userInfo,
    required this.requestDetails,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      requestId: json['request_id'],
      labInfo: LabInfo.fromJson(json['lab_info']),
      sessionInfo: (json['session_info'] as List)
          .map((session) => SessionInfo.fromJson(session))
          .toList(),
      userInfo: UserInfo.fromJson(json['user_info']),
      requestDetails: RequestDetails.fromJson(json['request_details']),
    );
  }
}

class LabInfo {
  final int labId;
  final String labName;
  final String building;
  final String availability;

  LabInfo({
    required this.labId,
    required this.labName,
    required this.building,
    required this.availability,
  });

  factory LabInfo.fromJson(Map<String, dynamic> json) {
    return LabInfo(
      labId: json['lab_id'],
      labName: json['lab_name'],
      building: json['building'],
      availability: json['availability'],
    );
  }
}

class SessionInfo {
  final int sessionId;
  final String timeSlot;
  final int sessionNumber;
  final String sessionStatus;

  SessionInfo({
    required this.sessionId,
    required this.timeSlot,
    required this.sessionNumber,
    required this.sessionStatus,
  });

  factory SessionInfo.fromJson(Map<String, dynamic> json) {
    return SessionInfo(
      sessionId: json['session_id'],
      timeSlot: json['time_slot'],
      sessionNumber: json['session_number'],
      sessionStatus: json['session_status'],
    );
  }
}

class UserInfo {
  final int userId;
  final String fullName;
  final ContactDetails contactDetails;
  final AcademicDetails academicDetails;
  final String userStatus;

  UserInfo({
    required this.userId,
    required this.fullName,
    required this.contactDetails,
    required this.academicDetails,
    required this.userStatus,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      userId: json['user_id'],
      fullName: json['full_name'],
      contactDetails: ContactDetails.fromJson(json['contact_details']),
      academicDetails: AcademicDetails.fromJson(json['academic_details']),
      userStatus: json['user_status'],
    );
  }
}

class ContactDetails {
  final String phoneNumber;

  ContactDetails({required this.phoneNumber});

  factory ContactDetails.fromJson(Map<String, dynamic> json) {
    return ContactDetails(
      phoneNumber: json['phone_number'],
    );
  }
}

class AcademicDetails {
  final String facultyName;
  final String departmentName;
  final String role;

  AcademicDetails({
    required this.facultyName,
    required this.departmentName,
    required this.role,
  });

  factory AcademicDetails.fromJson(Map<String, dynamic> json) {
    return AcademicDetails(
      facultyName: json['faculty_name'],
      departmentName: json['department_name'],
      role: json['role'],
    );
  }
}

class RequestDetails {
  final String requestTimestamp;
  final CourseInfo courseInfo;
  final AdditionalRequirements additionalRequirements;
  final ApprovalInfo approvalInfo;

  RequestDetails({
    required this.requestTimestamp,
    required this.courseInfo,
    required this.additionalRequirements,
    required this.approvalInfo,
  });

  factory RequestDetails.fromJson(Map<String, dynamic> json) {
    return RequestDetails(
      requestTimestamp: json['request_timestamp'],
      courseInfo: CourseInfo.fromJson(json['course_info']),
      additionalRequirements:
          AdditionalRequirements.fromJson(json['additional_requirements']),
      approvalInfo: ApprovalInfo.fromJson(json['approval_info']),
    );
  }
}

class CourseInfo {
  final String major;
  final String subject;
  final String studentBatch;

  CourseInfo({
    required this.major,
    required this.subject,
    required this.studentBatch,
  });

  factory CourseInfo.fromJson(Map<String, dynamic> json) {
    return CourseInfo(
      major: json['major'],
      subject: json['subject'],
      studentBatch: json['student_batch'],
    );
  }
}

class AdditionalRequirements {
  final List<String> softwareNeeded;
  final int numberOfStudents;
  final String additionalNotes;

  AdditionalRequirements({
    required this.softwareNeeded,
    required this.numberOfStudents,
    required this.additionalNotes,
  });

  factory AdditionalRequirements.fromJson(Map<String, dynamic> json) {
    return AdditionalRequirements(
      softwareNeeded: List<String>.from(json['software_needed']),
      numberOfStudents: json['number_of_students'],
      additionalNotes: json['additional_notes'],
    );
  }
}

class ApprovalInfo {
  final String approvalStatus;
  final String? approvedBy;
  final String? approvalNotes;

  ApprovalInfo({
    required this.approvalStatus,
    this.approvedBy,
    this.approvalNotes,
  });

  factory ApprovalInfo.fromJson(Map<String, dynamic> json) {
    return ApprovalInfo(
      approvalStatus: json['approval_status'],
      approvedBy: json['approved_by'],
      approvalNotes: json['approval_notes'],
    );
  }
}
