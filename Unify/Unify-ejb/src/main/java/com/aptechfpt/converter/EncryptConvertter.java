package com.aptechfpt.converter;

import com.aptechfpt.enumtype.AccountGender;
import com.aptechfpt.utils.MaHoa;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.NoSuchPaddingException;
import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

/**
 *
 * @author Kiero
 */
@Converter(autoApply = true)
public class EncryptConvertter implements AttributeConverter<String, String>{

    @Override
    public String convertToDatabaseColumn(String attribute) {
        try {
            MaHoa maHoa = new MaHoa();
            Logger.getLogger(EncryptConvertter.class.getName()).log(Level.INFO, "Encrypting: {0}" , attribute);
            String encrypt = maHoa.encrypt(attribute);
            return encrypt;
        } catch (NoSuchPaddingException | InvalidKeyException | InvalidAlgorithmParameterException ex) {
            Logger.getLogger(EncryptConvertter.class.getName()).log(Level.SEVERE, null, ex);
            return attribute;
        }
    }

    @Override
    public String convertToEntityAttribute(String dbData) {
        try {
            MaHoa maHoa = new MaHoa();
            Logger.getLogger(EncryptConvertter.class.getName()).log(Level.INFO, "Decrypting: {0}" , dbData);
            String decrypt = maHoa.decrypt(dbData);
            return decrypt;
        } catch (NoSuchPaddingException | InvalidKeyException | InvalidAlgorithmParameterException | IOException ex) {
            Logger.getLogger(EncryptConvertter.class.getName()).log(Level.SEVERE, null, ex);
            return dbData;
        }
    }
    
}
