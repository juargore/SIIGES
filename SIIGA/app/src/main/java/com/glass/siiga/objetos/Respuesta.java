package com.glass.siiga.objetos;

import android.os.Parcel;
import android.os.Parcelable;

public class Respuesta implements Parcelable {

    private int id;
    private String id_inspeccion;
    private int id_apartado;
    private int id_pregunta;
    private int seccion;
    private String respuesta;

    public Respuesta(int id, String id_inspeccion, int id_apartado, int id_pregunta, int seccion, String respuesta) {
        this.id = id;
        this.id_inspeccion = id_inspeccion;
        this.id_apartado = id_apartado;
        this.id_pregunta = id_pregunta;
        this.seccion = seccion;
        this.respuesta = respuesta;
    }

    protected Respuesta(Parcel in) {
        id = in.readInt();
        id_inspeccion = in.readString();
        id_apartado = in.readInt();
        id_pregunta = in.readInt();
        seccion = in.readInt();
        respuesta = in.readString();
    }

    public static final Creator<Respuesta> CREATOR = new Creator<Respuesta>() {
        @Override
        public Respuesta createFromParcel(Parcel in) {
            return new Respuesta(in);
        }

        @Override
        public Respuesta[] newArray(int size) {
            return new Respuesta[size];
        }
    };

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getId_inspeccion() {
        return id_inspeccion;
    }

    public void setId_inspeccion(String id_inspeccion) {
        this.id_inspeccion = id_inspeccion;
    }

    public int getId_apartado() {
        return id_apartado;
    }

    public void setId_apartado(int id_apartado) {
        this.id_apartado = id_apartado;
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

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(id);
        parcel.writeString(id_inspeccion);
        parcel.writeInt(id_apartado);
        parcel.writeInt(id_pregunta);
        parcel.writeInt(seccion);
        parcel.writeString(respuesta);
    }
}
