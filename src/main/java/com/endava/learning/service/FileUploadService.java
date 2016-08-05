package com.endava.learning.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.endava.learning.dao.MaterialDAO;
import com.endava.learning.model.Material;

@Service
public class FileUploadService {
    @Autowired
    private MaterialDAO materialDAO;
    
    @Transactional
    public String uploadFile(MultipartFile file) throws FileUploadException, IOException {
        String generatedName = UUID.randomUUID().toString();
        saveFile(file, generatedName);
        return Material.LOCATION + File.separator + generatedName;
    }

    private void saveFile(MultipartFile file, String generatedName) throws FileUploadException, IOException {
        if (file.isEmpty()) {
            throw new FileUploadException("Uploading has failed. The file was empty.");
        }

        String directoryPath = Material.LOCATION;
        File directory = new File(directoryPath);

        if ((!directory.exists()) && (!directory.mkdirs())) {
            throw new FileUploadException("Directories creation has failed. Check privileges.");
        }

        File serverFile = new File(directory.getAbsolutePath() + File.separator + generatedName);
        file.transferTo(serverFile);
    }

    @Transactional
    public boolean removeFile(Long fileId) {
        Material uploadedFile = materialDAO.findById(fileId);
        if (uploadedFile == null) {
            return false;
        }

        File file = new File(Material.LOCATION + File.separator + uploadedFile.getTitle());

        if (!file.delete()) {
            return false;
        }

        materialDAO.delete(fileId);

        return true;
    }

    @Transactional
    public Material getMaterialEntity(Long fileId) {
        return materialDAO.findById(fileId);
    }

    public File getFile(Material uploadedFile) {
        return new File(Material.LOCATION + File.separator + uploadedFile.getTitle());
    }

    @Transactional
    public List<Material> getAttachmentsByIds(List<Long> attachments) {
        List<Material> files = new ArrayList<>();
        for (Long attachment : attachments) {
            Material file = materialDAO.findById(attachment);
            if (file != null) {
                files.add(file);
            }
        }

        return files;
    }
}