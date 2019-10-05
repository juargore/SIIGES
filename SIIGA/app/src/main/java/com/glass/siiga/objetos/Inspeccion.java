package com.glass.siiga.objetos;

import android.os.Parcel;
import android.os.Parcelable;

public class Inspeccion implements Parcelable{

    private String id_inspeccion;
    private String folio;
    private String fecha_inspeccion;
    private int status_inspeccion;
    private int id_programa_educativo;
    private String programa_educativo;
    private String institucion;
    private int id_institucion;
    private int id_inspector;
    private String inspector;

    public Inspeccion(String id_inspeccion, String folio, String fecha_inspeccion, int id_institucion, String institucion,
                      int id_programa_educativo, String programa_educativo, int id_inspector, String nombre_inspector, int status_inspeccion) {

        this.id_inspeccion = id_inspeccion;
        this.folio = folio;
        this.fecha_inspeccion = fecha_inspeccion;
        this.id_institucion = id_institucion;
        this.institucion = institucion;
        this.id_programa_educativo = id_programa_educativo;
        this.programa_educativo = programa_educativo;
        this.id_inspector = id_inspector;
        this.inspector = nombre_inspector;
        this.status_inspeccion = status_inspeccion;
    }

    protected Inspeccion(Parcel in) {
        id_inspeccion = in.readString();
        folio = in.readString();
        fecha_inspeccion = in.readString();
        status_inspeccion = in.readInt();
        id_programa_educativo = in.readInt();
        programa_educativo = in.readString();
        institucion = in.readString();
        id_institucion = in.readInt();
        id_inspector = in.readInt();
        inspector = in.readString();
    }

    public static final Creator<Inspeccion> CREATOR = new Creator<Inspeccion>() {
        @Override
        public Inspeccion createFromParcel(Parcel in) {
            return new Inspeccion(in);
        }

        @Override
        public Inspeccion[] newArray(int size) {
            return new Inspeccion[size];
        }
    };

    public String getId_inspeccion() {
        return id_inspeccion;
    }

    public void setId_inspeccion(String id_inspeccion) {
        this.id_inspeccion = id_inspeccion;
    }

    public String getFolio() {
        return folio;
    }

    public void setFolio(String folio) {
        this.folio = folio;
    }

    public String getFecha_inspeccion() {
        return fecha_inspeccion;
    }

    public void setFecha_inspeccion(String fecha_inspeccion) {
        this.fecha_inspeccion = fecha_inspeccion;
    }

    public int getStatus_inspeccion() {
        return status_inspeccion;
    }

    public void setStatus_inspeccion(int status_inspeccion) {
        this.status_inspeccion = status_inspeccion;
    }

    public int getId_programa_educativo() {
        return id_programa_educativo;
    }

    public void setId_programa_educativo(int id_programa_educativo) {
        this.id_programa_educativo = id_programa_educativo;
    }

    public String getPrograma_educativo() {
        return programa_educativo;
    }

    public void setPrograma_educativo(String programa_educativo) {
        this.programa_educativo = programa_educativo;
    }

    public String getInstitucion() {
        return institucion;
    }

    public void setInstitucion(String institucion) {
        this.institucion = institucion;
    }

    public int getId_institucion() {
        return id_institucion;
    }

    public void setId_institucion(int id_institucion) {
        this.id_institucion = id_institucion;
    }

    public int getId_inspector() {
        return id_inspector;
    }

    public void setId_inspector(int id_inspector) {
        this.id_inspector = id_inspector;
    }

    public String getInspector() {
        return inspector;
    }

    public void setInspector(String inspector) {
        this.inspector = inspector;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(id_inspeccion);
        parcel.writeString(folio);
        parcel.writeString(fecha_inspeccion);
        parcel.writeInt(status_inspeccion);
        parcel.writeInt(id_programa_educativo);
        parcel.writeString(programa_educativo);
        parcel.writeString(institucion);
        parcel.writeInt(id_institucion);
        parcel.writeInt(id_inspector);
        parcel.writeString(inspector);
    }
}
