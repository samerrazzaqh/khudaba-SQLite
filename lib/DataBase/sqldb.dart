import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static final _databaseName = 'khutaba.db';
  static final _databaseVersion = 1;
  // static final table = 'notes';

  static Database? _db ;

  Future<Database?> get db async {
    if (_db == null){
      _db  = await intialDb() ;
      return _db ;
    }else {
      return _db ;
    }
  }


  intialDb() async {
    // String databasepath = await getDatabasesPath() ;
    // String path = join(databasepath , 'wael.db') ;
    // Database mydb = await openDatabase(path , onCreate: _onCreate , version: 3  , onUpgrade:_onUpgrade ) ;
    // return mydb ;


    var databasePath = await getDatabasesPath();
    String path = join(databasePath,_databaseName);
    //cheching existing------
    var exists = await databaseExists(path);
    if(!exists){
      // if not----
      print("copy database-----");
      try{
        await Directory(dirname(path)).create(recursive: true);
      }catch(_){}
      //copy---------
      ByteData data = await rootBundle.load(join("assets/filedata",_databaseName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      //write
      await File(path).writeAsBytes(bytes,flush:true);
    }else{
      print("open exsits database  -----");
    }
    return await openDatabase(path,version: _databaseVersion);

  }

  readData(String sql) async {
    Database? mydb = await db ;
    List<Map> response = await  mydb!.rawQuery(sql);
    return response ;
  }
  readDataOne(String sql) async {
    Database? mydb = await db ;
    var dbQuery = await mydb!.rawQuery(sql);
    if (dbQuery.length > 0) {
      String defn = dbQuery.first.values.toString();
      return defn;
    } else {
    return null;
    }
  }
  insertData(String sql) async {
    Database? mydb = await db ;
    int  response = await  mydb!.rawInsert(sql);
    return response ;
  }
  updateData(String sql) async {
    Database? mydb = await db ;
    int  response = await  mydb!.rawUpdate(sql);
    return response ;
  }
  deleteData(String sql) async {
    Database? mydb = await db ;
    int  response = await  mydb!.rawDelete(sql);
    return response ;
  }


// SELECT
// DELETE
// UPDATE
// INSERT


}