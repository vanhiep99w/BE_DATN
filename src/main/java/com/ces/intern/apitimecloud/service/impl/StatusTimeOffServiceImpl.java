package com.ces.intern.apitimecloud.service.impl;


import com.ces.intern.apitimecloud.entity.StatusTimeOffEntity;
import com.ces.intern.apitimecloud.entity.TimeOffEntity;
import com.ces.intern.apitimecloud.entity.UserEntity;
import com.ces.intern.apitimecloud.http.exception.NotFoundException;
import com.ces.intern.apitimecloud.http.request.StatusTimeOffRequest;
import com.ces.intern.apitimecloud.repository.StatusTimeOffRepository;
import com.ces.intern.apitimecloud.repository.UserRepository;
import com.ces.intern.apitimecloud.service.StatusTimeOffService;
import com.ces.intern.apitimecloud.util.ExceptionMessage;
import com.ces.intern.apitimecloud.util.StatusTO;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class StatusTimeOffServiceImpl implements StatusTimeOffService {

    private final StatusTimeOffRepository statusTimeOffRepository;
    private final UserRepository userRepository;

    public StatusTimeOffServiceImpl(StatusTimeOffRepository statusTimeOffRepository,
                                    UserRepository userRepository){
        this.statusTimeOffRepository = statusTimeOffRepository;
        this.userRepository = userRepository;
    }

    @Override
    public StatusTimeOffEntity getById(Integer timeOffId) {
        StatusTimeOffEntity statusTimeOffEntity = statusTimeOffRepository
                .findById(timeOffId)
                .orElseThrow(()
                        -> new NotFoundException(ExceptionMessage.NOT_FOUND_RECORD.getMessage() + " with timeoffId " + timeOffId));

        return statusTimeOffEntity;
    }

    @Override
    public StatusTimeOffEntity create(TimeOffEntity timeOffEntity) {

        StatusTimeOffEntity statusTimeOffEntity = new StatusTimeOffEntity();
        statusTimeOffEntity.setTimeOff(timeOffEntity);
        statusTimeOffEntity.setStatus(StatusTO.PENDING.getId());

        return statusTimeOffRepository.save(statusTimeOffEntity);
    }

    @Override
    public StatusTimeOffEntity update(StatusTimeOffRequest request, Integer timeOffId) {

        StatusTimeOffEntity statusTimeOffEntity = getById(timeOffId);
        UserEntity userEntity = userRepository.findById(request.getApproverId())
                .orElseThrow(()
                        -> new NotFoundException(ExceptionMessage.NOT_FOUND_RECORD.getMessage()));

        statusTimeOffEntity.setStatus(request.getStatus());
        statusTimeOffEntity.setApprover(userEntity);
        statusTimeOffEntity.setAcceptAt(new Date());

        return statusTimeOffRepository.save(statusTimeOffEntity);
    }

    @Override
    public void delete(Integer timeOffId) {
        statusTimeOffRepository.deleteById(timeOffId);
    }

}
