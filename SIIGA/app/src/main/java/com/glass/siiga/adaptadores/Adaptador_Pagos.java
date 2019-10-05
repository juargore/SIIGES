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
import com.glass.siiga.objetos.Pago;

import java.util.List;

public class Adaptador_Pagos extends RecyclerView.Adapter<Adaptador_Pagos.Pagos_ViewHolder>{

    private List<Pago> lista_pagos;

    public Adaptador_Pagos(List<Pago> lista_pagos) {
        this.lista_pagos = lista_pagos;
    }

    @Override
    public Pagos_ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.plantilla_celdas_pagos, parent, false);
        return new Pagos_ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull Pagos_ViewHolder holder, int position) {
        holder.bind(lista_pagos.get(position), position);
    }

    @Override
    public int getItemCount() {
        return lista_pagos.size();
    }

    public class Pagos_ViewHolder extends RecyclerView.ViewHolder{

        private LinearLayout layContenedorPagos;
        private TextView txtConcepto;
        private TextView txtCobertura;
        private TextView txtFecha;
        private TextView txtMonto;

        public Pagos_ViewHolder(View itemView) {
            super(itemView);

            layContenedorPagos = (LinearLayout) itemView.findViewById(R.id.layContenedorPagos);
            txtConcepto = (TextView) itemView.findViewById(R.id.txtConcepto);
            txtCobertura = (TextView) itemView.findViewById(R.id.txtCobertura);
            txtFecha = (TextView) itemView.findViewById(R.id.txtFecha);
            txtMonto = (TextView) itemView.findViewById(R.id.txtMonto);
        }

        public void bind(Pago pago, final int position) {

            if(position % 2 != 0){
                layContenedorPagos.setBackgroundColor(Color.parseColor("#F2F2F2"));
            } else{
                layContenedorPagos.setBackgroundColor(Color.parseColor("#FFFFFF"));
            }

            txtConcepto.setText(pago.getConcepto());
            txtCobertura.setText(pago.getCobertura());
            txtFecha.setText(pago.getFecha_pago());
            txtMonto.setText(pago.getMonto());
        }
    }
}
