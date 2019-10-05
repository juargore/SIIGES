package com.glass.siiga.objetos;

import android.os.Parcel;
import android.os.Parcelable;

public class Pregunta implements Parcelable{

    private int id_pregunta;
    private int seccion;
    private String pregunta;
    private int id_tipo_pregunta;
    private String descripcion_tipo_pregunta;
    private int id_apartado;
    private String nombre_apartado;
    private String descripcion_apartado;
    private int id_categoria;
    private String nombre_categoria;
    private String descripcion_categoria;
    private String instruccion_categoria;

    public Pregunta(int id_pregunta, int seccion, String pregunta, int id_tipo_pregunta, String descripcion_tipo_pregunta,
                    int id_apartado, String nombre_apartado, String descripcion_apartado, int id_categoria,
                    String nombre_categoria, String descripcion_categoria, String instruccion_categoria) {

        this.id_pregunta = id_pregunta;
        this.seccion = seccion;
        this.pregunta = pregunta;
        this.id_tipo_pregunta = id_tipo_pregunta;
        this.descripcion_tipo_pregunta = descripcion_tipo_pregunta;
        this.id_apartado = id_apartado;
        this.nombre_apartado = nombre_apartado;
        this.descripcion_apartado = descripcion_apartado;
        this.id_categoria = id_categoria;
        this.nombre_categoria = nombre_categoria;
        this.descripcion_categoria = descripcion_categoria;
        this.instruccion_categoria = instruccion_categoria;
    }

    public int getId_pregunta() {
        return id_pregunta;
    }

    public void setId_pregunta(int id_pregunta) {
        this.id_pregunta = id_pregunta;
    }

    public int getSeccion() {
        return seccion;
    }

    public void setSeccion(int seccion) {
        this.seccion = seccion;
    }

    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    public int getId_tipo_pregunta() {
        return id_tipo_pregunta;
    }

    public void setId_tipo_pregunta(int id_tipo_pregunta) {
        this.id_tipo_pregunta = id_tipo_pregunta;
    }

    public String getDescripcion_tipo_pregunta() {
        return descripcion_tipo_pregunta;
    }

    public void setDescripcion_tipo_pregunta(String descripcion_tipo_pregunta) {
        this.descripcion_tipo_pregunta = descripcion_tipo_pregunta;
    }

    public int getId_apartado() {
        return id_apartado;
    }

    public void setId_apartado(int id_apartado) {
        this.id_apartado = id_apartado;
    }

    public String getNombre_apartado() {
        return nombre_apartado;
    }

    public void setNombre_apartado(String nombre_apartado) {
        this.nombre_apartado = nombre_apartado;
    }

    public String getDescripcion_apartado() {
        return descripcion_apartado;
    }

    public void setDescripcion_apartado(String descripcion_apartado) {
        this.descripcion_apartado = descripcion_apartado;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getNombre_categoria() {
        return nombre_categoria;
    }

    public void setNombre_categoria(String nombre_categoria) {
        this.nombre_categoria = nombre_categoria;
    }

    public String getDescripcion_categoria() {
        return descripcion_categoria;
    }

    public void setDescripcion_categoria(String descripcion_categoria) {
        this.descripcion_categoria = descripcion_categoria;
    }

    public String getInstruccion_categoria() {
        return instruccion_categoria;
    }

    public void setInstruccion_categoria(String instruccion_categoria) {
        this.instruccion_categoria = instruccion_categoria;
    }

    public static Creator<Pregunta> getCREATOR() {
        return CREATOR;
    }

    protected Pregunta(Parcel in) {
        id_pregunta = in.readInt();
        pregunta = in.readString();
        id_tipo_pregunta = in.readInt();
        descripcion_tipo_pregunta = in.readString();
        id_apartado = in.readInt();
        nombre_apartado = in.readString();
        descripcion_apartado = in.readString();
        id_categoria = in.readInt();
        nombre_categoria = in.readString();
        descripcion_categoria = in.readString();
        instruccion_categoria = in.readString();
    }

    public static final Creator<Pregunta> CREATOR = new Creator<Pregunta>() {
        @Override
        public Pregunta createFromParcel(Parcel in) {
            return new Pregunta(in);
        }

        @Override
        public Pregunta[] newArray(int size) {
            return new Pregunta[size];
        }
    };

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(id_pregunta);
        parcel.writeString(pregunta);
        parcel.writeInt(id_tipo_pregunta);
        parcel.writeString(descripcion_tipo_pregunta);
        parcel.writeInt(id_apartado);
        parcel.writeString(nombre_apartado);
        parcel.writeString(descripcion_apartado);
        parcel.writeInt(id_categoria);
        parcel.writeString(nombre_categoria);
        parcel.writeString(descripcion_categoria);
        parcel.writeString(instruccion_categoria);
    }
}
