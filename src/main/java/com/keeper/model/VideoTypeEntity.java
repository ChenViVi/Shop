package com.keeper.model;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by Administrator on 2017/7/31.
 */
@Entity
@Table(name = "video_type", schema = "keeper", catalog = "")
public class VideoTypeEntity {
    private int id;
    private String name;
    private Collection<VideoEntity> videos;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 20)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VideoTypeEntity that = (VideoTypeEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "type")
    public Collection<VideoEntity> getVideos() {
        return videos;
    }

    public void setVideos(Collection<VideoEntity> videos) {
        this.videos = videos;
    }
}
