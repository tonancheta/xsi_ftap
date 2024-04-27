USE _682b33b45ffddc2b;

SET sql_safe_updates = 0;

UPDATE `tabEmail Account` SET enable_outgoing = 0 WHERE enable_outgoing = 1;

ALTER TABLE `tabSubscription`
	RENAME COLUMN project_type TO custom_project_type,
	RENAME COLUMN region TO custom_region,
	RENAME COLUMN billing_interval TO custom_billing_interval,
	RENAME COLUMN remarks TO custom_remarks,
	RENAME COLUMN period_of_lease TO custom_period_of_lease,
	RENAME COLUMN site_id TO custom_site_id,
	RENAME COLUMN anchor_mno_site_id TO custom_anchor_mno_site_id,
	RENAME COLUMN sub_plan TO custom_sub_plan,
	RENAME COLUMN workflow_state TO custom_workflow_state;
    
ALTER TABLE `tabItem`
	RENAME COLUMN account_no TO custom_account_no,
	RENAME COLUMN site_id TO custom_site_id,
	RENAME COLUMN project_type TO custom_project_type,
	RENAME COLUMN meter_type TO custom_meter_type,
	RENAME COLUMN meter_number TO custom_meter_number,
	RENAME COLUMN mno TO custom_mno,
	RENAME COLUMN bc_item_no TO custom_bc_item_no;
    
ALTER TABLE `tabSupplier`
	RENAME COLUMN bc_id_number TO custom_bc_id_number,
	RENAME COLUMN bc_business_style TO custom_bc_business_style,
	RENAME COLUMN coop_account_number TO custom_coop_account_number;
    
ALTER TABLE `tabPurchase Invoice`
	RENAME COLUMN bc_vendor_no TO custom_bc_vendor_no,
	RENAME COLUMN business_style TO custom_business_style,
	RENAME COLUMN account_no TO custom_account_no,
	RENAME COLUMN account_no_id TO custom_account_no_id,
	RENAME COLUMN site_id TO custom_site_id,
	RENAME COLUMN remarks_2 TO custom_remarks_2,
	RENAME COLUMN internal_status TO custom_internal_status,
	RENAME COLUMN project_type TO custom_project_type,
	RENAME COLUMN meter_type TO custom_meter_type,
	RENAME COLUMN meter_number TO custom_meter_number,
	RENAME COLUMN mno TO custom_mno,
	RENAME COLUMN kwh_consumed TO custom_kwh_consumed,
	RENAME COLUMN expected_first_billing TO custom_expected_first_billing,
	RENAME COLUMN billing_received_date TO custom_billing_received_date,
	RENAME COLUMN first_billing TO custom_first_billing,
	RENAME COLUMN billing_period TO custom_billing_period,
	RENAME COLUMN invoice_start__date TO custom_invoice_start_date,
	RENAME COLUMN invoice_end_date TO custom_invoice_end_date,
	RENAME COLUMN payment_due_date TO custom_payment_due_date,
	RENAME COLUMN attachment TO custom_attachment_1,
	RENAME COLUMN attachment_2 TO custom_attachment_2,
	RENAME COLUMN attachment_3 TO custom_attachment_3,
	RENAME COLUMN attachment_4 TO custom_attachment_4,
	RENAME COLUMN attachment_5 TO custom_attachment_5;
    
ALTER TABLE `tabPurchase Invoice Item`
	RENAME COLUMN vat_amount TO custom_vat_amount,
	RENAME COLUMN vat_base_amount TO custom_vat_base_amount,
	RENAME COLUMN vat_exempt TO custom_vat_exempt;
    
ALTER TABLE `tabPurchase Invoice Item`
	MODIFY COLUMN custom_vat_amount decimal(21,9),
    MODIFY COLUMN custom_vat_base_amount decimal(21,9),
    MODIFY COLUMN custom_vat_exempt decimal(21,9);
    
UPDATE `tabPurchase Invoice Item` SET custom_vat_amount = 0 WHERE custom_vat_amount IS NULL;

UPDATE `tabPurchase Invoice Item` SET custom_vat_base_amount = 0 WHERE custom_vat_base_amount IS NULL;

UPDATE `tabPurchase Invoice Item` SET custom_vat_exempt = 0 WHERE custom_vat_exempt IS NULL;

ALTER TABLE `tabHoliday` RENAME COLUMN ot_code TO custom_ot_code;
    
