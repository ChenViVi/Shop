package com.keeper.repository;

import com.keeper.model.ArticleTypeEntity;
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
public interface ArticleTypeRepository extends JpaRepository<ArticleTypeEntity, Integer> {
    @Modifying
    @Transactional
    @Query("update ArticleTypeEntity us set us.name=:qName where us.id=:qId")
    public void updateArticleType(@Param("qName") String name, @Param("qId") Integer id);


}
