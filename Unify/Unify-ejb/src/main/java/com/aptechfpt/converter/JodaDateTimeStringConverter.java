/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.converter;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

@Converter(autoApply = true)
public class JodaDateTimeStringConverter implements AttributeConverter<DateTime, String> {

    @Override
    public String convertToDatabaseColumn(DateTime attribute) {
        return attribute.toString("yyyy-MM-dd HH:mm:ss.SSSSSSS");
    }

    @Override
    public DateTime convertToEntityAttribute(String dbData) {
        DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss.SSSSSSS");
        return format.parseDateTime(dbData);
    }
}
