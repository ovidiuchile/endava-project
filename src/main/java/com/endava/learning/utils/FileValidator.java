package com.endava.learning.utils;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import com.endava.learning.model.FileBucket;

public class FileValidator implements Validator {
	
    public boolean supports(Class<?> paramClass) {
        return FileBucket.class.equals(paramClass);
    }
    
    public void validate(Object obj, Errors errors) {
        FileBucket file = (FileBucket) obj;
          if (file.getFile().getSize() == 0) {
           errors.rejectValue("file", "valid.file");
          }
    }
}
