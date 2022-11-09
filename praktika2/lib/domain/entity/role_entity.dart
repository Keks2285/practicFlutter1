class RoleEntity{
  late int id;
  final String role;

  RoleEntity({required this.id,required this.role});
}
enum RoleEnum {
  admin(id:1, role: 'Адмиистратор'),
  user(id:2, role: 'Пользователь');

  const RoleEnum({
    required this.role,
    required this.id
  });

  final String role;
  final int id;


}