--Qn.1-For each author, what proportion of their papers are in each category

select F.*,
      round(F.Author_No_in_Cat/F.No_Paper_in_cat,2) as Paper_proportion
	 -- ,F.No_Paper_in_cat/ (F.Author_No_in_Cat*5)

from(select distinct --D.*
                --D.Author_id
                D.Author_name
                ,D.categories
				,round(count(D.Publication_id) OVER(PARTITION BY D.categories),2) No_Paper_in_cat
                ,round(count(D.categories) OVER(PARTITION  BY D.Author_name ),2)AS Author_No_in_Cat
from
(select A.*
,C.* 
,F.*,concat(F.first_name,' ',F.last_name) as Author_name
from Publication_table A
inner join Pub_Sub_Cat_Table B
using(publication_id)
inner join Subcategories C
using(Sub_categories_id)
inner join Author_Bridge as E
 using(Publication_id)
inner join Authors F
using(Author_id)
) as D) as F ;





--Qn.2 What is are the mean and variance of the length of titles (or abstracts) in each category?

/*
select Publication_id
      ,title
      ,Abstract
	  ,categories,title_mean,Title_Variance,Abstract_mean,Abstract_Variance as Abstract_Variance
FROM (
*/	
SELECT E.Publication_id
      ,E.title
      ,E.Abstract
	  ,E.categories
     ,ROUND(E.Title_mean,2) as Title_mean
	 ,ROUND(E.Title_Ev_sq-E.Title_mean^2) AS Title_Variance
	 ,ROUND(E.Abstract_mean,2) as Abstract_mean
	 ,ROUND(E.Abstract_Ev_sq-E.Abstract_mean^2) AS Abstract_Variance
	 
From(	 
select D.*, length(D.title) AS X
,AVG(length(D.title)) OVER(PARTITION  BY D.Categories)AS Title_mean
,AVG(length(D.title)^2) OVER(PARTITION  BY D.Categories)AS Title_Ev_sq	
,AVG(length(D.Abstract))  OVER(PARTITION  BY D.Categories)AS Abstract_mean	
,AVG(length(D.Abstract)^2) OVER(PARTITION  BY D.Categories)AS Abstract_Ev_sq
from (select A.*
,C.* 
from Publication_table A
inner join Pub_Sub_Cat_Table B
using(publication_id)
inner join Subcategories C
using(Sub_categories_id)) as D) as E
--) AS F
;
	  



--Qn-3 Find the Publication_id, title, url, abstract ,categories and Author's full name  who have published paper in category
--     'Physics' and 'math' 



select D.Publication_id, D.title, D.url, D.abstract ,D.categories,D.Author_name,D.date 
from(select A.*
,C.* 
--,F.author_id 
,concat(F.first_name,' ',F.last_name) as Author_name
from Publication_table as  A
inner join Pub_Sub_Cat_Table B
using(publication_id)	 
inner join Subcategories C
using(Sub_categories_id)
inner join Author_Bridge as E
 using(Publication_id)
inner join Authors F
using(Author_id) ) D
 where D.categories in('physics','mathematics')	 
 ;


--Qn.4 Give the list of publication_id, title, abstract and categories which are published in June belong to Subcategory 'astrophysics'.

select A.publication_id, A.title,A.abstract,C.categories
from publication_table A
inner join Pub_Sub_Cat_Table B
using(publication_id)
inner join Subcategories C
using(Sub_categories_id)
where subcategories='astrophysics'
and  A.date between '2007-06-01' and '2007-06-30'
;



