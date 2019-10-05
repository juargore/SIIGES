package com.glass.siiga.objetos;

import android.os.Parcel;
import android.os.Parcelable;

public class Respuesta_Acta implements Parcelable{

    private int id_inspeccion;
    private int id_apartado;
    private String respuesta;

    public Respuesta_Acta(int id_inspeccion, int id_apartado, String respuesta) {
        this.id_inspeccion = id_inspeccion;
        this.id_apartado = id_apartado;
        this.respuesta = respuesta;
    }

    protected Respuesta_Acta(Parcel in) {
        id_inspeccion = in.readInt();
        id_apartado = in.readInt();
        respuesta = in.readString();
    }

    public static final Creator<Respuesta_Acta> CREATOR = new Creator<Respuesta_Acta>() {
        @Override
        public Respuesta_Acta createFromParcel(Parcel in) {
            return new Respuesta_Acta(in);
        }

        @Override
        public Respuesta_Acta[] newArray(int size) {
            return new Respuesta_Acta[size];
        }
    };

    public int getId_inspeccion() {
        return id_inspeccion;
    }

    public void setId_inspeccion(int id_inspeccion) {
        this.id_inspeccion = id_inspeccion;
    }

    public int getId_apartado() {
        return id_apartado;
    }

    public void setId_apartado(int id_apartado) {
        this.id_apartado = id_apartado;
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
        parcel.writeInt(id_inspeccion);
        parcel.writeInt(id_apartado);
        parcel.writeString(respuesta);
    }
}
