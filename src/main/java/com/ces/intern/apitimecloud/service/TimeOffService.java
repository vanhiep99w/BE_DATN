package com.ces.intern.apitimecloud.service;

import com.ces.intern.apitimecloud.dto.TimeOffDTO;
import com.ces.intern.apitimecloud.entity.TimeOffEntity;
import com.ces.intern.apitimecloud.http.request.TimeOffRequest;

public interface TimeOffService {
    TimeOffDTO getTimeOffById(Integer timeOffId);
    TimeOffEntity createTimeOff(TimeOffRequest timeOffRequest);
    void deleteTimeOff(Integer timeOffId);
    TimeOffDTO updateTimeOff(TimeOffRequest timeOffRequest, Integer timeOffId);
}
