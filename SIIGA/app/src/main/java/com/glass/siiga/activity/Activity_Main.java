package com.glass.siiga.activity;

import android.annotation.SuppressLint;
import android.app.ActionBar;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.content.res.TypedArray;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.util.Log;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.glass.siiga.R;
import com.glass.siiga.adaptadores.Adaptador_Menu_Lateral;
import com.glass.siiga.clases_gral.Pantalla;
import com.glass.siiga.conexion.Check_Internet;
import com.glass.siiga.conexion.Conectar_HttpPost;
import com.glass.siiga.fragments.Fragment_Avance;
import com.glass.siiga.fragments.Fragment_Inspeccion;
import com.glass.siiga.fragments.Fragment_Noticias;
import com.glass.siiga.fragments.Fragment_Notificaciones;
import com.glass.siiga.fragments.Fragment_Pagos;
import com.glass.siiga.fragments.Fragment_Perfil;
import com.glass.siiga.objetos.Item_Menu_Lateral;
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

/**
 * Desarrollado por el Mtro. Juan Arturo Gomez Resendiz
 * arturo.g.resendiz@gmail.com
 **/

public class Activity_Main extends FragmentActivity {

    private ActionBar actionBar;
    private DrawerLayout layout_menu_lateral;
    private LinearLayout layMenuLateral;
    private RecyclerView lista_menu_lateral;
    private ActionBarDrawerToggle icono_actionBar_menu;
    private boolean doubleBackToExit = false;
    private ArrayList<Item_Menu_Lateral> items_menu;
    private String[] titulos_menu_lateral;
    private TypedArray iconos_menu_lateral;
    private TypedArray iconos_menu_lateral_b;
    private TypedArray iconos_menu_lateral_r;
    private Adaptador_Menu_Lateral adapter;
    private String titulo_actual = "SIIGA", rol_id;
    private int icono_superior = R.drawable.icon_noticias;

    @SuppressLint("NewApi")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setTheme(R.style.MyNoActionBarShadowTheme);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //Propiedades del Action bar
        actionBar = getActionBar();
        actionBar.setHomeButtonEnabled(true);
        actionBar.setDisplayHomeAsUpEnabled(true);
        actionBar.setHomeAsUpIndicator(R.mipmap.icon_menu);
        actionBar.setBackgroundDrawable(new ColorDrawable(getResources().getColor( R.color.rojoFuerte)));
        actionBar.setIcon(new ColorDrawable(getResources().getColor(android.R.color.transparent)));

        //Cambiar color de Status Bar
        Window window = Activity_Main.this.getWindow();
        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        window.setStatusBarColor(getResources().getColor( R.color.rojoFuerte));

        //Match componentes XML
        layout_menu_lateral = (DrawerLayout) findViewById(R.id.layout_menu_lateral);
        lista_menu_lateral = (RecyclerView) findViewById(R.id.lista_menu_lateral);
        layMenuLateral = (LinearLayout) findViewById(R.id.layMenuLateral);

        //Propiedades del ActionBar y el menu lateral
        icono_actionBar_menu = new ActionBarDrawerToggle(this, layout_menu_lateral, R.string.app_name,R.string.app_name) {
            public void onDrawerClosed(View view) {
                invalidateOptionsMenu();
                //actionBar.show();
            }
            public void onDrawerOpened(View drawerView) {
                invalidateOptionsMenu();
                //actionBar.hide();
            }
        };

        //Rol ID de cada usuario
        SharedPreferences prefs = getSharedPreferences("SIIGA_BD", MODE_PRIVATE);
        rol_id = prefs.getString("rol_id", "");

        layout_menu_lateral.addDrawerListener(icono_actionBar_menu);

        final LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        lista_menu_lateral.setLayoutManager(layoutManager);

