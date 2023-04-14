class Validators {
  static String? email(String? email) {
    final bool emailRegex =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email ?? '');

    if (email == null || email.isEmpty) {
      return 'Não pode ser vazio';
    } else if (!emailRegex) {
      return "Email inválido";
    }
    return null;
  }

  static String? password(String? password) {
    //expressão regular para verificar se a senha possui pelo menos 8 caracteres,
    //uma letra maiúscula, uma letra minúscula, um número e um caractere especial
    //RegExp passwordRegex =
    //RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    bool passwordRegex =
        RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{6,}$').hasMatch(password ?? '');

    if (password == null || password.isEmpty) {
      return 'A senha é obrigatória';
    } else if (!passwordRegex) {
      return 'A senha deve ter pelo menos 6 caracteres \ncom letras e números';
    }
    return null;
  }
}
