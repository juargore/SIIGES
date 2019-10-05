package com.glass.siiga.adaptadores;

import android.app.Activity;
import android.content.Context;
import android.database.Cursor;
import android.graphics.Color;
import android.support.annotation.NonNull;
import android.support.v7.app.AlertDialog;
import android.support.v7.widget.RecyclerView;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.inputmethod.EditorInfo;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.glass.siiga.R;
import com.glass.siiga.clases_gral.Pantalla;
import com.glass.siiga.objetos.Inspeccion;
import com.glass.siiga.objetos.Pregunta;
import com.glass.siiga.tablas.Tabla_Respuestas;

import java.util.ArrayList;
import java.util.List;

import static android.content.Context.LAYOUT_INFLATER_SERVICE;

public class Adaptador_Preguntas_Inspeccion extends RecyclerView.Adapter<Adaptador_Preguntas_Inspeccion.Preguntas_ViewHolder>{
    private List<Pregunta> lista_preguntas;
    private Interface_OnClick objetoInterface;
    private Context context;
    private Inspeccion inspeccion;
    private Activity activity;
    private Tabla_Respuestas tabla_respuestas;
    private int id_apartado;

    public Adaptador_Preguntas_Inspeccion(Context context, Inspeccion inspeccion, List<Pregunta> lista_preguntas, int id_apartado, Interface_OnClick objetoInterface) {
        this.context = context;
        this.lista_preguntas = lista_preguntas;
        this.objetoInterface = objetoInterface;
        this.inspeccion = inspeccion;
        this.id_apartado = id_apartado;

        activity = (Activity) context;
        tabla_respuestas = new Tabla_Respuestas(activity);
    }

    @Override
    public int getItemViewType(int position) {
        switch (lista_preguntas.get(position).getId_tipo_pregunta()) {
            case 1:
                return 1;
            case 2:
                return 2;
            default:
                return 3;
        }
    }

    @Override
    public Preguntas_ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView;

        switch (viewType){
            case 1:
                itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.plantilla_pregunta_sino, parent, false);
                return new Preguntas_ViewHolder(itemView, 1);

