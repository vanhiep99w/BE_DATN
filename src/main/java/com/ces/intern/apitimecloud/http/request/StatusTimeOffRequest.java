package com.ces.intern.apitimecloud.http.request;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class StatusTimeOffRequest {
    private Integer timeOffId;
    private Integer acceptedBy;
    private String response;
    private Integer status;
}
