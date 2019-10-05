package com.glass.siiga.tabs;


import android.app.ProgressDialog;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.glass.siiga.R;
import com.glass.siiga.adaptadores.Adaptador_Preguntas_Inspeccion;
import com.glass.siiga.objetos.Apartado;
import com.glass.siiga.objetos.Inspeccion;
import com.glass.siiga.objetos.Pregunta;
import com.glass.siiga.tablas.Tabla_Comentarios;
import com.glass.siiga.tablas.Tabla_Preguntas;

import java.util.ArrayList;
import java.util.List;

public class Tab_Inspeccion_I extends Fragment implements View.OnClickListener{

    static final String ARG_APARTADO = "apartado";
    static final String ARG_SECCION = "seccion";
    static final String ARG_INSPECCION = "inspeccion";
    private View rootView;
    private int id_apartado, seccion;
    private Tabla_Preguntas tabla_preguntas;
    private RecyclerView rvListaInspeccion;
    private List<Pregunta> lista_preguntas;
    private Adaptador_Preguntas_Inspeccion adaptador;
    private Inspeccion inspeccion;
    private Apartado apartado;

    private ImageView imgGuardarComentario;
    private ImageView imgEliminarComentario;
    private EditText etObservacionesI;
    private Tabla_Comentarios tabla_comentarios;

    public Tab_Inspeccion_I() {

    }

    public static Tab_Inspeccion_I nuevaInstancia(Apartado apartado, int seccion, Inspeccion inspeccion) {
        Tab_Inspeccion_I fragment = new Tab_Inspeccion_I();

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

        rootView =  inflater.inflate(R.layout.tab_inspeccion_i, container, false);

        rvListaInspeccion = (RecyclerView) rootView.findViewById(R.id.rvListaInspeccion);
        final LinearLayoutManager layoutManager = new LinearLayoutManager(getActivity());
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        rvListaInspeccion.setLayoutManager(layoutManager);

        imgGuardarComentario = (ImageView) rootView.findViewById(R.id.imgGuardarComentarioI);
        imgEliminarComentario = (ImageView) rootView.findViewById(R.id.imgEliminarComentarioI);
        etObservacionesI = (EditText) rootView.findViewById(R.id.etObservacionesI);

        imgGuardarComentario.setOnClickListener(this);
        imgEliminarComentario.setOnClickListener(this);

        id_apartado = apartado.getId_apartado();
        tabla_preguntas = new Tabla_Preguntas(getActivity());
        tabla_comentarios = new Tabla_Comentarios(getActivity());

        Cursor c = tabla_comentarios.consultarComentario(inspeccion.getId_inspeccion(), id_apartado);
        c.moveToFirst();

        if(c.getCount()>0){
            etObservacionesI.setText(c.getString(c.getColumnIndex(Tabla_Comentarios.CM_COMENTARIO)));
        } c.close();

        if(etObservacionesI.getText().toString().matches("") && !apartado.getComentario_apartado().matches("")){
            etObservacionesI.setText(apartado.getComentario_apartado());
            tabla_comentarios.insertarComentario(inspeccion.getId_inspeccion(), id_apartado, apartado.getComentario_apartado());
        }

        //Cargar preguntas de la BD interna
        new tareaSegundoPlano().execute();

        return rootView;
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()){

            case R.id.imgGuardarComentarioI:
                Cursor c = tabla_comentarios.consultarComentario(inspeccion.getId_inspeccion(), id_apartado);
                c.moveToFirst();

                if(c.getCount() > 0){
                    tabla_comentarios.modificarComentario(inspeccion.getId_inspeccion(), id_apartado, etObservacionesI.getText().toString());
                } else {
                    tabla_comentarios.insertarComentario(inspeccion.getId_inspeccion(), id_apartado, etObservacionesI.getText().toString());
                } c.close();

                Toast.makeText(getActivity(), "Comentario guardado", Toast.LENGTH_SHORT).show();
                break;

            case R.id.imgEliminarComentarioI:
                etObservacionesI.setText("");
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

            Cursor cursor = tabla_preguntas.obtenerPreguntasPorApartado(id_apartado, seccion);
            lista_preguntas = new ArrayList<>();

            try {
                if (cursor.moveToFirst()) {
                    do {
                        lista_preguntas.add(new Pregunta(
                                cursor.getInt(cursor.getColumnIndex(Tabla_Preguntas.PR_ID_PREGUNTA)),
                                cursor.getInt(cursor.getColumnIndex(Tabla_Preguntas.PR_SECCION)),
                                cursor.getString(cursor.getColumnIndex(Tabla_Preguntas.PR_PREGUNTA)),
                                cursor.getInt(cursor.getColumnIndex(Tabla_Preguntas.PR_ID_TIPO_PREGUNTA)),
                                cursor.getString(cursor.getColumnIndex(Tabla_Preguntas.PR_DESCRIPCION_TIPO_PREGUNTA)),
                                cursor.getInt(cursor.getColumnIndex(Tabla_Preguntas.PR_ID_APARTADO)),
                                cursor.getString(cursor.getColumnIndex(Tabla_Preguntas.PR_NOMBRE_APARTADO)),
                                cursor.getString(cursor.getColumnIndex(Tabla_Preguntas.PR_DESCRIPCION_APARTADO)),
                                cursor.getInt(cursor.getColumnIndex(Tabla_Preguntas.PR_ID_CATEGORIA)),
                                cursor.getString(cursor.getColumnIndex(Tabla_Preguntas.PR_NOMBRE_CATEGORIA)),
                                cursor.getString(cursor.getColumnIndex(Tabla_Preguntas.PR_DESCRIPCION_CATEGORIA)),
                                cursor.getString(cursor.getColumnIndex(Tabla_Preguntas.PR_INSTRUCCION_CATEGORIA))
                        ));

                    } while (cursor.moveToNext());
                }
            } finally {
                cursor.close();
            }

            return true;
        }

        @Override
        protected void onPostExecute(Boolean b) {
            adaptador = new Adaptador_Preguntas_Inspeccion(getActivity(), inspeccion, lista_preguntas, id_apartado, new Adaptador_Preguntas_Inspeccion.Interface_OnClick() {
                @Override
                public void OnItemClick(Pregunta pregunta) {

                }
            });

            rvListaInspeccion.setAdapter(adaptador);
            if(b){dialog.dismiss();}
        }

    }

}
