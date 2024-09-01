package org.example.fileControl.dao.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Rapid {
    private boolean clientError;
    private String msg;
    private boolean serverError;
}
