package com.glass.siiga.adaptadores;

import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.glass.siiga.R;
import com.glass.siiga.objetos.Noticia;

import java.util.ArrayList;
import java.util.List;

public class Adaptador_Noticias extends RecyclerView.Adapter<Adaptador_Noticias.Noticias_ViewHolder> {

    private List<Noticia> lista_noticias;
    private Interface_OnClick objetoInterface;

    public Adaptador_Noticias(List<Noticia> lista_noticias, Interface_OnClick objetoInterface){
        this.lista_noticias = lista_noticias;
        this.objetoInterface = objetoInterface;
    }

    @Override
    public Noticias_ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.plantilla_celdas_noticias, parent, false);
        return new Noticias_ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(Noticias_ViewHolder holder, int position) {
        holder.bind(lista_noticias.get(position), objetoInterface);
    }

    @Override
    public int getItemCount() {
        return lista_noticias.size();
    }

    public interface Interface_OnClick{
        void OnItemClick(Noticia noticias);

    }

    public class Noticias_ViewHolder extends RecyclerView.ViewHolder{

        private TextView txtTituloNoticia;
        private TextView txtMsjNoticia;
        private ImageView imgNoticia;

        public Noticias_ViewHolder(View itemView) {
            super(itemView);

            txtTituloNoticia = (TextView) itemView.findViewById(R.id.txtTituloNoticia);
            txtMsjNoticia = (TextView) itemView.findViewById(R.id.txtMsjNoticia);
            imgNoticia = (ImageView) itemView.findViewById(R.id.imgNoticia);
        }

        public void bind(final Noticia noticias, final Interface_OnClick objetoInterface){
            txtTituloNoticia.setText(noticias.getTitulo());
            txtMsjNoticia.setText(noticias.getNombre());

            /*String icono = noticias.getIcono();
            Picasso.get().load(icono).into(ivIconosAjustes);*/

            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    objetoInterface.OnItemClick(noticias);
                }
            });
        }
    }
}
