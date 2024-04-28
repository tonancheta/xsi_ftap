frappe.ui.form.on('Employee', {
	refresh(frm) {
        frm.add_custom_button(__('Open FTAP Info'), () => {
            frappe.set_route('Form', 'Employee FTAP Information', frm.doc.name);
        })
    },

    // Automatically create a record in Employee FTAP Information when a new Employee record is created
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
    }
});
