package com.glass.siiga.activity;

import android.app.ActionBar;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.RequiresApi;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.TabLayout;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.view.ViewPager;
import android.text.Html;
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

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Activity_Inspeccion_II extends FragmentActivity {

    private TabLayout tabsApartados2;
    private ViewPager viewPagerApartados2;
    private FragmentManager fragmentManager;
    private FloatingActionButton fabFinish;
    private List<Apartado> lista_apartados;
    private Adaptador_Tabs_Apartados adapter;
    private ActionBar actionBar;
    private Inspeccion inspeccion;
    private final String url = "control-inspeccion.php";
    private boolean tiene_observaciones = true;

    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setTheme(R.style.MyNoActionBarShadowTheme);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_inspeccion_ii);

        actionBar = getActionBar();
        actionBar.setHomeButtonEnabled(true);
        actionBar.setDisplayHomeAsUpEnabled(true);
        actionBar.setElevation(0);
        actionBar.setIcon(android.R.color.transparent);
        actionBar.setTitle(" Inspección II");
        actionBar.setBackgroundDrawable(new ColorDrawable(getResources().getColor( R.color.rojoFuerte)));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR2) {
            actionBar.setHomeAsUpIndicator(R.mipmap.icon_back);
        }

        //Cambiar color de Status Bar
        Window window = Activity_Inspeccion_II.this.getWindow();
        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        window.setStatusBarColor(getResources().getColor( R.color.rojoFuerte));

        lista_apartados = new ArrayList<>();

        lista_apartados = getIntent().getParcelableArrayListExtra("lista_apartados");
        inspeccion = getIntent().getExtras().getParcelable("inspeccion");

        tabsApartados2 = (TabLayout) findViewById(R.id.tabsApartados2);
        viewPagerApartados2 = (ViewPager) findViewById(R.id.viewpagerApartados2);
        fabFinish = (FloatingActionButton) findViewById(R.id.fabFinish);

        fabFinish.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if(new Check_Internet().isConnected(Activity_Inspeccion_II.this)){
                    new android.app.AlertDialog.Builder(Activity_Inspeccion_II.this, R.style.MyDialogTheme)
                            .setTitle("¿La Inspección tiene observaciones que atender?")
                            .setMessage("¿La presente Inspección tiene observaciones que se deben resolver antes de emitir el Acta de Cierre?")
                            .setPositiveButton("Si tiene Observaciones", new DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface dialogInterface, int i) {
                                    tiene_observaciones = true;
                                    mostrarMensajeActaInspeccion();
                                    new tareaSegundoPlano().execute();
                                }
                            })
                            .setNegativeButton("No tiene Observaciones", new DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface dialogInterface, int i) {
                                    tiene_observaciones = false;
                                    mostrarMensajeActaInspeccion();
                                    new tareaSegundoPlano().execute();
                                }
                            })
                            .show();
                } else {
                    new android.app.AlertDialog.Builder(Activity_Inspeccion_II.this, R.style.MyDialogTheme)
                            .setTitle("Sin Conexión a Internet")
                            .setMessage("Para poder terminar esta inspección y actualizar su estatus,  " +
                                    "\nes necesario que se conecte a internet y vuelva a intentarlo")
                            .setPositiveButton("Entendido", null)
                            .show();
                }
            }
        });

        fragmentManager = getSupportFragmentManager();

        adapter = new Adaptador_Tabs_Apartados(fragmentManager, lista_apartados, 2, inspeccion);
        viewPagerApartados2.setAdapter(adapter);
        viewPagerApartados2.setOffscreenPageLimit(lista_apartados.size());
        tabsApartados2.setupWithViewPager(viewPagerApartados2);
    }

    public void mostrarMensajeActaInspeccion(){
        Toast toast = Toast.makeText(Activity_Inspeccion_II.this, "Ahora ya es posible imprimir el ACTA DE INSPECCIÓN en el sistema web de este folio", Toast.LENGTH_LONG);
        View view = toast.getView();

        view.getBackground().setColorFilter(Color.parseColor("#D02A2D"), PorterDuff.Mode.SRC_IN);
        TextView text = view.findViewById(android.R.id.message);
        text.setTextColor(Color.parseColor("#FFFFFF"));

        toast.show();
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
                finish();
                return true;

            case R.id.menuInfo:
                final LayoutInflater inflater = (LayoutInflater)getSystemService(LAYOUT_INFLATER_SERVICE);
                final AlertDialog.Builder imageDialog = new AlertDialog.Builder(new ContextThemeWrapper(Activity_Inspeccion_II.this, R.style.MyDialogTheme));
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

    public JSONObject enviarDatos(){

        JSONObject jsonObjRecibido;
        Conectar_HttpPost conectar = new Conectar_HttpPost();

        HashMap<String, String> parametros = new HashMap<>();

        parametros.put("webService","actualizarEstatus");
        parametros.put("id", inspeccion.getId_inspeccion());

        if(tiene_observaciones){
            parametros.put("nuevo_estatus", "4");
        } else {
            parametros.put("nuevo_estatus", "3");
        }

        jsonObjRecibido = conectar.enviarParametros(url, parametros, Activity_Inspeccion_II.this);

        return jsonObjRecibido;
    }

    private class tareaSegundoPlano extends AsyncTask<Void, Integer, Boolean> {

        private ProgressDialog dialog;

        @Override
        protected void onPreExecute() {
            dialog = new ProgressDialog(Activity_Inspeccion_II.this);
            dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
            dialog.setCancelable(false);
            dialog.setMessage(Html.fromHtml
                    ("<b>Espere un momento por favor<br><br></b>"+
                            "<font color=#791518>Descargando Inspecciones...</font>"));
            dialog.show();
        }

        @Override
        protected Boolean doInBackground(Void... params) {
            JSONObject j = enviarDatos();

            try {
                if(j.getInt("status") == 200){
                    Fragment_Inspeccion_Inspector.actualizar = true;
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return true;
        }

        @Override
        protected void onPostExecute(Boolean b) {
            if(b){dialog.dismiss();}

            Toast.makeText(Activity_Inspeccion_II.this, "Revisión Terminada", Toast.LENGTH_LONG).show();
            Intent intent = new Intent();
            setResult(RESULT_OK, intent);

            Activity_Inspeccion_II.this.finish();
        }
    }
}
