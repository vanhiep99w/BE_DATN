package com.ces.intern.apitimecloud.service;

import com.ces.intern.apitimecloud.entity.StatusTimeOffEntity;
import com.ces.intern.apitimecloud.entity.TimeOffEntity;
import com.ces.intern.apitimecloud.http.request.StatusTimeOffRequest;

public interface StatusTimeOffService {

    StatusTimeOffEntity getById(Integer timeOffId);
    StatusTimeOffEntity create(TimeOffEntity timeOffEntity);
    StatusTimeOffEntity update(StatusTimeOffRequest request, Integer timeOffId);
    void delete(Integer timeOffId);

}
