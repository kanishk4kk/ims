package com.sysquare.ims.web.util;

import java.util.Arrays;
import java.util.List;

public class FileUtil {
	public static final int DEFAULT_MAX_PICTURE_SIZE = 1024*1024;  // 1MB
	public static final int DEFAULT_MAX_FILE_SIZE = 5*1024*1024;  //5MB
	public static final List<String> VALID_PICTURE_EXTENTIONS = Arrays.asList(new String[]{"gif", "jpg", "jpeg", "png"});
	public static final List<String> VALID_PICTURE_MIME_TYPES = Arrays.asList(new String[]{"image/gif", "image/jpeg", "image/png"});
}
