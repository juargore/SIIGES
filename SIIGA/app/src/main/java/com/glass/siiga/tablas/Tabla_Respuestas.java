package com.glass.siiga.tablas;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

public class Tabla_Respuestas {

    private static final String TABLE_RESPUESTAS = "respuestas";

    public static final String RE_ID = "id";
    public static final String RE_ID_INSPECCION = "id_inspeccion";
    public static final String RE_ID_PREGUNTA = "id_pregunta";
    public static final String RE_RESPUESTA = "respuesta";

    public static final String CREATE_TABLE_RESPUESTAS = "create table " + TABLE_RESPUESTAS + " ( "
            + RE_ID + " INTEGER primary key autoincrement,"
            + RE_ID_INSPECCION + " TEXT not null,"
            + RE_ID_PREGUNTA + " INTEGER not null,"
            + RE_RESPUESTA + " TEXT);";

    private String[] columnas = new String[]{RE_ID, RE_ID_INSPECCION, RE_ID_PREGUNTA, RE_RESPUESTA};

    private DbHelper helper;
    private SQLiteDatabase db;

    public Tabla_Respuestas(Context context) {
        helper = new DbHelper(context);
        db = helper.getWritableDatabase();
    }

    public ContentValues generarContentValues(String id_inspeccion, int id_pregunta, String respuesta){
        ContentValues valores = new ContentValues();
        valores.put(RE_ID_INSPECCION, id_inspeccion);
        valores.put(RE_ID_PREGUNTA, id_pregunta);
        valores.put(RE_RESPUESTA, respuesta);

        return valores;
    }

    public void insertarRespuesta(String id_inspeccion, int id_pregunta, String respuesta){
        db.insert(TABLE_RESPUESTAS, null, generarContentValues(id_inspeccion, id_pregunta, respuesta));
    }

    public void modificarRespuesta(String id_inspeccion, int id_pregunta, String respuesta){
        db.update(TABLE_RESPUESTAS, generarContentValues(id_inspeccion, id_pregunta, respuesta),
                RE_ID_INSPECCION + " =? AND "+ RE_ID_PREGUNTA +" =?", new String[]{String.valueOf(id_inspeccion), String.valueOf(id_pregunta)});
    }

    public Cursor consultarRespuesta(String id_inspeccion, int id_pregunta){
        return db.query(TABLE_RESPUESTAS, columnas, (RE_ID_INSPECCION + " =? AND "+ RE_ID_PREGUNTA + " =?"),
                new String[]{id_inspeccion, String.valueOf(id_pregunta)},
                null, null, null);
    }

    public Cursor consultarRespuestasByInspeccion(String id_inspeccion){
        return db.query(TABLE_RESPUESTAS, columnas, (RE_ID_INSPECCION + " =?"),
                new String[]{id_inspeccion},
                null, null, null);
    }

    public Cursor consultarExistenRespuestas(){
        String[] columna = new String[]{RE_ID_INSPECCION};
        //return db.query(TABLE_RESPUESTAS, columna, null, null, null, null, null);
        return db.query(true, TABLE_RESPUESTAS, columna, null, null, null, null, null, null);
    }

    public int eliminarRespuestasByInspeccion(String id_inspeccion){
        return db.delete(TABLE_RESPUESTAS, RE_ID_INSPECCION + " =?", new String[]{id_inspeccion});
    }

    public void eliminarRespuestasTodas(){
        db.delete(TABLE_RESPUESTAS, null, new String[]{});
    }

}
