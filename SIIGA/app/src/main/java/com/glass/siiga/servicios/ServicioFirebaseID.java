package com.glass.siiga.servicios;

import android.app.Activity;
import android.content.SharedPreferences;
import android.util.Log;

import com.glass.siiga.conexion.Conectar_HttpPost;
import com.google.firebase.iid.FirebaseInstanceId;
import com.google.firebase.iid.FirebaseInstanceIdService;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;

/**
 * Created by Arturo on 5/3/18.
 */

public class ServicioFirebaseID extends FirebaseInstanceIdService {

    @Override
    public void onTokenRefresh() {

        // Get updated InstanceID token.
        String refreshedToken = FirebaseInstanceId.getInstance().getToken();
        Log.e("--", "Refreshed token: " + refreshedToken);
        sendRegistrationToServer(refreshedToken);
    }

    private void sendRegistrationToServer(String token_nuevo) {
        actualizar_token(token_nuevo);
    }

    public void actualizar_token(String token_nuevo){
        String url_actualizar_token = "control-usuario.php";
        HashMap<String, String> parametros_autenticacion = new HashMap<>();

        SharedPreferences prefs = getSharedPreferences("SIIGA_BD", MODE_PRIVATE);
        String id_usuario = prefs.getString("usuario_id","0");

        parametros_autenticacion.put("webService","guardar");
        parametros_autenticacion.put("id",""+id_usuario);
        parametros_autenticacion.put("token_notificaciones", token_nuevo);

        Conectar_HttpPost conectar = new Conectar_HttpPost();
        Activity activity = (Activity) getApplicationContext();
        JSONObject jsonObject = conectar.enviarParametros(url_actualizar_token, parametros_autenticacion, activity);

        try {
            if(jsonObject.getInt("status") == 200){
                SharedPreferences.Editor editor = getSharedPreferences("SIIGA_BD", MODE_PRIVATE).edit();
                editor.putString("token", ""+token_nuevo);
                editor.commit();
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
}
