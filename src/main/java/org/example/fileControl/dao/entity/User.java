package org.example.fileControl.dao.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author ${author}
 * @since 2024/08/29
 */
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@Data
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private String username;

    private String password;

    @Override
    public String toString() {
        return "User{" +
        "id = " + id +
        ", username = " + username +
        ", password = " + password +
        "}";
    }

    public static User of() {
        return new User();
    }
}
