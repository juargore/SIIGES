package com.glass.siiga.adaptadores;

import android.app.Activity;
import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.glass.siiga.R;
import com.glass.siiga.objetos.Noticia;
import com.glass.siiga.objetos.Notificacion;

import java.util.List;

public class Adaptador_Notificaciones extends RecyclerView.Adapter<Adaptador_Notificaciones.Notificacion_ViewHolder> {

    private Activity activity;
    private List<Notificacion> lista_notificaciones;
    private Interface_OnClick objetoInterface;

    public Adaptador_Notificaciones(Activity activity, List<Notificacion> lista_notif, Interface_OnClick objetoInterface){
        this.activity = activity;
        this.lista_notificaciones = lista_notif;
        this.objetoInterface = objetoInterface;
    }

    @Override
    public Notificacion_ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.plantilla_celdas_notficacion, parent, false);
        return new Notificacion_ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(Notificacion_ViewHolder holder, int position) {
        holder.bind(lista_notificaciones.get(position), objetoInterface);
    }

    @Override
    public int getItemCount() {
        return lista_notificaciones.size();
    }

    public interface Interface_OnClick{
        void OnItemClick(Notificacion notificacion, int procedencia);
    }

    public class Notificacion_ViewHolder extends RecyclerView.ViewHolder{

        private TextView txtTituloNotif;
        private TextView txtMsjNotif;
        private TextView txtFechaNotif;

        public Notificacion_ViewHolder(View itemView) {
            super(itemView);

            txtTituloNotif = (TextView) itemView.findViewById(R.id.txtTituloNotif);
            txtMsjNotif = (TextView) itemView.findViewById(R.id.txtMsjNotif);
            txtFechaNotif = (TextView) itemView.findViewById(R.id.txtFechaNotif);
        }

        public void bind(final Notificacion notif, final Interface_OnClick objetoInterface){
            txtTituloNotif.setText(notif.getTitulo());
            txtMsjNotif.setText(notif.getMensaje());
            txtFechaNotif.setText(notif.getFecha());

            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    objetoInterface.OnItemClick(notif, 0);
                }
            });

            itemView.setOnLongClickListener(new View.OnLongClickListener() {
                @Override
                public boolean onLongClick(View view) {
                    objetoInterface.OnItemClick(notif, 1);
                    return false;
                }
            });
        }
    }
}
