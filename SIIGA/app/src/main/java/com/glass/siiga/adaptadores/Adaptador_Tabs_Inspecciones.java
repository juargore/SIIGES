package com.glass.siiga.adaptadores;

import android.content.Context;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;

import com.glass.siiga.objetos.Inspeccion;
import com.glass.siiga.tabs.Tab_Vista_Inspeccion;

import java.util.ArrayList;
import java.util.List;

public class Adaptador_Tabs_Inspecciones extends FragmentStatePagerAdapter {

    Fragment fragment = null;
    Context context;
    List<Inspeccion> lista_inspeccion;
    List<Inspeccion> nueva_lista;

    public Adaptador_Tabs_Inspecciones(Context context, FragmentManager fm, List<Inspeccion> lista_inspeccion) {
        super(fm);

        this.context = context;
        this.lista_inspeccion = lista_inspeccion;
    }

    @Override
    public Fragment getItem(int position) {

        //Filtar por status = position + 1
        nueva_lista = new ArrayList<>();
        for (int i=0; i<lista_inspeccion.size(); i++){

            if(lista_inspeccion.get(i).getStatus_inspeccion() == (position+1)){
                nueva_lista.add(lista_inspeccion.get(i));
            }
        }

        fragment = Tab_Vista_Inspeccion.nuevaInstancia(position, nueva_lista);

        return fragment;
    }

    @Override
    public int getCount() {
        return 4;
    }

    @Override
    public CharSequence getPageTitle(int position) {
        String titulo;

        switch (position){
            case 0:
                titulo = "NUEVA";
                break;
            case 1:
                titulo = "EN PROCESO";
                break;
            case 2:
                titulo = "COMPLETA";
                break;
            default:
                titulo = "EN OBSERVACIÓN";
        }
        return titulo;
    }
}
