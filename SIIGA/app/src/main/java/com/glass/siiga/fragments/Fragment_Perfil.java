package com.glass.siiga.fragments;


import android.app.Fragment;
import android.app.ProgressDialog;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.view.animation.LayoutAnimationController;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.glass.siiga.R;
import com.glass.siiga.adaptadores.Adaptador_Perfil_Usuario;
import com.glass.siiga.clases_gral.Redondear_Imagen;
import com.glass.siiga.conexion.Check_Internet;
import com.glass.siiga.conexion.Conectar_HttpPost;
import com.glass.siiga.conexion.Descargar_Imagenes;
import com.glass.siiga.objetos.Perfil_Usuario;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

import static android.content.Context.MODE_PRIVATE;

/**
 * Desarrollado por el Mtro. Juan Arturo Gomez Resendiz
 * arturo.g.resendiz@gmail.com
**/
public class Fragment_Perfil extends Fragment{

    private LinearLayout laySiPerfil, layNoPerfil;
    private TextView txtTitulo, txtSubtitulo;
    private ImageView imgFotoPerfil;
    private TextView txtNombrePerfil, txtCargoPerfil, txtMasPerfil;
    private LinearLayout layListaPerfil;
    private RecyclerView rvListaPerfil;
    private String url = "control-usuario.php";
    private int status;
    private String mensaje, sub_mensaje = "", usuario, contrasena, url_foto;
    private List<Perfil_Usuario> lista_perfil;
    private Adaptador_Perfil_Usuario adapter;

    public Fragment_Perfil() { }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_perfil, container, false);

        laySiPerfil = (LinearLayout) rootView.findViewById(R.id.laySiPerfil);
        imgFotoPerfil = (ImageView) rootView.findViewById(R.id.imgFotoPerfil);
        txtNombrePerfil = (TextView) rootView.findViewById(R.id.txtNombrePerfil);
        txtCargoPerfil = (TextView) rootView.findViewById(R.id.txtCargoPerfil);
        txtMasPerfil = (TextView) rootView.findViewById(R.id.txtMasPerfil);
        layListaPerfil = (LinearLayout) rootView.findViewById(R.id.layListaPerfil);
        rvListaPerfil = (RecyclerView) rootView.findViewById(R.id.rvListaPerfil);

        layNoPerfil = (LinearLayout) rootView.findViewById(R.id.layNoPerfil);
        txtTitulo = (TextView) rootView.findViewById(R.id.txtTitulo);
        txtSubtitulo = (TextView) rootView.findViewById(R.id.txtSubtitulo);

        //Obtener usuario y password de SharedPreferences
        SharedPreferences prefs = getActivity().getSharedPreferences("SIIGA_BD", MODE_PRIVATE);
        usuario = prefs.getString("usuario", " ");
        contrasena = prefs.getString("contrasena", " ");

        //Propiedades del RecyclerView en Vertical
        final LinearLayoutManager layoutManager = new LinearLayoutManager(getActivity());
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        rvListaPerfil.setLayoutManager(layoutManager);

        if(new Check_Internet().isConnected(getActivity())){
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
        parametros.put("webService","validarInicioSesion");
        parametros.put("usuario",""+usuario);
        parametros.put("contrasena",""+contrasena);

        jsonObjRecibido = conectar.enviarParametros(url, parametros, getActivity());
        return jsonObjRecibido;
    }

    public void llenarListado(){
        status = 200;
        JSONObject jsonRecibido = enviarDatos();
        lista_perfil = new ArrayList<>();

        try {
            if(jsonRecibido.getInt("status") == 200){
                status = 200;
                mensaje = jsonRecibido.getString("message");
                url_foto = "https://siiges.com/"+jsonRecibido.getJSONObject("data").getJSONObject("persona").getString("fotografia");

                LinkedHashMap<String, String> datos = new LinkedHashMap<>();
                JSONObject object = jsonRecibido.getJSONObject("data").getJSONObject("persona");
                Iterator<String> iterator = object.keys();

                while(iterator.hasNext()) {
                    String currentKey = iterator.next();
                    String currentValue = object.getString(currentKey);
                    if(!currentKey.contains("_at") && !currentKey.contains("_id")){
                        datos.put(currentKey, currentValue);
                    }
                }

                String rol = "";
                if(jsonRecibido.getJSONObject("data").has("rol")){
                    Object item = jsonRecibido.getJSONObject("data").get("rol");

                    if(item instanceof JSONObject){
                        rol = jsonRecibido.getJSONObject("data").getJSONObject("rol").getString("descripcion");
                    } else {
                        rol = "Sin rol definido";
                    }
                }


                lista_perfil.add(new Perfil_Usuario(
                        jsonRecibido.getJSONObject("data").getString("persona_id"),
                        jsonRecibido.getJSONObject("data").getString("rol_id"),
                        jsonRecibido.getJSONObject("data").getJSONObject("persona").getString("nombre") +
                                " "+jsonRecibido.getJSONObject("data").getJSONObject("persona").getString("apellido_paterno") +
                                " "+jsonRecibido.getJSONObject("data").getJSONObject("persona").getString("apellido_materno"),
                        rol,
                        "No Photo",
                        datos
                ));
            } else {
                status = 500;
                mensaje = jsonRecibido.getString("message");
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public void colocarDatosPrimarios(){
        txtNombrePerfil.setText(lista_perfil.get(0).getNombre_usuario());
        txtCargoPerfil.setText(lista_perfil.get(0).getNombre_rol());
    }

    public void colocarAdaptador(){
        colocarDatosPrimarios();
        adapter = new Adaptador_Perfil_Usuario(lista_perfil, new Adaptador_Perfil_Usuario.OnItemClickListener() {
            @Override
            public void OnItemClick(Perfil_Usuario perfil) {

            }
        });

        rvListaPerfil.setAdapter(adapter);

        //Animacion del RecyclerView
        int resId = R.anim.layout_animation_fall_down;
        LayoutAnimationController animation = AnimationUtils.loadLayoutAnimation(getActivity(), resId);
        rvListaPerfil.setLayoutAnimation(animation);

        //Redondear foto del usuario
        try {
            imgFotoPerfil.setImageBitmap(new Redondear_Imagen().getCircleBitmap
                    (new Descargar_Imagenes().obtenerImagen(url_foto), getActivity()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void mostrarMensaje(){
        laySiPerfil.setVisibility(View.GONE);
        layNoPerfil.setVisibility(View.VISIBLE);

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
