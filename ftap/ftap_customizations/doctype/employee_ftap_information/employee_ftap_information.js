// Copyright (c) 2024, Xurpas Software, Inc. and contributors
// For license information, please see license.txt

frappe.ui.form.on("Employee FTAP Information", {
	refresh(frm) {
        frm.add_custom_button(__('Return to Employee'), () => {
            frappe.set_route('Form', 'Employee', frm.doc.mobile_employee_code);
        })
    },
});
