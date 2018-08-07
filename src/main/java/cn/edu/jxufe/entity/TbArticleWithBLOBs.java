package cn.edu.jxufe.entity;

import java.io.Serializable;
import java.util.Arrays;

/**
 * tb_article
 * @author 
 */
public class TbArticleWithBLOBs extends TbArticle implements Serializable {
    /**
     * 文章内容
     */
    private byte[] content;

    /**
     * 文章图片地址
     */
    private byte[] picurl;

    private static final long serialVersionUID = 1L;

    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    public byte[] getPicurl() {
        return picurl;
    }

    public void setPicurl(byte[] picurl) {
        this.picurl = picurl;
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
        TbArticleWithBLOBs other = (TbArticleWithBLOBs) that;
        return (this.getArticleid() == null ? other.getArticleid() == null : this.getArticleid().equals(other.getArticleid()))
            && (this.getTitle() == null ? other.getTitle() == null : this.getTitle().equals(other.getTitle()))
            && (this.getReadcount() == null ? other.getReadcount() == null : this.getReadcount().equals(other.getReadcount()))
            && (this.getCreatetime() == null ? other.getCreatetime() == null : this.getCreatetime().equals(other.getCreatetime()))
            && (this.getUpdatetime() == null ? other.getUpdatetime() == null : this.getUpdatetime().equals(other.getUpdatetime()))
            && (Arrays.equals(this.getContent(), other.getContent()))
            && (Arrays.equals(this.getPicurl(), other.getPicurl()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getArticleid() == null) ? 0 : getArticleid().hashCode());
        result = prime * result + ((getTitle() == null) ? 0 : getTitle().hashCode());
        result = prime * result + ((getReadcount() == null) ? 0 : getReadcount().hashCode());
        result = prime * result + ((getCreatetime() == null) ? 0 : getCreatetime().hashCode());
        result = prime * result + ((getUpdatetime() == null) ? 0 : getUpdatetime().hashCode());
        result = prime * result + (Arrays.hashCode(getContent()));
        result = prime * result + (Arrays.hashCode(getPicurl()));
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", content=").append(content);
        sb.append(", picurl=").append(picurl);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}