package com.glass.siiga.objetos;

import android.os.Parcel;
import android.os.Parcelable;

public class Noticia implements Parcelable{

    String titulo, subtitulo, nombre;

    public Noticia(String titulo, String subtitulo, String nombre){
        this.titulo = titulo;
        this.subtitulo = subtitulo;
        this.nombre = nombre;
    }

    protected Noticia(Parcel in) {
        titulo = in.readString();
        subtitulo = in.readString();
        nombre = in.readString();
    }


    public static final Creator<Noticia> CREATOR = new Creator<Noticia>() {
        @Override
        public Noticia createFromParcel(Parcel in) {
            return new Noticia(in);
        }

        @Override
        public Noticia[] newArray(int size) {
            return new Noticia[size];
        }
    };

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getSubtitulo() {
        return subtitulo;
    }

    public void setSubtitulo(String subtitulo) {
        this.subtitulo = subtitulo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(titulo);
        parcel.writeString(subtitulo);
        parcel.writeString(nombre);
    }
}
