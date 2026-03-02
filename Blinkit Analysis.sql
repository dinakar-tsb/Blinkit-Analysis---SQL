SELECT
    CAST(SUM(Total_Sales)/1000000 AS DECIMAL(10,2)) AS Total_Sales_Million,
    CAST(AVG(Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
    COUNT(*) AS No_of_Items,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data;

SELECT Item_Fat_Content, 
			CAST(SUM(Total_Sales)/1000 AS DECIMAL(10,2)) AS Total_Sales_by_Thousands,
			CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
			COUNT(*) AS No_of_items,
			CAST(AVG(Rating)AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Fat_Content
ORDER BY Total_Sales_by_Thousands DESC

SELECT Item_Type, 
			CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
			CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
			COUNT(*) AS No_of_items,
			CAST(AVG(Rating)AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC

SELECT Outlet_Location_Type,Item_Fat_Content,
			CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
			CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
			COUNT(*) AS No_of_items,
			CAST(AVG(Rating)AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Location_Type, Item_Fat_Content
ORDER BY Total_Sales

SELECT Outlet_Location_Type,
		ISNULL([Low Fat], 0) AS Low_Fat,
		ISNULL([Regular], 0) AS Regular
FROM
(
	SELECT Outlet_Location_Type, Item_Fat_Content,
			CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
	FROM blinkit_data
	GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT
(
	SUM(Total_Sales)
	FOR Item_Fat_Content IN ([Low Fat],[Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type

SELECT Outlet_Establishment_Year,
			CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
			CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
			COUNT(*) AS No_of_items,
			CAST(AVG(Rating)AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Total_Sales DESC

SELECT
	Outlet_Size,
	CAST(SUM(Total_Sales) AS DECIMAL (10,2)) AS Total_Sales,
	CAST((SUM(Total_Sales) * 100.0/ SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC

SELECT Outlet_Location_Type,
			CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
			CAST((SUM(Total_Sales) * 100.0/ SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
			CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
			COUNT(*) AS No_of_items,
			CAST(AVG(Rating)AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC

SELECT Outlet_Type,
			CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
			CAST((SUM(Total_Sales) * 100.0/ SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
			CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
			COUNT(*) AS No_of_items,
			CAST(AVG(Rating)AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC