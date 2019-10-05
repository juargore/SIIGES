package com.glass.siiga.objetos;

import java.util.HashMap;
import java.util.LinkedHashMap;

public class Perfil_Usuario {

    private String persona_id, rol_id, nombre_usuario, nombre_rol, url_foto;
    private LinkedHashMap<String, String> valores;

    public Perfil_Usuario(String persona_id, String rol_id, String nombre_usuario, String nombre_rol, String url_foto, LinkedHashMap<String, String> valores){
        this.persona_id = persona_id;
        this.rol_id = rol_id;
        this.nombre_usuario = nombre_usuario;
        this.nombre_rol = nombre_rol;
        this.url_foto = url_foto;
        this.valores = valores;
    }

    public String getPersona_id() {
        return persona_id;
    }

    public void setPersona_id(String persona_id) {
        this.persona_id = persona_id;
    }

    public String getRol_id() {
        return rol_id;
    }

    public void setRol_id(String rol_id) {
        this.rol_id = rol_id;
    }

    public String getUrl_foto() {
        return url_foto;
    }

    public void setUrl_foto(String url_foto) {
        this.url_foto = url_foto;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getNombre_rol() {
        return nombre_rol;
    }

    public void setNombre_rol(String nombre_rol) {
        this.nombre_rol = nombre_rol;
    }

    public LinkedHashMap<String, String> getValores() {
        return valores;
    }

    public void setValores(LinkedHashMap<String, String> valores) {
        this.valores = valores;
    }
}
