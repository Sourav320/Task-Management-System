# Task Management System (Ruby on Rails)

A role-based **Task Management System** built with **Ruby on Rails**, supporting **Admin** and **User** roles.  
The system allows task assignment, status tracking, email notifications, dashboards, user management, and advanced filtering.

---

## Project Overview

This application helps teams manage tasks efficiently by:
- Assigning tasks to multiple users
- Tracking task progress (Pending / In Progress / Completed)
- Sending email notifications on task assignment
- Providing dashboards for Admin and Users
- Managing users and roles
- Searching and filtering tasks by status and user

---

## Tech Stack

- **Ruby:** 3.2.x  
- **Rails:** 7.x  
- **Database:** MySQL  
- **Authentication:** Devise  
- **Authorization:** Role-based (Admin / User)  
- **Search & Filtering:** Ransack  
- **Pagination:** will_paginate  
- **UI:** Bootstrap 5, Select2  
- **Mail:** ActionMailer (SMTP – Gmail)

---

## Features

### User Management
- User authentication using Devise
- Roles: **Admin** and **User**
- Users can:
  - Sign up via UI
  - Be created via seed data
- Admin can:
  - View all users
  - Edit user details
  - Soft delete users

---

### Task Management
- Create, view, update, and delete tasks
- Assign one task to multiple users
- Each assignment has:
  - Status (Pending / In Progress / Completed)
  - Start date
  - Due date
- Soft delete support

---

### Dashboards
#### Admin Dashboard
- Total tasks count
- Status-wise task summary:
  - Pending
  - In Progress
  - Completed
- Can view tasks of all users

#### User Dashboard
- Sees only assigned tasks
- Status-wise task count for logged-in user

---

## Search & Filters
- Filter tasks by:
  - Status
  - Assigned User (Admin only)
- Combined filtering supported (Status + User)
- Pagination enabled

---

## Email Notifications
- When a task is assigned, an email is sent to the user
- Email includes:
  - Task title
  - Description
  - Due date
- Emails are sent to: souravkarak00@gmail.com

---

## Project Setup

### Clone the Repository
```bash
git clone https://github.com/Sourav320/Task-Management-System.git
cd Task-Management-System

----

### INSTALL DEPENDECIES
-- bundle install

#Configarartion Database
-- username: root
-- password: your_password
-- host: localhost

#Create and Migrate Databse
-- rails db:create
-- rails db:migrate

## Run Seed File

- rails db:seed

## Run Server
- rails s

## Open Browser
- http://localhost:3000



