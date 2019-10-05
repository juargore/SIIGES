package com.glass.siiga.tabs;

import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.glass.siiga.R;
import com.glass.siiga.adaptadores.Adaptador_Vista_Inspeccion;
import com.glass.siiga.objetos.Inspeccion;

import java.util.ArrayList;
import java.util.List;


public class Tab_Vista_Inspeccion extends Fragment{

    public static final String ARG_POSITION = "position";
    public static final String ARG_LISTA = "lista_inspeccion";
    private RecyclerView rvListaIns;
    private List<Inspeccion> lista_inspeccion;
    private int position;
    private Adaptador_Vista_Inspeccion adapter;

    public Tab_Vista_Inspeccion() {

    }

    public static Tab_Vista_Inspeccion nuevaInstancia(int position, List<Inspeccion> lista_inspeccion) {
        Tab_Vista_Inspeccion fragment = new Tab_Vista_Inspeccion();

        Bundle args = new Bundle();
        args.putSerializable(ARG_POSITION, position);
        args.putParcelableArrayList(ARG_LISTA, (ArrayList<? extends Parcelable>) lista_inspeccion);
        fragment.setArguments(args);

        return fragment;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        position = getArguments().getInt(ARG_POSITION);
        lista_inspeccion = getArguments().getParcelableArrayList(ARG_LISTA);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.tab_vista_inspeccion, container, false);

        rvListaIns = (RecyclerView) rootView.findViewById(R.id.rvListaIns);

        final LinearLayoutManager layoutManager = new LinearLayoutManager(getActivity());
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        rvListaIns.setLayoutManager(layoutManager);
        
        llenarAdaptador();

        return rootView;
    }
    
    public void llenarAdaptador(){
        adapter = new Adaptador_Vista_Inspeccion(getActivity(), lista_inspeccion);

        rvListaIns.setAdapter(adapter);
    }
}