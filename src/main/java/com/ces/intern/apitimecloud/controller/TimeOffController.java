package com.ces.intern.apitimecloud.controller;

import com.ces.intern.apitimecloud.dto.TimeOffDTO;
import com.ces.intern.apitimecloud.dto.UserDTO;
import com.ces.intern.apitimecloud.entity.TimeOffEntity;
import com.ces.intern.apitimecloud.http.exception.BadRequestException;
import com.ces.intern.apitimecloud.http.request.TimeOffRequest;
import com.ces.intern.apitimecloud.repository.TimeOffRepository;
import com.ces.intern.apitimecloud.service.TimeOffService;
import com.ces.intern.apitimecloud.util.ExceptionMessage;
import com.ces.intern.apitimecloud.util.ResponseMessage;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/time-off")
public class TimeOffController {

    private final TimeOffService timeOffService;
    private final ModelMapper modelMapper;

    public TimeOffController(TimeOffService timeOffService,
                      ModelMapper modelMapper
                        ){
        this.timeOffService = timeOffService;
        this.modelMapper = modelMapper;
    }

    @PostMapping("")
    private TimeOffDTO create(@RequestBody TimeOffRequest timeOffRequest) throws Exception {
        if(timeOffRequest.getDescription().isEmpty()) throw new BadRequestException(ExceptionMessage.MISSING_REQUIRE_FIELD.name());
        TimeOffEntity timeOffEntity = timeOffService.createTimeOff(timeOffRequest);
        UserDTO userDTO = modelMapper.map(timeOffEntity.getUser(), UserDTO.class);
        TimeOffDTO timeOffDTO = modelMapper.map(timeOffEntity, TimeOffDTO.class);
        timeOffDTO.setUserDTO(userDTO);
        return timeOffDTO;
    }

    @PutMapping("/{timeOffId}")
    private TimeOffDTO update(@RequestBody TimeOffRequest timeOffRequest, @PathVariable Integer timeOffId) throws Exception {
        return timeOffService.updateTimeOff(timeOffRequest, timeOffId);
    }

    @DeleteMapping("/{timeOffId}")
    private String delete(@PathVariable Integer timeOffId) {
        timeOffService.deleteTimeOff(timeOffId);
        return ResponseMessage.DELETE_SUCCESS;
    }
}
