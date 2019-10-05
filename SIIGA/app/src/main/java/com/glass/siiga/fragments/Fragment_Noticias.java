package com.glass.siiga.fragments;


import android.app.Fragment;
import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.RequiresApi;
import android.support.v7.app.AlertDialog;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.view.animation.LayoutAnimationController;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.glass.siiga.R;
import com.glass.siiga.adaptadores.Adaptador_Noticias;
import com.glass.siiga.conexion.Check_Internet;
import com.glass.siiga.conexion.Conectar_HttpPost;
import com.glass.siiga.objetos.Noticia;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static android.content.Context.LAYOUT_INFLATER_SERVICE;

/**
 * Created by Arturo Gomez Resendiz
 */
public class Fragment_Noticias extends Fragment {

    private LinearLayout laySiNoticias, layNONoticias;
    private TextView txtTitulo, txtSubtitulo;
    private View rootView;
    private RecyclerView rvListaNoticias;
    private String url = "control-noticia.php";
    private String mensaje, sub_mensaje = "";
    private int status;
    private List<Noticia> lista_noticias;
    private Adaptador_Noticias adapter;

    public Fragment_Noticias() { }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        rootView = inflater.inflate(R.layout.fragment_noticias, container, false);

        laySiNoticias = (LinearLayout) rootView.findViewById(R.id.laySiNoticias);
        rvListaNoticias = (RecyclerView) rootView.findViewById(R.id.rvListaNoticias);

        layNONoticias = (LinearLayout) rootView.findViewById(R.id.layNoNoticias);
        txtTitulo = (TextView) rootView.findViewById(R.id.txtTitulo);
        txtSubtitulo = (TextView) rootView.findViewById(R.id.txtSubtitulo);

        final LinearLayoutManager layoutManager = new LinearLayoutManager(getActivity());
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        rvListaNoticias.setLayoutManager(layoutManager);


        //Revisar si hay internet, sino, mostar msj al usuario
        if(new Check_Internet().isConnected(getActivity())){

            //Si hay internet, comenzar a descargar JSON
            new tareaSegundoPlano().execute();

        } else {

            mensaje = "No hay conexión a internet";
            sub_mensaje = "Conecte el dispositivo a otra red y vuelva a intentarlo";
            mostrarMensaje();
        }

        return rootView;
    }

    public JSONObject enviarDatos(){
        JSONObject jsonObjRecibido;
        Conectar_HttpPost conectar = new Conectar_HttpPost();

        HashMap<String, String> parametros = new HashMap<>();
        parametros.put("webService","consultarTodos");

        jsonObjRecibido = conectar.enviarParametros(url, parametros, getActivity());
        return jsonObjRecibido;
    }

    public void llenarListado(){
        JSONObject jsonRecibido = enviarDatos();
        lista_noticias = new ArrayList<>();

        try {
            if(jsonRecibido.getInt("status") == 200){
                if(jsonRecibido.getJSONArray("data").length() > 0){
                    status = 200;

                    for(int i = 0; i < jsonRecibido.getJSONArray("data").length(); i++){
                        lista_noticias.add(new Noticia(
                                jsonRecibido.getJSONArray("data").getJSONObject(i).getString("titulo"),
                                jsonRecibido.getJSONArray("data").getJSONObject(i).getString("subtitulo"),
                                jsonRecibido.getJSONArray("data").getJSONObject(i).getString("descripcion"))
                        );
                    }
                } else {
                    status = 500;
                    mensaje = "Aún no se han generado Noticias";
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

    public void colocarAdaptador(){
        adapter = new Adaptador_Noticias(lista_noticias, new Adaptador_Noticias.Interface_OnClick() {
            @RequiresApi(api = Build.VERSION_CODES.O)
            @Override
            public void OnItemClick(Noticia noticia) {
                final LayoutInflater inflater = (LayoutInflater)getActivity().getSystemService(LAYOUT_INFLATER_SERVICE);

                final AlertDialog.Builder imageDialog = new AlertDialog.Builder(new ContextThemeWrapper(getActivity(), R.style.MyDialogTheme));

                View layout = inflater.inflate(R.layout.pop_up_noticia, (ViewGroup) getActivity().findViewById(R.id.cvPopUpGral));

                ImageView imgCerrarPopUpNoticia = (ImageView) layout.findViewById(R.id.imgCerrarPopUpGral);
                TextView txtTituloPopUpNoticia = (TextView) layout.findViewById(R.id.txtTituloPopUpGral);
                TextView txtSubTituloPopUpNoticia = (TextView) layout.findViewById(R.id.txtSubTituloPopUpGral);
                TextView txtMensajePopUpNoticia = (TextView) layout.findViewById(R.id.txtMensajePopUpGral);

                txtTituloPopUpNoticia.setText(noticia.getTitulo());
                txtSubTituloPopUpNoticia.setText(noticia.getSubtitulo());
                txtMensajePopUpNoticia.setText(noticia.getNombre());

                imageDialog.setView(layout);
                final AlertDialog alert = imageDialog.create();
                alert.getWindow().setBackgroundDrawableResource(android.R.color.transparent);
                alert.show();

                imgCerrarPopUpNoticia.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        alert.dismiss();
                    }
                });
            }
        });

        rvListaNoticias.setAdapter(adapter);

        //Animacion del RecyclerView
        int resId = R.anim.layout_animation_fall_down;
        LayoutAnimationController animation = AnimationUtils.loadLayoutAnimation(getActivity(), resId);
        rvListaNoticias.setLayoutAnimation(animation);
    }

    public void mostrarMensaje(){
        laySiNoticias.setVisibility(View.GONE);
        layNONoticias.setVisibility(View.VISIBLE);

        txtTitulo.setText(mensaje);
        txtSubtitulo.setText(sub_mensaje);
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
                            "<font color=#791518>Descargando contenido...</font>"));
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
            if(status == 200){
                colocarAdaptador();
            } else {
                mostrarMensaje();
            }
        }
    }
}
