package com.dao.commodity.commoditytype;

import com.entity.commodity.Commtype;
import com.entity.commodity.Types;
import org.apache.ibatis.annotations.Param;

import java.util.List;

//商品类型
public interface CommTypesDao {
    //查询所有商品分类
    List<Types> getCommTypesAll();

    //按类型查询商品id
    List<Commtype> getCommsType(int typesid);

    //添加商品时给商品添加类型
    void insertCommtype(@Param("commid") int commid, @Param("typesid") int typesid);

    //最新添加的商品id
    int commTypeId();

    //删除分类
    void deleteCommtype(int commid);

    //修改商品的分类
    void updateCommtype(@Param("typesid") int typesid, @Param("commid") int commid);

    //查询某个商品分类id
    int commTypeid(int commid);

    //通过分类id查询分类
    Types types(int typesid);

}
