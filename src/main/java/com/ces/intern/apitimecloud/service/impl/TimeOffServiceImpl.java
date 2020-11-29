package com.ces.intern.apitimecloud.service.impl;

import com.ces.intern.apitimecloud.dto.TimeOffDTO;
import com.ces.intern.apitimecloud.dto.UserDTO;
import com.ces.intern.apitimecloud.entity.TimeOffEntity;
import com.ces.intern.apitimecloud.entity.UserEntity;
import com.ces.intern.apitimecloud.http.exception.BadRequestException;
import com.ces.intern.apitimecloud.http.exception.NotFoundException;
import com.ces.intern.apitimecloud.http.request.TimeOffRequest;
import com.ces.intern.apitimecloud.repository.TimeOffRepository;
import com.ces.intern.apitimecloud.repository.UserRepository;
import com.ces.intern.apitimecloud.service.TimeOffService;
import com.ces.intern.apitimecloud.util.ExceptionMessage;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Date;

@Service
public class TimeOffServiceImpl implements TimeOffService {

    private final TimeOffRepository timeOffRepository;
    private final UserRepository userRepository;
    private final ModelMapper modelMapper;

    public TimeOffServiceImpl(TimeOffRepository timeOffRepository,
                              UserRepository userRepository,
                              ModelMapper modelMapper
                            ){
        this.timeOffRepository = timeOffRepository;
        this.userRepository = userRepository;
        this.modelMapper= modelMapper;
    }

    @Override
    @Transactional
    public TimeOffEntity createTimeOff(TimeOffRequest timeOffRequest) {
        UserEntity userEntity = userRepository.findById(timeOffRequest.getUserId())
                .orElseThrow(()
                        -> new NotFoundException(ExceptionMessage.NOT_FOUND_RECORD.getMessage() + "with" + timeOffRequest.getUserId()));
        TimeOffEntity timeOffEntity = modelMapper.map(timeOffRequest, TimeOffEntity.class);
        timeOffEntity.setStartTime(new Date(timeOffRequest.getMilisecondsStartTime()));
        timeOffEntity.setEndTime(new Date(timeOffRequest.getMilisecondsEndTime()));
        timeOffEntity.setUser(userEntity);
        timeOffEntity.setBasicInfo(new Date(), timeOffRequest.getUserId(), new Date(), timeOffRequest.getUserId());
        timeOffRepository.save(timeOffEntity);
        return timeOffEntity;
    }

    @Override
    public void deleteTimeOff(Integer timeOffId) {
        timeOffRepository.deleteById(timeOffId);
    }

    @Override
    public TimeOffDTO updateTimeOff(TimeOffRequest timeOffRequest, Integer timeOffId) {
        TimeOffEntity timeOffEntity = timeOffRepository.findById(timeOffId)
                .orElseThrow(() -> new NotFoundException(ExceptionMessage.NOT_FOUND_RECORD.getMessage() + "with" + timeOffId));
        timeOffEntity.setStartTime(new Date(timeOffRequest.getMilisecondsStartTime()));
        timeOffEntity.setEndTime(new Date(timeOffRequest.getMilisecondsEndTime()));
        timeOffEntity.setDescription(timeOffRequest.getDescription());
        timeOffEntity.setModifyAt(new Date());
        TimeOffEntity timeOffEntityUpdate = timeOffRepository.save(timeOffEntity);
        TimeOffDTO timeOffDTO = modelMapper.map(timeOffEntityUpdate, TimeOffDTO.class);
        timeOffDTO.setUserDTO(modelMapper.map(timeOffEntityUpdate.getUser(), UserDTO.class));
        return timeOffDTO;
    }
}
