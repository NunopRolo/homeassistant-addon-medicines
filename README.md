[nunorolo]: https://github.com/NunopRolo
[issue]: https://github.com/NunopRolo/medicines-app-addon/issues

# Home Assistant Addon: Medicines App
## About
Medicines App is a web application to manage portuguese medicines, with the following functionalities:
* **Medicines List page**:
  * List of medicines with pagination
  * Search for medicines by any field
  * Search medicine by medicine barcode scan
* **Stock page**:
  * List of medicines in stock, with color code to identify which medicines are with validity, without validity, and less than 1 month validity
  * Search for medicines in stock, by any field
  * Filter medicines list by validity status
  * Add medicine to stock
  * Delete medicine from stock
  * Notification when medicine validity expires
* **Medication Page**:
  * Table with times of the day (Before Breakfast, Breakfast, etc) in the header
  * In the table cells, there are the medicines associated with a time of the day
  * Add medicine to a time of the day
  * Delete medicine from the time of the day
  * Add observations to the medicine entry
  * Add image to a medicine
  * Generate PDF of the medicines table
  * Add temporary medication
* **Settings Page:**
  * Add persons
  * Delete persons
  * Add day periods
  * Delete day periods

## Configuration
There are two database options to run this application, with SQLite, and with Postgres. 

If you want to use Postgres, you need to configure the following variables. If these variables are not filled in, the application will default to SQLite as the database system.
```yaml
DATASOURCE_URL: <postgres_host>/<database_schema>
DATASOURCE_USERNAME: username
DATASOURCE_PWD: password
```

## Requirements
If you want to run the application with Postgres, you need to have a Postgres database instance, for example: [Postgres Addon](https://github.com/alexbelgium/hassio-addons/tree/master/postgres)

## Installation
The installation of this add-on is pretty straightforward and not different in comparison to installing any other add-on.

1. Add add-on repository to your home assistant instance
2. Install this add-on.
3. Click the `Save` button to store your configuration.
4. Set the add-on options to your preferences
5. Start the add-on.
6. Check the logs of the add-on to see if everything went well.
7. Open the webUI

## Authors & contributors
[Nuno Rolo][nunorolo]

## Support
Open an issue [here][issue]
