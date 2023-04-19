import 'package:atv_01_sqflite/models/contatos_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnect {
  Database? _database;

//função get
  Future<Database> get database async {
    //localiza o banco no dispositivo
    final dbpath = await getDatabasesPath();

    const dbname = 'contatos';
//cria o caminho completo do banco de dados
    final path = join(dbpath, dbname);
    //abrir a coneção com o banco

    _database = await openDatabase(path, version: 1, onCreate: _onCreate);

    return _database!;
  }

  //criar o banco de dados
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contatos (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT, 
        email TEXT
        )
    ''');
  }

  //inserir dados no banco
  Future<void> insertContatos(Contatos contatos) async {
    //chama a função get
    final db = await database;

    await db.insert(
      'contatos',
      contatos.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, //substitui itens duplicados
    );
  }

  //deletar dados no banco
  Future<void> deleteContatos(Contatos contatos) async {
    final db = await database;

    await db.delete(
      'contatos',
      where: 'id == ?', //query q busca e checa a condição para deletar o item
      whereArgs: [contatos.id],
    );
  }

  //litar todos os contatos
  Future<List<Contatos>> getContatos() async {
    final db = await database;
    //query para buscar os dados
    List<Map<String, dynamic>> dados = await db.query(
      'contatos',
      orderBy: 'id DESC',
    );
    //converter os dados dessa maplist para uma lista de Contatos
    return List.generate(
      dados.length,
      (d) => Contatos(
        id: dados[d]['id'],
        name: dados[d]['name'],
        email: dados[d]['email'],
      ),
    );
  }
}
