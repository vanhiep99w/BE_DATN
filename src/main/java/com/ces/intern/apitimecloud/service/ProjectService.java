package com.ces.intern.apitimecloud.service;

import com.ces.intern.apitimecloud.dto.ProjectDTO;
import com.ces.intern.apitimecloud.dto.ProjectUserDTO;
import com.ces.intern.apitimecloud.entity.ProjectEntity;
import com.ces.intern.apitimecloud.http.request.ProjectUserRequest;

import java.util.List;


public interface ProjectService {

    ProjectDTO createProject(Integer companyId, ProjectDTO projectDTO, Integer userId);

    ProjectDTO getProject(Integer projectId);

    List getAllProject();

    ProjectDTO updateProject(Integer projectId, ProjectDTO projectDTO, Integer userId);

    List<ProjectDTO> getAllByCompanyId(Integer companyId);

    List<ProjectDTO> getAllStillDoingByCompanyId(Integer companyId);

    List<ProjectDTO> getAllByUserId(Integer userId);

    List<ProjectDTO> getAllByUserIdAndIsDoing(Integer userId);

    ProjectUserDTO addUserToProject(Integer userId, Integer projectId);

    List<ProjectDTO> getAllByUserIdOOrderByTaskCount(Integer userId);

    List<ProjectUserDTO> getAllByProjectUserId(Integer userId);

    ProjectDTO changeStatusProject(Integer projectId, Boolean done);

    void deleteUserOfProject(Integer projectId, Integer userId);

    void deleteAllProjectUser(Integer projectId);

    boolean checkProjectAvailable(Integer projectId);

    List<ProjectUserDTO> getAllUserByIsDoing(Integer projectId, boolean isDoing);

    ProjectUserDTO editProjectUser(Integer projectId, Integer userId, ProjectUserRequest projectUserRequest);


}
