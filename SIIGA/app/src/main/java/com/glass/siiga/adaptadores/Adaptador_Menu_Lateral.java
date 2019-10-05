package com.glass.siiga.adaptadores;

import android.content.Context;
import android.graphics.Color;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.glass.siiga.R;
import com.glass.siiga.objetos.Item_Menu_Lateral;

import java.util.ArrayList;

public class Adaptador_Menu_Lateral extends RecyclerView.Adapter<Adaptador_Menu_Lateral.Adaptador_Menu_Lateral_ViewHolder> {

    private ArrayList<Item_Menu_Lateral> items_menu;
    private Context context;
    private OnItemClickListener onItemClickListener;
    private int indice_fila = 0;

    public Adaptador_Menu_Lateral(Context context, ArrayList<Item_Menu_Lateral> items_menu, OnItemClickListener onItemClickListener){
        this.items_menu = items_menu;
        this.context = context;
        this.onItemClickListener = onItemClickListener;
    }

    @Override
    public Adaptador_Menu_Lateral_ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.plantilla_item_menu_lateral, parent, false);

        return new Adaptador_Menu_Lateral_ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(Adaptador_Menu_Lateral_ViewHolder holder, int position) {
        holder.bind(position, items_menu.get(position), onItemClickListener);
    }

    @Override
    public int getItemCount() {
        return items_menu.size();
    }

    public interface OnItemClickListener{
        void OnItemClick(Item_Menu_Lateral item_menu_lateral);
    }

    public class Adaptador_Menu_Lateral_ViewHolder extends RecyclerView.ViewHolder {

        private ImageView icono;
        private TextView titulo;
        private TextView contador;

        public Adaptador_Menu_Lateral_ViewHolder(View itemView) {
            super(itemView);

            icono = (ImageView) itemView.findViewById(R.id.icono);
            titulo = (TextView) itemView.findViewById(R.id.titulo);
            contador = (TextView) itemView.findViewById(R.id.contador);
        }

        public void bind(final int position, final Item_Menu_Lateral item_menu_lateral, final OnItemClickListener listener) {

            icono.setImageResource(item_menu_lateral.getIcono());
            titulo.setText(item_menu_lateral.getTitulo());

            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    indice_fila = position;
                    notifyDataSetChanged();
                    listener.OnItemClick(item_menu_lateral);
                }
            });

            //Agregar color al icono seleccionado
            if(indice_fila == position){
                icono.setColorFilter(context.getResources().getColor(R.color.rojoDebil));
                titulo.setTextColor(context.getResources().getColor(R.color.rojoDebil));
            } else {
                icono.setColorFilter(Color.parseColor("#999999"));
                titulo.setTextColor(Color.parseColor("#999999"));
            }
        }
    }
}
