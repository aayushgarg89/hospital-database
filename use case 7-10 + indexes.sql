USE Hospital;
select * from appointment
select * from Physician
select * from Patient_visits

select p.physician_first_name,p.physician_last_name from Physician p
INNER JOIN (select physician_id,count(physician_id) as 'count' from Appointment a where appointment_date between CAST('11-APR-2016' AS date)
 and CAST('12-APR-2016' AS date) group by physician_id having count(physician_id) in(6,8,20)) a
 on p.physician_id=a.physician_id

 select * from Patient_Ins
 select * from Insurance_Plan

 select IP.Insurance_name,IP.physician_copayment_amt,count(patient_id) as 'No. of patients' from Insurance_Plan IP
 INNER JOIN Patient_Ins P on IP.insurance_id=P.Insurance_id 
 where IP.insurance_id=(select insurance_id from patient_INS group by insurance_id having count(insurance_id)=  
 (select top(1)count(insurance_id) as cnt from Patient_Ins group by Insurance_id order by count(insurance_id) desc))
 group by p.Insurance_id,IP.Insurance_name,IP.physician_copayment_amt  

 
 select * from Patient_visits
 select * from Appointment

 
 --insert into Appointment values('A14','D1',CAST('13-APR-2016' as date))
 insert into Appointment values('A15','D1',CAST('14-APR-2016' as date))
 insert into Appointment values('A16','D1',CAST('15-APR-2016' as date))
 insert into Appointment values('A26','D2',CAST('13-APR-2016' as date))
 insert into Appointment values('A27','D2',CAST('15-APR-2016' as date))
 insert into Appointment values('A72','D5',CAST('14-APR-2016' as date))
 --insert into Patient_visits values('A14','P1')
 insert into Patient_visits values('A15','P1')
 insert into Patient_visits values('A16','P1')
 insert into Patient_visits values('A26','P2')
 insert into Patient_visits values('A27','P2')
 insert into Patient_visits values('A72','P7')

 select * from Patient_visits
 select * from Appointment
 select patient_id, count(appointment_id) from Patient_visits group by patient_id 

 select physician_id, count(appointment_id) from Appointment group by physician_id


 
 --select patient_id,physician_id, count(pv.Appointment_id)as'no of visits' from Patient_visits pv
 --INNER JOIN Appointment a on pv.Appointment_id=a.appointment_id  
 --group by patient_id,physician_id order by count(pv.Appointment_id) desc

 select patient_first_name,patient_last_name,physician_first_name,physician_last_name, count(pv.patient_id)as'no of visits' from patient p 
 INNER JOIN Patient_visits pv on p.patient_id=pv.patient_id
 INNER JOIN Appointment a on pv.Appointment_id=a.appointment_id
 INNER JOIN Physician py on a.physician_id=py.physician_id  
 group by patient_first_name,patient_last_name,physician_first_name,physician_last_name having count(pv.patient_id) > 1

 select * from Patient

 --select physician_first_name,physician_last_name from  Physician
 select distinct a.physician_id,physician_first_name,physician_last_name,count(distinct patient_id) as 'No. of Patients' from Patient_visits pv
 INNER JOIN Appointment a ON pv.Appointment_id=a.appointment_id
 INNER JOIN Physician p on p.physician_id=a.physician_id
 group by a.physician_id,physician_first_name,physician_last_name having count(distinct patient_id) >1
 order by count(distinct patient_id) desc

 select * from waiting_list

 CREATE INDEX wait_list on waiting_list(waiting_id)

 select * from Patient_Ins

 CREATE INDEX Amount_due on Patient_Ins(Patient_balance_due)
 