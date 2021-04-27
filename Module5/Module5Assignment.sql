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