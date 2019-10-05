package com.glass.siiga.activity;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.view.Window;
import android.view.WindowManager;

import com.glass.siiga.R;
import com.glass.siiga.seguridad.Login;

public class Splash_Screen extends Activity {

    private final int SPLASH_DISPLAY_LENGTH = 1000;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash_screen);

        new Handler().postDelayed(new Runnable(){
            @Override
            public void run() {
                SharedPreferences prefs = getSharedPreferences("SIIGA_BD", MODE_PRIVATE);
                Boolean recordar_contrasena = prefs.getBoolean("recordar_contrasena", false);
                Intent ir_inicio;

                if(recordar_contrasena){
                    ir_inicio = new Intent(Splash_Screen.this, Activity_Main.class);
                } else {
                    ir_inicio = new Intent(Splash_Screen.this, Login.class);
                }

                startActivity(ir_inicio);
                Splash_Screen.this.finish();
                overridePendingTransition(R.anim.fade_in, R.anim.fade_out);
            }
        }, SPLASH_DISPLAY_LENGTH);
    }
}
