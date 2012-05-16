package com.shop.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Param;

import com.shop.model.ShopArticle;

public interface ArticleMapper extends BaseMapper<ShopArticle>{
	List<ShopArticle> load(@Param("loadnum") int loadnum);
}
