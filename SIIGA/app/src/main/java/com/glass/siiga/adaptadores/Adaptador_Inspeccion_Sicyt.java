package com.glass.siiga.adaptadores;

import android.graphics.Color;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.glass.siiga.R;
import com.glass.siiga.objetos.Respuesta;
import com.glass.siiga.objetos.Respuesta_Acta;
import com.glass.siiga.objetos.Respuesta_Acta_Sicyt;

import java.util.List;

public class Adaptador_Inspeccion_Sicyt extends RecyclerView.Adapter<Adaptador_Inspeccion_Sicyt.Inspeccion_ViewHolder> {

    private List<Respuesta_Acta_Sicyt> lista_pregunta_apartado;

    public Adaptador_Inspeccion_Sicyt(List<Respuesta_Acta_Sicyt> lista_pregunta_apartado) {
        this.lista_pregunta_apartado = lista_pregunta_apartado;
    }

    @Override
    public Inspeccion_ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.plantilla_celdas_perfil, parent, false);
        return new Inspeccion_ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull Inspeccion_ViewHolder holder, int position) {
        holder.bind(lista_pregunta_apartado.get(position), position);
    }

    @Override
    public int getItemCount() {
        return lista_pregunta_apartado.size();
    }

    public class Inspeccion_ViewHolder extends RecyclerView.ViewHolder{

        private TextView txtCualidadPerfil;
        private TextView txtDescripcionPerfil;
        private LinearLayout layCeldasPerfil;

        public Inspeccion_ViewHolder(View itemView) {
            super(itemView);

            txtCualidadPerfil = (TextView) itemView.findViewById(R.id.txtCualidadPerfil);
            txtDescripcionPerfil = (TextView) itemView.findViewById(R.id.txtDescripcionPerfil);
            layCeldasPerfil = (LinearLayout) itemView.findViewById(R.id.layCeldasPerfil);
        }

        public void bind(Respuesta_Acta_Sicyt pregunta_apartado, final int position) {

            if(position % 2 == 0){
                layCeldasPerfil.setBackgroundColor(Color.parseColor("#F9F9F9"));
            } else{
                layCeldasPerfil.setBackgroundColor(Color.parseColor("#FFFFFF"));
            }

            txtCualidadPerfil.setText(pregunta_apartado.getPregunta());
            txtDescripcionPerfil.setText(pregunta_apartado.getRespuesta());
        }
    }
}
