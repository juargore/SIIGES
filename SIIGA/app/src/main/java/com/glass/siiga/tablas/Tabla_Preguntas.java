package com.glass.siiga.tablas;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

public class Tabla_Preguntas {

    private static final String TABLE_PREGUNTAS = "preguntas";

    public static final String PR_ID = "id";
    public static final String PR_SECCION = "seccion";
    public static final String PR_ID_PREGUNTA = "id_pregunta";
    public static final String PR_PREGUNTA = "pregunta";
    public static final String PR_ID_TIPO_PREGUNTA = "id_tipo_pregunta";
    public static final String PR_DESCRIPCION_TIPO_PREGUNTA = "descripcion_tipo_pregunta";
    public static final String PR_ID_APARTADO = "id_apartado";
    public static final String PR_NOMBRE_APARTADO = "nombre_apartado";
    public static final String PR_DESCRIPCION_APARTADO = "descripcion_apartado";
    public static final String PR_ID_CATEGORIA = "id_categoria";
    public static final String PR_NOMBRE_CATEGORIA = "nombre_categoria";
    public static final String PR_DESCRIPCION_CATEGORIA = "descripcion_categoria";
    public static final String PR_INSTRUCCION_CATEGORIA = "instruccion_categoria";

    /*create table preguntas(
                             id integer primary key autoincrement,
                             pregunta text not null,
                             id_tipo_pregunta integer not null,
                             descripcion_tipo_pregunta text not null,
                             id_apartado integer not null,
                             nombre_apartado text,
                             descripcion_apartado text,
                             id_categoria int not null,
                             nombre_categoria text,
                             descripcion_categoria text,
                             instruccion_categoria text); */

    public static final String CREATE_TABLE_PREGUNTAS = "create table " + TABLE_PREGUNTAS + " ( "
            + PR_ID + " INTEGER primary key autoincrement,"
            + PR_SECCION + " INTEGER not null,"
            + PR_ID_PREGUNTA + " INTEGER not null,"
            + PR_PREGUNTA + " TEXT not null,"
            + PR_ID_TIPO_PREGUNTA + " INTEGER not null,"
            + PR_DESCRIPCION_TIPO_PREGUNTA + " TEXT,"
            + PR_ID_APARTADO + " INTEGER not null,"
            + PR_NOMBRE_APARTADO + " TEXT,"
            + PR_DESCRIPCION_APARTADO + " TEXT,"
            + PR_ID_CATEGORIA + " INTEGER not null,"
            + PR_NOMBRE_CATEGORIA + " TEXT,"
            + PR_DESCRIPCION_CATEGORIA + " TEXT,"
            + PR_INSTRUCCION_CATEGORIA + " TEXT);";

    private String[] columnas = new String[]{PR_ID, PR_ID_PREGUNTA, PR_SECCION, PR_PREGUNTA, PR_ID_TIPO_PREGUNTA, PR_DESCRIPCION_TIPO_PREGUNTA,
            PR_ID_APARTADO, PR_NOMBRE_APARTADO, PR_DESCRIPCION_APARTADO, PR_ID_CATEGORIA, PR_NOMBRE_CATEGORIA, PR_DESCRIPCION_CATEGORIA,
            PR_INSTRUCCION_CATEGORIA};

    private DbHelper helper;
    private SQLiteDatabase db;

    public Tabla_Preguntas(Context context) {
        helper = new DbHelper(context);
        db = helper.getWritableDatabase();
    }

    //Se saca este metodo, porque es un codigo que se usara en muchas ocasiones y no es bueno estar repitiendo
    public ContentValues generarContentValues(int id_pregunta, int seccion, String pregunta, int id_tipo_pregunta, String descripcion_tipo_pregunta, int id_apartado,
                                              String nombre_apartado, String descripcion_apartado, int id_categoria, String nombre_categoria,
                                              String descripcion_categoria, String instruccion_categoria){

        ContentValues valores = new ContentValues();
        valores.put(PR_ID_PREGUNTA, id_pregunta);
        valores.put(PR_SECCION, seccion);
        valores.put(PR_PREGUNTA, pregunta);
        valores.put(PR_ID_TIPO_PREGUNTA, id_tipo_pregunta);
        valores.put(PR_DESCRIPCION_TIPO_PREGUNTA, descripcion_tipo_pregunta);
        valores.put(PR_ID_APARTADO, id_apartado);
        valores.put(PR_NOMBRE_APARTADO, nombre_apartado);
        valores.put(PR_DESCRIPCION_APARTADO, descripcion_apartado);
        valores.put(PR_ID_CATEGORIA, id_categoria);
        valores.put(PR_NOMBRE_CATEGORIA, nombre_categoria);
        valores.put(PR_DESCRIPCION_CATEGORIA, descripcion_categoria);
        valores.put(PR_INSTRUCCION_CATEGORIA, instruccion_categoria);

        return valores;
    }

    public void insertarPreguntas(int id_pregunta, int seccion, String pregunta, int id_tipo_pregunta, String descripcion_tipo_pregunta, int id_apartado,
                                  String nombre_apartado, String descripcion_apartado, int id_categoria, String nombre_categoria,
                                  String descripcion_categoria, String instruccion_categoria){

        db.insert(TABLE_PREGUNTAS, null, generarContentValues(id_pregunta, seccion, pregunta, id_tipo_pregunta, descripcion_tipo_pregunta,
                id_apartado, nombre_apartado, descripcion_apartado, id_categoria, nombre_categoria, descripcion_categoria, instruccion_categoria));
    }

    public void eliminarPreguntas(){
        db.delete(TABLE_PREGUNTAS, null, new String[]{});
    }

    public Cursor obtenerPreguntasPorApartado(int id_apartado, int seccion){
        return db.query(TABLE_PREGUNTAS, columnas, PR_ID_APARTADO + " =? AND "+ PR_SECCION +" =?", new String[]{String.valueOf(id_apartado), String.valueOf(seccion)}, null, null, null);
    }
}
