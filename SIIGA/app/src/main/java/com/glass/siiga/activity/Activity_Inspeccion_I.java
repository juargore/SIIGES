package com.glass.siiga.activity;

import android.app.ActionBar;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.RequiresApi;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.TabLayout;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.view.ViewPager;
import android.text.Html;
import android.util.Log;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.TextView;
import android.widget.Toast;

import com.glass.siiga.R;
import com.glass.siiga.adaptadores.Adaptador_Tabs_Apartados;
import com.glass.siiga.conexion.Check_Internet;
import com.glass.siiga.conexion.Conectar_HttpPost;
import com.glass.siiga.fragments.Fragment_Inspeccion_Inspector;
import com.glass.siiga.objetos.Apartado;
import com.glass.siiga.objetos.Inspeccion;
import com.glass.siiga.objetos.Respuesta_Acta;
import com.glass.siiga.tablas.Tabla_Comentarios;
import com.glass.siiga.tablas.Tabla_Preguntas;
import com.glass.siiga.tablas.Tabla_Respuestas;
import com.glass.siiga.tablas.Tabla_Respuestas_Acta;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Activity_Inspeccion_I extends FragmentActivity {

    private TabLayout tabsApartados;
    private ViewPager viewPagerApartados;
    private FragmentManager fragmentManager;
    private FloatingActionButton fabNext;
    private List<Apartado> lista_apartados;
    private List<Apartado> lista_apartados_acta;
    private Adaptador_Tabs_Apartados adapter;
    private ActionBar actionBar;
    final static int REQUEST_CODE = 0;
    private final String url = "control-inspeccion.php";
    private String mensaje, persona_id;
    private Inspeccion inspeccion;

    //== TABLAS ==
    private Tabla_Preguntas tabla_preguntas;
    private Tabla_Respuestas tabla_respuestas;
    private Tabla_Respuestas_Acta tabla_respuestas_acta;
    private Tabla_Comentarios tabla_comentarios;


    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setTheme(R.style.MyNoActionBarShadowTheme);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_inspeccion_i);

        actionBar = getActionBar();
        actionBar.setHomeButtonEnabled(true);
        actionBar.setDisplayHomeAsUpEnabled(true);
        actionBar.setElevation(0);
        actionBar.setIcon(android.R.color.transparent);
        actionBar.setTitle(" Inspección I");
        actionBar.setBackgroundDrawable(new ColorDrawable(getResources().getColor( R.color.rojoFuerte)));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR2) {
            actionBar.setHomeAsUpIndicator(R.mipmap.icon_back);
        }

        //CAMBIAR COLOR DEL STATUS BAR
        Window window = Activity_Inspeccion_I.this.getWindow();
        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        window.setStatusBarColor(getResources().getColor( R.color.rojoFuerte));

        //OBTENER DATOS DE SHARED PREFERENCES
        SharedPreferences prefs = getSharedPreferences("SIIGA_BD", MODE_PRIVATE);
        persona_id = prefs.getString("persona_id", "");
        inspeccion = getIntent().getExtras().getParcelable("inspeccion");
        fragmentManager = getSupportFragmentManager();

        //MATCH DE COMPONENTES XML
        tabsApartados = (TabLayout) findViewById(R.id.tabsApartados);
        viewPagerApartados = (ViewPager) findViewById(R.id.viewpagerApartados);
        fabNext = (FloatingActionButton) findViewById(R.id.fabNext);

        //REVISAR SI HAY INTERNET DISPONIBLE
        if(new Check_Internet().isConnected(Activity_Inspeccion_I.this)){

            //INSTANCIAR TABLAS
            tabla_preguntas = new Tabla_Preguntas(Activity_Inspeccion_I.this);
            tabla_respuestas = new Tabla_Respuestas(Activity_Inspeccion_I.this);
            tabla_respuestas_acta = new Tabla_Respuestas_Acta(Activity_Inspeccion_I.this);
            tabla_comentarios = new Tabla_Comentarios(Activity_Inspeccion_I.this);

            //CAMBIAR EL STATUS DE ESTA INSPECCION
            if(inspeccion.getStatus_inspeccion() == 1){
                //ES INSPECCION 'NUEVA' -> SE PASA A INSPECCION 'EN PROCESO'
                cambiarStatus();
            }

            //==EMPEZAMOS LLENANDO EL LISTADO DEL ACTA DE INSPECCION==
            new tareaSegundoPlano(2).execute();

            //PASAR LISTADO DE APARTADOS A LA SIGUIENTE ACTIVITY CON FLOATING BUTTON
            fabNext.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Intent ir = new Intent(Activity_Inspeccion_I.this, Activity_Inspeccion_II.class);
                    ir.putExtra("inspeccion", inspeccion);
                    ir.putParcelableArrayListExtra("lista_apartados", (ArrayList<? extends Parcelable>) lista_apartados_acta);
                    startActivityForResult(ir, REQUEST_CODE);
                }
            });

        } else {
            //NO HAY INTERNET, MOSTRAR MSJ AL USUARIO
            new android.app.AlertDialog.Builder(Activity_Inspeccion_I.this, R.style.MyDialogTheme)
                    .setTitle("Sin Conexión a Internet")
                    .setMessage("Conecte el dispositivo a Internet para poder descargar las preguntas y apartados de esta Inspección")
                    .setPositiveButton("Entendido", null)
                    .show();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_inspecciones, menu);

        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        switch (item.getItemId()){
            case android.R.id.home:
                Activity_Inspeccion_I.this.finish();
                return true;

            //ICONO ARRIBA-DERECHA DE INFORMACION DE LA INSPECCION
            case R.id.menuInfo:
                final LayoutInflater inflater = (LayoutInflater)getSystemService(LAYOUT_INFLATER_SERVICE);
                final AlertDialog.Builder imageDialog = new AlertDialog.Builder(new ContextThemeWrapper(Activity_Inspeccion_I.this, R.style.MyDialogTheme));
                View layout = inflater.inflate(R.layout.pop_up_detalle_cuestionario, (ViewGroup) findViewById(R.id.cvPopUpCuestionario), false);

                TextView txtFolioCuestionario = (TextView) layout.findViewById(R.id.txtFolioCuestionario);
                TextView txtFechaCuestionario = (TextView) layout.findViewById(R.id.txtFechaCuestionario);
                TextView txtInstitucionCuestionario = (TextView) layout.findViewById(R.id.txtInstitucionCuestionario);
                TextView txtProgramaCuestionario = (TextView) layout.findViewById(R.id.txtProgramaCuestionario);

                txtFolioCuestionario.setText(inspeccion.getFolio());
                txtFechaCuestionario.setText(inspeccion.getFecha_inspeccion());
                txtInstitucionCuestionario.setText(inspeccion.getInstitucion());
                txtProgramaCuestionario.setText(inspeccion.getPrograma_educativo());

                imageDialog.setView(layout);
                final AlertDialog alert = imageDialog.create();
                alert.getWindow().setBackgroundDrawableResource(android.R.color.transparent);
                alert.show();

                return true;

                default:
                    return super.onOptionsItemSelected(item);
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == REQUEST_CODE) {
            if (resultCode == RESULT_OK) {
                Activity_Inspeccion_I.this.finish();
            }
        }
    }

    public JSONObject enviarDatos(int caso){
        JSONObject jsonObjRecibido;
        Conectar_HttpPost conectar = new Conectar_HttpPost();

        HashMap<String, String> parametros = new HashMap<>();

        switch (caso){
            case 0:
                parametros.put("webService","actualizarEstatus");
                parametros.put("id", inspeccion.getId_inspeccion());
                parametros.put("nuevo_estatus", "2"); //Status En Proceso = 2
                break;
            case 1:
                parametros.put("webService","guiaInspeccion");
                parametros.put("id", inspeccion.getId_inspeccion());
                break;
            case 2:
                parametros.put("webService","informacionActaInspeccion");
                parametros.put("id", inspeccion.getId_inspeccion());
                break;
        }

        jsonObjRecibido = conectar.enviarParametros(url, parametros, Activity_Inspeccion_I.this);
        return jsonObjRecibido;
    }

    public void cambiarStatus(){
        JSONObject jsonRecibido = enviarDatos(0);

        try {
            if(jsonRecibido.getInt("status") == 200){
                mensaje = jsonRecibido.getString("data");
                Toast.makeText(this, mensaje, Toast.LENGTH_SHORT).show();
                Fragment_Inspeccion_Inspector.actualizar = true;
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public void llenarListado(){
        JSONObject jsonRecibido = enviarDatos(1);
        lista_apartados = new ArrayList<>();

        try {
            JSONArray reactivos = jsonRecibido.getJSONObject("data").getJSONArray("reactivos");

            //DESCARGAR APARTADOS SECCION I
            for(int i=0; i<reactivos.length(); i++){
                int id_apartado = reactivos.getJSONObject(i).getInt("id");
                String nombre_apartado = reactivos.getJSONObject(i).getString("apartado");
                String comentario_apartado = reactivos.getJSONObject(i).getString("comentario");

                lista_apartados.add(new Apartado(
                        id_apartado, nombre_apartado, comentario_apartado
                ));

                if(comentario_apartado.matches("")){

                } else {
                    Cursor c = tabla_comentarios.consultarComentario(inspeccion.getId_inspeccion(), id_apartado);
                    c.moveToFirst();

                    if(c.getCount()>0){

                    } else {
                        tabla_comentarios.insertarComentario(inspeccion.getId_inspeccion(), id_apartado, comentario_apartado);
                    } c.close();
                }
            }

            //LIMPIAR TABLA PREGUNTAS Y DESCARGARLAS NUEVAMENTE
            tabla_preguntas.eliminarPreguntas();

            for(int i=0; i<reactivos.length(); i++){

                JSONArray preguntas = reactivos.getJSONObject(i).getJSONArray("preguntas");
                int id_apartado = reactivos.getJSONObject(i).getInt("id");
                String nombre_apartado = reactivos.getJSONObject(i).getString("apartado");

                for(int j=0; j<preguntas.length(); j++){
                    int id_pregunta = preguntas.getJSONObject(j).getInt("id");
                    int seccion = 1;
                    String pregunta = preguntas.getJSONObject(j).getString("pregunta");
                    int id_tipo_pregunta = preguntas.getJSONObject(j).getInt("id_inspeccion_tipo_pregunta");
                    String descripcion_tipo_pregunta = preguntas.getJSONObject(j).getJSONObject("tipo_pregunta").getString("descripcion");
                    String descripcion_apartado = "";
                    int id_categoria = preguntas.getJSONObject(j).getInt("id_inspeccion_categoria");
                    String nombre_categoria = preguntas.getJSONObject(j).getJSONObject("categoria").getString("nombre");
                    String descripcion_categoria = preguntas.getJSONObject(j).getJSONObject("categoria").getString("descripcion");
                    String instruccion_categoria  = preguntas.getJSONObject(j).getJSONObject("categoria").getString("instruccion");

                    //GUARDAR PREGUNTA EN LA TABLA
                    tabla_preguntas.insertarPreguntas(id_pregunta, seccion, pregunta, id_tipo_pregunta, descripcion_tipo_pregunta,id_apartado,
                            nombre_apartado,descripcion_apartado,id_categoria,nombre_categoria, descripcion_categoria, instruccion_categoria);

                    //GUARDAR RESPUESTA DE LA PREGUNTA EN LA TABLA
                    Cursor c = tabla_respuestas.consultarRespuesta(inspeccion.getId_inspeccion(), id_pregunta);
                    c.moveToFirst();

                    if(c.getCount() > 0){
                        //Ya existe una respuesta guardada, no hacer nada
                    } else {
                        if(preguntas.getJSONObject(j).getString("respuesta").matches("")){

                        } else{
                            tabla_respuestas.insertarRespuesta(inspeccion.getId_inspeccion(), id_pregunta, preguntas.getJSONObject(j).getString("respuesta"));
                            if(id_pregunta == 1){
                                Log.e("--", "Se guardo: "+preguntas.getJSONObject(j).getString("respuesta"));
                            }
                        }
                    } c.close();
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }


    public void llenarListadoActa(){
        JSONObject jsonRecibido = enviarDatos(2);
        lista_apartados_acta = new ArrayList<>();

        try {
            JSONArray apartados = jsonRecibido.getJSONObject("data").getJSONArray("apartados");
            String id_inspeccion = inspeccion.getId_inspeccion();

            for (int i=0; i<apartados.length(); i++){

                int id_apartado = apartados.getJSONObject(i).getInt("id_apartado");
                String nombre_apartado = apartados.getJSONObject(i).getString("nombre_apartado");
                String comentario = apartados.getJSONObject(i).getString("observaciones");

                lista_apartados_acta.add(new Apartado(
                        id_apartado, nombre_apartado, comentario
                ));

                //AGREGAR LAS RESPUESTAS DE ESTE APARTADO
                Cursor cursor = tabla_respuestas_acta.consultarRespuestaActa(inspeccion.getId_inspeccion(), id_apartado);
                cursor.moveToFirst();

                if(cursor.getCount()>0) {
                    //==YA EXISTEN RESPUESTAS GUARDADAS, USAR ESAS Y NO AGREGAR NUEVAS==
                } else {

                    //==NO EXISTEN RESPUESTAS, ES LA PRIMERA VEZ QUE SE DESCARGAN; GUARDARLAS EN BD INTERNA==
                    JSONArray respuestas = apartados.getJSONObject(i).getJSONArray("respuestas");
                    for (int j=0; j<respuestas.length(); j++){
                        String respuesta = respuestas.getJSONObject(j).getString("respuesta");
                        tabla_respuestas_acta.insertarRespuestaActa(id_inspeccion, id_apartado, respuesta);
                    }
                } cursor.close();

            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public void colocarApartados(){
        adapter = new Adaptador_Tabs_Apartados(fragmentManager, lista_apartados, 1, inspeccion);
        viewPagerApartados.setAdapter(adapter);
        viewPagerApartados.setOffscreenPageLimit(lista_apartados.size());
        tabsApartados.setupWithViewPager(viewPagerApartados);
    }

    private class tareaSegundoPlano extends AsyncTask<Void, Integer, Boolean> {

        private ProgressDialog dialog;
        private int procedencia;

        public tareaSegundoPlano(int procedencia){
            this.procedencia = procedencia;
        }

        @Override
        protected void onPreExecute() {
            dialog = new ProgressDialog(Activity_Inspeccion_I.this);
            dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
            dialog.setCancelable(false);
            dialog.setMessage(Html.fromHtml
                    ("<b>Espere un momento por favor<br><br></b>"+
                            "<font color=#791518>Descargando Preguntas...</font>"));
            dialog.show();
        }

        @Override
        protected Boolean doInBackground(Void... params) {
            switch (procedencia){
                case 1:
                    llenarListado();
                    break;
                case 2:
                    llenarListadoActa();
                    break;
            }
            return true;
        }

        @Override
        protected void onPostExecute(Boolean b) {
            switch (procedencia){
                case 1:
                    //TABS DE LOS APARTADOS Y GENERACION DINAMICA DE CONTENIDO
                    colocarApartados();
                    break;

                case 2:
                    //YA SE DESCARGO EL ACTA_INSPECCION Y SUS APARTADOS
                    //AHORA DESCARGAR APARTADOS Y PREGUNTAS SECCION I
                    new tareaSegundoPlano(1).execute();
                    break;
            }
            if(b){dialog.dismiss();}
        }
    }
}
