Library Management System – MySQL Project

Project Description
This project is a relational database system designed for managing a library's day-to-day operations, including:

- Tracking members
- Managing books and their authors
- Organizing categories
- Recording borrowing transactions

The database is designed using MySQL with proper normalization and constraints to ensure data integrity and relationships.


How to Set Up / Run the Project

1. Install MySQL Server  
   Make sure MySQL is installed on your machine. You can download it from [MySQL Official Website](https://dev.mysql.com/downloads/).

2. Import the SQL File

   - Open your MySQL command-line or a GUI tool like **phpMyAdmin**, **MySQL Workbench**, or **DBeaver**.
   - Run the following command to import the SQL file:

     ```sql
     SOURCE /path/to/library_management.sql;
     ```

   - This will:
     - Create the `LibraryDB` database
     - Create all necessary tables with relationships and constraints

3. Start Using the Database
   You can now perform `INSERT`, `SELECT`, and `JOIN` queries to interact with the data.


Entity-Relationship Diagram (ERD)
Here's a visual overview of the database structure:

![ERD Screenshot](https://i.imgur.com/Plt8EHy.png)  


 Tables & Relationships Overview

| Table          | Description                            |
|----------------|----------------------------------------|
| `Members`      | Registered library users               |
| `Books`        | All available books in the library     |
| `Authors`      | Authors of books                       |
| `Categories`   | Book genres or categories              |
| `BorrowRecords`| Records of books borrowed/returned     |
| `BookAuthors`  | Mapping table for many-to-many relation between books and authors |


 Constraints Used

- `PRIMARY KEY` and `FOREIGN KEY`
- `UNIQUE` (e.g., email, ISBN)
- `NOT NULL` for essential fields
- `AUTO_INCREMENT` for IDs


