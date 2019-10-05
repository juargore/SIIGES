package com.glass.siiga.objetos;

public class Etapa_Avance {

    private int id;
    private String nombre_etapa;
    private String descripcion;
    private String comentario;
    private int status;

    public Etapa_Avance(int id, String nombre_etapa, String descripcion, String comentario, int status) {
        this.id = id;
        this.nombre_etapa = nombre_etapa;
        this.descripcion = descripcion;
        this.comentario = comentario;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre_etapa() {
        return nombre_etapa;
    }

    public void setNombre_etapa(String nombre_etapa) {
        this.nombre_etapa = nombre_etapa;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
