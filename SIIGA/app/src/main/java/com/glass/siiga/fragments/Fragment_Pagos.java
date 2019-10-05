package com.glass.siiga.fragments;


import android.annotation.SuppressLint;
import android.app.ProgressDialog;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.view.animation.LayoutAnimationController;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;

import com.glass.siiga.R;
import com.glass.siiga.adaptadores.Adaptador_Pagos;
import com.glass.siiga.conexion.Check_Internet;
import com.glass.siiga.conexion.Conectar_HttpPost;
import com.glass.siiga.objetos.General_Dos;
import com.glass.siiga.objetos.Pago;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static android.content.Context.MODE_PRIVATE;

@SuppressLint("ValidFragment")
public class Fragment_Pagos extends Fragment {

    private LinearLayout laySiPagos, layNoPagos;
    private TextView txtTitulo, txtSubtitulo;
    private String mensaje, sub_mensaje="", institucion_id, solicitud_id, usuario_id, rol_id;
    private String url = "control-pago.php";
    private RecyclerView rvListaPagos;
    private List<String> lista_spinner_instituciones, lista_spinner_folios;
    private List<Pago> lista_pagos;
    private List<General_Dos> lista_instituciones, lista_folios;
    private int status;
    private Adaptador_Pagos adapter;
    private Spinner spinnerInstPagos, spinnerFolioPagos;

    @SuppressLint("ValidFragment")
    public Fragment_Pagos(String rol_id) {
        this.rol_id = rol_id;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView =  inflater.inflate(R.layout.fragment_pagos, container, false);

        laySiPagos = (LinearLayout) rootView.findViewById(R.id.laySiPagos);
        rvListaPagos = (RecyclerView) rootView.findViewById(R.id.rvListaPagos);
        spinnerFolioPagos = (Spinner) rootView.findViewById(R.id.spinnerFolioPagos);
        spinnerInstPagos = (Spinner) rootView.findViewById(R.id.spinnerInstPagos);

        //BLOQUEAR SPINNER DE INSTITUCIONES PARA EL REPR LEGAL = 3
        if(rol_id.equals("3")){
            spinnerInstPagos.setEnabled(false);
            spinnerInstPagos.setClickable(false);
        }

        layNoPagos = (LinearLayout) rootView.findViewById(R.id.layNoPagos);
        txtTitulo = (TextView) rootView.findViewById(R.id.txtTitulo);
        txtSubtitulo = (TextView) rootView.findViewById(R.id.txtSubtitulo);

        //ORIENTACION VERTICAL DEL RECYCLER VIEW
        final LinearLayoutManager layoutManager = new LinearLayoutManager(getActivity());
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        rvListaPagos.setLayoutManager(layoutManager);

        //USUARIO ID DEL SHARED PREFERENCES
        SharedPreferences prefs = getActivity().getSharedPreferences("SIIGA_BD", MODE_PRIVATE);
        usuario_id = prefs.getString("usuario_id", "");

        //CHECAR SI HAY INTERNET PARA COMENZAR A DESCARGAR PAGOS
        if(new Check_Internet().isConnected(getActivity())){

            //NUMERO_URL = 0; OBTENER_INSTITUCIONES
            new tareaSegundoPlano(0).execute();
        } else {

            //NO HAY INTERNET, MOSTRAR MSJ AL USUARIO
            mensaje = "No hay conexión a internet";
            sub_mensaje = "Conecte el dispositivo a otra red y vuelva a intentarlo";
            mostrarMensaje();
        }

        return rootView;
    }

    public JSONObject enviarDatos(int numero_url){
        JSONObject jsonObjRecibido;
        Conectar_HttpPost conectar = new Conectar_HttpPost();
        HashMap<String, String> parametros = new HashMap<>();

        switch (numero_url){
            case 0:
                parametros.put("webService","obtenerInstituciones");
                parametros.put("usuario_id",""+usuario_id);
                break;
            case 1:
                parametros.put("webService","obtenerFoliosSolicitudes");
                parametros.put("institucion_id", institucion_id);
                break;
            case 2:
                parametros.put("webService","obtenerPagosSolicitud");
                parametros.put("solicitud_id", solicitud_id);
                break;
        }

        jsonObjRecibido = conectar.enviarParametros(url, parametros, getActivity());

        return jsonObjRecibido;
    }

