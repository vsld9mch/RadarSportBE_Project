# Sportradar Coding Academy - Backend Exercise

## Overview
This project is a sports event calendar web application built for the Sportradar Coding Academy Backend Exercise. It allows users to view scheduled and played sports events, add new events, and delete existing ones. The application features a normalized relational database (3NF) and a custom PHP RESTful API to handle data manipulation efficiently.

**Live Demo:** [http://sportradarbeproject.page.gd/](http://sportradarbeproject.page.gd/)

## Features & Technical Highlights
* **Efficient Data Retrieval:** The `get_events.php` endpoint fetches and displays events dynamically from the database using a single, efficient `LEFT JOIN` SQL query. This strictly adheres to the requirement of avoiding SQL queries inside loops.
* **Add Events:** A user-friendly frontend form (`index.html`) that communicates with `add_event.php` via the Fetch API to insert new matches into the database.
* **Delete Events (Bonus):** Implemented an additional feature (`delete_event.php`) allowing users to dynamically remove events from the calendar.
* **Database Design:** The database strictly follows the Third Normal Form (3NF) with a clear separation of entities (events, sports, teams, venues). All foreign keys are properly named with an underscore prefix (e.g., `_home_team_id`, `_sport_id`) as requested.

## Tech Stack
* **Backend:** PHP (PDO for secure database interactions)
* **Database:** MySQL
* **Frontend:** HTML5, CSS3, Vanilla JavaScript (Fetch API)

## Repository Structure
All core files are located in the root directory for simplicity and ease of review:
* `index.html` - The frontend user interface.
* `db.php` - Database connection configuration.
* `get_events.php`, `add_event.php`, `delete_event.php` - API endpoints handling CRUD operations.
* `database.sql` - Database export file containing the schema and initial seed data (AFC Champions League matches).

## Setup and Installation Instructions
To run this project locally on your machine, follow these steps:

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git](https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git)
    ```
2.  **Database Setup:**
    * Start your local server environment (e.g., XAMPP, MAMP, or WAMP).
    * Open phpMyAdmin and create a new database named `sports_calendar`.
    * Import the provided `database.sql` file into this new database to create the tables and populate the initial data.
3.  **Configure Environment:**
    * Open the `db.php` file in your code editor.
    * Update the database connection credentials (`$host`, `$db`, `$user`, `$pass`) to match your local MySQL server settings (usually `localhost` and `root`).
4.  **Run the Application:**
    * Place the cloned project folder inside your web server's root directory (e.g., the `htdocs` folder for XAMPP).
    * Navigate to `http://localhost/YOUR_PROJECT_FOLDER/index.html` in your web browser.

## Assumptions and Decisions
* **Technology Choice:** PHP and MySQL were chosen for their reliability and straightforward deployment on standard web hosting environments. PDO was used to prevent SQL injection vulnerabilities.
* **Frontend Architecture:** Opted for a Single Page Application (SPA) approach using Vanilla JavaScript and the Fetch API. This cleanly separates the frontend presentation layer from the backend API logic.
* **API Structure:** Placed API endpoints in the root directory alongside the frontend to simplify the project structure for the reviewers, similar to my previous portfolio projects.
