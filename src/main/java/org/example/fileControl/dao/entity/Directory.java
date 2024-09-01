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
public class Directory implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 账号id
     */
    private Long userid;

    /**
     * 父目录id
     */
    private Long parentid;

}
