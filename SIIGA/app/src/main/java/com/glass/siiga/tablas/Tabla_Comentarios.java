package com.glass.siiga.tablas;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

public class Tabla_Comentarios {

    private static final String TABLE_COMENTARIOS = "comentarios";

    public static final String CM_ID_INSPECCION = "id_inspeccion";
    public static final String CM_ID_APARTADO = "id_apartado";
    public static final String CM_COMENTARIO = "comentario";

    public static final String CREATE_TABLE_COMENTARIOS = "create table " + TABLE_COMENTARIOS + " ( "
            + CM_ID_INSPECCION + " TEXT not null,"
            + CM_ID_APARTADO + " INTEGER not null,"
            + CM_COMENTARIO + " TEXT);";

    private String[] columnas = new String[]{CM_ID_INSPECCION, CM_ID_APARTADO, CM_COMENTARIO};

    private DbHelper helper;
    private SQLiteDatabase db;

    public Tabla_Comentarios(Context context) {
        helper = new DbHelper(context);
        db = helper.getWritableDatabase();
    }

    public ContentValues generarContentValues(String id_inspeccion, int id_apartado, String comentario){
        ContentValues valores = new ContentValues();
        valores.put(CM_ID_INSPECCION, id_inspeccion);
        valores.put(CM_ID_APARTADO, id_apartado);
        valores.put(CM_COMENTARIO, comentario);

        return valores;
    }

    public void insertarComentario(String id_inspeccion, int id_apartado, String comentario){
        db.insert(TABLE_COMENTARIOS, null, generarContentValues(id_inspeccion, id_apartado,comentario));
    }

    public void modificarComentario(String id_inspeccion, int id_apartado, String comentario){
        db.update(TABLE_COMENTARIOS, generarContentValues(id_inspeccion, id_apartado, comentario),
                CM_ID_INSPECCION + " =? AND "+ CM_ID_APARTADO +" =?", new String[]{id_inspeccion, String.valueOf(id_apartado)});
    }

    public Cursor consultarComentario(String id_inspeccion, int id_apartado){
        return db.query(TABLE_COMENTARIOS, columnas, (CM_ID_INSPECCION + " =? AND "+ CM_ID_APARTADO +" =?"),
                new String[]{id_inspeccion, String.valueOf(id_apartado)},
                null, null, null);
    }

    public Cursor consultarComentarioByInspeccion(String id_inspeccion){
        return db.query(TABLE_COMENTARIOS, columnas, (CM_ID_INSPECCION + " =?"),
                new String[]{id_inspeccion},
                null, null, null);
    }


    public void eliminarComentariosTodos(){
        db.delete(TABLE_COMENTARIOS, null, new String[]{});
    }

    public int eliminarComentariosByInspeccion(String id_inspeccion){
        return db.delete(TABLE_COMENTARIOS, CM_ID_INSPECCION + " =?", new String[]{id_inspeccion});
    }

}
