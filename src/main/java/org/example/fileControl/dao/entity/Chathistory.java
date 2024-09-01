package org.example.fileControl.dao.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author ${author}
 * @since 2024/08/31
 */
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@Data
public class Chathistory implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private Long userid;

    private String content;

    private LocalDateTime createTime;

    private String platform;

    private Integer type;

    public static Chathistory of(){
        return new Chathistory();
    }
}
