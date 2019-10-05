package com.glass.siiga.clases_gral;

import android.content.Context;

import com.glass.siiga.R;

public class Pantalla {

    public int getOrientation(Context c){
        return c.getResources().getConfiguration().orientation;
    }

    public boolean esTablet(Context c){
        return c.getResources().getBoolean(R.bool.esTablet);
    }

}
