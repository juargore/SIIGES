package com.glass.siiga.fragments;


import android.annotation.SuppressLint;
import android.app.Fragment;
import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.glass.siiga.R;
import com.glass.siiga.conexion.Check_Internet;


public class Fragment_Inspeccion extends Fragment {

    private FragmentManager fragmentManager;
    private View rootView;
    private Fragment_Inspeccion_sicyt fis;
    private Fragment_Inspeccion_Inspector fii;
    private LinearLayout layNOInspeccion, layFragmentInspeccion;
    private TextView txtTitulo, txtSubtitulo;
    private String mensaje="", sub_mensaje="", rol_id="";

    public Fragment_Inspeccion() { }

    @SuppressLint("ValidFragment")
    public Fragment_Inspeccion(String rol_id, FragmentManager fra) {
        this.rol_id = rol_id;
        this.fragmentManager = fra;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        rootView =  inflater.inflate(R.layout.fragment_inspeccion, container, false);

        layFragmentInspeccion = (LinearLayout) rootView.findViewById(R.id.layFragmentInspeccion);
        layNOInspeccion = (LinearLayout) rootView.findViewById(R.id.layNoInspeccion);
        txtTitulo = (TextView) rootView.findViewById(R.id.txtTitulo);
        txtSubtitulo = (TextView) rootView.findViewById(R.id.txtSubtitulo);

        fis = new Fragment_Inspeccion_sicyt(fragmentManager);
        fii = new Fragment_Inspeccion_Inspector(fragmentManager);

        if(new Check_Internet().isConnected(getActivity())){

            if(rol_id.equals("6")){ //Es inspector...

                getFragmentManager().beginTransaction().
                        add(R.id.layFragmentInspeccion, fii, "Tag_Inspeccion").commit();
            } else { //Es SICyT o Repr Legal...

                Bundle bundle = new Bundle();
                bundle.putString("rol_id", rol_id);
                fis.setArguments(bundle);

                getFragmentManager().beginTransaction().
                        add(R.id.layFragmentInspeccion, fis, "Tag_Inspeccion").commit();
            }

        } else {
            mensaje = "No hay conexión a internet";
            sub_mensaje = "Conecte el dispositivo a otra red y vuelva a intentarlo";
            mostrarMensaje();
        }

        return rootView;
    }


    public void mostrarMensaje(){
        layFragmentInspeccion.setVisibility(View.GONE);
        layNOInspeccion.setVisibility(View.VISIBLE);

        txtTitulo.setText(mensaje);
        txtSubtitulo.setText(sub_mensaje);
    }

}
