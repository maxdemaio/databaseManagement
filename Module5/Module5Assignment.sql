USE intercollegiateathletic;

-- Problem 1
-- For event requests, list the event number, event date (eventrequest.dateheld), 
-- and count of the event plans.  Only include event requests in the 
-- result if the event request has more than one related 
-- event plan with a work date in December 2018.
SELECT eventrequest.eventno, eventrequest.dateheld,
		COUNT(eventplan.PlanNo) AS NUM_EVENT_PLANS
	FROM eventrequest, eventplan;