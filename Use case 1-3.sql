USE Hospital;

select * from Physician
select * from Buildings

select physician_first_name, physician_last_name from Physician p
INNER JOIN Buildings b 
on p.physician_id=b.physician_id
where building_name ='Agnes' or building_name= 'Palladius'

select * from Patient
select * from Insurance_Plan

select patient_first_name, patient_last_name,Insurance_name from Patient p
INNER JOIN Insurance_Plan ip 
on p.insurance_id=ip.insurance_id where p.insurance_id is not null

select * from Waiting_List

ALTER PROC add_patient
@appointment_id varchar(20),
@patient_id varchar(20)
AS
BEGIN
declare @waitingNo int

if NOT EXISTS(select * from Waiting_List)
BEGIN
INSERT INTO Waiting_List values(@appointment_id,@patient_id,1,'Scheduled')
END
ELSE
BEGIN
select @waitingNo =(select top(1) waiting_number from Waiting_List order by waiting_number desc) 
SET @waitingNo= @waitingNo +1
INSERT INTO Waiting_List values(@appointment_id,@patient_id,@waitingNo,'Scheduled')
END

END

select * from Patient

EXEC add_patient 'A11','P1'
EXEC add_patient 'A21','P2'

select * from Waiting_List