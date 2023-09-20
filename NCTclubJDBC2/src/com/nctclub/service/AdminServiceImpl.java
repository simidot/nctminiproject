package com.nctclub.service;

import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.nctclub.mapper.AdminMapper;
import com.nctclub.mapper.UserMapper;
import com.nctclub.model.NCTmemberDTO;
import com.nctclub.model.UserDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper mapper;
	
	// 허용된 파일 확장자를 정의한 리스트
    private static final List<String> ALLOWED_EXTENSIONS = Arrays.asList("jpg", "jpeg", "png", "gif");
    
    // 파일 크기 제한을 정의 (예: 5MB)
    private static final long MAX_FILE_SIZE = 5 * 1024 * 1024;
	
	@Override
	public List<UserDTO> selectAllUsers() {
		return mapper.selectAllusers();
	}

	@Override
	public int deleteUser(String userId) {
		return mapper.deleteUser(userId);
	}

    @Transactional
    public void addMemberWithGroups(NCTmemberDTO dto) {
        // Insert member
        mapper.insertMember(dto);
        // Insert groups
        mapper.insertGroupsForMember(dto);
    }
	
    /**
     * 파일을 업로드하는 메서드
     * @param file - 업로드할 MultipartFile
     * @param uploadPath - 업로드될 경로
     * @return 업로드된 파일
     * @throws Exception
     */
	
	@Override
    public File uploadFile(MultipartFile file, String uploadPath) throws Exception {
        String fileName = file.getOriginalFilename();
        System.out.println("fileExtension before: "+fileName);
        String fileExtension = getFileExtension(fileName);
        System.out.println("fileExtension after: "+fileExtension);

		// 파일 확장자를 검사하여 허용되지 않는 확장자인 경우 예외를 발생시킨다.
        if (!ALLOWED_EXTENSIONS.contains(fileExtension)) {
            throw new Exception("Invalid file extension. Allowed extensions are: " + ALLOWED_EXTENSIONS);
        }
        // 파일의 크기를 검사하여 크기 제한을 초과하는 경우 예외를 발생시킨다.
        if (file.getSize() > MAX_FILE_SIZE) {
            throw new Exception("File size exceeds the limit of " + MAX_FILE_SIZE / (1024 * 1024) + "MB.");
        }
        
        System.out.println("upload전 : "+ uploadPath);
        // 업로드 디렉토리가 존재하지 않는 경우 디렉토리를 생성한다.
        File uploadDir = new File(uploadPath);
        System.out.println("upload후 : "+ uploadDir);

        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

       // 동일한 파일 이름이 존재하는 경우 UUID를 사용하여 파일 이름을 변경한다.
        File uploadFile = new File(uploadPath + File.separator + fileName);
        System.out.println("uploadFile : "+ uploadFile);

        if (uploadFile.exists()) {
            String uuid = UUID.randomUUID().toString(); // UUID 생성
            fileName = uuid + "_" + fileName; // 파일 이름에 UUID 추가
            uploadFile = new File(uploadPath + File.separator + fileName);
        }
        // 실제 파일을 지정된 경로로 이동 (또는 복사) 한다.
        file.transferTo(uploadFile);
        return uploadFile;
    }
	
    /**
     * 파일 이름에서 확장자를 추출하는 메서드
     * @param fileName - 확장자를 추출할 파일 이름
     * @return 파일의 확장자
     */
    private String getFileExtension(String fileName) {
    	 // 파일 이름에 확장자가 없는 경우 빈 문자열을 반환
        if (fileName == null || fileName.lastIndexOf(".") == -1) {
            return ""; 
        }
        return fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
    }
    
    @Override
	public List<NCTmemberDTO> selectAllMembers() {   	
		return mapper.selectAllMembers();
	}

	@Override
	public NCTmemberDTO selectMember(int memberId) {
		System.out.println(mapper.selectMember(memberId));
		return mapper.selectMember(memberId);
	}

}
