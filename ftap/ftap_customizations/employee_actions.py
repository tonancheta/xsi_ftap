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


@frappe.whitelist()
def get_ftap_info(employee, source_fields):
    print('** get_ftap_info **\n' + employee + '\n')

    if frappe.db.exists('Employee FTAP Information', employee):
        # Fetch Employee FTAP Info document
        doc = frappe.get_doc('Employee FTAP Information', employee)

        # Retrieve each element in source_fields list, fetch the field value from the document and store it in a dictionary
        source_fields = frappe.parse_json(source_fields)
        field_values = {field: doc.get(field) for field in source_fields}

        return field_values
    else:
        return None
    


@frappe.whitelist()
def update_ftap_info(employee, field_values):
    if frappe.db.exists('Employee FTAP Information', employee):
        # Fetch Employee FTAP Info document
        doc = frappe.get_doc('Employee FTAP Information', employee)

        # Update the value of each field in field_values dictionary
        for field, value in field_values.items():
            doc.set(field, value)

        doc.save()
        return _("Employee FTAP Info updated successfully")
    else:
        return _("Employee FTAP Info does not exist for this employee")