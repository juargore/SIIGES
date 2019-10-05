package com.glass.siiga.fragments;


import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.app.Fragment;
import android.app.ProgressDialog;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.LayoutAnimationController;
import android.view.animation.Transformation;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.glass.siiga.R;
import com.glass.siiga.adaptadores.Adaptador_Avance;
import com.glass.siiga.conexion.Check_Internet;
import com.glass.siiga.conexion.Conectar_HttpPost;
import com.glass.siiga.objetos.Etapa_Avance;
import com.glass.siiga.objetos.General_Dos;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static android.content.Context.MODE_PRIVATE;


@SuppressLint("ValidFragment")
public class Fragment_Avance extends Fragment {

    private String rol_id, usuario_id, institucion_id, mensaje, sub_mensaje, solicitud_id, fecha;
    private RelativeLayout layGrisPadre, layRojoHijo;
    private LinearLayout laySiAvance, layNoAvance;
    private String url = "control-solicitud.php";
    private TextView txtFechaAvance, txtPorcentajeAvance, txtTitulo, txtSubtitulo ;
    private Spinner spinnerInstAvance, spinnerFolioAvance;
    private RecyclerView rvListaAvance;
    private Adaptador_Avance adaptador;
    private List<Etapa_Avance> lista_avance;
    private List<General_Dos> lista_instituciones, lista_folios;
    private List<String> lista_spinner_instituciones, lista_spinner_folios;
    private int porcentaje, status;

    @SuppressLint("ValidFragment")
    public Fragment_Avance(String rol_id) {
        this.rol_id = rol_id;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_avance, container, false);

        laySiAvance = (LinearLayout) rootView.findViewById(R.id.laySiAvance);
        spinnerInstAvance = (Spinner) rootView.findViewById(R.id.spinnerInstAvance);
        spinnerFolioAvance = (Spinner) rootView.findViewById(R.id.spinnerFolioAvance);
        layGrisPadre = (RelativeLayout) rootView.findViewById(R.id.layGrisPadre);
        layRojoHijo = (RelativeLayout) rootView.findViewById(R.id.layRojoHijo);
        txtFechaAvance = (TextView) rootView.findViewById(R.id.txtFechaAvance);
        txtPorcentajeAvance = (TextView) rootView.findViewById(R.id.txtPorcentajeAvance);
        rvListaAvance = (RecyclerView) rootView.findViewById(R.id.rvListaAvance);

        layNoAvance = (LinearLayout) rootView.findViewById(R.id.layNoAvance);
        txtTitulo = (TextView) rootView.findViewById(R.id.txtTitulo);
        txtSubtitulo = (TextView) rootView.findViewById(R.id.txtSubtitulo);

        final LinearLayoutManager layoutManager = new LinearLayoutManager(getActivity());
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        rvListaAvance.setLayoutManager(layoutManager);

        //Bloquear Spinner para el Representante Legal
        if(rol_id.equals("3")){
            spinnerInstAvance.setEnabled(false);
            spinnerInstAvance.setClickable(false);
        }

        SharedPreferences prefs = getActivity().getSharedPreferences("SIIGA_BD", MODE_PRIVATE);
        usuario_id = prefs.getString("usuario_id", "");


