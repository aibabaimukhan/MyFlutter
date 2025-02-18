import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late ApiService apiService;
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    fetchUsers();
  }

  void fetchUsers() async {
    try {
      final userData = await apiService.fetchData();
      setState(() {
        users = userData;
      });
    } catch (e) {
      print("Error while fetching users: $e");
    }
  }


var count = 0;
void addUser() async {
  count++;  // Увеличиваем счётчик
  print("Current count: $count");
  // Добавляем нового пользователя
  await apiService.addData('New User $count', 'newuser$count@example.com');
  fetchUsers();  // Обновить список пользователей
}


void deleteUser(int id) async {
  try {
    await apiService.deleteData(id);
    fetchUsers();  // Обновить список после удаления
  } catch (e) {
    print("Error while deleting user: $e");
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: users.isEmpty
          ? Center(child: Text('No users found'))
          : ListView.builder(
              itemCount: users.length,
               itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index]['name']),
                  subtitle: Text(users[index]['email']),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteUser(int.parse(users[index]['id'])),  // Преобразуем ID в целое число
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addUser,
        child: Icon(Icons.add),
      ),
    );
  }
}
