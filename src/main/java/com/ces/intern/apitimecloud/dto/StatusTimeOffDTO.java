package com.ces.intern.apitimecloud.dto;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class StatusTimeOffDTO {
    private Integer id;
    private TimeOffDTO timeOff;
    private UserDTO approver;
    private String response;
    private Integer status;
}