        colocar_items_en_menu_lateral();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu, menu);
        Bitmap logo = BitmapFactory.decodeResource(getResources(), icono_superior);

        ImageView icono_escuela = new ImageView(Activity_Main.this);
        icono_escuela.setImageBitmap(logo);

        TypedValue tv = new TypedValue();
        int actionBarHeight = 0;
        if (getTheme().resolveAttribute(android.R.attr.actionBarSize, tv, true))
        {
            actionBarHeight = TypedValue.complexToDimensionPixelSize(tv.data,getResources().getDisplayMetrics());
        }

        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(200, actionBarHeight);
        icono_escuela.setLayoutParams(layoutParams);

        if(new Pantalla().esTablet(Activity_Main.this)){
            icono_escuela.setPadding(0,11,0,11);
        } else {
            icono_escuela.setPadding(0,25,0,25);
        }


        MenuItem item = menu.getItem(0);
        item.setActionView(icono_escuela);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public void onBackPressed() {
        if(layout_menu_lateral.isDrawerOpen(layMenuLateral)){
            layout_menu_lateral.closeDrawer(layMenuLateral);
        } else {
            if (doubleBackToExit) {
                super.onBackPressed();
                return;
            }

            this.doubleBackToExit = true;
            Toast.makeText(this, R.string.doble_click, Toast.LENGTH_SHORT).show();

            new Handler().postDelayed(new Runnable() {
                @Override
                public void run() {
                    doubleBackToExit = false;
                }
            }, 2000);
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (icono_actionBar_menu.onOptionsItemSelected(item)) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressLint("ResourceType")
    public void colocar_items_en_menu_lateral(){
        items_menu = new ArrayList<>();
        titulos_menu_lateral = getResources().getStringArray(R.array.array_titulos_menu_lateral);
        iconos_menu_lateral = getResources().obtainTypedArray(R.array.array_iconos_menu_lateral);
        iconos_menu_lateral_b = getResources().obtainTypedArray(R.array.array_iconos_menu_lateral_b);
        iconos_menu_lateral_r = getResources().obtainTypedArray(R.array.array_iconos_menu_lateral_r);

        //Noticias
        items_menu.add(new Item_Menu_Lateral(0, titulos_menu_lateral[0], iconos_menu_lateral.getResourceId(0, -1), iconos_menu_lateral_b.getResourceId(0, -1), iconos_menu_lateral_r.getResourceId(0, -1), true, "0"));
        //Perfil
        items_menu.add(new Item_Menu_Lateral(1, titulos_menu_lateral[1], iconos_menu_lateral.getResourceId(1, -1), iconos_menu_lateral_b.getResourceId(1, -1), iconos_menu_lateral_r.getResourceId(1, -1), true, "0"));

        switch (Integer.parseInt(rol_id)){
            case 2: //ADMIN
                //Avance
                items_menu.add(new Item_Menu_Lateral(2, titulos_menu_lateral[2], iconos_menu_lateral.getResourceId(2, -1), iconos_menu_lateral_b.getResourceId(2, -1), iconos_menu_lateral_r.getResourceId(2, -1), true, "0"));
                //Notificaciones
                items_menu.add(new Item_Menu_Lateral(3, titulos_menu_lateral[3], iconos_menu_lateral.getResourceId(3, -1), iconos_menu_lateral_b.getResourceId(3, -1), iconos_menu_lateral_r.getResourceId(3, -1), true, "0"));
                //Inspeccion
                items_menu.add(new Item_Menu_Lateral(4, titulos_menu_lateral[4], iconos_menu_lateral.getResourceId(4, -1), iconos_menu_lateral_b.getResourceId(4, -1), iconos_menu_lateral_r.getResourceId(5, -1), true, "0"));
                //Pagos
                items_menu.add(new Item_Menu_Lateral(5, titulos_menu_lateral[5], iconos_menu_lateral.getResourceId(5, -1), iconos_menu_lateral_b.getResourceId(5, -1), iconos_menu_lateral_r.getResourceId(6, -1), true, "0"));
                break;
            case 3: //REPRESENTANTE
                //Avance
                items_menu.add(new Item_Menu_Lateral(2, titulos_menu_lateral[2], iconos_menu_lateral.getResourceId(2, -1), iconos_menu_lateral_b.getResourceId(2, -1), iconos_menu_lateral_r.getResourceId(2, -1), true, "0"));
                //Notificaciones
                items_menu.add(new Item_Menu_Lateral(3, titulos_menu_lateral[3], iconos_menu_lateral.getResourceId(3, -1), iconos_menu_lateral_b.getResourceId(3, -1), iconos_menu_lateral_r.getResourceId(3, -1), true, "0"));
                //Inspeccion
                items_menu.add(new Item_Menu_Lateral(4, titulos_menu_lateral[4], iconos_menu_lateral.getResourceId(4, -1), iconos_menu_lateral_b.getResourceId(4, -1), iconos_menu_lateral_r.getResourceId(5, -1), true, "0"));
                //Pagos
                items_menu.add(new Item_Menu_Lateral(5, titulos_menu_lateral[5], iconos_menu_lateral.getResourceId(5, -1), iconos_menu_lateral_b.getResourceId(5, -1), iconos_menu_lateral_r.getResourceId(6, -1), true, "0"));
                break;
            case 8: //SICYT LECTURA
                //Avance
                items_menu.add(new Item_Menu_Lateral(2, titulos_menu_lateral[2], iconos_menu_lateral.getResourceId(2, -1), iconos_menu_lateral_b.getResourceId(2, -1), iconos_menu_lateral_r.getResourceId(2, -1), true, "0"));
                //Notificaciones
                items_menu.add(new Item_Menu_Lateral(3, titulos_menu_lateral[3], iconos_menu_lateral.getResourceId(3, -1), iconos_menu_lateral_b.getResourceId(3, -1), iconos_menu_lateral_r.getResourceId(3, -1), true, "0"));
                //Inspeccion
                items_menu.add(new Item_Menu_Lateral(4, titulos_menu_lateral[4], iconos_menu_lateral.getResourceId(4, -1), iconos_menu_lateral_b.getResourceId(4, -1), iconos_menu_lateral_r.getResourceId(5, -1), true, "0"));
                //Pagos
                items_menu.add(new Item_Menu_Lateral(5, titulos_menu_lateral[5], iconos_menu_lateral.getResourceId(5, -1), iconos_menu_lateral_b.getResourceId(5, -1), iconos_menu_lateral_r.getResourceId(6, -1), true, "0"));
                break;
            case 9: //SICYT EDITAR
                //Avance
                items_menu.add(new Item_Menu_Lateral(2, titulos_menu_lateral[2], iconos_menu_lateral.getResourceId(2, -1), iconos_menu_lateral_b.getResourceId(2, -1), iconos_menu_lateral_r.getResourceId(2, -1), true, "0"));
                //Notificaciones
                items_menu.add(new Item_Menu_Lateral(3, titulos_menu_lateral[3], iconos_menu_lateral.getResourceId(3, -1), iconos_menu_lateral_b.getResourceId(3, -1), iconos_menu_lateral_r.getResourceId(3, -1), true, "0"));
                //Inspeccion
                items_menu.add(new Item_Menu_Lateral(4, titulos_menu_lateral[4], iconos_menu_lateral.getResourceId(4, -1), iconos_menu_lateral_b.getResourceId(4, -1), iconos_menu_lateral_r.getResourceId(5, -1), true, "0"));
                //Pagos
                items_menu.add(new Item_Menu_Lateral(5, titulos_menu_lateral[5], iconos_menu_lateral.getResourceId(5, -1), iconos_menu_lateral_b.getResourceId(5, -1), iconos_menu_lateral_r.getResourceId(6, -1), true, "0"));
                break;
            case 4: //GESTOR
                //Avance
                items_menu.add(new Item_Menu_Lateral(2, titulos_menu_lateral[2], iconos_menu_lateral.getResourceId(2, -1), iconos_menu_lateral_b.getResourceId(2, -1), iconos_menu_lateral_r.getResourceId(2, -1), true, "0"));
                //Notificaciones
                items_menu.add(new Item_Menu_Lateral(3, titulos_menu_lateral[3], iconos_menu_lateral.getResourceId(3, -1), iconos_menu_lateral_b.getResourceId(3, -1), iconos_menu_lateral_r.getResourceId(3, -1), true, "0"));
                break;
            case 6: //INSPECTOR
                //Notificaciones
                items_menu.add(new Item_Menu_Lateral(3, titulos_menu_lateral[3], iconos_menu_lateral.getResourceId(3, -1), iconos_menu_lateral_b.getResourceId(3, -1), iconos_menu_lateral_r.getResourceId(3, -1), true, "0"));
                //Inspeccion
                items_menu.add(new Item_Menu_Lateral(4, titulos_menu_lateral[4], iconos_menu_lateral.getResourceId(4, -1), iconos_menu_lateral_b.getResourceId(4, -1), iconos_menu_lateral_r.getResourceId(5, -1), true, "0"));
                break;
        }

        //Salir
        items_menu.add(new Item_Menu_Lateral(6, titulos_menu_lateral[6], iconos_menu_lateral.getResourceId(6, -1), iconos_menu_lateral_b.getResourceId(6, -1), iconos_menu_lateral_r.getResourceId(7, -1), true, "0"));

        iconos_menu_lateral.recycle();
        adapter = new Adaptador_Menu_Lateral(Activity_Main.this, items_menu, new Adaptador_Menu_Lateral.OnItemClickListener() {
            @Override
            public void OnItemClick(Item_Menu_Lateral item_menu_lateral) {
                mostrar_fragment(item_menu_lateral.getPosition(), item_menu_lateral.getIcono_b());
            }
        });

        lista_menu_lateral.setAdapter(adapter);
        mostrar_fragment(0, items_menu.get(0).getIcono_b());
    }

    public void mostrar_fragment(int position, int icono_b) {
        Fragment fragment = null;
        android.support.v4.app.FragmentManager fra = getSupportFragmentManager();

        switch (position) {
            case 0: fragment = new Fragment_Noticias(); break;
            case 1: fragment = new Fragment_Perfil(); break;
            case 2: fragment = new Fragment_Avance(rol_id); break;
            case 3: fragment = new Fragment_Notificaciones(rol_id, fra); break;
            case 4: fragment = new Fragment_Inspeccion(rol_id, fra); break;
            case 5: fragment = new Fragment_Pagos(rol_id); break;
            case 6:
                //Checar si es Inspector
                if(rol_id.equals("6")){

                    //Checar si hay info en la BD para enviar al Server
                    Tabla_Respuestas t = new Tabla_Respuestas(Activity_Main.this);
                    Cursor c = t.consultarExistenRespuestas();

                    //Agregar id_inspeccion a una List<String> para enviar al Server...
                    final List<String> lista_inspecciones = new ArrayList<>();

                    if(c.getCount() > 0){
                        try {
                            if (c.moveToFirst()) {
                                do {
                                    lista_inspecciones.add(c.getString(c.getColumnIndex(Tabla_Respuestas.RE_ID_INSPECCION)));
                                } while (c.moveToNext());
                            }
                        } finally {
                            c.close();
                        }

                        //Si hay info sin enviar al Server. Mostrar msj al Inspector para ver que hacer...
                        new android.app.AlertDialog.Builder(new ContextThemeWrapper(this, R.style.myDialog))
                                .setTitle("¿Seguro que desea salir de la App SIIGES?")
                                .setMessage("Se ha detectado que usted inició sesión como Inspector y existen respuestas sin enviar al Servidor. " +
                                        "Desea guardar estas inspecciones en el Servidor para descargarlas la próxima vez que inicie sesión o desea eliminar las inspecciones guardadas?")
                                .setPositiveButton("Enviar Inspecciones al Servidor", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialogInterface, int i) {

                                        //Solo si hay internet podra realizar la accion...
                                        if(new Check_Internet().isConnected(Activity_Main.this)){

                                            //Aqui enviar info al Server...
                                            new tareaSegundoPlano(lista_inspecciones).execute();
                                        } else {
                                            Toast.makeText(Activity_Main.this, "Necesita conexión a Internet para realizar esta acción", Toast.LENGTH_LONG).show();
                                        }

                                    }
                                })
                                .setNegativeButton("Eliminar Inspecciones y Salir", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialogInterface, int i) {

                                        //Solo si hay internet podra realizar la accion...
                                        if(new Check_Internet().isConnected(Activity_Main.this)){

                                            //Aqui eliminar BD interna y actualizar status a 1 = Nuevo
                                            new Tabla_Comentarios(Activity_Main.this).eliminarComentariosTodos();
                                            new Tabla_Preguntas(Activity_Main.this).eliminarPreguntas();
                                            new Tabla_Respuestas(Activity_Main.this).eliminarRespuestasTodas();
                                            new Tabla_Respuestas_Acta(Activity_Main.this).eliminarRespuestasActaTodos();

                                            String url = "control-inspeccion.php";
                                            Conectar_HttpPost conectar = new Conectar_HttpPost();

                                            for (int k = 0; k<lista_inspecciones.size(); k++){
                                                HashMap<String, String> parametros = new HashMap<>();

                                                parametros.put("webService","actulizarEstatus");
                                                parametros.put("id", lista_inspecciones.get(k));
                                                parametros.put("nuevo_estatus", "1"); //Status En Proceso = 2

                                                conectar.enviarParametros(url, parametros, Activity_Main.this);
                                            }

                                            new tareaDesligarToken().execute();
                                            //mostrarMsjSalir();
                                        } else {
                                            Toast.makeText(Activity_Main.this, "Necesita conexión a Internet para realizar esta acción", Toast.LENGTH_LONG).show();
                                        }
                                    }
                                })
                                .show();
                    } else {
                        new tareaDesligarToken().execute();
                        //mostrarMsjSalir();
                        break;
                    }

                } else {
                    new tareaDesligarToken().execute();
                    //mostrarMsjSalir();
                    break;
                }
        }

        if (fragment != null) {
            FragmentManager fragmentManager = getFragmentManager();
            fragmentManager.beginTransaction().replace(R.id.frame_contenedor, fragment).commit();

            actionBar.setTitle(titulos_menu_lateral[position]);
            icono_superior = icono_b;
            titulo_actual = titulos_menu_lateral[position];
            layout_menu_lateral.closeDrawer(layMenuLateral);

            invalidateOptionsMenu();
        } else {
            Log.e("MainActivity", "Error in creating fragment");
        }
    }

    public void mostrarMsjSalir(){
        final ProgressDialog dialog = new ProgressDialog(Activity_Main.this);
        dialog.setMessage(Html.fromHtml("<b>Cerrando sesión en SIIGES<br><br></b>"+
                "<font color=#791518>Espere por favor...</font>"));
        dialog.setCancelable(false);
        dialog.show();

        Handler handler = new Handler();
        handler.postDelayed(new Runnable() {
            public void run() {
                SharedPreferences.Editor editor = getSharedPreferences("SIIGA_BD", MODE_PRIVATE).edit();
                editor.putBoolean("recordar_contrasena", false);
                editor.commit();

                dialog.dismiss();
                Activity_Main.this.finish();
            }
        }, 1000);

    }

    public JSONObject desligar_token(){
        JSONObject jsonObject = new JSONObject();
        SharedPreferences prefs = getSharedPreferences("SIIGA_BD", MODE_PRIVATE);
        String usuario_id = prefs.getString("usuario_id","0");

        Conectar_HttpPost conectar = new Conectar_HttpPost();
        String url_token = "control-usuario.php";

        HashMap<String, String> parametros_token = new HashMap<>();

        parametros_token.put("webService","guardar");
        parametros_token.put("id", usuario_id);
        parametros_token.put("token_notificaciones","-1");

        jsonObject = conectar.enviarParametros(url_token, parametros_token, Activity_Main.this);

        return  jsonObject;

    }

    public JSONObject formarJsonRespuesta(String id_inspeccion){

        Tabla_Respuestas tabla_respuestas = new Tabla_Respuestas(Activity_Main.this);
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

        Tabla_Comentarios tabla_comentarios = new Tabla_Comentarios(Activity_Main.this);
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
            Log.e("--", ""+jsonPadre);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return jsonPadre;
    }

    private class tareaSegundoPlano extends AsyncTask<Void, Integer, Boolean> {

        private ProgressDialog dialog;
        private List<String> lista_inspecciones;
        String url = "control-inspeccion.php";

        public tareaSegundoPlano(List<String> lista_inspecciones) {
            this.lista_inspecciones = lista_inspecciones;
        }

        @Override
        protected void onPreExecute() {
            dialog = new ProgressDialog(Activity_Main.this);
            dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
            dialog.setCancelable(false);
            dialog.setMessage(Html.fromHtml
                    ("<b>Espere un momento por favor<br><br></b>"+
                            "<font color=#791518>Enviando Inspección al Server...</font>"));
            dialog.show();
        }

        @Override
        protected Boolean doInBackground(Void... params) {

            for (int j=0; j<lista_inspecciones.size(); j++){
                Conectar_HttpPost conectar = new Conectar_HttpPost();
                HashMap<String, String> parametros = new HashMap<>();

                JSONObject jsonObject = formarJsonRespuesta(lista_inspecciones.get(j));

                parametros.put("webService","guardarInspeccion");
                parametros.put("datos", jsonObject.toString());

                conectar.enviarParametros(url, parametros, Activity_Main.this);
            }
            return true;
        }

        @Override
        protected void onPostExecute(Boolean b) {
            if(b){dialog.dismiss();}

            SharedPreferences.Editor editor = getSharedPreferences("SIIGA_BD", MODE_PRIVATE).edit();
            editor.putBoolean("recordar_contrasena", false);
            editor.commit();

            Activity_Main.this.finish();
        }
    }

    private class tareaDesligarToken extends AsyncTask<Void, Integer, Boolean> {

        private ProgressDialog dialog;
        private JSONObject jsonObject;

        @Override
        protected void onPreExecute() {
            dialog = new ProgressDialog(Activity_Main.this);
            dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
            dialog.setCancelable(false);
            dialog.setMessage(Html.fromHtml
                    ("<b>Espere un momento por favor<br><br></b>"+
                            "<font color=#791518>Cerrando Sesión en SIIGES...</font>"));
            dialog.show();
        }

        @Override
        protected Boolean doInBackground(Void... params) {
            jsonObject = desligar_token();
            return true;
        }

        @Override
        protected void onPostExecute(Boolean b) {
            try {

                if(jsonObject.getInt("status") == 200){
                    //mostrarMsjSalir();
                    SharedPreferences.Editor editor = getSharedPreferences("SIIGA_BD", MODE_PRIVATE).edit();
                    editor.putBoolean("recordar_contrasena", false);
                    editor.commit();

                    dialog.dismiss();
                    Activity_Main.this.finish();

                } else {
                    Toast.makeText(getApplicationContext(), "Hubo un problema al desligar el Token. Contacte al Administrador", Toast.LENGTH_LONG).show();
                }

            } catch (JSONException e) {
                e.printStackTrace();
            }

            if(b){dialog.dismiss();}

        }
    }
}