            case 2:
                itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.plantilla_pregunta_numerica, parent, false);
                return new Preguntas_ViewHolder(itemView, 2);

                default:
                    itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.plantilla_pregunta_abierta, parent, false);
                    return new Preguntas_ViewHolder(itemView, 3);
        }
    }

    @Override
    public void onBindViewHolder(@NonNull Preguntas_ViewHolder holder, int position) {
        holder.bind(lista_preguntas.get(position), objetoInterface);
    }

    @Override
    public int getItemCount() {
        return lista_preguntas.size();
    }

    public interface Interface_OnClick{
        void OnItemClick(Pregunta pregunta);
    }

    public class Preguntas_ViewHolder extends RecyclerView.ViewHolder{

        private TextView txtAmpliarPreguntaSINO;
        private TextView txtPreguntaSINO;
        private TextView txtIndicadorPreguntaSINO;
        private LinearLayout layPreguntaSINO;
        private LinearLayout layRespuestaPreguntaSINO;
        private Button btnYesPreguntaSINO;
        private Button btnNoPreguntaSINO;

        private TextView txtAmpliarPreguntaNumerica;
        private TextView txtPreguntaNumerica;
        private TextView txtIndicadorPreguntaNumerica;
        private LinearLayout layPreguntaNumerica;
        private LinearLayout layRespuestaPreguntaNumerica;
        private Spinner spinnerPreguntaNumerica;
        private Button btnGuardarPreguntaNumerica;

        private TextView txtAmpliarPreguntaAbierta;
        private TextView txtPreguntaAbierta;
        private TextView txtIndicadorPreguntaAbierta;
        private LinearLayout layPreguntaAbierta;
        private LinearLayout layRespuestaPreguntaAbierta;
        private EditText etRespuestaPreguntaAbierta;
        private Button btnGuardarPreguntaAbierta;
        private Button btnBorrarPreguntaAbierta;

        private TextView txtInfoPregunta;

        public Preguntas_ViewHolder(View itemView, int vista) {
            super(itemView);

            switch (vista){
                // plantilla_pregunta_sino
                case 1:
                    txtAmpliarPreguntaSINO = (TextView) itemView.findViewById(R.id.txtAmpliarPreguntaSINO);
                    txtPreguntaSINO = (TextView) itemView.findViewById(R.id.txtPreguntaSINO);
                    txtIndicadorPreguntaSINO = (TextView) itemView.findViewById(R.id.txtIndicadorPreguntaSINO);
                    layRespuestaPreguntaSINO = (LinearLayout) itemView.findViewById(R.id.layRespuestaPreguntaSINO);
                    layPreguntaSINO = (LinearLayout) itemView.findViewById(R.id.layPreguntaSINO);
                    btnYesPreguntaSINO = (Button) itemView.findViewById(R.id.btnYesPreguntaSINO);
                    btnNoPreguntaSINO = (Button) itemView.findViewById(R.id.btnNoPreguntaSINO);
                    break;
                // plantilla_pregunta_numerica
                case 2:
                    txtAmpliarPreguntaNumerica = (TextView) itemView.findViewById(R.id.txtAmpliarPreguntaNumerica);
                    txtPreguntaNumerica = (TextView) itemView.findViewById(R.id.txtPreguntaNumerica);
                    txtIndicadorPreguntaNumerica = (TextView) itemView.findViewById(R.id.txtIndicadorPreguntaNumerica);
                    layPreguntaNumerica = (LinearLayout) itemView.findViewById(R.id.layPreguntaNumerica);
                    layRespuestaPreguntaNumerica = (LinearLayout) itemView.findViewById(R.id.layRespuestaPreguntaNumerica);
                    spinnerPreguntaNumerica = (Spinner) itemView.findViewById(R.id.spinnerPreguntaNumerica);
                    btnGuardarPreguntaNumerica = (Button) itemView.findViewById(R.id.btnGuardarPreguntaNumerica);
                    break;
                // plantilla_pregunta_abierta
                default:
                    txtAmpliarPreguntaAbierta = (TextView) itemView.findViewById(R.id.txtAmpliarPreguntaAbierta);
                    txtPreguntaAbierta = (TextView) itemView.findViewById(R.id.txtPreguntaAbierta);
                    txtIndicadorPreguntaAbierta = (TextView) itemView.findViewById(R.id.txtIndicadorPreguntaAbierta);
                    layPreguntaAbierta = (LinearLayout) itemView.findViewById(R.id.layPreguntaAbierta);
                    layRespuestaPreguntaAbierta = (LinearLayout) itemView.findViewById(R.id.layRespuestaPreguntaAbierta);
                    btnGuardarPreguntaAbierta = (Button) itemView.findViewById(R.id.btnGuardarPreguntaAbierta);
                    btnBorrarPreguntaAbierta = (Button) itemView.findViewById(R.id.btnBorrarPreguntaAbierta);
                    etRespuestaPreguntaAbierta = (EditText) itemView.findViewById(R.id.etRespuestaPreguntaAbierta);
                    etRespuestaPreguntaAbierta.setImeOptions(EditorInfo.IME_ACTION_DONE);
            }

            txtInfoPregunta = (TextView) itemView.findViewById(R.id.txtInfoPregunta);
        }

        public void bind(final Pregunta pregunta, final Interface_OnClick objetoInterface){

            switch (pregunta.getId_tipo_pregunta()){
                case 1:

                    //----Ver si esta pregunta ya tiene una respuesta----
                    Cursor c = tabla_respuestas.consultarRespuesta(inspeccion.getId_inspeccion(), pregunta.getId_pregunta());
                    c.moveToFirst();

                    if(c.getCount() > 0){ //Ya existe la respuesta, UPDATE
                        txtIndicadorPreguntaSINO.setText("✓");
                        txtIndicadorPreguntaSINO.setTextColor(Color.parseColor("#4A90E2"));

                        if(c.getString(c.getColumnIndex(Tabla_Respuestas.RE_RESPUESTA)).equals("SI")){
                            btnYesPreguntaSINO.setBackgroundColor(Color.parseColor("#4A90E2"));
                            btnNoPreguntaSINO.setBackgroundColor(Color.parseColor("#33D0021B"));
                        } else {
                            btnYesPreguntaSINO.setBackgroundColor(Color.parseColor("#334A90E2"));
                            btnNoPreguntaSINO.setBackgroundColor(Color.parseColor("#D0021B"));
                        }

                    }

                    c.close();

                    //----Colocar las preguntas y los eventos----
                    txtPreguntaSINO.setText(pregunta.getPregunta());

                    layPreguntaSINO.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            if(layRespuestaPreguntaSINO.getVisibility() == View.VISIBLE){
                                layRespuestaPreguntaSINO.setVisibility(View.GONE);
                                txtAmpliarPreguntaSINO.setText("+");
                            } else {
                                layRespuestaPreguntaSINO.setVisibility(View.VISIBLE);
                                txtAmpliarPreguntaSINO.setText("—");
                            }
                        }
                    });

                    final AlphaAnimation buttonClick = new AlphaAnimation(1F, 0.5F);

                    btnNoPreguntaSINO.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            view.startAnimation(buttonClick);
                            txtIndicadorPreguntaSINO.setText("✓");
                            txtIndicadorPreguntaSINO.setTextColor(Color.parseColor("#4A90E2"));
                            btnYesPreguntaSINO.setBackgroundColor(Color.parseColor("#334A90E2"));
                            btnNoPreguntaSINO.setBackgroundColor(Color.parseColor("#D0021B"));
                            guardarRespuesta(pregunta, "NO");
                        }
                    });

                    btnYesPreguntaSINO.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            view.startAnimation(buttonClick);
                            txtIndicadorPreguntaSINO.setText("✓");
                            txtIndicadorPreguntaSINO.setTextColor(Color.parseColor("#4A90E2"));
                            btnNoPreguntaSINO.setBackgroundColor(Color.parseColor("#33D0021B"));
                            btnYesPreguntaSINO.setBackgroundColor(Color.parseColor("#4A90E2"));
                            guardarRespuesta(pregunta, "SI");
                        }
                    });
                    break;
                case 2:

                    //----Colocar las preguntas y los eventos----
                    txtPreguntaNumerica.setText(pregunta.getPregunta());

                    List<Integer> numeros = new ArrayList<Integer>();
                    for (int i = 0; i<1000; i++){
                        numeros.add(i);
                    }

                    ArrayAdapter<Integer> dataAdapter = new ArrayAdapter<Integer>(context, R.layout.spinner_pregunta, numeros);
                    spinnerPreguntaNumerica.setAdapter(dataAdapter);

                    //----Ver si esta pregunta ya tiene una respuesta----
                    Cursor c1 = tabla_respuestas.consultarRespuesta(inspeccion.getId_inspeccion(), pregunta.getId_pregunta());
                    c1.moveToFirst();

                    if(c1.getCount() > 0){ //Ya existe la respuesta, UPDATE
                        txtIndicadorPreguntaNumerica.setText("✓");
                        txtIndicadorPreguntaNumerica.setTextColor(Color.parseColor("#4A90E2"));
                        spinnerPreguntaNumerica.setSelection(Integer.parseInt(c1.getString(c1.getColumnIndex(Tabla_Respuestas.RE_RESPUESTA))));

                    } c1.close();

                    layPreguntaNumerica.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            if(layRespuestaPreguntaNumerica.getVisibility() == View.VISIBLE){
                                layRespuestaPreguntaNumerica.setVisibility(View.GONE);
                                txtAmpliarPreguntaNumerica.setText("+");
                            } else {
                                layRespuestaPreguntaNumerica.setVisibility(View.VISIBLE);
                                txtAmpliarPreguntaNumerica.setText("—");
                            }
                        }
                    });

                    final AlphaAnimation buttonClick1 = new AlphaAnimation(1F, 0.5F);
                    btnGuardarPreguntaNumerica.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            view.startAnimation(buttonClick1);
                            txtIndicadorPreguntaNumerica.setText("✓");
                            txtIndicadorPreguntaNumerica.setTextColor(Color.parseColor("#4A90E2"));
                            String numero = spinnerPreguntaNumerica.getSelectedItem().toString();
                            guardarRespuesta(pregunta, numero);
                        }
                    });
                    break;
                default:

                    //----Ver si esta pregunta ya tiene una respuesta----
                    Cursor c2 = tabla_respuestas.consultarRespuesta(inspeccion.getId_inspeccion(), pregunta.getId_pregunta());
                    c2.moveToFirst();

                    if(c2.getCount() > 0){ //Ya existe la respuesta, UPDATE
                        txtIndicadorPreguntaAbierta.setText("✓");
                        txtIndicadorPreguntaAbierta.setTextColor(Color.parseColor("#4A90E2"));

                        etRespuestaPreguntaAbierta.setText(c2.getString(c2.getColumnIndex(Tabla_Respuestas.RE_RESPUESTA)));

                    }

                    c2.close();

                    txtPreguntaAbierta.setText(pregunta.getPregunta());

                    layPreguntaAbierta.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            if(layRespuestaPreguntaAbierta.getVisibility() == View.VISIBLE){
                                layRespuestaPreguntaAbierta.setVisibility(View.GONE);
                                txtAmpliarPreguntaAbierta.setText("+");
                            } else {
                                layRespuestaPreguntaAbierta.setVisibility(View.VISIBLE);
                                txtAmpliarPreguntaAbierta.setText("—");
                            }
                        }
                    });

                    final AlphaAnimation buttonClick2 = new AlphaAnimation(1F, 0.5F);
                    btnGuardarPreguntaAbierta.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            view.startAnimation(buttonClick2);
                            txtIndicadorPreguntaAbierta.setText("✓");
                            txtIndicadorPreguntaAbierta.setTextColor(Color.parseColor("#4A90E2"));
                            guardarRespuesta(pregunta, etRespuestaPreguntaAbierta.getText().toString());
                        }
                    });

                    btnBorrarPreguntaAbierta.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            view.startAnimation(buttonClick2);
                            etRespuestaPreguntaAbierta.setText("");
                        }
                    });

            }

            txtInfoPregunta.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {

                    if(new Pantalla().esTablet(activity)){
                        objetoInterface.OnItemClick(pregunta);
                    } else {
                        final LayoutInflater inflater = (LayoutInflater)activity.getSystemService(LAYOUT_INFLATER_SERVICE);
                        final AlertDialog.Builder imageDialog = new AlertDialog.Builder(new ContextThemeWrapper(activity, R.style.myDialog));
                        View layout = inflater.inflate(R.layout.pop_up_detalle_pregunta, (ViewGroup) activity.findViewById(R.id.cvPopUpPregunta), false);

                        TextView txtApartadoPregunta, txtCategoriaPregunta, txtInstruccionPregunta, txtTipoPregunta;

                        txtApartadoPregunta = (TextView) layout.findViewById(R.id.txtApartadoPregunta);
                        txtCategoriaPregunta = (TextView) layout.findViewById(R.id.txtCategoriaPregunta);
                        txtInstruccionPregunta = (TextView) layout.findViewById(R.id.txtInstruccionPregunta);
                        txtTipoPregunta = (TextView) layout.findViewById(R.id.txtTipoPregunta);

                        txtApartadoPregunta.setText(pregunta.getNombre_apartado());
                        txtCategoriaPregunta.setText(pregunta.getNombre_categoria());
                        txtInstruccionPregunta.setText(pregunta.getInstruccion_categoria());
                        txtTipoPregunta.setText(pregunta.getDescripcion_tipo_pregunta());

                        imageDialog.setView(layout);
                        final AlertDialog alert = imageDialog.create();
                        alert.getWindow().setBackgroundDrawableResource(android.R.color.transparent);
                        alert.show();
                    }
                }
            });

        }

        public void guardarRespuesta(Pregunta pregunta, String respuesta){

            Cursor c = tabla_respuestas.consultarRespuesta(inspeccion.getId_inspeccion(), pregunta.getId_pregunta());
            c.moveToFirst();

            if(c.getCount() > 0){ //Ya existe la respuesta, UPDATE
                tabla_respuestas.modificarRespuesta(inspeccion.getId_inspeccion(), pregunta.getId_pregunta(), respuesta);
                //Toast.makeText(activity, "UPDATED", Toast.LENGTH_SHORT).show();
            } else { //No existe la respuesta, SAVE IT
                tabla_respuestas.insertarRespuesta(inspeccion.getId_inspeccion(), pregunta.getId_pregunta(), respuesta);
                //Toast.makeText(activity, "CREATED", Toast.LENGTH_SHORT).show();
            } c.close();
        }
    }
}