    public void llenarListado(int numero_url){
        JSONObject jsonRecibido = enviarDatos(numero_url);

        try {
            if(jsonRecibido.getInt("status") == 200){
                JSONArray data = jsonRecibido.getJSONArray("data");

                if(data.length() > 0){

                    switch (numero_url){
                        case 0:
                            status = 200;
                            lista_spinner_instituciones = new ArrayList<>();
                            lista_instituciones = new ArrayList<>();

                            for(int i = 0; i < data.length(); i++){
                                lista_spinner_instituciones.add(
                                        data.getJSONObject(i).getString("nombre_institucion"));

                                lista_instituciones.add(new General_Dos(
                                        data.getJSONObject(i).getString("institucion_id"),
                                        data.getJSONObject(i).getString("nombre_institucion")
                                ));
                            }
                            break;

                        case 1:
                            status = 200;
                            lista_spinner_folios = new ArrayList<>();
                            lista_folios = new ArrayList<>();

                            for(int i = 0; i < data.length(); i++){
                                lista_spinner_folios.add(
                                        data.getJSONObject(i).getString("folio_solicitud"));

                                lista_folios.add(new General_Dos(
                                        data.getJSONObject(i).getString("solicitud_id"),
                                        data.getJSONObject(i).getString("folio_solicitud")
                                ));
                            }
                            break;

                        case 2:
                            lista_pagos = new ArrayList<>();
                            JSONArray pagos = data.getJSONObject(0).getJSONArray("pagos");

                            if(pagos.length() > 0){
                                status = 200;

                                for(int i = 0; i < pagos.length(); i++){
                                    lista_pagos.add(new Pago(
                                            pagos.getJSONObject(i).getInt("pago_id"),
                                            pagos.getJSONObject(i).getString("concepto"),
                                            pagos.getJSONObject(i).getString("monto"),
                                            pagos.getJSONObject(i).getString("cobertura"),
                                            pagos.getJSONObject(i).getString("fecha_pago")
                                    ));
                                }
                            } else{
                                status = 500;
                                mensaje = "Aún no se han generado Pagos para este Folio";
                                sub_mensaje = "Vuelva a intentarlo más tarde";
                            }

                            break;
                    }

                } else {
                    status = 500;
                    mensaje = "No hay Pagos que mostrar";
                    sub_mensaje = "Vuelva a intentarlo más tarde";
                }

            } else {
                status = 500;
                mensaje = jsonRecibido.getString("message");
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public void llenarSpinnerInst(){
        ArrayAdapter<String> adaptador = new ArrayAdapter<String>(getActivity(),
                R.layout.spinner_pregunta, lista_spinner_instituciones);

        spinnerInstPagos.setAdapter(adaptador);
        spinnerInstPagos.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {

                institucion_id = String.valueOf(lista_instituciones.get(i).getId());
                new tareaSegundoPlano(1).execute();
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) { }
        });
    }

    public void llenarSpinnerFolios(){
        ArrayAdapter<String> adaptador = new ArrayAdapter<String>(getActivity(),
                R.layout.spinner_pregunta, lista_spinner_folios);

        spinnerFolioPagos.setAdapter(adaptador);
        spinnerFolioPagos.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {

                solicitud_id = String.valueOf(lista_folios.get(i).getId());
                new tareaSegundoPlano(2).execute();
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) { }
        });
    }

    public void colocarAdaptador(){
        adapter = new Adaptador_Pagos(lista_pagos);

        rvListaPagos.setAdapter(adapter);

        //Animacion del RecyclerView
        int resId = R.anim.layout_animation_fall_down;
        LayoutAnimationController animation = AnimationUtils.loadLayoutAnimation(getActivity(), resId);
        rvListaPagos.setLayoutAnimation(animation);
    }

    public void mostrarMensaje(){
        laySiPagos.setVisibility(View.GONE);
        layNoPagos.setVisibility(View.VISIBLE);

        txtTitulo.setText(mensaje);
        txtSubtitulo.setText(sub_mensaje);
    }

    private class tareaSegundoPlano extends AsyncTask<Void, Integer, Boolean> {

        private ProgressDialog dialog;
        private int numero_url;

        public tareaSegundoPlano(int numero_url){
            this.numero_url = numero_url;
        }

        @Override
        protected void onPreExecute() {

            dialog = new ProgressDialog(getActivity());
            dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
            dialog.setCancelable(false);
            dialog.setMessage(Html.fromHtml
                    ("<b>Espere un momento por favor<br><br></b>"+
                            "<font color=#791518>Descargando contenido...</font>"));
            dialog.show();
        }

        @Override
        protected Boolean doInBackground(Void... params) {
            llenarListado(numero_url);
            return true;
        }

        @Override
        protected void onPostExecute(Boolean b) {
            if(b){dialog.dismiss();}
            if(status == 200){
                switch (numero_url){
                    case 0:
                        llenarSpinnerInst();
                        break;
                    case 1:
                        llenarSpinnerFolios();
                        break;
                    case 2:
                        colocarAdaptador();
                        break;
                }
            } else {
                mostrarMensaje();
            }
        }
    }
}
