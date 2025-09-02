class SigninReqParams {
  String usersEmail;
  String usersPassword;

  SigninReqParams({required this.usersEmail, required this.usersPassword});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['users_email'] = usersEmail;
    data['users_password'] = usersPassword;
    return data;
  }
}
