USE intercollegiateathletic;

-- Problem 1
-- For event requests, list the event number, event date (eventrequest.dateheld), 
-- and count of the event plans.  Only include event requests in the 
-- result if the event request has more than one related 
-- event plan with a work date in December 2018.
SELECT eventrequest.eventno, eventrequest.dateheld,
		COUNT(eventplans.PlanNo) AS numEventPlans
	FROM eventrequest, eventplans
    WHERE eventrequest.eventno = eventplans.eventno
    GROUP BY EventRequest.EventNo, eventrequest.dateheld
    HAVING numEventPlans > 1;
    
-- Problem 2
-- List the plan number, event number, work date, and 
-- activity of event plans meeting the following two conditions: 
-- (1) the work date is in December 2018 and (2) the event is held in the “Basketball arena”. 
--  Your query must not use the facility number (“F101”) of the basketball arena in the WHERE clause. 
--  Instead, you should use a condition on the FacName column for the value of “Basketball arena”.
SELECT eventrequest.eventno, eventplans.planno, 
		eventplans.workdate, eventplans.activity, facility.facname
	FROM eventrequest, eventplans, facility
    WHERE eventrequest.eventno = eventplans.eventno
		AND eventrequest.facno = facility.facno
        AND facname = "Basketball arena";

-- Problem 3
-- List the event number, event date, status, and estimated cost of events where 
-- there is an event plan managed by Mary Manager and the event is held in the basketball arena 
-- in the period October 1 to December 31, 2018.  
-- Your query must not use the facility number (“F101”) of the basketball arena 
-- or the employee number (“E101”) of “Mary Manager” in the WHERE clause. 
-- Thus, the WHERE clause should not have conditions involving the facility number or employee number compared to constant values.
SELECT eventrequest.eventno, dateheld, status, estcost,
		eventplans.planno, eventplans.workdate, eventplans.activity, 
        facility.facname,
        employee.empname
	FROM eventrequest, eventplans, facility, employee
    WHERE eventrequest.eventno = eventplans.eventno
		AND eventrequest.facno = facility.facno
        AND eventplans.empno = employee.empno
        AND facname = "Basketball arena"
        AND empname = "Mary Manager";

        