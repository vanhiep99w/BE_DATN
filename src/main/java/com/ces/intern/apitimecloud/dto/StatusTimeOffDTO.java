package com.ces.intern.apitimecloud.dto;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class StatusTimeOffDTO {
    private TimeOffDTO timeOffDTO;
    private UserDTO userDTO;
    private String response;
    private Integer status;
}
