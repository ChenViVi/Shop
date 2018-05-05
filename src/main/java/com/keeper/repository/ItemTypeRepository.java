package com.keeper.repository;

import com.keeper.model.ItemTypeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Administrator on 2017/7/27.
 */
@Repository
public interface ItemTypeRepository extends JpaRepository<ItemTypeEntity, Integer> {
    @Modifying      // 说明该方法是修改操作
    @Transactional  // 说明该方法是事务性操作
    // 定义查询
    // @Param注解用于提取参数
    @Query("update MusicTypeEntity us set us.name=:qName where us.id=:qId")
    public void updateVideoType(@Param("qName") String name, @Param("qId") Integer id);
}