        if(new Check_Internet().isConnected(getActivity())){
            new tareaSegundoPlano(0).execute();
        } else {
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
                parametros.put("webService","institucionesSolicitudes");
                parametros.put("usuario_id",""+usuario_id);
                break;
            case 1:
                parametros.put("webService","solicitudesInstitucion");
                parametros.put("id", institucion_id);
                break;
            case 2:
                parametros.put("webService","avanceSolicitud");
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
                JSONObject data = jsonRecibido.getJSONObject("data");

                if(data.length() > 0){

                    switch (numero_url){
                        case 0:
                            status = 200;
                            lista_spinner_instituciones = new ArrayList<>();
                            lista_instituciones = new ArrayList<>();

                            JSONArray instituciones = data.getJSONArray("instituciones");

                            for(int i = 0; i < instituciones.length(); i++){
                                lista_spinner_instituciones.add(
                                        instituciones.getJSONObject(i).getString("institucion"));

                                lista_instituciones.add(new General_Dos(
                                        instituciones.getJSONObject(i).getString("id"),
                                        instituciones.getJSONObject(i).getString("institucion")
                                ));
                            }
                            break;

                        case 1:
                            status = 200;
                            lista_spinner_folios = new ArrayList<>();
                            lista_folios = new ArrayList<>();

                            JSONArray solicitudes = data.getJSONArray("solicitudes");

                            for(int i = 0; i < solicitudes.length(); i++){
                                lista_spinner_folios.add(
                                        solicitudes.getJSONObject(i).getString("folio"));

                                lista_folios.add(new General_Dos(
                                        solicitudes.getJSONObject(i).getString("id"),
                                        solicitudes.getJSONObject(i).getString("folio")
                                ));
                            }
                            break;

                        case 2:
                            JSONArray etapas = data.getJSONArray("etapas");

                            lista_avance = new ArrayList<>();
                            fecha = data.getString("fecha");
                            porcentaje = data.getInt("porcentaje");

                            if(etapas.length() > 0){
                                status = 200;

                                for(int i = 0; i < etapas.length(); i++){
                                    lista_avance.add(new Etapa_Avance(
                                            i,
                                            etapas.getJSONObject(i).getString("nombre"),
                                            etapas.getJSONObject(i).getString("descripcion"),
                                            etapas.getJSONObject(i).getString("comentario"),
                                            etapas.getJSONObject(i).getInt("status")
                                    ));
                                }
                            } else{
                                status = 400;
                                mensaje = "Aún no se han generado Avances para este Folio";
                                sub_mensaje = "Vuelva a intentarlo más tarde";
                            }

                            break;
                    }

                } else {
                    status = 500;
                    mensaje = "No hay Avances que mostrar";
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

        spinnerInstAvance.setAdapter(adaptador);
        spinnerInstAvance.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
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

        spinnerFolioAvance.setAdapter(adaptador);
        spinnerFolioAvance.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
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
        layNoAvance.setVisibility(View.GONE);
        laySiAvance.setVisibility(View.VISIBLE);
        rvListaAvance.setVisibility(View.VISIBLE);
        colocarInfoPrincipal();

        adaptador = new Adaptador_Avance(lista_avance, new Adaptador_Avance.Interface_OnClick() {
            @Override
            public void OnItemClick(Etapa_Avance etapa) {
                String comentario = etapa.getComentario();

                if(comentario.equals(""))
                    comentario = "Sin comentarios en esta etapa";

                Toast toast = Toast.makeText(getActivity(), comentario, Toast.LENGTH_SHORT);
                View view = toast.getView();

                //Gets the actual oval background of the Toast then sets the colour filter
                view.getBackground().setColorFilter(Color.parseColor("#D02A2D"), PorterDuff.Mode.SRC_IN);

                //Gets the TextView from the Toast so it can be editted
                TextView text = view.findViewById(android.R.id.message);
                text.setTextColor(Color.parseColor("#FFFFFF"));

                toast.show();
            }
        });

        rvListaAvance.setAdapter(adaptador);

        //Animacion del RecyclerView
        int resId = R.anim.layout_animation_fall_down;
        LayoutAnimationController animation = AnimationUtils.loadLayoutAnimation(getActivity(), resId);
        rvListaAvance.setLayoutAnimation(animation);
    }

    public void mostrarMensaje(){
        laySiAvance.setVisibility(View.GONE);
        layNoAvance.setVisibility(View.VISIBLE);

        txtTitulo.setText(mensaje);
        txtSubtitulo.setText(sub_mensaje);
    }

    public void dividirPantalla(){
        //Barra roja en 2dp
        ViewGroup.LayoutParams params = layRojoHijo.getLayoutParams();
        params.width = 3;
        layRojoHijo.setLayoutParams(params);

        //Porcentaje a 0%
        txtPorcentajeAvance.setText("0%");

        rvListaAvance.setVisibility(View.GONE);
        layNoAvance.setVisibility(View.VISIBLE);

        txtTitulo.setText(mensaje);
        txtSubtitulo.setText(sub_mensaje);
    }

    public void colocarInfoPrincipal(){
        txtFechaAvance.setText("Porcentaje de avance al " + fecha);
        iniciarAnimacionAvance();

        //--COLOREAR BARRAS DE AVANCE--
        layGrisPadre.post(new Runnable() {
            @Override
            public void run() {
                final int ancho = layGrisPadre.getWidth();
                layRojoHijo.post(new Runnable() {
                    @Override
                    public void run() {
                        ViewGroup.LayoutParams params = layRojoHijo.getLayoutParams();
                        params.width = (porcentaje * ancho) / 100;

                        //Agregar animacion a la barra roja
                        ResizeWidthAnimation anim = new ResizeWidthAnimation(layRojoHijo, params.width);
                        anim.setDuration(2000);
                        layRojoHijo.startAnimation(anim);
                    }
                });
            }
        });
    }

    private void iniciarAnimacionAvance() {
        ValueAnimator animator = ValueAnimator.ofInt(0, porcentaje); //0 is min number, 600 is max number
        animator.setDuration(2000); //Duration is in milliseconds
        animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator animation) {
                txtPorcentajeAvance.setText(animation.getAnimatedValue().toString()+"%");
            }
        });
        animator.start();
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
            } else if (status == 400){
                dividirPantalla();
            } else {
                mostrarMensaje();
            }
        }
    }

}


class ResizeWidthAnimation extends Animation {
    private int mWidth;
    private int mStartWidth;
    private View mView;

    public ResizeWidthAnimation(View view, int width) {
        mView = view;
        mWidth = width;
        mStartWidth = view.getWidth();
    }

    @Override
    protected void applyTransformation(float interpolatedTime, Transformation t) {
        int newWidth = mStartWidth + (int) ((mWidth - mStartWidth) * interpolatedTime);

        mView.getLayoutParams().width = newWidth;
        mView.requestLayout();
    }

    @Override
    public void initialize(int width, int height, int parentWidth, int parentHeight) {
        super.initialize(width, height, parentWidth, parentHeight);
    }

    @Override
    public boolean willChangeBounds() {
        return true;
    }
}
