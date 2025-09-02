class SignupReqParams {
  String usersName;
  String usersEmail;
  String usersPassword;

  SignupReqParams({
    required this.usersName,
    required this.usersEmail,
    required this.usersPassword,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['users_name'] = usersName;
    data['users_email'] = usersEmail;
    data['users_password'] = usersPassword;
    return data;
  }
}