CREATE TABLE `tabEmployee FTAP Information` (
    name varchar(140) NOT NULL PRIMARY KEY,
    creation datetime(6),
    modified datetime(6),
    modified_by varchar(140),
    owner varchar(140),
    docstatus int(1),
    idx int(8),
    _user_tags text,
    _comments text,
    _assign text,
    _liked_by text,
    mobile_first_name varchar(140),
    mobile_middle_name varchar(140),
    mobile_last_name varchar(140),
    mobile_date_hired date,
    mobile_date_of_birth date,
    mobile_gender varchar(140),
    mobile_nationality varchar(140),
    mobile_marital_status varchar(140),
    mobile_department varchar(140),
    mobile_immediate_superior varchar(140),
    manager_2 varchar(140),
    mobile_department_head varchar(140),
    mobile_sss varchar(140),
    mobile_tin varchar(140),
    mobile_philhealth varchar(140),
    mobile_pagibig varchar(140),
    region varchar(140),
    mobile_branch varchar(140),
    mobile_employee_code varchar(140),
    mobile_contact_no varchar(140),
    mobile_company_email varchar(140),
    mobile_personal_email varchar(140),
    mobile_perm_add text,
    mobile_home_add text,
    mobile_present_add text,
    emergency_contact_no varchar(140),
    ftap_nationality varchar(140),
    ftap_age varchar(140),
    ftap_marital_status varchar(140),
    ftap_tin_number varchar(140),
    ftap_sss_number varchar(140),
    ftap_pagibig_number varchar(140),
    ftap_philhealth_number varchar(140),
    ftap_immediate_superior varchar(140),
    immediate_email varchar(140),
    ftap_position_classification varchar(140),
    ftap_department_head varchar(140),
    manager_ varchar(140),
    ftap_hiring_date date,
    ftap_date_of_regularization date,
    ftap_region varchar(140),
    dh_email varchar(140),
    manager_plus_email varchar(140),
    ftap_license_certification varchar(140),
    ftap_payroll_account_branch varchar(140),
    ftap_height varchar(140),
    ftap_weight varchar(140),
    ftap_avega_member_number varchar(140),
    ftap_passport_number varchar(140),
    ftap_date_issue date,
    ftap_place_of_issue varchar(140),
    ftap_copy_of_passport text,
    ftap_valid_upto date,
    ftap_special_needs text,
    last_reporting_date date,
    ftap_separation_date date,
    ftap_reason_for_leaving varchar(140),
    employer_initiated varchar(140)
);

INSERT INTO `tabEmployee FTAP Information` (
    name,
    mobile_first_name,
    mobile_middle_name,
    mobile_last_name,
    mobile_date_hired,
    mobile_date_of_birth,
    mobile_gender,
    mobile_nationality,
    mobile_marital_status,
    mobile_department,
    mobile_immediate_superior,
    manager_2,
    mobile_department_head,
    mobile_sss,
    mobile_tin,
    mobile_philhealth,
    mobile_pagibig,
    region,
    mobile_branch,
    mobile_employee_code,
    mobile_contact_no,
    mobile_company_email,
    mobile_personal_email,
    mobile_perm_add,
    mobile_home_add,
    mobile_present_add,
    emergency_contact_no,
    ftap_nationality,
    ftap_age,
    ftap_marital_status,
    ftap_tin_number,
    ftap_sss_number,
    ftap_pagibig_number,
    ftap_philhealth_number,
    ftap_immediate_superior,
    immediate_email,
    ftap_position_classification,
    ftap_department_head,
    manager_,
    ftap_hiring_date,
    ftap_date_of_regularization,
    ftap_region,
    dh_email,
    manager_plus_email,
    ftap_license_certification,
    ftap_payroll_account_branch,
    ftap_height,
    ftap_weight,
    ftap_avega_member_number,
    ftap_passport_number,
    ftap_date_issue,
    ftap_place_of_issue,
    ftap_copy_of_passport,
    ftap_valid_upto,
    ftap_special_needs,
    last_reporting_date,
    ftap_separation_date,
    ftap_reason_for_leaving,
    employer_initiated
)
SELECT
    name,
    mobile_first_name,
    mobile_middle_name,
    mobile_last_name,
    mobile_date_hired,
    mobile_date_of_birth,
    mobile_gender,
    mobile_nationality,
    mobile_marital_status,
    mobile_department,
    mobile_immediate_superior,
    manager_2,
    mobile_department_head,
    mobile_sss,
    mobile_tin,
    mobile_philhealth,
    mobile_pagibig,
    region,
    mobile_branch,
    mobile_employee_code,
    mobile_contact_no,
    mobile_company_email,
    mobile_personal_email,
    mobile_perm_add,
    mobile_home_add,
    mobile_present_add,
    emergency_contact_no,
    ftap_nationality,
    ftap_age,
    ftap_marital_status,
    ftap_tin_number,
    ftap_sss_number,
    ftap_pagibig_number,
    ftap_philhealth_number,
    ftap_immediate_superior,
    immediate_email,
    ftap_position_classification,
    ftap_department_head,
    manager_,
    ftap_hiring_date,
    ftap_date_of_regularization,
    ftap_region,
    dh_email,
    manager_plus_email,
    ftap_license_certification,
    ftap_payroll_account_branch,
    ftap_height,
    ftap_weight,
    ftap_avega_member_number,
    ftap_passport_number,
    ftap_date_issue,
    ftap_place_of_issue,
    ftap_copy_of_passport,
    ftap_valid_upto,
    ftap_special_needs,
    last_reporting_date,
    ftap_separation_date,
    ftap_reason_for_leaving,
    employer_initiated
