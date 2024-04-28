import frappe
from frappe import _

@frappe.whitelist()
def create_ftap_info(employee):
    if not frappe.db.exists("Employee FTAP Info", employee):
        # Create a new Employee FTAP Info document
        doc = frappe.new_doc("Employee FTAP Info")
        doc.mobile_employee_code = employee
        doc.insert()

        msg = _("Employee FTAP Info created successfully")
    else:
        msg = _("Employee FTAP Info already exists for this employee")

    return msg