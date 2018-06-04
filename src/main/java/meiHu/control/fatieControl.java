package meiHu.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class fatieControl {
    @PostMapping(value = "/picload.action")
    public @ResponseBody Map<String,String> upload(MultipartFile uploadImage, HttpServletRequest request) throws IOException {
        //原始文件名称
        String pictureFile_name =  uploadImage.getOriginalFilename();
        //新文件名称
        String newFileName = UUID.randomUUID().toString()+pictureFile_name.substring(pictureFile_name.lastIndexOf("."));

        //获得图片上传的路径
        String path=request.getServletContext().getRealPath("image/upload");

        //上传图片
        File uploadPic = new java.io.File(path+"/"+newFileName);

        if(!uploadPic.exists()){
            uploadPic.mkdirs();
        }
        //向磁盘写文件
        uploadImage.transferTo(uploadPic);
        System.out.println(request.getServletContext().getContextPath()+"image/upload"+"/"+newFileName);
        Map<String,String> map=new HashMap();
        map.put("url","image/upload"+"/"+newFileName);
        return map;

    }
}
