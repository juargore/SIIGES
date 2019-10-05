package com.glass.siiga.fragments;


import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.FragmentTransaction;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.app.Fragment;
import android.support.annotation.RequiresApi;
import android.support.v4.app.FragmentManager;
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
import android.widget.Toast;

import com.glass.siiga.R;
import com.glass.siiga.adaptadores.Adaptador_Notificaciones;
import com.glass.siiga.conexion.Check_Internet;
import com.glass.siiga.conexion.Conectar_HttpPost;
import com.glass.siiga.objetos.Notificacion;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static android.content.Context.LAYOUT_INFLATER_SERVICE;
import static android.content.Context.MODE_PRIVATE;

/**
 * A simple {@link Fragment} subclass.
 */
public class Fragment_Notificaciones extends Fragment {

    private FragmentManager fragmentManager;
    private LinearLayout laySiNotif, layNONotif;
    private TextView txtTitulo, txtSubtitulo;
    private RecyclerView rvNotificaciones;
    private String mensaje, sub_mensaje ="";
    private List<Notificacion> lista_notif;
    private Adaptador_Notificaciones adapter;
    private String url = "control-notificacion.php";
    private int status, id_notificacion;
    private String usuario_id;

    public Fragment_Notificaciones() { }

    @SuppressLint("ValidFragment")
    public Fragment_Notificaciones(String rol_id, FragmentManager fra) {
        this.fragmentManager = fra;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_notificaciones, container, false);

        laySiNotif = (LinearLayout) rootView.findViewById(R.id.laySiNotif);
        rvNotificaciones = (RecyclerView) rootView.findViewById(R.id.rvNotificaciones);

        layNONotif = (LinearLayout) rootView.findViewById(R.id.layNoNotif);
        txtTitulo = (TextView) rootView.findViewById(R.id.txtTitulo);
        txtSubtitulo = (TextView) rootView.findViewById(R.id.txtSubtitulo);

        final LinearLayoutManager layoutManager = new LinearLayoutManager(getActivity());
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        rvNotificaciones.setLayoutManager(layoutManager);

        //USUARIO ID DEL SHARED PREFERENCES
        SharedPreferences prefs = getActivity().getSharedPreferences("SIIGA_BD", MODE_PRIVATE);
        usuario_id = prefs.getString("usuario_id", "");

        //Revisar si hay internet, sino, mostar msj al usuario
        if(new Check_Internet().isConnected(getActivity())){

            //Si hay internet, comenzar a descargar JSON
            new tareaSegundoPlano(1).execute();

        } else {

            mensaje = "No hay conexión a internet";
            sub_mensaje = "Conecte el dispositivo a otra red y vuelva a intentarlo";
            mostrarMensaje();
        }

