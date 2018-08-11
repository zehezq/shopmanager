package cn.edu.jxufe.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * tb_advertisement
 * @author 
 */
public class TbAdvertisement implements Serializable {
    private Integer adno;

    private Integer index;

    private Integer status;

    private Date createtime;

    private String picurl;

    private String url;

    private String title;

    private static final long serialVersionUID = 1L;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getAdno() {
        return adno;
    }

    public void setAdno(Integer adno) {
        this.adno = adno;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getPicurl() {
        return picurl;
    }

    public void setPicurl(String picurl) {
        this.picurl = picurl;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        TbAdvertisement other = (TbAdvertisement) that;
        return (this.getAdno() == null ? other.getAdno() == null : this.getAdno().equals(other.getAdno()))
            && (this.getIndex() == null ? other.getIndex() == null : this.getIndex().equals(other.getIndex()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getCreatetime() == null ? other.getCreatetime() == null : this.getCreatetime().equals(other.getCreatetime()))
            && (this.getPicurl() == null ? other.getPicurl() == null : this.getPicurl().equals(other.getPicurl()))
            && (this.getUrl() == null ? other.getUrl() == null : this.getUrl().equals(other.getUrl()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getAdno() == null) ? 0 : getAdno().hashCode());
        result = prime * result + ((getIndex() == null) ? 0 : getIndex().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getCreatetime() == null) ? 0 : getCreatetime().hashCode());
        result = prime * result + ((getPicurl() == null) ? 0 : getPicurl().hashCode());
        result = prime * result + ((getUrl() == null) ? 0 : getUrl().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", adno=").append(adno);
        sb.append(", index=").append(index);
        sb.append(", status=").append(status);
        sb.append(", createtime=").append(createtime);
        sb.append(", picurl=").append(picurl);
        sb.append(", url=").append(url);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}