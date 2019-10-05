package com.glass.siiga.objetos;

import android.os.Parcel;
import android.os.Parcelable;

public class Respuesta_Acta_Sicyt implements Parcelable{

    private int id_apartado;
    private String pregunta;
    private String respuesta;

    public Respuesta_Acta_Sicyt(int id_apartado, String pregunta, String respuesta) {
        this.id_apartado = id_apartado;
        this.pregunta = pregunta;
        this.respuesta = respuesta;
    }

    protected Respuesta_Acta_Sicyt(Parcel in) {
        id_apartado = in.readInt();
        pregunta = in.readString();
        respuesta = in.readString();
    }

    public static final Creator<Respuesta_Acta_Sicyt> CREATOR = new Creator<Respuesta_Acta_Sicyt>() {
        @Override
        public Respuesta_Acta_Sicyt createFromParcel(Parcel in) {
            return new Respuesta_Acta_Sicyt(in);
        }

        @Override
        public Respuesta_Acta_Sicyt[] newArray(int size) {
            return new Respuesta_Acta_Sicyt[size];
        }
    };

    public int getId_apartado() {
        return id_apartado;
    }

    public void setId_apartado(int id_apartado) {
        this.id_apartado = id_apartado;
    }

    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
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
        parcel.writeInt(id_apartado);
        parcel.writeString(pregunta);
        parcel.writeString(respuesta);
    }
}
