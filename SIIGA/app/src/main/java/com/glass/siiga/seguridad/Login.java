package com.glass.siiga.seguridad;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.Html;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.glass.siiga.R;
import com.glass.siiga.activity.Activity_Main;
import com.glass.siiga.conexion.Conectar_HttpPost;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;

/**
 * Desarrollado por Mtro. Juan Arturo Gomez Resendiz
 * arturo.g.resendiz@gmail.com
 **/

public class Login extends Activity {

    private EditText etUsuarioLogin, etPassLogin;
    private TextView txtPoliticasLogin;
    private Button btnInciarLogin;
    private String url = "control-usuario.php";
    private String titulo, mensaje, usuario_id, persona_id, rol_id;
    private int status;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        etUsuarioLogin = (EditText) findViewById(R.id.etUsuarioLogin);
        etPassLogin = (EditText) findViewById(R.id.etPassLogin);
        btnInciarLogin = (Button) findViewById(R.id.btnIniciarLogin);
        txtPoliticasLogin = (TextView) findViewById(R.id.txtPoliticasLogin);

        btnInciarLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(validarCamposLlenos()){

                    //Comienza validando las credenciales
                    new tareaSegundoPlano(1).execute();
                }
            }
        });

        txtPoliticasLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Uri uri = Uri.parse("http://www.google.com"); // missing 'http://' will cause crashed
                Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                startActivity(intent);
            }
        });
    }

    public boolean validarCamposLlenos(){
        if(TextUtils.isEmpty(etUsuarioLogin.getText().toString())){
            etUsuarioLogin.setError("Introduzca su nombre de Usuario");
            return false;
        } else if(TextUtils.isEmpty(etPassLogin.getText().toString())){
            etPassLogin.setError("Introduzca su contraseña");
            return false;
        } else {
            return true;
        }
    }

    public JSONObject enviarDatos(){
        JSONObject jsonObjRecibido;
        Conectar_HttpPost conectar = new Conectar_HttpPost();

        HashMap<String, String> parametros = new HashMap<>();
        parametros.put("webService","validarInicioSesion");
        parametros.put("usuario",""+etUsuarioLogin.getText().toString());
        parametros.put("contrasena",""+etPassLogin.getText().toString());

        jsonObjRecibido = conectar.enviarParametros(url, parametros, Login.this);
        return jsonObjRecibido;
    }

    public void validarRespuesta(){
        JSONObject jsonRecibido = enviarDatos();
        try {
            if(jsonRecibido.getInt("status") == 200){
                status = 200;
                titulo = "Éxito!";
                mensaje = jsonRecibido.getString("message");
                usuario_id = jsonRecibido.getJSONObject("data").getString("id");
                persona_id  = jsonRecibido.getJSONObject("data").getString("persona_id");
                rol_id = jsonRecibido.getJSONObject("data").getString("rol_id");
            } else {
                status = 500;
                titulo = "Error!";
                mensaje = jsonRecibido.getString("message");
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public void mostrarPopUp() {
        final LayoutInflater inflater = (LayoutInflater)getSystemService(LAYOUT_INFLATER_SERVICE);
        final AlertDialog.Builder imageDialog = new AlertDialog.Builder(Login.this, R.style.MyDialogTheme);
        View layout = inflater.inflate(R.layout.pop_up_general, (ViewGroup) findViewById(R.id.cvPopUpGral));

        ImageView imgPopUpCerrar = (ImageView) layout.findViewById(R.id.imgCerrarPopUpGral);
        TextView subtitlePopUp = (TextView) layout.findViewById(R.id.txtMensajePopUpGral);
        TextView titlePopUp = (TextView) layout.findViewById(R.id.txtTituloPopUpGral);
        Button btnPopUp = (Button) layout.findViewById(R.id.btnPopUpGral);

        subtitlePopUp.setText(mensaje);
        titlePopUp.setText(titulo);

        imageDialog.setView(layout);
        final AlertDialog alert = imageDialog.create();
        alert.getWindow().setBackgroundDrawableResource(android.R.color.transparent);
        alert.setCancelable(false);
        alert.show();

        btnPopUp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                alert.dismiss();
            }
        });

        imgPopUpCerrar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                alert.dismiss();
            }
        });
    }

    public void entrarApp(){
        SharedPreferences.Editor editor = getSharedPreferences("SIIGA_BD", MODE_PRIVATE).edit();
        editor.putString("usuario", etUsuarioLogin.getText().toString());
        editor.putString("usuario_id", usuario_id);
        editor.putString("persona_id", persona_id);
        editor.putString("rol_id", rol_id);
        editor.putString("contrasena", etPassLogin.getText().toString());
        editor.putBoolean("mostrar_intro", false);
        editor.putBoolean("recordar_contrasena", true);

        editor.commit();

        //Iniciar la App SIIGA
        Toast.makeText(Login.this, "Bienvenido", Toast.LENGTH_SHORT).show();
        Intent ir = new Intent(Login.this, Activity_Main.class);
        ir.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        startActivity(ir);
        Login.this.finish();
        finishAffinity();
    }

    public void enviarToken(){
        Conectar_HttpPost conectar = new Conectar_HttpPost();
        String url_token = "control-usuario.php";

        SharedPreferences prefs = getSharedPreferences("SIIGA_BD", MODE_PRIVATE);
        HashMap<String, String> parametros_token = new HashMap<>();

        parametros_token.put("webService","guardar");
        parametros_token.put("id",""+usuario_id);
        parametros_token.put("token_notificaciones",""+prefs.getString("token","0"));

        conectar.enviarParametros(url_token, parametros_token, Login.this);
    }


    private class tareaSegundoPlano extends AsyncTask<Void, Integer, Boolean> {

        ProgressDialog dialog;
        int numero;

        public tareaSegundoPlano(int numero){
            this.numero = numero;
        }

        @Override
        protected void onPreExecute() {
            dialog = new ProgressDialog(Login.this);
            dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
            dialog.setCancelable(false);
            dialog.setMessage(Html.fromHtml
                    ("<b>Espere un momento por favor<br><br></b>"+
                            "<font color=#791518>Validando credenciales...</font>"));
            dialog.show();
        }

        @Override
        protected Boolean doInBackground(Void... params) {

            if(numero == 1){
                //Valida si las credenciales fueron correctas
                //Retorna status (200 o 500)
                validarRespuesta();

            } else{
                //Envia el token para registrarlo
                enviarToken();
            }

            return true;
        }

        @Override
        protected void onPostExecute(Boolean b) {
            if(b){dialog.dismiss();}

            if(numero == 1){

                if(status == 200){

                    //Las credenciales fueron correctas
                    //Ahora a enviar el token al Server...
                    new tareaSegundoPlano(2).execute();

                } else {

                    //Las credenciales fueron incorrectas
                    //Mostrar msj al usuario para hacerle saber
                    mostrarPopUp();
                }
            } else {

                //Ya se envió el Token...
                //Ahora a entrar a la App
                entrarApp();
            }

        }
    }
}
