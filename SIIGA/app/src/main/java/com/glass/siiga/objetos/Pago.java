package com.glass.siiga.objetos;

public class Pago {

    private int pago_id;
    private String concepto;
    private String monto;
    private String cobertura;
    private String fecha_pago;

    public Pago(int pago_id, String concepto, String monto, String cobertura, String fecha_pago) {
        this.pago_id = pago_id;
        this.concepto = concepto;
        this.monto = monto;
        this.cobertura = cobertura;
        this.fecha_pago = fecha_pago;
    }

    public int getPago_id() {
        return pago_id;
    }

    public void setPago_id(int pago_id) {
        this.pago_id = pago_id;
    }

    public String getConcepto() {
        return concepto;
    }

    public void setConcepto(String concepto) {
        this.concepto = concepto;
    }

    public String getMonto() {
        return monto;
    }

    public void setMonto(String monto) {
        this.monto = monto;
    }

    public String getCobertura() {
        return cobertura;
    }

    public void setCobertura(String cobertura) {
        this.cobertura = cobertura;
    }

    public String getFecha_pago() {
        return fecha_pago;
    }

    public void setFecha_pago(String fecha_pago) {
        this.fecha_pago = fecha_pago;
    }
}
