package com.mySpring.myapi; 

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;

public class OCRGeneralAPIDemo {

	public static void main(String[] args) {
		String apiURL = "https://6i6hrwizgm.apigw.ntruss.com/custom/v1/36511/e69228bb8eaa54da22e75cd075bdd52904ef256d43f4aa94575ac2b7c509f176/infer";
		String secretKey = "YVppekhaU3BDTGlNZHVoVldlQm5wdHdBVmROeFl2cEc=";

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json; charset=utf-8");
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("url", "http://www.nasandt.co.kr/bbs/data/sub04/2022%EB%85%84_%EC%82%AC%EC%97%85%EC%9E%90%EB%93%B1%EB%A1%9D%EC%A6%9D%EC%82%AC%EB%B3%B8.jpg"); // image should be public, otherwise, should use data
			// FileInputStream inputStream = new FileInputStream("YOUR_IMAGE_FILE");
			// byte[] buffer = new byte[inputStream.available()];
			// inputStream.read(buffer);
			// inputStream.close();
			// image.put("data", buffer);
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();

			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			System.out.println(response);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}