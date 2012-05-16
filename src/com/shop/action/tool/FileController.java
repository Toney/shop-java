package com.shop.action.tool;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Hashtable;

import javax.servlet.ServletContext;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.shop.action.BaseController;
import com.shop.action.tool.comparator.NameComparator;
import com.shop.action.tool.comparator.SizeComparator;
import com.shop.action.tool.comparator.TypeComparator;
import com.shop.bean.Message;
import com.shop.util.DateUtil;
import com.shop.util.FileUtil;
import com.shop.util.StringUtil;

import java.util.List;

@Controller
@RequestMapping(value = "file/")
public class FileController extends BaseController implements
		ServletContextAware {

	private ServletContext servletContext;

	public void setServletContext(ServletContext servletContext) { // 实现接口中的setServletContext方法
		this.servletContext = servletContext;
	}

	@RequestMapping(value = "/filemanager", method = RequestMethod.GET)
	@ResponseBody
	public String filemanager(String path, String name, String dir,
			String order, String imgLocation) {
		String rootPath = this.servletContext.getRealPath(imgLocation);
		String rootUrl = imgLocation;

		// 图片扩展名
		String[] fileTypes = new String[] { "gif", "jpg", "jpeg", "png", "bmp" };

		if (dir != null) {
			if (!Arrays.<String> asList(
					new String[] { "image", "flash", "media", "file" })
					.contains(dir)) {
				return "没有对应的路径！";
			}
			rootPath += "/" + dir;
			rootUrl += dir + "/";
			File saveDirFile = new File(rootPath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
		}

		// 根据path参数，设置各路径和URL
		path = path != null ? path : "";
		String currentPath = rootPath + "/" + path;
		String currentUrl = rootUrl + path;
		String currentDirPath = path;
		String moveupDirPath = "";
		if (!"".equals(path)) {
			String str = currentDirPath.substring(0,
					currentDirPath.length() - 1);
			moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0,
					str.lastIndexOf("/") + 1) : "";
		}

		// 排序形式，name or size or type
		order = order != null ? order.toLowerCase() : "name";

		// 不允许使用..移动到上一级目录
		if (path.indexOf("..") >= 0) {
			return "权限不足！";
		}
		// 最后一个字符不是/
		if (!"".equals(path) && !path.endsWith("/")) {
			return "参数不正确！";
		}
		// 目录不存在或不是目录
		File currentPathFile = new File(currentPath);
		if (!currentPathFile.isDirectory()) {
			return "目录不存在！";
		}

		// 遍历目录取的文件信息
		List<Hashtable> fileList = new ArrayList<Hashtable>();
		if (currentPathFile.listFiles() != null) {
			for (File file : currentPathFile.listFiles()) {
				Hashtable<String, Object> hash = new Hashtable<String, Object>();
				String fileName = file.getName();
				if (file.isDirectory()) {
					hash.put("is_dir", true);
					hash.put("has_file", (file.listFiles() != null));
					hash.put("filesize", 0L);
					hash.put("is_photo", false);
					hash.put("filetype", "");
				} else if (file.isFile()) {
					String fileExt = fileName.substring(
							fileName.lastIndexOf(".") + 1).toLowerCase();
					hash.put("is_dir", false);
					hash.put("has_file", false);
					hash.put("filesize", file.length());
					hash.put("is_photo", Arrays.<String> asList(fileTypes)
							.contains(fileExt));
					hash.put("filetype", fileExt);
				}
				hash.put("filename", fileName);
				hash.put("datetime",
						new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file
								.lastModified()));
				fileList.add(hash);
			}
		}

		if ("size".equals(order)) {
			Collections.sort(fileList, new SizeComparator());
		} else if ("type".equals(order)) {
			Collections.sort(fileList, new TypeComparator());
		} else {
			Collections.sort(fileList, new NameComparator());
		}

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("moveup_dir_path", moveupDirPath);
		result.put("current_dir_path", currentDirPath);
		result.put("current_url", currentUrl);
		result.put("total_count", fileList.size());
		result.put("file_list", fileList);

		JSONObject jsonobj = JSONObject.fromObject(result);
		return jsonobj.toString();
	}

	/**
	 * @param imgFile
	 *            图片文件信息
	 * @param savefolder
	 *            文件保存路径
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String upload(@RequestParam("imgFile") CommonsMultipartFile imgFile,
			String imgLocation, String dir) {
		String rootPath = this.servletContext.getRealPath(imgLocation);
		String rootUrl = imgLocation;
		Message message = new Message();
		if (!imgFile.isEmpty()) {
			if (dir != null) {
				if (!Arrays.<String> asList(
						new String[] { "image", "flash", "media", "file" })
						.contains(dir)) {
					message.setMessage("没有对应的路径！");
					message.setType("false");
				}
				rootPath += "/" + dir;
				rootUrl += dir + "/";
				File saveDirFile = new File(rootPath);
				if (!saveDirFile.exists()) {
					saveDirFile.mkdirs();
				}

				String month = DateUtil
						.getCurrentDateStr(DateUtil.C_DATA_PATTON_YYYYMM);
				rootPath += "/" + month;
				rootUrl += month + "/";
				saveDirFile = new File(rootPath);
				if (!saveDirFile.exists()) {
					saveDirFile.mkdirs();
				}

				String day = DateUtil
						.getCurrentDateStr(DateUtil.C_DATA_PATTON_DD);
				rootPath += "/" + day;
				rootUrl += day + "/";
				saveDirFile = new File(rootPath);
				if (!saveDirFile.exists()) {
					saveDirFile.mkdirs();
				}

				String filepath = rootPath + "/" + day;
				File file = new File(filepath); // 新建一个文件
				try {
					imgFile.getFileItem().write(file); // 将上传的文件写入新建的文件中
				} catch (Exception e) {
					e.printStackTrace();
				}

			}

			String fname = StringUtil.getTimeMD5();
			String suffix = FileUtil.getSuffix(imgFile.getName());
			rootPath += "/" + fname + "." + suffix;
			rootUrl += fname + "." + suffix;
			File file = new File(rootPath); // 新建一个文件

			try {
				imgFile.getFileItem().write(file); // 将上传的文件写入新建的文件中
				message.setMessage(rootUrl);
				message.setType("true");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message.setMessage("文件不能为空！");
			message.setType("false");
		}
		return JSONObject.fromObject(message).toString();
	}

}
