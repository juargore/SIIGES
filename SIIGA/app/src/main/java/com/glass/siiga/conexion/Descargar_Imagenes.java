package com.glass.siiga.conexion;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.StrictMode;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;


/**
 * Created by Arturo on 2/12/2018.
 */

public class Descargar_Imagenes {

    public Bitmap obtenerImagen(String url) throws IOException {

        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);

        Bitmap imagen;
        InputStream imagenEntrante;

        imagenEntrante = new URL(url).openStream();
        imagen = BitmapFactory.decodeStream(imagenEntrante);

        if(imagenEntrante != null) imagenEntrante.close();

        return imagen;
    }
}
