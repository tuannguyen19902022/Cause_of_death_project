/* Global Total Death */
select sum([Death Numbers]) as Total_Death_world
from dbo.Death_cause$;

/* Total death in Canada*/
select sum([Death Numbers]) as Total_Death_Canada
from dbo.Death_cause$
where Entity = 'Canada';

/*1. What are the 10 leading causes of death around the world? */
select top 10 ([Causes name]), sum([Death Numbers]) as Total_death
from dbo.Death_cause$
group by [Causes name]
order by Total_death DESC
;

/* 2. Top 10 countries with greatest number of deaths */
select Top 10 Entity, Sum([Death Numbers]) as Total_Death
from dbo.Death_cause$
group by Entity
order by Sum([Death Numbers]) DESC;

/*3. What is the trend of cause of death due to Drug use disorder? */

select [Causes name], sum([Death Numbers]) as Total_Death, Year
from dbo.Death_cause$
where  [Causes name] like '%drug%'
group by year, [Causes name]
order by year;



/*4. Trend of 5 leading cause of death over time? */

select [Causes name], sum([Death Numbers]) as Total_Death, Year
from dbo.Death_cause$
where [Causes name] in ('Cardiovascular diseases', 'Neoplasms', 'Chronic respiratory diseases', 'Lower respiratory infections', 'Neonatal disorders')
group by [Causes name], Year
order by Year;
