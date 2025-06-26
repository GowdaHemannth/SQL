-- Q1: Workers with salary greater than average salary
SELECT * FROM WORKER_ONE
WHERE Salary > (SELECT AVG(Salary) FROM WORKER_ONE);

-- Q2: Workers in same department as worker 001
SELECT * FROM WORKER_ONE
WHERE Department = (
    SELECT Department FROM WORKER_ONE WHERE WORKER_ID = 001
);

-- Q3: Workers with max salary in their department
SELECT * FROM WORKER_ONE w
WHERE Salary = (
    SELECT MAX(Salary) FROM WORKER_ONE WHERE Department = w.Department
);

-- Q4: Workers not present in bonus table
SELECT * FROM WORKER_ONE
WHERE WORKER_ID NOT IN (
    SELECT WORKER_REF_ID FROM B
);

-- Q5: Worker who joined first
SELECT * FROM WORKER_ONE
WHERE Joining_Date = (
    SELECT MIN(Joining_Date) FROM WORKER_ONE
);

-- Q6: Departments with more than 1 worker
SELECT DISTINCT Department FROM WORKER_ONE
WHERE Department IN (
    SELECT Department FROM WORKER_ONE GROUP BY Department HAVING COUNT(*) > 1
);

-- Q7: Workers with salary less than min bonus
SELECT * FROM WORKER_ONE
WHERE Salary < (
    SELECT MIN(BONUS_AMOUNT) FROM B
);

-- Q8: Worker with second highest salary
SELECT * FROM WORKER_ONE
WHERE Salary = (
    SELECT MAX(Salary) FROM WORKER_ONE
    WHERE Salary < (SELECT MAX(Salary) FROM WORKER_ONE)
);

-- Q9: Workers with salary > all in HR
SELECT * FROM WORKER_ONE
WHERE Salary > ALL (
    SELECT Salary FROM WORKER_ONE WHERE Department = 'HR'
);

-- Q10: Workers with same last name as someone else
SELECT * FROM WORKER_ONE
WHERE LAST_NAME IN (
    SELECT LAST_NAME FROM WORKER_ONE GROUP BY LAST_NAME HAVING COUNT(*) > 1
);

-- Q11: Workers with bonus > average bonus
SELECT * FROM WORKER_ONE
WHERE WORKER_ID IN (
    SELECT WORKER_REF_ID FROM B
    WHERE BONUS_AMOUNT > (SELECT AVG(BONUS_AMOUNT) FROM B)
);

-- Q12: Workers with bonus same date as worker 002
SELECT * FROM WORKER_ONE
WHERE WORKER_ID IN (
    SELECT WORKER_REF_ID FROM B
    WHERE BONUS_DATE = (
        SELECT BONUS_DATE FROM B WHERE WORKER_REF_ID = 002
    )
);

-- Q13: Workers with max bonus
SELECT * FROM WORKER_ONE
WHERE WORKER_ID IN (
    SELECT WORKER_REF_ID FROM B
    WHERE BONUS_AMOUNT = (SELECT MAX(BONUS_AMOUNT) FROM B)
);

-- Q14: Bonus < bonus of worker 005
SELECT * FROM WORKER_ONE
WHERE WORKER_ID IN (
    SELECT WORKER_REF_ID FROM B
    WHERE BONUS_AMOUNT < (
        SELECT BONUS_AMOUNT FROM B WHERE WORKER_REF_ID = 005
    )
);

-- Q15: Workers with no bonus
SELECT * FROM WORKER_ONE
WHERE WORKER_ID NOT IN (SELECT WORKER_REF_ID FROM B);

-- Q16: Total bonus for workers earning > 60000
SELECT SUM(BONUS_AMOUNT) FROM B
WHERE WORKER_REF_ID IN (
    SELECT WORKER_ID FROM WORKER_ONE WHERE Salary > 60000
);

-- Q17: Workers with more than one bonus (if multiple rows per worker)
SELECT WORKER_REF_ID FROM B
GROUP BY WORKER_REF_ID HAVING COUNT(*) > 1;

-- Q18: Bonus after title assignment
SELECT * FROM WORKER_ONE
WHERE WORKER_ID IN (
    SELECT b.WORKER_REF_ID FROM B b
    WHERE b.BONUS_DATE > (
        SELECT AFFECTED_FROM FROM Title t WHERE t.WORKER_REF_ID = b.WORKER_REF_ID
    )
);

-- Q19: Workers with same title as worker 003
SELECT * FROM WORKER_ONE
WHERE WORKER_ID IN (
    SELECT WORKER_REF_ID FROM Title
    WHERE WORKER_TITLE = (
        SELECT WORKER_TITLE FROM Title WHERE WORKER_REF_ID = 003
    )
);

-- Q20: Workers with most recent title
SELECT * FROM WORKER_ONE
WHERE WORKER_ID IN (
    SELECT WORKER_REF_ID FROM Title
    WHERE AFFECTED_FROM = (
        SELECT MAX(AFFECTED_FROM) FROM Title
    )
);

-- Q21: Title assigned before joining date
SELECT * FROM WORKER_ONE
WHERE WORKER_ID IN (
    SELECT t.WORKER_REF_ID FROM Title t
    WHERE t.AFFECTED_FROM < (
        SELECT Joining_Date FROM WORKER_ONE w WHERE w.WORKER_ID = t.WORKER_REF_ID
    )
);

-- Q22: Unique titles in IT dept
SELECT DISTINCT WORKER_TITLE FROM Title
WHERE WORKER_REF_ID IN (
    SELECT WORKER_ID FROM WORKER_ONE WHERE Department = 'IT'
);

-- Q23: Most common title
SELECT WORKER_TITLE FROM Title
GROUP BY WORKER_TITLE
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Q24: Non-managers earning more than managers
SELECT * FROM WORKER_ONE
WHERE WORKER_ID IN (
    SELECT t.WORKER_REF_ID FROM Title t
    WHERE t.WORKER_TITLE <> 'Manager'
) AND Salary > (
    SELECT MAX(Salary) FROM WORKER_ONE
    WHERE WORKER_ID IN (
        SELECT WORKER_REF_ID FROM Title WHERE WORKER_TITLE = 'Manager'
    )
);

-- Q25: Workers whose title changed after first bonus
SELECT * FROM WORKER_ONE
WHERE WORKER_ID IN (
    SELECT t.WORKER_REF_ID FROM Title t
    WHERE t.AFFECTED_FROM > (
        SELECT MIN(BONUS_DATE) FROM B
        WHERE WORKER_REF_ID = t.WORKER_REF_ID
    )
);
