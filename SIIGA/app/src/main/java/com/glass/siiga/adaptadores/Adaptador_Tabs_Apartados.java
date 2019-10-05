package com.glass.siiga.adaptadores;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;

import com.glass.siiga.objetos.Apartado;
import com.glass.siiga.objetos.Inspeccion;
import com.glass.siiga.objetos.Respuesta_Acta;
import com.glass.siiga.tabs.Tab_Inspeccion_I;
import com.glass.siiga.tabs.Tab_Inspeccion_II;

import java.util.ArrayList;
import java.util.List;

public class Adaptador_Tabs_Apartados extends FragmentStatePagerAdapter {

    private Fragment fragment = null;
    private List<Apartado> lista;
    private int seccion;
    private Inspeccion inspeccion;


    public Adaptador_Tabs_Apartados(FragmentManager fm, List<Apartado> lista_apartados, int seccion,
                                    Inspeccion inspeccion) {
        super(fm);
        this.lista = lista_apartados;
        this.seccion = seccion;
        this.inspeccion = inspeccion;
    }

    @Override
    public Fragment getItem(int position) {

        if(seccion == 1){
            fragment = Tab_Inspeccion_I.nuevaInstancia(lista.get(position), seccion, inspeccion);
        } else {
            fragment = Tab_Inspeccion_II.nuevaInstancia(lista.get(position), seccion, inspeccion);
        }

        return fragment;
    }

    @Override
    public int getCount() {
        return lista.size();
    }

    @Override
    public CharSequence getPageTitle(int position) {

        String nombre_apartado = "";
        for(int i=0; i<lista.size(); i++){
            if(position == i){
                nombre_apartado =  lista.get(i).getNombre_apartado();
            }
        }
        return nombre_apartado;
    }
}
