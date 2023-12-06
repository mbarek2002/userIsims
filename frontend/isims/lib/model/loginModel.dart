

class loginModel{
  String? matricule;
  String? motDePasse;

  loginModel({this.matricule,this.motDePasse});

  Map<String, dynamic> toJson() => {
    'matricule': matricule,
    "motDePasse":motDePasse,
  };

}