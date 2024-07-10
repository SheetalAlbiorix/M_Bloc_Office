import 'package:m_bloc_office/data/model/new_office_modle.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class OfficeDatabase {
  static final OfficeDatabase instance = OfficeDatabase._init();

  static Database? _database;

  OfficeDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB('offices.db');
    return _database!;
  }

  Future<Database> initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: createDB,
    );
  }

  Future createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER NOT NULL';

    await db.execute('''
    CREATE TABLE offices ( 
      id $idType, 
      name $textType,
      address $textType,
      email $textType,
      phoneNumber $textType,
      capacity $intType,
      color $textType
    )
    ''');
  }

  Future<OfficeModel> create(OfficeModel office) async {
    final db = await instance.database;

    final id = await db.insert('offices', office.toMap());
    return office.copyWith(id: id);
  }

  Future<List<OfficeModel>> readAllOffices() async {
    final db = await instance.database;

    const orderBy = 'name ASC';
    final result = await db.query('offices', orderBy: orderBy);

    return result.map((json) => OfficeModel.fromMap(json)).toList();
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
