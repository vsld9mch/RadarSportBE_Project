# Sportradar Backend Exercise - Sports Calendar

**Live Demo:** [http://sportradarbeproject.page.gd/](http://sportradarbeproject.page.gd/)

## Overview
A lightweight sports event calendar built with **PHP, MySQL, and Vanilla JavaScript**. It allows users to view, add, and delete sports events. The project features a fully normalized (3NF) database and a custom RESTful API, specifically designed to retrieve related data efficiently using a single `JOIN` query (avoiding N+1 query problems).

## Tech Stack
* **Backend:** PHP (PDO for secure database interactions)
* **Database:** MySQL
* **Frontend:** HTML5, CSS3, Vanilla JavaScript (Fetch API)

## Setup Instructions
1. **Clone the repo:** `git clone https://github.com/vsld9mch/RadarSportBE_Project.git`
2. **Database Setup:** Create a new database in MySQL and import the `database.sql` file to set up tables and seed data.
3. **Configuration:** Open `db.php` and update the `$host`, `$db`, `$user`, and `$pass` variables with your local database credentials.
4. **Run:** Place the project folder in your local web server root (e.g., `htdocs` for XAMPP) and open `index.html` in your browser.

## Key Decisions & Architecture
* **Single Directory Structure:** Frontend (`index.html`), API endpoints (`.php`), and config (`db.php`) are kept in the root folder for simplicity and easy review.
* **Efficient Data Retrieval:** `get_events.php` uses a `LEFT JOIN` to fetch events, teams, sports, and venues in one single request, strictly avoiding SQL queries inside loops.
* **Bonus Feature:** Implemented a "Delete" function using the Fetch API and a dedicated `DELETE` endpoint to demonstrate full CRUD understanding.
* **Security:** Used PHP PDO with prepared statements across all endpoints to prevent SQL injection.
