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

    public Item_Menu_Lateral(int position, String title, int icon, int icon_b, int icon_r){
        this.position = position;
        this.titulo = title;
        this.icono = icon;
        this.icono_b = icon_b;
        this.icono_r = icon_r;
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

    public int getIcono_b() {
        return icono_b;
    }

    public int getIcono_r() {
        return icono_r;
    }
}
