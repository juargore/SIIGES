package com.glass.siiga.adaptadores;

import android.graphics.Color;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.glass.siiga.R;
import com.glass.siiga.objetos.Perfil_Usuario;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Adaptador_Perfil_Usuario extends RecyclerView.Adapter<Adaptador_Perfil_Usuario.Perfil_ViewHolder> {

    private List<Perfil_Usuario> lista_perfil;
    private OnItemClickListener onItemClickListener;
    private HashMap<String, String> valores;
    private List<String> key, value;

    public Adaptador_Perfil_Usuario(List<Perfil_Usuario> lista_perfil, OnItemClickListener onItemClickListener){
        this.lista_perfil = lista_perfil;
        this.onItemClickListener = onItemClickListener;
        this.valores = lista_perfil.get(0).getValores();

        key = new ArrayList<>();
        value = new ArrayList<>();

        for (Map.Entry<String,String> entry : this.valores.entrySet()) {
            key.add(entry.getKey());
            value.add(entry.getValue());
        }
    }

    @Override
    public Perfil_ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.plantilla_celdas_perfil, parent, false);
        return new Perfil_ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(Perfil_ViewHolder holder, int position) {
        holder.bind(key.get(position), value.get(position), position, onItemClickListener);
    }

    @Override
    public int getItemCount() {
        return valores.size();
    }

    public interface OnItemClickListener{
        void OnItemClick(Perfil_Usuario perfil);
    }

    public class Perfil_ViewHolder extends RecyclerView.ViewHolder{

        private TextView txtCualidadPerfil;
        private TextView txtDescripcionPerfil;
        private LinearLayout layCeldasPerfil;

        public Perfil_ViewHolder(View itemView) {
            super(itemView);
            this.setIsRecyclable(false);

            txtCualidadPerfil = (TextView) itemView.findViewById(R.id.txtCualidadPerfil);
            txtDescripcionPerfil = (TextView) itemView.findViewById(R.id.txtDescripcionPerfil);
            layCeldasPerfil = (LinearLayout) itemView.findViewById(R.id.layCeldasPerfil);
        }

        public void bind(final String key, final String value, int position, final OnItemClickListener listener){

            txtCualidadPerfil.setText(key);
            txtDescripcionPerfil.setText(value);

            if(position % 2 == 0){
                layCeldasPerfil.setBackgroundColor(Color.parseColor("#F9F9F9"));
            } else{
                layCeldasPerfil.setBackgroundColor(Color.parseColor("#FFFFFF"));
            }

            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {

                }
            });
        }
    }
}
