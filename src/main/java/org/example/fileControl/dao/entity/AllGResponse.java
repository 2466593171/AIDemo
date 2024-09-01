package org.example.fileControl.dao.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AllGResponse {
    private String status;
    private List<ALLGResult> result;
}
