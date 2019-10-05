package com.glass.siiga.tabs;


import android.app.ProgressDialog;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.glass.siiga.R;
import com.glass.siiga.adaptadores.Adaptador_Preguntas_Acta_Inspeccion;
import com.glass.siiga.objetos.Apartado;
import com.glass.siiga.objetos.Inspeccion;
import com.glass.siiga.objetos.Respuesta;
import com.glass.siiga.objetos.Respuesta_Acta;
import com.glass.siiga.tablas.Tabla_Comentarios;
import com.glass.siiga.tablas.Tabla_Respuestas;
import com.glass.siiga.tablas.Tabla_Respuestas_Acta;

import java.util.ArrayList;
import java.util.List;

public class Tab_Inspeccion_II extends Fragment implements View.OnClickListener{

    private View rootView;
    static final String ARG_APARTADO = "apartado";
    static final String ARG_SECCION = "seccion";
    static final String ARG_INSPECCION = "inspeccion";
    private int id_apartado, seccion;
    private Tabla_Respuestas_Acta tabla_respuestas_acta;
    private RecyclerView rvListaInspeccion2;
    private List<Respuesta_Acta> lista_respuestas_acta;
    private Adaptador_Preguntas_Acta_Inspeccion adaptador;
    private Inspeccion inspeccion;
    private Apartado apartado;

    private ImageView imgGuardarComentario;
    private ImageView imgEliminarComentario;
    private EditText etObservacionesActa;
    private Tabla_Comentarios tabla_comentarios;
    private boolean comentario_guardado = true;

    public Tab_Inspeccion_II() {

    }

    public static Tab_Inspeccion_II nuevaInstancia(Apartado apartado, int seccion, Inspeccion inspeccion) {
        Tab_Inspeccion_II fragment = new Tab_Inspeccion_II();

        Bundle args = new Bundle();
        args.putParcelable(ARG_APARTADO, apartado);
        args.putSerializable(ARG_SECCION, seccion);
        args.putParcelable(ARG_INSPECCION, inspeccion);
        fragment.setArguments(args);

        return fragment;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        apartado = getArguments().getParcelable(ARG_APARTADO);
        seccion = getArguments().getInt(ARG_SECCION);
        inspeccion = getArguments().getParcelable(ARG_INSPECCION);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        rootView =  inflater.inflate(R.layout.tab_inspeccion_ii, container, false);

        rvListaInspeccion2 = (RecyclerView) rootView.findViewById(R.id.rvListaInspeccion2);
        imgGuardarComentario = (ImageView) rootView.findViewById(R.id.imgGuardarComentario);
        imgEliminarComentario = (ImageView) rootView.findViewById(R.id.imgEliminarComentario);
        etObservacionesActa = (EditText) rootView.findViewById(R.id.etObservacionesActa);

        imgGuardarComentario.setOnClickListener(this);
        imgEliminarComentario.setOnClickListener(this);

        final LinearLayoutManager layoutManager = new LinearLayoutManager(getActivity());
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        rvListaInspeccion2.setLayoutManager(layoutManager);

        tabla_comentarios = new Tabla_Comentarios(getActivity());
        tabla_respuestas_acta = new Tabla_Respuestas_Acta(getActivity());
        id_apartado = apartado.getId_apartado();

        Cursor c = tabla_comentarios.consultarComentario(inspeccion.getId_inspeccion(), id_apartado);
        c.moveToFirst();

        if(c.getCount() > 0){ //Ya esta guardado un comentario para ese apartado
            etObservacionesActa.setText(c.getString(c.getColumnIndex(Tabla_Comentarios.CM_COMENTARIO)));
        } else { //Aun no hay alguno guardado
            etObservacionesActa.setText(apartado.getComentario_apartado());
            tabla_comentarios.insertarComentario(inspeccion.getId_inspeccion(), id_apartado, apartado.getComentario_apartado());
        } c.close();

        new tareaSegundoPlano().execute();

        return rootView;
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()){
            case R.id.imgGuardarComentario:
                Cursor c = tabla_comentarios.consultarComentario(inspeccion.getId_inspeccion(), id_apartado);
                c.moveToFirst();

                if(c.getCount() > 0){
                    tabla_comentarios.modificarComentario(inspeccion.getId_inspeccion(), id_apartado, etObservacionesActa.getText().toString());
                } else {
                    tabla_comentarios.insertarComentario(inspeccion.getId_inspeccion(), id_apartado, etObservacionesActa.getText().toString());
                } c.close();

                Toast.makeText(getActivity(), "Comentario guardado", Toast.LENGTH_SHORT).show();
                break;
            case R.id.imgEliminarComentario:
                etObservacionesActa.setText("");
                break;
        }
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

            lista_respuestas_acta = new ArrayList<>();
            Cursor cursor = tabla_respuestas_acta.consultarRespuestaActa(inspeccion.getId_inspeccion(), id_apartado);

            if(cursor.getCount()>0){
                cursor.moveToFirst();

                try {
                    do {
                        lista_respuestas_acta.add(new Respuesta_Acta(
                                cursor.getInt(cursor.getColumnIndex(Tabla_Respuestas_Acta.AC_ID_INSPECCION)),
                                cursor.getInt(cursor.getColumnIndex(Tabla_Respuestas_Acta.AC_ID_APARTADO)),
                                cursor.getString(cursor.getColumnIndex(Tabla_Respuestas_Acta.AC_RESPUESTA))
                        ));

                    } while (cursor.moveToNext());
                } finally {
                    cursor.close();
                }
            } else {
                Log.e("--","Cursor es 0");
            }

            return true;
        }

        @Override
        protected void onPostExecute(Boolean b) {
            if(b){dialog.dismiss();}

            adaptador = new Adaptador_Preguntas_Acta_Inspeccion(getActivity(), lista_respuestas_acta);

            rvListaInspeccion2.setAdapter(adaptador);
        }
    }

}
