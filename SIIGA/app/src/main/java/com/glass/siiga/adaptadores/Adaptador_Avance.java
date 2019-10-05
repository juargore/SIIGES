package com.glass.siiga.adaptadores;

import android.graphics.Color;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.glass.siiga.R;
import com.glass.siiga.objetos.Etapa_Avance;

import java.util.List;

public class Adaptador_Avance extends RecyclerView.Adapter<Adaptador_Avance.Avance_ViewHolder> {

    private List<Etapa_Avance> lista;
    private Interface_OnClick objetoInterface;

    public Adaptador_Avance(List<Etapa_Avance> lista, Interface_OnClick objetoInterface) {
        this.lista = lista;
        this.objetoInterface = objetoInterface;
    }

    @Override
    public Avance_ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.plantilla_celdas_avance, parent, false);
        return new Avance_ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull Avance_ViewHolder holder, int position) {
        holder.bind(position, lista.get(position), objetoInterface);
    }

    @Override
    public int getItemCount() {
        return lista.size();
    }

    public interface Interface_OnClick{
        void OnItemClick(Etapa_Avance etapa);

    }

    public class Avance_ViewHolder extends RecyclerView.ViewHolder{

        private LinearLayout layPadreAvance;
        private TextView txtAvNombre;
        private TextView txtAvDescripcion;
        private TextView txtAvStatus;
        private ImageView imgAvIcono;

        public Avance_ViewHolder(View itemView) {
            super(itemView);

            layPadreAvance = (LinearLayout) itemView.findViewById(R.id.layPadreAvance);
            txtAvNombre = itemView.findViewById(R.id.txtAvNombre);
            txtAvDescripcion = itemView.findViewById(R.id.txtAvDescripcion);
            txtAvStatus = itemView.findViewById(R.id.txtAvStatus);
            imgAvIcono = itemView.findViewById(R.id.imgAvIcono);
        }

        public void bind(int position, final Etapa_Avance etapa, final Interface_OnClick objetoInterface){

            if(etapa.getStatus() == 0){
                imgAvIcono.setImageResource(R.drawable.ic_white_pause);
                txtAvStatus.setText("En proceso");
            }

            if(position % 2 == 0){
                layPadreAvance.setBackgroundColor(Color.parseColor("#FFFFFF"));
            } else {
                layPadreAvance.setBackgroundColor(Color.parseColor("#F9F9F9"));
            }

            txtAvNombre.setText(etapa.getNombre_etapa());
            txtAvDescripcion.setText(etapa.getDescripcion());

            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    objetoInterface.OnItemClick(etapa);
                }
            });
        }
    }
}
