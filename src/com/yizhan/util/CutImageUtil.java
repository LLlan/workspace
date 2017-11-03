package com.yizhan.util;

import java.io.IOException;
import java.io.InputStream;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.web.multipart.MultipartFile;

import com.yizhan.controller.base.BaseController;
/**
 * 裁剪图片工具类
 * @author Administrator
 *
 */
public class  CutImageUtil extends BaseController{
	
	/**
	 * 裁剪图片生成自定义尺寸图片
	 * @param file
	 * @param dataX
	 * @param dataY
	 * @param dataWidth
	 * @param dataHeight
	 * @param dataRotate
	 * @param boxWidth
	 * @param boxHeigth
	 * @throws IOException
	 */
	public static String CutIamgeToCustomSize(
			MultipartFile file,
			String dataX,
			String dataY,
			String dataWidth,
			String dataHeight,
			String dataRotate,
			String boxWidth,
			String boxHeigth,
			String folderName,
			String uuid
			) throws IOException{
		//临时文件名和路径
		String tempfileName="temp"+file.getOriginalFilename().toString().substring(file.getOriginalFilename().lastIndexOf("."));
		String tempfilePath = PathUtil.getClasspath() + Const.FILEPATHIMG + tempfileName;//文件上传路径
		//文件名
		String fileName=uuid+file.getOriginalFilename().toString().substring(file.getOriginalFilename().lastIndexOf("."));
		//判断文件夹是否存在，不存在则新建
		FileUtil.createDir(PathUtil.getClasspath() + Const.FILEPATHIMG + folderName);
		//返回路径（存储到数据库中的路径）
		String filePath1=Const.FILEPATHIMG + folderName + fileName;
		//最后生成裁剪图片的图片路径
		String filePath = PathUtil.getClasspath() + filePath1;
		// 获取上传文件的ioputstream
		InputStream fileInputStream = file.getInputStream();
		// 将上传文件的ioputstream写人到filepath路径
		//FileOutputStream fileOutputStream = new FileOutputStream(filePath);
		//判断是否有旋转
		if(!dataRotate.equals("0")){//有
			Thumbnails.of(fileInputStream).scale(1).rotate(Integer.parseInt(dataRotate)).toFile(tempfilePath);
			Thumbnails.of(tempfilePath).sourceRegion(Integer.parseInt(dataX), Integer.parseInt(dataY), Integer.parseInt(dataWidth), Integer.parseInt(dataHeight))
			.size(Integer.parseInt(boxWidth), Integer.parseInt(boxHeigth)).keepAspectRatio(false)
			.toFile(filePath);
			//删除临时图片
			FileUtil.delFile(tempfilePath);
		}else{//无
			Thumbnails.of(fileInputStream).sourceRegion(Integer.parseInt(dataX), Integer.parseInt(dataY), Integer.parseInt(dataWidth), Integer.parseInt(dataHeight))
			.size(Integer.parseInt(boxWidth), Integer.parseInt(boxHeigth)).keepAspectRatio(false)
			.toFile(filePath);
		}
		return filePath1;
	}
}
