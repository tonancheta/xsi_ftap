frappe.ui.form.on('Employee', {
	refresh(frm) {
        frm.add_custom_button(__('Open FTAP Info'), () => {
            frappe.set_route('Form', 'Employee FTAP Information', frm.doc.name);
        })
    },
    
    // onload: function(frm) {
    //     source_fields = [
    //         'mobile_last_name', 'mobile_middle_name', 'mobile_first_name', 'mobile_date_hired', 'mobile_department',
    //         'mobile_immediate_supervisor', 'manager_', 'ftap_department_head', 'region', 'mobile_branch',
    //         'ftap_tin_number', 'ftap_sss_number', 'ftap_philhealth_number', 'ftap_pagibig_number',
    //         'mobile_date_of_birth', 'mobile_gender', 'mobile_nationality', 'mobile_marital_status', 'mobile_contact_no',
    //         'mobile_company_email', 'mobile_personal_email', 'mobile_perm_add', 'mobile_present_add', 'mobile_home_add',
    //         'emergency_contact_no'
    //     ];

    //     frappe.call({
    //         method: 'ftap.ftap_customizations.employee_actions.get_ftap_info',
    //         args: {
    //             'employee': frm.doc.name,
    //             'source_fields': source_fields,
    //         },
    //         callback: function(r) {
    //             if (r.message) {
    //                 // Get the first element of the returned list into mobile_employee_code
    //                 frm.set_value('custom_mobile_employee_code', frm.doc.name);
    //                 frm.set_value('custom_mobile_last_name', r.message['mobile_last_name']);
    //                 frm.set_value('custom_mobile_middle_name', r.message['mobile_middle_name']);
    //                 frm.set_value('custom_mobile_first_name', r.message['mobile_first_name']);
    //                 frm.set_value('custom_mobile_date_hired', r.message['mobile_date_hired']);
    //                 frm.set_value('custom_mobile_department', r.message['mobile_department']);
    //                 frm.set_value('custom_mobile_immediate_supervisor', r.message['mobile_immediate_supervisor']);
    //                 frm.set_value('custom_mobile_manager_1', r.message['manager_']);
    //                 frm.set_value('custom_mobile_department_head', r.message['ftap_department_head']);
    //                 frm.set_value('custom_mobile_region', r.message['region']);
    //                 frm.set_value('custom_mobile_branch', r.message['mobile_branch']);
    //                 frm.set_value('custom_mobile_tin', r.message['ftap_tin_number']);
    //                 frm.set_value('custom_mobile_sss', r.message['ftap_sss_number']);
    //                 frm.set_value('custom_mobile_philhealth', r.message['ftap_philhealth_number']);
    //                 frm.set_value('custom_mobile_pagibig', r.message['ftap_pagibig_number']);
    //                 frm.set_value('custom_mobile_date_of_birth', r.message['mobile_date_of_birth']);
    //                 frm.set_value('custom_mobile_gender', r.message['mobile_gender']);
    //                 frm.set_value('custom_mobile_nationality', r.message['mobile_nationality']);
    //                 frm.set_value('custom_mobile_marital_status', r.message['mobile_marital_status']);
    //                 frm.set_value('custom_mobile_contact_no', r.message['mobile_contact_no']);
    //                 frm.set_value('custom_mobile_company_email', r.message['mobile_company_email']);
    //                 frm.set_value('custom_mobile_personal_email', r.message['mobile_personal_email']);
    //                 frm.set_value('custom_mobile_permanent_address_local', r.message['mobile_perm_add']);
    //                 frm.set_value('custom_mobile_present_address_local', r.message['mobile_present_add']);
    //                 frm.set_value('custom_mobile_home_address_abroad', r.message['mobile_home_add']);
    //                 frm.set_value('custom_mobile_emergency_contact_person', frm.doc.emergency_contact_person);
    //                 frm.set_value('custom_mobile_emergency_contact_no', r.message['emergency_contact_no']);
    //             }
    //         }
    //     });
    // },

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
