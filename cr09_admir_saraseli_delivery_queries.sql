-- How many rows are on each table
SELECT table_name, table_rows
   FROM INFORMATION_SCHEMA.TABLES
   WHERE TABLE_SCHEMA = 'cr09_admir_saraseli_delivery'

-- How many packages/mail do we have in total
select count(*) as Total FROM mail_delivery_services;

-- How many packages/mail were sent from Vienna
select count(*)  FROM mail_delivery_services
INNER JOIN mds_address ON mail_delivery_services.mds_add_id = mds_address.mds_add_id
WHERE city = "Vienna";

-- Who sent packages/mail on this date
select first_name, last_name, date_time  FROM sender
INNER JOIN mail_delivery_services ON mail_delivery_services.sender_id = sender.sender_id
WHERE date(date_time) = "2020-07-11"
GROUP BY sender.sender_id;

-- Who sent packages/mail between this and that date
select first_name, last_name, date_time  FROM sender
INNER JOIN mail_delivery_services ON mail_delivery_services.sender_id = sender.sender_id
WHERE date(date_time) BETWEEN "2020-01-01" AND "2020-07-12"
GROUP BY sender.sender_id;

-- Who is the emplyee that processed package no 1
select first_name, last_name, hire_date FROM employee
INNER JOIN processed ON processed.emp_no = employee.emp_no
INNER JOIN mail_delivery_services on processed.mds_no = mail_delivery_services.mds_no
WHERE pac_mail_no = 1;

-- Wich packages are not delivered yet 
select pac_mail.* from delivered
INNER JOIN receive_location on delivered.rec_loc_no = receive_location.rec_loc_no
INNER JOIN processing_system on receive_location.proc_sys_no = processing_system.proc_sys_no
INNER JOIN processed on processing_system.process_no = processed.process_no
INNER JOIN mail_delivery_services on processed.mds_no = mail_delivery_services.mds_no
INNER JOIN pac_mail on mail_delivery_services.pac_mail_no = pac_mail.pac_mail_no
where delivered = 0
