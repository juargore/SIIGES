package com.glass.siiga.adaptadores;

import android.content.Context;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;

import com.glass.siiga.objetos.Apartado_Extendido;
import com.glass.siiga.tabs.Tab_Inspeccion_Sicyt;

import java.util.List;

public class Adaptador_Tabs_Inspeccion_Sicyt extends FragmentStatePagerAdapter {

    Fragment fragment = null;

    Context context;
    List<Apartado_Extendido> lae;

    public Adaptador_Tabs_Inspeccion_Sicyt(Context context, FragmentManager fm, List<Apartado_Extendido> lae) {
        super(fm);

        this.context = context;
        this.lae = lae;
    }

    @Override
    public Fragment getItem(int position) {
        fragment = Tab_Inspeccion_Sicyt.nuevaInstancia(lae.get(position));

        return fragment;
    }

    @Override
    public int getCount() {
        return lae.size();
    }

    @Override
    public CharSequence getPageTitle(int position) {
        String nombre_apartado = "";

        for(int i=0; i<lae.size(); i++){
            if(position == i){
                nombre_apartado =  lae.get(i).getNombre_apartado();
            }
        }
        return nombre_apartado;
    }
}
