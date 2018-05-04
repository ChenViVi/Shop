package com.keeper.repository;

import com.keeper.model.ArticleEntity;
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
public interface ArticleRepository extends JpaRepository<ArticleEntity, Integer> {
    @Modifying
    @Transactional
    @Query("update ArticleEntity article set article.title=:qTitle, article.type.id=:qTypeId," +
            "article.content=:qContent where article.id=:qId")
    void updateArticle(@Param("qTitle") String title, @Param("qTypeId") int typeId, @Param("qContent") String content,@Param("qId") int id);

    @Modifying
    @Transactional
    @Query("update ArticleEntity article set article.type.id=-1 where article.type.id=:qId")
    public void deleteType(@Param("qId") int id);
}
