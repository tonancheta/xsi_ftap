## FTAP Customizations

Transfer of Core customizations to this app

### License

mit

### Steps to Migrate and Upgrade
1. Make a fresh backup of the current database
2. Run the transform.sql script 
3. Install FTAP
4. Do a Bench Migrate

### Observations
- Lack of name field in a number of the doctypes
- Hardcoded values in doctypes with Select type fields
- Redundant doctypes that could have been streamlined
- Overtime Application forms could be streamlined