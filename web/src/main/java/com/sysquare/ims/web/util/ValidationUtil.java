package com.sysquare.ims.web.util;

import org.apache.commons.io.FilenameUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

public class ValidationUtil {
	public static boolean validatePictureUpload(String propertyName, MultipartFile picture, BindingResult result){
        boolean valid = true;
        if(picture != null && picture.getSize() > 0){
            if (picture.getSize() > FileUtil.DEFAULT_MAX_PICTURE_SIZE) {
                result.rejectValue(propertyName, "picture.size.exceeded", "The picture size should not exceed.");
                valid = false;
            }

            String mimeType = picture.getContentType();

            if(mimeType != null){
               if(!FileUtil.VALID_PICTURE_MIME_TYPES.contains(mimeType))
               {
                    valid = false;
                    result.rejectValue(propertyName, "picture.invalid.fileType", "Invalid file type.");
               }
            } else{
                String extension = FilenameUtils.getExtension(picture.getOriginalFilename());
                // if there was no mime-type and no extension, then consider it invalid
                if(extension == null){
                    valid = false;
                    result.rejectValue(propertyName, "picture.invalid.fileType", "Invalid file type.");
                }
                else{
                    extension = extension.toLowerCase();
                    if (!FileUtil.VALID_PICTURE_EXTENTIONS.contains(extension)) 
                    {
                        valid = false;
                        result.rejectValue(propertyName, "picture.invalid.fileType", "Invalid file type.");
                    }
                }
            }
        }
        return valid;
    }
}
