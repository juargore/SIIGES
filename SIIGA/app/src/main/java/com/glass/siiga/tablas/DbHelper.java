package com.glass.siiga.tablas;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;


/*Esta clase nos ayuda a Abrir la BD si existe, sino existe nos ayuda a crearla
y permite actualizar el esquema de la BD*/

public class DbHelper extends SQLiteOpenHelper {

    private static final String DB_NAME = "siiga.sqlite"; //puede o no llevar el .sqlite
    private static final int DB_SCHEME_VERSION = 1;

    public DbHelper(Context context) {
        super(context, DB_NAME, null, DB_SCHEME_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        //Despues de crear la sentencia SQL en Tabla_Preguntas, la llamamos aqui
        sqLiteDatabase.execSQL(Tabla_Preguntas.CREATE_TABLE_PREGUNTAS);
        sqLiteDatabase.execSQL(Tabla_Respuestas.CREATE_TABLE_RESPUESTAS);
        sqLiteDatabase.execSQL(Tabla_Comentarios.CREATE_TABLE_COMENTARIOS);
        sqLiteDatabase.execSQL(Tabla_Respuestas_Acta.CREATE_TABLE_RESPUESTAS_ACTA);
    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {

    }
}
