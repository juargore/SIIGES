package com.glass.siiga.conexion;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

import com.glass.siiga.R;

/**
 * Created by Arturo on 2/11/2018.
 */

public class Check_Internet {

    public boolean isConnected(Activity activity){
        ConnectivityManager connectivityManager = (ConnectivityManager)activity.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo activeNetworkInfo = connectivityManager
                .getActiveNetworkInfo();
        return activeNetworkInfo != null;
    }

    public void MsgNoInternet(final Activity activity){
        AlertDialog.Builder builder1 = new AlertDialog.Builder(activity);
        builder1.setMessage(R.string.no_internet);
        builder1.setCancelable(true);
        builder1.setPositiveButton("Entendido",
                new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();

                        activity.finish();
                        activity.moveTaskToBack(true);

                        android.os.Process.killProcess(android.os.Process.myPid());
                    }
                });

        AlertDialog alert11 = builder1.create();
        alert11.show();
    }
}
