package com.glass.siiga.adaptadores;

import android.content.Context;
import android.database.Cursor;
import android.graphics.Color;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.glass.siiga.R;
import com.glass.siiga.objetos.Inspeccion;
import com.glass.siiga.objetos.Pregunta;
import com.glass.siiga.objetos.Respuesta;
import com.glass.siiga.objetos.Respuesta_Acta;
import com.glass.siiga.tablas.Tabla_Respuestas;

import java.util.List;

public class Adaptador_Preguntas_Acta_Inspeccion extends RecyclerView.Adapter<Adaptador_Preguntas_Acta_Inspeccion.Acta_ViewHolder> {

    private Context context;
    private List<Respuesta_Acta> lista_respuestas;

    public Adaptador_Preguntas_Acta_Inspeccion(Context context, List<Respuesta_Acta> lista_respuestas) {
        this.context = context;
        this.lista_respuestas = lista_respuestas;
    }

    @NonNull
    @Override
    public Acta_ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.plantilla_celdas_perfil, parent, false);
        return new Acta_ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull Acta_ViewHolder holder, int position) {
        holder.bind(lista_respuestas.get(position), position);
    }

    @Override
    public int getItemCount() {
        return lista_respuestas.size();
    }


    public class Acta_ViewHolder extends RecyclerView.ViewHolder{

        private LinearLayout layCeldas;
        private TextView txtTitulo;
        private TextView txtValor;


        public Acta_ViewHolder(View itemView) {
            super(itemView);

            layCeldas = (LinearLayout) itemView.findViewById(R.id.layCeldasPerfil);
            txtTitulo = (TextView) itemView.findViewById(R.id.txtCualidadPerfil);
            txtValor = (TextView) itemView.findViewById(R.id.txtDescripcionPerfil);
        }

        public void bind(final Respuesta_Acta respuesta, final int position){

            txtTitulo.setText("Descripción");
            txtValor.setText(respuesta.getRespuesta());

            if(position % 2 == 0){
                layCeldas.setBackgroundColor(Color.parseColor("#F9F9F9"));
            } else{
                layCeldas.setBackgroundColor(Color.parseColor("#FFFFFF"));
            }

        }
    }
}
