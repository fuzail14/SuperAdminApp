class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? cnic;
  final int? roleId;
  final String? roleName;
  final String? bearerToken;

  User(
      {this.id,
        this.firstName,
 this.lastName,
       this.cnic,
        this.roleId,
       this.roleName,
     this.bearerToken});
}
