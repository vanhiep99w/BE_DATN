package com.ces.intern.apitimecloud.http.request;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProjectRequest {

    private String name;
    private String clientName;
    private String color;
    private Boolean done;
    private Integer projectManagerId;
    private Integer budget;
    private Boolean permission;
}