        return rootView;
    }

    public JSONObject enviarDatos(int source){
        JSONObject jsonObjRecibido;
        Conectar_HttpPost conectar = new Conectar_HttpPost();

        HashMap<String, String> parametros = new HashMap<>();

        if(source == 1){
            parametros.put("webService","consultarNotificacionesIdUsuario");
            parametros.put("usuario_id",""+usuario_id);
        } else {
            parametros.put("webService","eliminar");
            parametros.put("id",""+id_notificacion);
        }

        jsonObjRecibido = conectar.enviarParametros(url, parametros, getActivity());
        return jsonObjRecibido;
    }

    public void llenarListado(){
        JSONObject jsonRecibido = enviarDatos(1);
        lista_notif = new ArrayList<>();

        try {
            if(jsonRecibido.getInt("status") == 200){

                if(jsonRecibido.getJSONArray("data").length() > 0){
                    status = 200;

                    for(int i = 0; i < jsonRecibido.getJSONArray("data").length(); i++){

                        lista_notif.add(new Notificacion(
                                jsonRecibido.getJSONArray("data").getJSONObject(i).getInt("id"),
                                jsonRecibido.getJSONArray("data").getJSONObject(i).getString("titulo"),
                                jsonRecibido.getJSONArray("data").getJSONObject(i).getString("mensaje"),
                                jsonRecibido.getJSONArray("data").getJSONObject(i).getString("created_at"))
                        );
                    }
                } else {
                    status = 500;
                    mensaje = "Aún no se han generado Notificaciones";
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
        adapter = new Adaptador_Notificaciones(getActivity(), lista_notif, new Adaptador_Notificaciones.Interface_OnClick() {
            @RequiresApi(api = Build.VERSION_CODES.O)
            @Override
            public void OnItemClick(final Notificacion notificacion, int procedencia) {
                if(procedencia == 0){
                    final LayoutInflater inflater = (LayoutInflater)getActivity().getSystemService(LAYOUT_INFLATER_SERVICE);

                    final AlertDialog.Builder imageDialog = new AlertDialog.Builder(new ContextThemeWrapper(getActivity(), R.style.MyDialogTheme));
                    View layout = inflater.inflate(R.layout.pop_up_noticia, (ViewGroup) getActivity().findViewById(R.id.cvPopUpGral));

                    ImageView imgCerrarPopUpNoticia = (ImageView) layout.findViewById(R.id.imgCerrarPopUpGral);
                    TextView txtTituloPopUpNoticia = (TextView) layout.findViewById(R.id.txtTituloPopUpGral);
                    TextView txtSubTituloPopUpNoticia = (TextView) layout.findViewById(R.id.txtSubTituloPopUpGral);
                    TextView txtMensajePopUpNoticia = (TextView) layout.findViewById(R.id.txtMensajePopUpGral);

                    txtTituloPopUpNoticia.setText(notificacion.getTitulo());
                    txtSubTituloPopUpNoticia.setText(notificacion.getFecha());
                    txtMensajePopUpNoticia.setText(notificacion.getMensaje());

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
                } else {

                    //Eliminar la notificacion
                    new android.app.AlertDialog.Builder(getActivity(), R.style.MyDialogTheme)
                            .setTitle("¿Está seguro de eliminar esta Notificación?")
                            .setMessage("Una vez eliminada no podrá ser recuperada")
                            .setPositiveButton("Eliminar", new DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface dialogInterface, int i) {

                                    id_notificacion = notificacion.getId();

                                    new tareaSegundoPlano(2).execute();
                                }
                            })
                            .setNegativeButton("Cancelar", null)
                            .show();
                }
            }
        });

        rvNotificaciones.setAdapter(adapter);

        //Animacion del RecyclerView
        int resId = R.anim.layout_animation_fall_down;
        LayoutAnimationController animation = AnimationUtils.loadLayoutAnimation(getActivity(), resId);
        rvNotificaciones.setLayoutAnimation(animation);
    }

    public void mostrarMensaje(){
        laySiNotif.setVisibility(View.GONE);
        layNONotif.setVisibility(View.VISIBLE);

        txtTitulo.setText(mensaje);
        txtSubtitulo.setText(sub_mensaje);
    }

    private class tareaSegundoPlano extends AsyncTask<Void, Integer, Boolean> {

        JSONObject j;
        ProgressDialog dialog;
        int source;

        public tareaSegundoPlano(int source){
            this.source = source;
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
            if(source == 1)
                llenarListado();
            else
                j = enviarDatos(2);

            return true;
        }

        @Override
        protected void onPostExecute(Boolean b) {
            if(b){dialog.dismiss();}

            if(source == 1){
                if(status == 200){
                    colocarAdaptador();
                } else {
                    mostrarMensaje();
                }
            } else {
                try {
                    if (j.getInt("status") == 200){
                        Toast.makeText(getActivity(), "Notificacion eliminada de la APp", Toast.LENGTH_SHORT).show();

                        //Actualizar Fragment actual...
                        new tareaSegundoPlano(1).execute();
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }

        }
    }

}
