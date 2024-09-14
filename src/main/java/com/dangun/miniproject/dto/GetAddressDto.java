package com.dangun.miniproject.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@Builder
@ToString
@NoArgsConstructor
public class GetAddressDto {
    @JsonProperty("street")
    private String street;

    @JsonProperty("detail")
    private String detail;

    @JsonProperty("zipcode")
    private String zipcode;

    @Builder
    public GetAddressDto(String street, String detail, String zipcode) {
        this.street = street;
        this.detail = detail;
        this.zipcode = zipcode;
    }
}
