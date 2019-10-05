package com.glass.siiga.fragments;


import android.annotation.SuppressLint;
import android.app.ProgressDialog;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Fragment;
import android.support.design.widget.TabLayout;
import android.support.v4.app.FragmentManager;
import android.support.v4.view.ViewPager;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import com.glass.siiga.R;
import com.glass.siiga.adaptadores.Adaptador_Tabs_Inspeccion_Sicyt;
import com.glass.siiga.conexion.Conectar_HttpPost;
import com.glass.siiga.objetos.Apartado_Extendido;
import com.glass.siiga.objetos.General_Dos;
import com.glass.siiga.objetos.Respuesta_Acta;
import com.glass.siiga.objetos.Respuesta_Acta_Sicyt;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static android.content.Context.MODE_PRIVATE;

@SuppressLint("ValidFragment")
public class Fragment_Inspeccion_sicyt extends Fragment {

    private Spinner spinnerInstInspeccion;
    private Spinner spinnerFolioInspeccion;
    private List<String> lista_spinner_instituciones, lista_spinner_folios;
    private List<General_Dos> lista_instituciones, lista_folios;
    private List<Respuesta_Acta_Sicyt> lista_pregunta_apartado;
    private List<Apartado_Extendido> lista_apartado;
    private int status;
    private String url = "control-inspeccion.php";
    private String mensaje, sub_mensaje, institucion_id, solicitud_id, rol_id, usuario_id;
    private TabLayout tabsInsSicyt;
    private ViewPager viewPagerInsSicyt;
    private FragmentManager fragmentManager;

    @SuppressLint("ValidFragment")
    public Fragment_Inspeccion_sicyt(FragmentManager fra) {
        this.fragmentManager = fra;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_inspeccion_sicyt, container, false);

        spinnerFolioInspeccion = (Spinner) rootView.findViewById(R.id.spinnerFolioInspeccion);
        spinnerInstInspeccion = (Spinner) rootView.findViewById(R.id.spinnerInstInspeccion);
        tabsInsSicyt = (TabLayout) rootView.findViewById(R.id.tabsInsSicyt);
        viewPagerInsSicyt = (ViewPager) rootView.findViewById(R.id.viewPagerInsSicyt);

        //Revisamos si el Activity Padre envió datos al crear el fragment
        if (getArguments() != null) {
            rol_id = getArguments().getString("rol_id");
        }

        //Bloquear Spinner para el Representante Legal
        if(rol_id.equals("3")){
            spinnerInstInspeccion.setEnabled(false);
            spinnerInstInspeccion.setClickable(false);
        }

        SharedPreferences prefs = getActivity().getSharedPreferences("SIIGA_BD", MODE_PRIVATE);
        usuario_id = prefs.getString("usuario_id", "");

        new tareaSegundoPlano(0).execute();

        return rootView;
    }

    public JSONObject enviarDatos(int numero_url){
        JSONObject jsonObjRecibido;
        Conectar_HttpPost conectar = new Conectar_HttpPost();
        HashMap<String, String> parametros = new HashMap<>();

        switch (numero_url){
            case 0:
                parametros.put("webService","inspecciones");
                parametros.put("usuario_id",""+usuario_id);
                break;
            case 1:
                parametros.put("webService","inspeccionesInstitucion");
                parametros.put("id", institucion_id);
                break;
            case 2:
                parametros.put("webService","detallesInspeccion");
                parametros.put("id", solicitud_id);
                break;
        }

        jsonObjRecibido = conectar.enviarParametros(url, parametros, getActivity());

        return jsonObjRecibido;
    }

    public void llenarListado(int numero_url){
        JSONObject jsonRecibido = enviarDatos(numero_url);

        try {
            if(jsonRecibido.getInt("status") == 200){
                switch (numero_url){
                    case 0:
                        status = 200;
                        lista_spinner_instituciones = new ArrayList<>();
                        lista_instituciones = new ArrayList<>();

                        JSONArray data = jsonRecibido.getJSONObject("data").getJSONArray("instituciones");
                        for(int i = 0; i < data.length(); i++){
                            lista_spinner_instituciones.add(
                                    data.getJSONObject(i).getString("institucion"));

                            lista_instituciones.add(new General_Dos(
                                    data.getJSONObject(i).getString("id"),
                                    data.getJSONObject(i).getString("institucion")
                            ));
                        }
                        break;

                    case 1:
                        status = 200;
                        lista_spinner_folios = new ArrayList<>();
                        lista_folios = new ArrayList<>();

                        JSONArray data1 = jsonRecibido.getJSONObject("data").getJSONArray("inspecciones");

                        for(int i = 0; i < data1.length(); i++){
                            lista_spinner_folios.add(
                                    data1.getJSONObject(i).getString("folio"));

                            lista_folios.add(new General_Dos(
                                    data1.getJSONObject(i).getString("id"),
                                    data1.getJSONObject(i).getString("folio")
                            ));
                        }
                        break;
                    case 2:
                        status = 200;
                        lista_apartado = new ArrayList<>();

                        JSONArray preguntas = jsonRecibido.getJSONObject("data").getJSONArray("preguntas");
                        int id_inspeccion = jsonRecibido.getJSONObject("data").getInt("id");

                        for(int i = 0; i < preguntas.length(); i++){

                            lista_pregunta_apartado = new ArrayList<>();
                            String nombre_apartado = preguntas.getJSONObject(i).getString("apartado");
                            JSONArray respuestas = preguntas.getJSONObject(i).getJSONArray("respuestas");

                            for(int j=0; j<respuestas.length(); j++){
                                lista_pregunta_apartado.add(new Respuesta_Acta_Sicyt(
                                        i,
                                        respuestas.getJSONObject(j).getString("pregunta"),
                                        respuestas.getJSONObject(j).getString("respuesta"))
                                );
                            }

                            lista_apartado.add(new Apartado_Extendido(
                                    i,
                                    nombre_apartado,
                                    lista_pregunta_apartado
                            ));
                        }
                        break;
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

        spinnerInstInspeccion.setAdapter(adaptador);
        spinnerInstInspeccion.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
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

        spinnerFolioInspeccion.setAdapter(adaptador);
        spinnerFolioInspeccion.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {

                solicitud_id = String.valueOf(lista_folios.get(i).getId());
                new tareaSegundoPlano(2).execute();
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) { }
        });
    }

    public void crearTabs(){
        Adaptador_Tabs_Inspeccion_Sicyt adapter = new Adaptador_Tabs_Inspeccion_Sicyt(getActivity(), fragmentManager, lista_apartado);
        viewPagerInsSicyt.setAdapter(adapter);
        viewPagerInsSicyt.setOffscreenPageLimit(lista_apartado.size());
        tabsInsSicyt.setupWithViewPager(viewPagerInsSicyt);

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
                        crearTabs();
                        break;
                }
            } else {
                //mostrarMensaje();
            }
        }
    }

}
