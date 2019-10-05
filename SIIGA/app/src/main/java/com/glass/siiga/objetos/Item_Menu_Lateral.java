package com.glass.siiga.objetos;

/**
 * Created by Arturo on 2/11/2018.
 */

public class Item_Menu_Lateral {

    private int position;
    private String titulo;
    private int icono;
    private int icono_b;
    private int icono_r;
    private String contador = "0";
    private boolean contadorVisible = false;

    public Item_Menu_Lateral(int position, String title, int icon, int icon_b, int icon_r, boolean isCounterVisible, String count){
        this.position = position;
        this.titulo = title;
        this.icono = icon;
        this.icono_b = icon_b;
        this.icono_r = icon_r;
        this.contadorVisible = isCounterVisible;
        this.contador = count;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getIcono() {
        return icono;
    }

    public void setIcono(int icono) {
        this.icono = icono;
    }

    public int getIcono_b() {
        return icono_b;
    }

    public int getIcono_r() {
        return icono_r;
    }

    public void setIcono_r(int icono_r) {
        this.icono_r = icono_r;
    }

    public void setIcono_b(int icono_b) {
        this.icono_b = icono_b;
    }

    public String getContador() {
        return contador;
    }

    public void setContador(String contador) {
        this.contador = contador;
    }

    public boolean isContadorVisible() {
        return contadorVisible;
    }

    public void setContadorVisible(boolean contadorVisible) {
        this.contadorVisible = contadorVisible;
    }

    public boolean getCounterVisibility(){
        return this.contadorVisible;
    }
}
