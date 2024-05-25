frappe.ui.form.on('Employee', {
	refresh(frm) {
        frm.add_custom_button(__('Open FTAP Info'), () => {
            frappe.set_route('Form', 'Employee FTAP Information', frm.doc.name);
        })
    },
    
    frappe.ui.form.on('Employee', {
        onload: function(frm) {
            source_fields = [
                'mobile_last_name', 'mobile_middle_name', 'mobile_first_name', 'mobile_date_hired', 'mobile_department',
                'mobile_immediate_supervisor', 'manager_', 'ftap_department_head', 'region', 'mobile_branch',
                'ftap_tin_number', 'ftap_sss_number', 'ftap_philhealth_number', 'ftap_pagibig_number',
                'mobile_date_of_birth', 'mobile_gender', 'mobile_nationality', 'mobile_marital_status', 'mobile_contact_no',
                'mobile_company_email', 'mobile_personal_email', 'mobile_perm_add', 'mobile_present_add', 'mobile_home_add',
                'emergency_contact_no', 'ftap_immediate_superior', 'immediate_email', 'ftap_position_classification', 'ftap_department_head',
                'manager_', 'ftap_region', 'dh_email', 'manager_plus_email', 'ftap_license_certification', 'ftap_nationality', 'ftap_age',
                'ftap_marital_status', 'ftap_tin_number', 'ftap_sss_number', 'ftap_philhealth_number', 'ftap_pagibig_number',
                'ftap_payroll_account_branch', 'ftap_passport_number', 'ftap_date_issue', 'ftap_place_of_issue', 'ftap_valid_upto',
                'mobile_home_add', 'ftap_hiring_date', 'ftap_date_of_regularization', 'ftap_reason_for_leaving', 'employer_initiated'
            ];
            frappe.call({
                method: 'ftap.ftap_customizations.employee_actions.get_ftap_info',
                args: {
                    'employee': frm.doc.employee,
                    'source_fields': source_fields,
                },
                callback: function(r) {
                    if (r.message) {
                        // Get the first element of the returned list into mobile_employee_code
                        frm.set_value({
                            custom_mobile_employee_code: frm.doc.employee,
                            custom_mobile_last_name: r.message['mobile_last_name'],
                            custom_mobile_middle_name: r.message['mobile_middle_name'],
                            custom_mobile_first_name: r.message['mobile_first_name'],
                            custom_mobile_date_hired: r.message['mobile_date_hired'],
                            custom_mobile_department: r.message['mobile_department'],
                            custom_mobile_immediate_supervisor: r.message['mobile_immediate_supervisor'],
                            custom_mobile_manager__1: r.message['manager_'],
                            custom_mobile_department_head: r.message['ftap_department_head'],
                            custom_mobile_region: r.message['region'],
                            custom_mobile_branch: r.message['mobile_branch'],
                            custom_mobile_tin: r.message['ftap_tin_number'],
                            custom_mobile_sss: r.message['ftap_sss_number'],
                            custom_mobile_philhealth: r.message['ftap_philhealth_number'],
                            custom_mobile_pagibig: r.message['ftap_pagibig_number'],
                            custom_mobile_date_of_birth: r.message['mobile_date_of_birth'],
                            custom_mobile_gender: r.message['mobile_gender'],
                            custom_mobile_nationality: r.message['mobile_nationality'],
                            custom_mobile_marital_status: r.message['mobile_marital_status'],
                            custom_mobile_contact_no: r.message['mobile_contact_no'],
                            custom_mobile_company_email: r.message['mobile_company_email'],
                            custom_mobile_personal_email: r.message['mobile_personal_email'],
                            custom_mobile_permanent_address_local: r.message['mobile_perm_add'],
                            custom_mobile_present_address_local: r.message['mobile_present_add'],
                            custom_mobile_home_address_abroad: r.message['mobile_home_add'],
                            custom_mobile_emergency_contact_person: frm.doc.person_to_be_contacted,
                            custom_mobile_emergency_contact_no: r.message['emergency_contact_no'],
                            custom_immediate_superior: r.message['ftap_immediate_superior'],
                            custom_immediate_email: r.message['immediate_email'],
                            custom_position_classification: r.message['ftap_position_classification'],
                            custom_department_head: r.message['ftap_department_head'],
                            custom_manager_1: r.message['manager_'],
                            custom_region: r.message['ftap_region'],
                            custom_dh_email: r.message['dh_email'],
                            custom_manager_plus_email: r.message['manager_plus_email'],
                            custom_licensecertification: r.message['ftap_license_certification'],
                            custom_nationality: r.message['ftap_nationality'],
                            custom_age: r.message['ftap_age'],
                            custom_marital: r.message['ftap_marital_status'],
                            custom_tin: r.message['ftap_tin_number'],
                            custom_sss_number: r.message['ftap_sss_number'],
                            custom_philhealth_number: r.message['ftap_philhealth_number'],
                            custom_pagibig_number: r.message['ftap_pagibig_number'],
                            custom_branch_of_bank_account: r.message['ftap_payroll_account_branch'],
                            passport_number: r.message['ftap_passport_number'],
                            date_of_issue: r.message['ftap_date_issue'],
                            place_of_issue: r.message['ftap_place_of_issue'],
                            valid_upto: r.message['ftap_valid_upto'],
                            custom_permanent_address_abroad: r.message['mobile_home_add'],
                            custom_hiring_date: r.message['ftap_hiring_date'],
                            custom_date_of_regularization: r.message['ftap_date_of_regularization'],
                            custom_reason_of_leaving: r.message['ftap_reason_for_leaving'],
                            custom_employer_initiated: r.message['employer_initiated']
                        });
                        
                        frm.doc.__unsaved = undefined;
                    }
                }
            });
        },
    }),
    
    after_save: function(frm) {
        frappe.call({
            method: 'ftap.ftap_customizations.employee_actions.create_ftap_info',
            args: {
                employee: frm.doc.name
            },
            callback: function(response) {
                if (response.message) {
                    frappe.msgprint(__('Employee FTAP Information created.'));
                }
            }
        });
    },

    custom_open_ftap_info: function(frm) {
        // Open the Employee FTAP Information doctype with this Employee record already loaded
        frappe.set_route('Form', 'Employee FTAP Information', frm.doc.name);
    },
});
