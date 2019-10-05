package com.glass.siiga.fragments;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentTransaction;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.support.v4.app.FragmentManager;
import android.support.v4.view.ViewPager;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.glass.siiga.R;
import com.glass.siiga.adaptadores.Adaptador_Tabs_Inspecciones;
import com.glass.siiga.conexion.Check_Internet;
import com.glass.siiga.conexion.Conectar_HttpPost;
import com.glass.siiga.objetos.Inspeccion;
import com.glass.siiga.tablas.Tabla_Preguntas;
import com.glass.siiga.tabs.Tab_Vista_Inspeccion;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static android.content.Context.MODE_PRIVATE;

@SuppressLint("ValidFragment")
public class Fragment_Inspeccion_Inspector extends Fragment{

    private TabLayout tabsVistaIns;
    private ViewPager viewPagerVistaIns;
    private FragmentManager fragmentManager;
    private boolean primera = true;
    private String persona_id;
    public static boolean actualizar = false;

    private View rootView;
    private final String url = "control-inspeccion.php";
    private List<Inspeccion> lista_inspeccion;

    @SuppressLint("ValidFragment")
    public Fragment_Inspeccion_Inspector(FragmentManager fra) {
        this.fragmentManager = fra;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        rootView = inflater.inflate(R.layout.fragment_inspeccion_inspector, container, false);

        tabsVistaIns = (TabLayout) rootView.findViewById(R.id.tabsVistaIns);
        viewPagerVistaIns = (ViewPager) rootView.findViewById(R.id.viewPagerVistaIns);

        //USUARIO ID DEL SHARED PREFERENCES
        SharedPreferences prefs = getActivity().getSharedPreferences("SIIGA_BD", MODE_PRIVATE);
        persona_id = prefs.getString("persona_id", "");

        //==DESCARGAR INSPECCIONES==
        if(new Check_Internet().isConnected(getActivity())){
            new tareaSegundoPlano().execute();
        }

        return rootView;
    }

    public JSONObject enviarDatos(){
        JSONObject jsonObjRecibido;
        Conectar_HttpPost conectar = new Conectar_HttpPost();

        HashMap<String, String> parametros = new HashMap<>();
        parametros.put("webService","inspeccionesInspector");
        parametros.put("persona_id", persona_id);

        jsonObjRecibido = conectar.enviarParametros(url, parametros, getActivity());
        return jsonObjRecibido;
    }

    public void llenarListado(){
        JSONObject jsonRecibido = enviarDatos();

        lista_inspeccion = new ArrayList<>();

        try {
            if(jsonRecibido.getInt("status") == 200){
                JSONArray inspecciones = jsonRecibido.getJSONArray("data");

                if(inspecciones.length()>0){

                    for(int i = 0; i < inspecciones.length(); i++){
                        lista_inspeccion.add(new Inspeccion(
                                inspecciones.getJSONObject(i).getString("id_inspeccion"),
                                inspecciones.getJSONObject(i).getString("folio_inspeccion"),
                                inspecciones.getJSONObject(i).getString("fecha_inspeccion"),
                                inspecciones.getJSONObject(i).getInt("id_institucion"),
                                inspecciones.getJSONObject(i).getString("nombre_institucion"),
                                inspecciones.getJSONObject(i).getInt("id_programa_educativo"),
                                inspecciones.getJSONObject(i).getString("nombre_programa_educativo"),
                                1,
                                "Arturo",
                                inspecciones.getJSONObject(i).getInt("estatus_inspeccion")
                        ));
                    }
                } else {
                    //Este inspector no tiene inspecciones con status alguno
                    Log.e("RES", "Este inspector no tiene inspecciones con status alguno");
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onResume() {

        if(new Check_Internet().isConnected(getActivity())){
            if(!primera){
                if(actualizar){
                    new tareaSegundoPlano().execute();
                }
            }

            primera = false;
            actualizar = false;
        } else {
            Toast.makeText(getActivity(), "Necesita conexión a Internet para actualizar las Inspecciones", Toast.LENGTH_LONG).show();
        }

        super.onResume();
    }

    private class tareaSegundoPlano extends AsyncTask<Void, Integer, Boolean> {

        ProgressDialog dialog;

        @Override
        protected void onPreExecute() {
            dialog = new ProgressDialog(getActivity());
            dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
            dialog.setCancelable(false);
            dialog.setMessage(Html.fromHtml
                    ("<b>Espere un momento por favor<br><br></b>"+
                            "<font color=#791518>Descargando Inspecciones...</font>"));
            dialog.show();
        }

        @Override
        protected Boolean doInBackground(Void... params) {
            llenarListado();
            return true;
        }

        @Override
        protected void onPostExecute(Boolean b) {
            if(b){dialog.dismiss();}

            //Se envian las Inspecciones para colocarlas en el Tab
            Adaptador_Tabs_Inspecciones adapter = new Adaptador_Tabs_Inspecciones(getActivity(), fragmentManager, lista_inspeccion);
            viewPagerVistaIns.setAdapter(adapter);
            viewPagerVistaIns.setOffscreenPageLimit(4);
            tabsVistaIns.setupWithViewPager(viewPagerVistaIns);
        }
    }

}
