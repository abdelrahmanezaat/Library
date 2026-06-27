# Library Management System

## Overview

Library Management System built with ASP.NET Core 8 Web API.

## Technologies

- ASP.NET Core 8
- Entity Framework Core
- SQL Server
- ASP.NET Identity
- JWT Authentication
- AutoMapper

## Features

- Authentication using JWT
- Role Based Authorization (Admin, Librarian,Staff)
- Book Management
- Category Management
- Author Management
- Publisher Management
- Member Management
- Borrow / Return Books
- Activity Logging
- Image Upload
- Soft Delete

## Project Structure

- Controllers
- Services
- DTOs
- Models
- Helpers
- Mappings

## Design Choices

- Service Layer to separate business logic.
- Soft Delete is used instead of permanent delete.
- AutoMapper is used to reduce mapping code.
- JWT Authentication for securing APIs.
- ActivityLog table stores important user actions.

## How to Run

1. Update connection string in appsettings.json.
2. Run migrations.
3. Run the application.
4. Login using seeded admin account.

## Default Admin

Email:
admin@library.com

Password:
Admin@123