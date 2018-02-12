USE Hospital;

select * from Patient


select * from Physician
select * from Appointment
select * from patient_visits

select Physician_first_name, physician_last_name from Physician where physician_id 
NOT IN(select physician_id from appointment where appointment_id in('A11','A12','A13')) 

select * from Patient
select * from Insurance_Plan
select * from Patient_Ins
select * from Waiting_List

CREATE PROC patient_bal_updt
AS
BEGIN
declare @patient_id varchar(20)
declare @insurance_id varchar(20)
select Top(1) @patient_id=patient_id from Waiting_List order by waiting_id desc
select @insurance_id= insurance_id from Patient where patient_id=@patient_id
if (@insurance_id='I1')
BEGIN
update Patient_Ins set Patient_balance_due=10 where patient_id=@patient_id and Insurance_id=@insurance_id
END
else if (@insurance_id='I2')
BEGIN
update Patient_Ins set Patient_balance_due=20 where patient_id=@patient_id and Insurance_id=@insurance_id
END
else if (@insurance_id='I3')
BEGIN
update Patient_Ins set Patient_balance_due=30 where patient_id=@patient_id and Insurance_id=@insurance_id
END
else if (@insurance_id='I4')
BEGIN
update Patient_Ins set Patient_balance_due=40 where patient_id=@patient_id and Insurance_id=@insurance_id
END
else if (@insurance_id='I5')
BEGIN
update Patient_Ins set Patient_balance_due=50 where patient_id=@patient_id and Insurance_id=@insurance_id
END
END

exec add_patient 'A61','P6'

select * from Waiting_List

exec patient_bal_updt

select * from Patient_Ins
select * from patient

CREATE PROC Cancel_Ins
@patient_id varchar(20)
AS
BEGIN
update Patient set insurance_id = NULL where patient_id=@patient_id
update Patient_Ins set Insurance_id = NULL where patient_id=@patient_id
END

exec Cancel_Ins 'P5'

select * from Patient

select * from Patient_Ins