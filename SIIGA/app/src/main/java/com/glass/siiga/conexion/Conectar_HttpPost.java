package com.glass.siiga.conexion;

import android.app.Activity;
import android.os.StrictMode;
import android.util.Log;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.net.ssl.HttpsURLConnection;

/**
 * Created by Arturo on 2/10/2018.
 */

public class Conectar_HttpPost {

    URL url_f;
    StringBuilder output;
    //String responseServer, url1;
    JSONObject jsonRespuesta;
    //Conectar_HttpsPost conectar;

    public JSONObject enviarParametros(String url, HashMap<String, String> listado, Activity context){
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);

        try {
            url_f = new URL("https://siiges.com/controllers/"+url);

            HttpsURLConnection connection = (HttpsURLConnection)url_f.openConnection();

            String urlParameters = "";
            Set keys = listado.keySet();

            for (Iterator i = keys.iterator(); i.hasNext(); ) {
                String key = (String) i.next();
                String value = listado.get(key);

                //Log.e(""+key,""+value);
                urlParameters = urlParameters + key + "=" + ""+ URLEncoder.encode(value.replace("%20", " ").replace("%0A", "<br>"), "UTF-8") + "&";
            }

            connection.setRequestMethod("POST");
            connection.setRequestProperty("USER-AGENT", "Mozilla/5.0");
            connection.setRequestProperty("ACCEPT-LANGUAGE", "en-US,en;0.5");
            connection.setDoOutput(true);

            DataOutputStream dStream = new DataOutputStream(connection.getOutputStream());
            dStream.writeBytes(urlParameters.substring(0, urlParameters.length() - 1));
            dStream.flush();
            dStream.close();

            int responseCode = connection.getResponseCode();
            output = new StringBuilder("Request URL " + url);
            output.append(System.getProperty("line.separator") + "Request Parameters " + urlParameters);
            output.append(System.getProperty("line.separator")  + "Response Code " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line = "";
            StringBuilder responseOutput = new StringBuilder();
            while((line = br.readLine()) != null ) {
                responseOutput.append(line);
            }
            br.close();

            output.append(System.getProperty("line.separator") +
                    "Response " + System.getProperty("line.separator") +
                    System.getProperty("line.separator") + responseOutput.toString());

            jsonRespuesta = new JSONObject(responseOutput.toString());
            Log.e("RES", ""+jsonRespuesta);

        } catch (MalformedURLException e) {
            // TODO
            e.printStackTrace();
        } catch (IOException e) {
            // TODO
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonRespuesta;
        /*this.url = url;
        HttpClient httpclient = new DefaultHttpClient();

        HttpPost httppost = new HttpPost("http://siiga.glassproject.com.mx/controllers/"+url);

        try {
            List<NameValuePair> nameValuePairs = new ArrayList<>();
            Set keys = listado.keySet();

            for (Iterator i = keys.iterator(); i.hasNext(); ) {
                String key = (String) i.next();
                String value = listado.get(key);

                nameValuePairs.add(new BasicNameValuePair(""+key, ""+value.replace("%20", " ").replace("%0A", "<br>")));
                //Log.e(key , value);
            }

            httppost.setEntity(new UrlEncodedFormEntity(nameValuePairs, "UTF-8"));
            HttpResponse response = httpclient.execute(httppost);
            InputStream inputStream = response.getEntity().getContent();
            InputStreamToString str = new InputStreamToString();

            responseServer = str.getStringFromInputStream(inputStream);
            Log.e("RES", responseServer);

            jsonRespuesta = new JSONObject(responseServer);

        } catch (ClientProtocolException e) {
            // TODO Auto-generated catch block
        } catch (IOException e) {
            // TODO Auto-generated catch block
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonRespuesta;*/
    }

    public static class InputStreamToString {
        private static String getStringFromInputStream(InputStream is) {
            BufferedReader br = null;
            StringBuilder sb = new StringBuilder();
            String line;

            try {
                br = new BufferedReader(new InputStreamReader(is));
                while ((line = br.readLine()) != null) {
                    sb.append(line);
                }
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (br != null) {
                    try {
                        br.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
            return sb.toString();
        }
    }

    public void sendJsonPost(String url_a, JSONObject jsonParam) {

        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);

        try {
            String result = "";

            URL url = new URL(url_a);

            // 1. create HttpURLConnection
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");

            // 3. add JSON content to POST request body
            OutputStream os = conn.getOutputStream();
            BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os, "UTF-8"));
            writer.write(jsonParam.toString());
            //Log.i(MainActivity.class.toString(), jsonObject.toString());
            writer.flush();
            writer.close();
            os.close();

            // 4. make POST request to the given URL
            conn.connect();

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
            br.close();

            Log.e("JSON", sb.toString());
            //return sb.toString();

            // 5. return response message
            //return conn.getResponseMessage()+"";


        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
