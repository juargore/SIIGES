package com.glass.siiga.objetos;

import android.os.Parcel;
import android.os.Parcelable;

public class Apartado implements Parcelable {

    private int id_apartado;
    private String nombre_apartado;
    private String comentario_apartado;

    public Apartado(int id_apartado, String nombre_apartado, String comentario_apartado) {
        this.id_apartado = id_apartado;
        this.nombre_apartado = nombre_apartado;
        this.comentario_apartado = comentario_apartado;
    }

    protected Apartado(Parcel in) {
        id_apartado = in.readInt();
        nombre_apartado = in.readString();
        comentario_apartado = in.readString();
    }

    public static final Creator<Apartado> CREATOR = new Creator<Apartado>() {
        @Override
        public Apartado createFromParcel(Parcel in) {
            return new Apartado(in);
        }

        @Override
        public Apartado[] newArray(int size) {
            return new Apartado[size];
        }
    };

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

    public String getComentario_apartado() {
        return comentario_apartado;
    }

    public void setComentario_apartado(String comentario_apartado) {
        this.comentario_apartado = comentario_apartado;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(id_apartado);
        parcel.writeString(nombre_apartado);
        parcel.writeString(comentario_apartado);
    }
}
