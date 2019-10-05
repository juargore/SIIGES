package com.glass.siiga.adaptadores;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.os.AsyncTask;
import android.support.annotation.NonNull;
import android.support.v7.app.AlertDialog;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.util.Log;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.glass.siiga.R;
import com.glass.siiga.activity.Activity_Inspeccion_I;
import com.glass.siiga.conexion.Check_Internet;
import com.glass.siiga.conexion.Conectar_HttpPost;
import com.glass.siiga.fragments.Fragment_Inspeccion_Inspector;
import com.glass.siiga.objetos.Inspeccion;
import com.glass.siiga.tablas.Tabla_Comentarios;
import com.glass.siiga.tablas.Tabla_Respuestas;
import com.glass.siiga.tablas.Tabla_Respuestas_Acta;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;

import static android.content.Context.LAYOUT_INFLATER_SERVICE;

public class Adaptador_Vista_Inspeccion extends RecyclerView.Adapter<Adaptador_Vista_Inspeccion.Inspeccion_ViewHolder>{

    private Context context;
    private List<Inspeccion> lista;
    private Activity activity;

    public Adaptador_Vista_Inspeccion(Context context, List<Inspeccion> lista) {
        this.context = context;
        this.lista = lista;

        activity = (Activity) context;
    }

    @Override
    public Inspeccion_ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.plantilla_vista_inspecciones, parent, false);
        return new Inspeccion_ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull Inspeccion_ViewHolder holder, int position) {
        holder.bind(lista.get(position));
    }

    @Override
    public int getItemCount() {
        return lista.size();
    }


    public class Inspeccion_ViewHolder extends RecyclerView.ViewHolder{

        private TextView txtFolioIns;
        private TextView txtInstitucionIns;
        private TextView txtProgrIns;
        private TextView txtInspectorIns;
        private TextView txtFechaIns;
        private TextView txtStatusIns;
        private ImageView imgMenuIns;

        public Inspeccion_ViewHolder(View itemView) {
            super(itemView);

            txtFolioIns = (TextView) itemView.findViewById(R.id.txtFolioIns);
            txtInstitucionIns = (TextView) itemView.findViewById(R.id.txtInstitucionIns);
            txtProgrIns = (TextView) itemView.findViewById(R.id.txtProgrIns);
            txtInspectorIns = (TextView) itemView.findViewById(R.id.txtInspectorIns);
            txtFechaIns = (TextView) itemView.findViewById(R.id.txtFechaIns);
            txtStatusIns = (TextView) itemView.findViewById(R.id.txtStatusIns);
            imgMenuIns = (ImageView) itemView.findViewById(R.id.imgMenuIns);
        }

        public void bind(final Inspeccion inspeccion){

            txtFolioIns.setText(inspeccion.getFolio());
            txtInstitucionIns.setText(inspeccion.getInstitucion());
            txtProgrIns.setText(inspeccion.getPrograma_educativo());
            txtInspectorIns.setText(inspeccion.getInspector());
            txtFechaIns.setText(inspeccion.getFecha_inspeccion());

            switch (inspeccion.getStatus_inspeccion()){
                case 1:
                    txtStatusIns.setText("NUEVO");
                    break;
                case 2:
                    txtStatusIns.setText("EN PROCESO");
                    break;
                case 3:
                    txtStatusIns.setText("COMPLETO");
                    break;
                case 4:
                    txtStatusIns.setText("EN OBSERVACIÓN");
                    break;
            }

            imgMenuIns.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    final AlphaAnimation buttonClick2 = new AlphaAnimation(1F, 0.5F);
                    view.startAnimation(buttonClick2);

                    final LayoutInflater inflater = (LayoutInflater)activity.getSystemService(LAYOUT_INFLATER_SERVICE);
                    final AlertDialog.Builder imageDialog = new AlertDialog.Builder(new ContextThemeWrapper(activity, R.style.myDialog));
                    View layout = inflater.inflate(R.layout.pop_up_menu_inspeccion, (ViewGroup) activity.findViewById(R.id.cvPopUpMenu), false);

                    TextView txtMenuVer = (TextView) layout.findViewById(R.id.txtMenuVer);
                    TextView txtMenuSincronizar = (TextView) layout.findViewById(R.id.txtMenuSincronizar);

                    if(inspeccion.getStatus_inspeccion() == 3){
                        txtMenuSincronizar.setVisibility(View.VISIBLE);
                    }

                    imageDialog.setView(layout);
                    final AlertDialog alert = imageDialog.create();
                    alert.getWindow().setBackgroundDrawableResource(android.R.color.transparent);
                    alert.show();

                    txtMenuVer.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            Intent ir = new Intent(context, Activity_Inspeccion_I.class);
                            ir.putExtra("inspeccion", inspeccion);
                            context.startActivity(ir);

                            alert.dismiss();
                        }
                    });

                    txtMenuSincronizar.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {

                            if(new Check_Internet().isConnected(activity)){
                                new android.app.AlertDialog.Builder(new ContextThemeWrapper(context, R.style.myDialog))
                                        .setTitle("¿Seguro de Sincronizar esta Inspección?")
                                        .setMessage("Una vez Sincronizada esta Inspección no será posible modificar sus respuestas o comentarios " +
                                                "y se generará en automático el Acta de Cierre en el sistema web. ¿Confirma que desea Sincronizar?")
                                        .setPositiveButton("Sincronizar", new DialogInterface.OnClickListener() {
                                            @Override
                                            public void onClick(DialogInterface dialogInterface, int i) {
                                                JSONObject j = formarJsonRespuesta(inspeccion.getId_inspeccion());
                                                new tareaSegundoPlano(0, j, inspeccion).execute();
                                            }
                                        })
                                        .setNegativeButton("Cancelar", null)
                                        .show();

                            } else {
                                Toast.makeText(activity, "Necesita conexión a Internet para realizar esta acción", Toast.LENGTH_LONG).show();
                            }
                        }
                    });
                }
            });
        }
    }

    public JSONObject formarJsonRespuesta(String id_inspeccion){

        Tabla_Respuestas tabla_respuestas = new Tabla_Respuestas(activity);
        Cursor cursor = tabla_respuestas.consultarRespuestasByInspeccion(id_inspeccion);

        JSONArray preguntas = new JSONArray();
        JSONArray apartados = new JSONArray();
        JSONObject jsonPadre = new JSONObject();

        if(cursor.getCount()>0){
            cursor.moveToFirst();
            try {
                do {
                    JSONObject items = new JSONObject();
                    items.put("pregunta_id", cursor.getString(cursor.getColumnIndex(Tabla_Respuestas.RE_ID_PREGUNTA)));
                    items.put("respuesta", cursor.getString(cursor.getColumnIndex(Tabla_Respuestas.RE_RESPUESTA)));

                    preguntas.put(items);
                } while (cursor.moveToNext());

            } catch (JSONException e) {
                e.printStackTrace();
            } finally {
                cursor.close();
            }
        }

        Tabla_Comentarios tabla_comentarios = new Tabla_Comentarios(activity);
        Cursor c = tabla_comentarios.consultarComentarioByInspeccion(id_inspeccion);

        if(c.getCount()>0){
            c.moveToFirst();
            try {
                do {
                    JSONObject items = new JSONObject();
                    items.put("apartado_id", c.getString(c.getColumnIndex(Tabla_Comentarios.CM_ID_APARTADO)));
                    items.put("comentario", c.getString(c.getColumnIndex(Tabla_Comentarios.CM_COMENTARIO)));

                    apartados.put(items);
                } while (c.moveToNext());

            } catch (JSONException e) {
                e.printStackTrace();
            } finally {
                c.close();
            }
        }

        try {
            jsonPadre.put("inspeccion_id", id_inspeccion);
            jsonPadre.put("preguntas" , preguntas);
            jsonPadre.put("apartados" , apartados);
            //Log.e("--", ""+jsonPadre);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        Log.e("JSON",""+jsonPadre);

        return jsonPadre;
    }

    private class tareaSegundoPlano extends AsyncTask<Void, Integer, Boolean> {

        String url = "control-inspeccion.php";
        private ProgressDialog dialog;
        private int procedencia;
        private JSONObject j, jsonObjRecibido;
        private Inspeccion inspeccion;

        public tareaSegundoPlano(int procedencia, Inspeccion inspeccion){
            this.procedencia = procedencia;
            this.inspeccion = inspeccion;
        }

        public tareaSegundoPlano(int procedencia, JSONObject j, Inspeccion inspeccion){
            this.procedencia = procedencia;
            this.inspeccion = inspeccion;
            this.j = j;
        }

        @Override
        protected void onPreExecute() {
            dialog = new ProgressDialog(activity);
            dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
            dialog.setCancelable(false);
            if(procedencia == 0){
                dialog.setMessage(Html.fromHtml
                        ("<b>Espere un momento por favor<br><br></b>"+
                                "<font color=#791518>Enviando Información al Servidor...</font>"));
            } else {
                dialog.setMessage(Html.fromHtml
                        ("<b>Espere un momento por favor<br><br></b>"+
                                "<font color=#791518>Actualizando el estatus de la Inspección...</font>"));
            }
            dialog.show();
        }

        @Override
        protected Boolean doInBackground(Void... params) {
            Conectar_HttpPost conectar = new Conectar_HttpPost();
            HashMap<String, String> parametros = new HashMap<>();

            switch (procedencia){
                case 0:
                    parametros.put("webService","guardarInspeccion");
                    parametros.put("datos", j.toString());

                    jsonObjRecibido = conectar.enviarParametros(url, parametros, activity);
                    break;
                case 1:
                    parametros.put("webService","actualizarEstatus");
                    parametros.put("id", inspeccion.getId_inspeccion());
                    parametros.put("nuevo_estatus", "5"); //Status En Proceso = 2

                    jsonObjRecibido = conectar.enviarParametros(url, parametros, activity);
                    break;
            }

            return true;
        }

        @Override
        protected void onPostExecute(Boolean b) {

            switch (procedencia){
                case 0:
                    try {
                        if(jsonObjRecibido.getInt("status") == 200){

                            //==ACTUALIZAR STATUS A 5 EN SERVER==
                            new tareaSegundoPlano(1, inspeccion).execute();

                        } else {
                            String mensaje = jsonObjRecibido.getString("message");
                            Toast.makeText(activity, mensaje, Toast.LENGTH_LONG).show();
                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                break;

                case 1:
                    try {
                        if(jsonObjRecibido.getInt("status") == 200){

                            //==ELIMINAR TODA LA INFO DE LA INSPECCION EN BD INTERNA==
                            new Tabla_Respuestas(activity).eliminarRespuestasByInspeccion(inspeccion.getId_inspeccion());
                            new Tabla_Respuestas_Acta(activity).eliminarRespuestasActaByInspeccion(inspeccion.getId_inspeccion());
                            new Tabla_Comentarios(activity).eliminarComentariosByInspeccion(inspeccion.getId_inspeccion());

                            //==INFORMAR AL INSPECTOR QUE YA SE ACTUALIZO ALL==
                            new android.app.AlertDialog.Builder(new ContextThemeWrapper(context, R.style.myDialog))
                                    .setTitle("Inspección Actualizada con Éxito")
                                    .setMessage("La Inspección se ha guardado en el Servidor con éxito. Ahora es posible imprimir su " +
                                            "acta de cierre a través del Sistema web. Esta inspección no aparecerá más en este módulo")
                                    .setPositiveButton("Entendido", null)
                                    .show();
                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                break;
            }
            if(b){dialog.dismiss();}
        }
    }
}