FROM `tabEmployee`
WHERE name IS NOT NULL;

ALTER TABLE `tabEmployee`
    DROP COLUMN mobile_first_name,
    DROP COLUMN mobile_middle_name,
    DROP COLUMN mobile_last_name,
    DROP COLUMN mobile_date_hired,
    DROP COLUMN mobile_date_of_birth,
    DROP COLUMN mobile_gender,
    DROP COLUMN mobile_nationality,
    DROP COLUMN mobile_marital_status,
    DROP COLUMN mobile_department,
    DROP COLUMN mobile_immediate_superior,
    DROP COLUMN manager_2,
    DROP COLUMN mobile_department_head,
    DROP COLUMN mobile_sss,
    DROP COLUMN mobile_tin,
    DROP COLUMN mobile_philhealth,
    DROP COLUMN mobile_pagibig,
    DROP COLUMN region,
    DROP COLUMN mobile_branch,
    DROP COLUMN mobile_employee_code,
    DROP COLUMN mobile_contact_no,
    DROP COLUMN mobile_company_email,
    DROP COLUMN mobile_personal_email,
    DROP COLUMN mobile_perm_add,
    DROP COLUMN mobile_home_add,
    DROP COLUMN mobile_present_add,
    DROP COLUMN emergency_contact_no,
    DROP COLUMN ftap_nationality,
    DROP COLUMN ftap_age,
    DROP COLUMN ftap_marital_status,
    DROP COLUMN ftap_tin_number,
    DROP COLUMN ftap_sss_number,
    DROP COLUMN ftap_pagibig_number,
    DROP COLUMN ftap_philhealth_number,
    DROP COLUMN ftap_immediate_superior,
    DROP COLUMN immediate_email,
    DROP COLUMN ftap_position_classification,
    DROP COLUMN ftap_department_head,
    DROP COLUMN manager_,
    DROP COLUMN ftap_hiring_date,
    DROP COLUMN ftap_date_of_regularization,
    DROP COLUMN ftap_region,
    DROP COLUMN dh_email,
    DROP COLUMN manager_plus_email,
    DROP COLUMN ftap_license_certification,
    DROP COLUMN ftap_payroll_account_branch,
    DROP COLUMN ftap_height,
    DROP COLUMN ftap_weight,
    DROP COLUMN ftap_avega_member_number,
    DROP COLUMN ftap_passport_number,
    DROP COLUMN ftap_date_issue,
    DROP COLUMN ftap_place_of_issue,
    DROP COLUMN ftap_copy_of_passport,
    DROP COLUMN ftap_valid_upto,
    DROP COLUMN ftap_special_needs,
    DROP COLUMN last_reporting_date,
    DROP COLUMN ftap_separation_date,
    DROP COLUMN ftap_reason_for_leaving,
    DROP COLUMN employer_initiated;

/*
Orphaned DocType(s) found:
- Frontier 360 Degree Review
- TR HR Related-International C-LEVEL
- TR HR Related-International CEO
- TR HR Related-International DH
- TR HR Related-International
- TR International CEO
- TR International C-LEVEL
- TR International DH
- TR International
- TR HR Related-Domestic C-LEVEL 1
- TR Domestic C-LEVEL 1
- TR HR Related-Domestic DH
- TR HR Related-Domestic
- TR HR Related-Domestic CEO
- TR Domestic CEO
- TR Domestic DH
- TR Domestic
- Daily Allowance-Intl
- Daily Allowance-Domestic
- FTAP Travel Itinerary-International
- FTAP Travel Itinerary Domestic
- Frontier 360 Consolidation Report
- Lists of Travel-International
- HR Purpose of Travel
- Target Setting and Performance Evaluation-Regular Yr 2023
- Target Setting and Performance Evaluation-Contract
- Target Setting and Performance Evaluation-Probationary
- Target Setting and Performance Evaluation-Regular
- Target Setting and Performance Evaluation-Project Based
- Target Statement Table
- Overtime Application Form Commercial
- Overtime Application Form SAQ
- Overtime Application Form Roll Out
- Overtime Application Form QHSE
- Overtime Application Form Procurement
- Overtime Application Form Power and Ops
- Overtime Application Form PMO
- Overtime Application Form Legal
- Overtime Application Form OM
- Overtime Application Form IT
- Overtime Application Form HR and Admin
- Overtime Application Form Grid
- Overtime Application Form Government Rel and Docu
- Overtime Application Form Finance and Strategy
- Overtime Application Form Finance
- Overtime Application Form Executive Office
- Overtime Application Form Executive
- Overtime Application Form Design and Engineering
- Overtime Application Form Commercial and Strategy
- Overtime Application Form Warehouse
- Overtime Application Form Power
- Overtime Application Form Power Grid
- Overtime Table
- Hiring Request Form
- Meter Number
- COOP Account Number
- Hotel Information
- Error Snapshot
- Social Media Post
- LinkedIn Settings
- Twitter Settings
- Homepage Featured Product
- Exotel Settings*/