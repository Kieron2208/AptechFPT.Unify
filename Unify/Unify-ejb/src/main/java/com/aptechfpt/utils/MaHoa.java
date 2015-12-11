package com.aptechfpt.utils;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ken
 */
public class MaHoa {
    Cipher ecipher; 
    Cipher dcipher; 
    final static String strPassword = "password12345678";
    static SecretKeySpec key = new SecretKeySpec(strPassword.getBytes(), "AES");
    public MaHoa() throws NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException { 
        try{ 
            AlgorithmParameterSpec paramSpec = 
                    new IvParameterSpec(strPassword.getBytes()); 
            ecipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            dcipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            ecipher.init(Cipher.ENCRYPT_MODE, key, paramSpec);
            dcipher.init(Cipher.DECRYPT_MODE, key, paramSpec); 
        } catch (NoSuchAlgorithmException e) {}
        catch (InvalidKeyException e) {} 
        catch (InvalidAlgorithmParameterException ex) {}
        catch (NoSuchPaddingException e) {}
    }
 
    // encrypt() inputs a string and returns an encrypted version 
    // of that String. 
    public String encrypt(String str) { 
        try { 
            // Encode the string into bytes using utf-8 
            byte[] utf8 = str.getBytes("UTF8"); 
            // Encrypt 
            byte[] enc = ecipher.doFinal(utf8); 
            // Encode bytes to base64 to get a string 
            return new sun.misc.BASE64Encoder().encode(enc); 
            } catch (BadPaddingException e) { 
            } catch (IllegalBlockSizeException e) { 
            } catch (UnsupportedEncodingException e) { 
        }
        return null; 
    }
    
    
    public String decrypt(String str) throws IOException { 
        try { 
            // Decode base64 to get bytes 
            byte[] dec = new sun.misc.BASE64Decoder().decodeBuffer(str); 
            // Decrypt 
            byte[] utf8 = dcipher.doFinal(dec);
            // Decode using utf-8
            return new String(utf8, "UTF8"); 
        } catch (BadPaddingException e) { 
        } catch (IllegalBlockSizeException e) { 
        } catch (UnsupportedEncodingException e) { 
        } catch (IOException e) { 
        }
        return null; 
    } 
}
