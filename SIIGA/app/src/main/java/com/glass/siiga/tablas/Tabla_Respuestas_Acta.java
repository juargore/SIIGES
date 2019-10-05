package com.glass.siiga.tablas;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

public class Tabla_Respuestas_Acta {

    private static final String TABLE_RESPUESTAS_ACTA = "respuestas_acta";

    public static final String AC_ID_INSPECCION = "id_inspeccion";
    public static final String AC_ID_APARTADO = "id_apartado";
    public static final String AC_RESPUESTA = "respuesta";

    public static final String CREATE_TABLE_RESPUESTAS_ACTA = "create table " + TABLE_RESPUESTAS_ACTA + " ( "
            + AC_ID_INSPECCION + " TEXT not null,"
            + AC_ID_APARTADO + " INTEGER not null,"
            + AC_RESPUESTA + " TEXT);";

    private String[] columnas = new String[]{AC_ID_INSPECCION, AC_ID_APARTADO, AC_RESPUESTA};

    private DbHelper helper;
    private SQLiteDatabase db;

    public Tabla_Respuestas_Acta(Context context) {
        helper = new DbHelper(context);
        db = helper.getWritableDatabase();
    }

    public ContentValues generarContentValues(String id_inspeccion, int id_apartado, String respuesta){
        ContentValues valores = new ContentValues();
        valores.put(AC_ID_INSPECCION, id_inspeccion);
        valores.put(AC_ID_APARTADO, id_apartado);
        valores.put(AC_RESPUESTA, respuesta);

        return valores;
    }

    public void insertarRespuestaActa(String id_inspeccion, int id_apartado, String respuesta){
        db.insert(TABLE_RESPUESTAS_ACTA, null, generarContentValues(id_inspeccion, id_apartado, respuesta));
    }

    public Cursor consultarRespuestaActa(String id_inspeccion, int id_apartado){
        return db.query(TABLE_RESPUESTAS_ACTA, columnas, (AC_ID_INSPECCION + " =? AND "+ AC_ID_APARTADO +" =?"),
                new String[]{id_inspeccion, String.valueOf(id_apartado)},
                null, null, null);
    }

    public void eliminarRespuestasActaTodos(){
        db.delete(TABLE_RESPUESTAS_ACTA, null, new String[]{});
    }

    public int eliminarRespuestasActaByInspeccion(String id_inspeccion){
        return db.delete(TABLE_RESPUESTAS_ACTA, AC_ID_INSPECCION + " =?", new String[]{id_inspeccion});
    }
}
