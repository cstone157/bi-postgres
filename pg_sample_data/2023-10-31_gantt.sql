CREATE TABLE public.gantt_chart
(
    uid serial NOT NULL,
    "time" timestamp with time zone NOT NULL,
    target_a_find integer,
    target_a_fix integer,
    target_a_track integer,
    target_a_target integer,
    target_a_engage integer,

    target_b_find integer,
    target_b_fix integer,
    target_b_track integer,
    target_b_target integer,
    target_b_engage integer,

    target_c_find integer,
    target_c_fix integer,
    target_c_track integer,
    target_c_target integer,
    target_c_engage integer,

    PRIMARY KEY (uid)
);

ALTER TABLE IF EXISTS public.gantt_chart
    OWNER to shoc;


INSERT INTO public.gantt_chart
  ("time", 
   "target_a_find", "target_a_fix", "target_a_track", 
   "target_a_target", "target_a_engage", 
   "target_b_find", "target_b_fix", "target_b_track", 
   "target_b_target", "target_b_engage", 
   "target_c_find", "target_c_fix", "target_c_track", 
   "target_c_target", "target_c_engage")
  VALUES ('2023-10-31 09:00:00+00', 
		  0, 0, 0, 
		  0, 0, 
		  0, 0, 0, 
		  0, 0, 
		  0, 0, 0, 
		  0, 0),
      ('2023-10-31 09:01:00+00', 
		  1, 0, 0, 
		  0, 0, 
		  0, 0, 0, 
		  0, 0, 
		  0, 0, 0, 
		  0, 0),
		  ('2023-10-31 09:02:10+00', 
		  1, 0, 0, 
		  0, 0, 
		  0, 0, 0, 
		  0, 0, 
		  0, 0, 0, 
		  0, 0),
		  ('2023-10-31 09:03:00+00', 
		  1, 2, 0, 
		  0, 0, 
		  0, 0, 0, 
		  0, 0, 
		  0, 0, 0, 
		  0, 0),
		  ('2023-10-31 09:04:00+00', 
		  0, 2, 0, 
		  0, 0, 
		  0, 0, 0, 
		  0, 0, 
		  0, 0, 0, 
		  0, 0),
		  ('2023-10-31 09:05:00+00', 
		  0, 2, 0, 
		  0, 0, 
		  0, 0, 0, 
		  0, 0, 
		  0, 0, 0, 
		  0, 0),
		  ('2023-10-31 09:10:00+00', 
		  0, 0, 3, 
		  0, 0, 
		  1, 0, 0, 
		  0, 0, 
		  0, 0, 0, 
		  0, 0),
		  ('2023-10-31 09:15:00+00', 
		  0, 0, 3, 
		  0, 0, 
		  0, 0, 0, 
		  4, 0, 
		  0, 0, 0, 
		  0, 0),
		  ('2023-10-31 09:16:00+00', 
		  0, 0, 3, 
		  4, 0, 
		  0, 0, 0, 
		  4, 0, 
		  0, 0, 0, 
		  0, 0),
		  ('2023-10-31 09:20:00+00', 
		  0, 0, 0, 
		  0, 5, 
		  0, 0, 0, 
		  4, 0, 
		  0, 0, 0, 
		  0, 0),
		  ('2023-10-31 09:23:00+00', 
		  0, 0, 0, 
		  0, 0, 
		  0, 0, 0, 
		  4, 0, 
		  1, 0, 0, 
		  0, 0);

update public.gantt_chart set target_a_find = NULL where target_a_find = 0;
update public.gantt_chart set target_a_fix = NULL where target_a_fix = 0;
update public.gantt_chart set target_a_track = NULL where target_a_track = 0;
update public.gantt_chart set target_a_target = NULL where target_a_target = 0;
update public.gantt_chart set target_a_engage = NULL where target_a_engage = 0;
update public.gantt_chart set target_b_find = NULL where target_b_find = 0;
update public.gantt_chart set target_b_fix = NULL where target_b_fix = 0;
update public.gantt_chart set target_b_track = NULL where target_b_track = 0;
update public.gantt_chart set target_b_target = NULL where target_b_target = 0;
update public.gantt_chart set target_b_engage = NULL where target_b_engage = 0;
update public.gantt_chart set target_c_find = NULL where target_c_find = 0;
update public.gantt_chart set target_c_fix = NULL where target_c_fix = 0;
update public.gantt_chart set target_c_track = NULL where target_c_track = 0;
update public.gantt_chart set target_c_target = NULL where target_c_target = 0;
update public.gantt_chart set target_c_engage = NULL where target_c_engage = 0;

DROP TABLE public.gantt_chart;

CREATE TABLE public.gantt_chart
(
    uid serial NOT NULL,
    "time" timestamp with time zone NOT NULL,
    target_a_find text,
    target_a_fix text,
    target_a_track text,
    target_a_target text,
    target_a_engage text,

    target_b_find text,
    target_b_fix text,
    target_b_track text,
    target_b_target text,
    target_b_engage text,

    target_c_find text,
    target_c_fix text,
    target_c_track text,
    target_c_target text,
    target_c_engage text,

    PRIMARY KEY (uid)
);

ALTER TABLE IF EXISTS public.gantt_chart
    OWNER to shoc;
	
INSERT INTO public.gantt_chart
  ("time", 
   "target_a_find", "target_a_fix", "target_a_track", 
   "target_a_target", "target_a_engage", 
   "target_b_find", "target_b_fix", "target_b_track", 
   "target_b_target", "target_b_engage", 
   "target_c_find", "target_c_fix", "target_c_track", 
   "target_c_target", "target_c_engage")
  VALUES ('2023-10-31 09:00:00+00', 
		  NULL, NULL, NULL, 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL), 
      ('2023-10-31 09:01:00+00', 
		  1, NULL, NULL, 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL), 
		  ('2023-10-31 09:02:10+00', 
		  'Find', NULL, NULL, 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL), 
		  ('2023-10-31 09:03:00+00', 
		  'Find', 'Fix', NULL, 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL), 
		  ('2023-10-31 09:04:00+00', 
		  NULL, 'Fix', NULL, 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL), 
		  ('2023-10-31 09:05:00+00', 
		  NULL, 'Fix', NULL, 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL), 
		  ('2023-10-31 09:10:00+00', 
		  NULL, NULL, 'Track', 
		  NULL, NULL, 
		  'Find', NULL, NULL, 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL), 
		  ('2023-10-31 09:15:00+00', 
		  NULL, NULL, 'Track', 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  'Target', NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL), 
		  ('2023-10-31 09:16:00+00', 
		  NULL, NULL, 'Track', 
		  'Target', NULL, 
		  NULL, NULL, NULL, 
		  'Target', NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL), 
		  ('2023-10-31 09:20:00+00', 
		  NULL, NULL, NULL, 
		  NULL, 'Engage', 
		  NULL, NULL, NULL, 
		  'Target', NULL, 
		  NULL, NULL, NULL, 
		  NULL, NULL), 
		  ('2023-10-31 09:23:00+00', 
		  NULL, NULL, NULL, 
		  NULL, NULL, 
		  NULL, NULL, NULL, 
		  'Target', NULL, 
		  'Find', NULL, NULL, 
		  NULL, NULL);


