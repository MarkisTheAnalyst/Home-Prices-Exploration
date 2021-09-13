--What factors drive homeprices? 

Select Distinct neighborhood,bldgtype,housestyle,lotarea,grlivarea, yearbuilt, exterior1st, overallcond, saleprice
From houseprices 
Order By neighborhood ASC


--Neighborhood total sales

Select neighborhood, Sum(saleprice) AS total_saleprice
From houseprices
Group By neighborhood
Order By total_saleprice Desc

--Building type factor in top 5 neighborhoods 

Select neighborhood, bldgtype, Sum(saleprice) AS total_saleprice
From houseprices
Where neighborhood IN ('NAmes', 'CollgCr', 'NridgHt', 'Somerst', 'Gilbert')
Group By neighborhood, bldgtype
Order By neighborhood Asc, total_saleprice Desc

--Building type Count in Top 5 neighborhoods

Select neighborhood, bldgtype, Count(bldgtype) AS count_bldgtype, Sum(saleprice) AS total_saleprice
From houseprices
Where neighborhood IN ('NAmes', 'CollgCr', 'NridgHt', 'Somerst', 'Gilbert')
Group By neighborhood, bldgtype
Order By neighborhood Asc, total_saleprice Desc 

--Avg overall condition of Single Family Building type

Select neighborhood, bldgtype, Round(Avg(overallcond),0) AS avg_overallcond, Sum(saleprice) AS total_saleprice
From houseprices
Where neighborhood IN ('NAmes', 'CollgCr', 'NridgHt', 'Somerst', 'Gilbert') AND bldgtype='1Fam'
Group By neighborhood, bldgtype
Order By total_saleprice Desc 

--Best overall condition effect on single family total sales

Select neighborhood, bldgtype, Round(Avg(overallcond),0) AS avg_overallcond, Sum(saleprice) AS total_saleprice
From houseprices
Where neighborhood IN ('NAmes', 'CollgCr', 'NridgHt', 'Somerst', 'Gilbert') AND bldgtype='1Fam'
Group By neighborhood, bldgtype
Having Round(Avg(overallcond),0) > 5
Order By neighborhood Asc, total_saleprice Desc
 