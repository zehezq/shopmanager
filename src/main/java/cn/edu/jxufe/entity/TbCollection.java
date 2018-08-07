package cn.edu.jxufe.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * tb_collection
 * @author 
 */
public class TbCollection implements Serializable {
    /**
     * 收藏标识
     */
    private Integer collid;

    /**
     * 用户编号
     */
    private Integer userid;

    /**
     * 商品编号
     */
    private Integer goodid;

    /**
     * 收藏时间
     */
    private Date updatetime;

    private static final long serialVersionUID = 1L;

    public Integer getCollid() {
        return collid;
    }

    public void setCollid(Integer collid) {
        this.collid = collid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getGoodid() {
        return goodid;
    }

    public void setGoodid(Integer goodid) {
        this.goodid = goodid;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
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
        TbCollection other = (TbCollection) that;
        return (this.getCollid() == null ? other.getCollid() == null : this.getCollid().equals(other.getCollid()))
            && (this.getUserid() == null ? other.getUserid() == null : this.getUserid().equals(other.getUserid()))
            && (this.getGoodid() == null ? other.getGoodid() == null : this.getGoodid().equals(other.getGoodid()))
            && (this.getUpdatetime() == null ? other.getUpdatetime() == null : this.getUpdatetime().equals(other.getUpdatetime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getCollid() == null) ? 0 : getCollid().hashCode());
        result = prime * result + ((getUserid() == null) ? 0 : getUserid().hashCode());
        result = prime * result + ((getGoodid() == null) ? 0 : getGoodid().hashCode());
        result = prime * result + ((getUpdatetime() == null) ? 0 : getUpdatetime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", collid=").append(collid);
        sb.append(", userid=").append(userid);
        sb.append(", goodid=").append(goodid);
        sb.append(", updatetime=").append(updatetime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}