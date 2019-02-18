package com.kt.common;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class CsvParser {
public static void main(String[] args) {
	 String csvFile = "D:/test.csv";
     BufferedReader br = null;
     String line = "";
     String cvsSplitBy = ",";

     try {

         br = new BufferedReader(new FileReader(csvFile));
         while ((line = br.readLine()) != null) {

             // use comma as separator
             String[] country = line.split(cvsSplitBy);

             System.out.println("Country [code= " + country[4]);

         }

     } catch (FileNotFoundException e) {
         e.printStackTrace();
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

}
}
