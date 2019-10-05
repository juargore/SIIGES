package com.glass.siiga.objetos;

import android.os.Parcel;
import android.os.Parcelable;

import java.util.List;

public class Apartado_Extendido implements Parcelable{

    private int id_apartado;
    private String nombre_apartado;
    private List<Respuesta_Acta_Sicyt> pregunta_apartado;

    public Apartado_Extendido(int id_apartado, String nombre_apartado, List<Respuesta_Acta_Sicyt> pregunta_apartado) {
        this.id_apartado = id_apartado;
        this.nombre_apartado = nombre_apartado;
        this.pregunta_apartado = pregunta_apartado;
    }

    protected Apartado_Extendido(Parcel in) {
        id_apartado = in.readInt();
        nombre_apartado = in.readString();
    }

    public static final Creator<Apartado_Extendido> CREATOR = new Creator<Apartado_Extendido>() {
        @Override
        public Apartado_Extendido createFromParcel(Parcel in) {
            return new Apartado_Extendido(in);
        }

        @Override
        public Apartado_Extendido[] newArray(int size) {
            return new Apartado_Extendido[size];
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

    public List<Respuesta_Acta_Sicyt> getPregunta_apartado() {
        return pregunta_apartado;
    }

    public void setPregunta_apartado(List<Respuesta_Acta_Sicyt> pregunta_apartado) {
        this.pregunta_apartado = pregunta_apartado;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(id_apartado);
        parcel.writeString(nombre_apartado);
    }
}
