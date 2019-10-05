package com.glass.siiga.tabs;


import android.os.Bundle;

import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.view.animation.LayoutAnimationController;

import com.glass.siiga.R;
import com.glass.siiga.adaptadores.Adaptador_Inspeccion_Sicyt;
import com.glass.siiga.objetos.Apartado_Extendido;
import com.glass.siiga.objetos.Respuesta_Acta;
import com.glass.siiga.objetos.Respuesta_Acta_Sicyt;

import java.util.ArrayList;
import java.util.List;

public class Tab_Inspeccion_Sicyt extends Fragment {

    private RecyclerView rvListaInspeccionSicyt;
    public static String ARG_LISTA;
    private Apartado_Extendido lae;
    private List<Respuesta_Acta_Sicyt> lista_pregunta_apartado;

    public Tab_Inspeccion_Sicyt() {
        // Required empty public constructor
    }

    public static Tab_Inspeccion_Sicyt nuevaInstancia(Apartado_Extendido lae) {
        Tab_Inspeccion_Sicyt fragment = new Tab_Inspeccion_Sicyt();

        Bundle args = new Bundle();
        args.putParcelable(ARG_LISTA, lae);
        fragment.setArguments(args);

        return fragment;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        lae = getArguments().getParcelable(ARG_LISTA);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.tab_inspeccion_sicyt, container, false);

        rvListaInspeccionSicyt = (RecyclerView) rootView.findViewById(R.id.rvListaInspeccionSicyt);

        final LinearLayoutManager layoutManager = new LinearLayoutManager(getActivity());
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        rvListaInspeccionSicyt.setLayoutManager(layoutManager);

        llenarListado();

        return rootView;
    }

    public void llenarListado(){
        lista_pregunta_apartado = new ArrayList<>();

        for (int i = 0; i<lae.getPregunta_apartado().size(); i++){
            lista_pregunta_apartado.add(lae.getPregunta_apartado().get(i));
        }

        colocarAdaptador();
    }

    public void colocarAdaptador(){
        Adaptador_Inspeccion_Sicyt adapter = new Adaptador_Inspeccion_Sicyt(lista_pregunta_apartado);

        rvListaInspeccionSicyt.setAdapter(adapter);

        //Animacion del RecyclerView
        int resId = R.anim.layout_animation_fall_down;
        LayoutAnimationController animation = AnimationUtils.loadLayoutAnimation(getActivity(), resId);
        rvListaInspeccionSicyt.setLayoutAnimation(animation);
    }

}
