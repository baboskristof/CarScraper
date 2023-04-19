How to use:
The carscraper.sh is called with one parameter, which is the website to scrape. Once env_prep.sh has been run and the directories have been set up, the user can run carscraper.sh with the following command:
./carscraper.sh [website_url]

env_prep.sh
This script sets up the necessary directories for the application. It is run before the main script and must only be run once. The script checks if the directories already exist and creates them if they don't.

load_cars.sh
This script loads the website given as a parameter to the main script, extracts the car titles and links, and saves the raw html files to the data directory. It is called by the main script and must be run before csv_generator.sh.

csv_generator.sh
This script generates a csv file from the raw html files saved by load_cars.sh, and compares the newly generated file with the last saved csv file. If there are any new car titles or links, they are printed out to the console. This script is called by the main script after load_cars.sh has been run.

Note:

The user must have permission to write to the directories created by env_prep.sh
The user must have internet access to run the application
The application is designed to work with the specific website structure given, and may not work with other websites without modification.