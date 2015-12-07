package com.aptechfpt.converter;

import com.aptechfpt.enumtype.AccountGender;
import java.util.Date;
import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import org.joda.time.DateTime;

/**
 *
 * @author kieron2208
 */
@Converter(autoApply = true)
public class GenderConverter implements AttributeConverter<AccountGender, String>{

    @Override
    public String convertToDatabaseColumn(AccountGender attribute) {
        switch (attribute){
            case Male:
                return "M";
            case Female:
                return "F";
            default:
                return "";
        }
    }

    @Override
    public AccountGender convertToEntityAttribute(String dbData) {
        switch (dbData){
            case "M":
                return AccountGender.Male;
            case "F":
                return AccountGender.Female;
            default:
                return null;
        }
    }
}
