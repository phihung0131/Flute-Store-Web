# 🎶 Flute Store Web Application

A full-stack e-commerce web application for purchasing flutes, built with **React**, **PHP**, and **MySQL**.

## 🎬 Video Preview

[![Project Demo]()

## 🌟 Overview

Flute Store is an online platform for customers to explore and buy a variety of flutes. Administrators can manage the inventory, orders, and users through a dedicated admin portal. This project includes both frontend and backend functionalities.

---

## 🛠️ Tech Stack

### Frontend

- ⚛️ **React.js**
- 🔄 **Redux** - State management
- 🚏 **React Router** - Navigation
- 🎨 **Tailwind CSS** - Styling
- 🌐 **Axios** - API calls

### Backend

- 🐘 **PHP**
- 🗄️ **MySQL** - Database
- 🛠️ **XAMPP** - Local development server

---

## ✨ Features

### Customer Features

- 🔍 Browse flute products
- 👤 User registration & login
- 🛒 Shopping cart functionality
- 📦 Order placement & tracking
- 🔧 Profile management
- ⭐ Product reviews & ratings

### Admin Features

- 📊 Dashboard with analytics
- 📦 Product management (CRUD)
- 🚚 Order management
- 👥 User management
- 💬 Feedback moderation
- 📜 Admin activity logs

---

## 🚀 Getting Started

### Prerequisites

- 📦 **Node.js** (v14 or higher)
- 🛠️ **XAMPP** (PHP 7.4+ and MySQL)
- 🐙 **Git**

### Installation

#### 1. Clone the repository

```bash
git clone [repository-url]
cd shop
```

#### 2. Backend Setup

- Start **XAMPP** and ensure **Apache** and **MySQL** services are running.
- Create a new MySQL database named `dbshop`.
- Import the database schema from `database.sql`.
- Copy the `Backend` folder to your XAMPP's htdocs directory:
  ```bash
  cp -r Backend/ [xampp-path]/htdocs/shop-api
  ```

#### 3. Frontend Setup

- Navigate to the `Frontend` directory:
  ```bash
  cd Frontend
  npm install
  ```
- Configure API endpoint:
  - Create a `.env` file in the `Frontend` directory:
    ```plaintext
    REACT_APP_API_URL=http://localhost/shop-api
    ```

### Running the Application

#### Backend

- Ensure **XAMPP** (Apache and MySQL) is running.
- Access backend API at [http://localhost/shop-api](http://localhost/shop-api).

#### Frontend

- Start the frontend. It will be accessible at [http://localhost:3000](http://localhost:3000).

---

## 📂 Project Structure

```
├── Backend/
│   ├── api/           # API endpoints
│   ├── config/        # Database configuration
│   ├── middleware/    # Authentication middleware
│   └── model/         # Database models
├── Frontend/
│   ├── public/
│   └── src/
│       ├── components/
│       ├── pages/
│       ├── redux/
│       └── services/
└── database.sql       # Database schema
```

---

## 🔍 Main Features Details

### 🛒 Customer Portal

- Detailed product views
- Real-time shopping cart updates
- Secure checkout process
- Order history & tracking
- Profile management
- Ratings & reviews for products

### 🛠️ Admin Portal

- Comprehensive dashboard with key metrics
- Full product management capabilities
- Order processing & updates
- User account management
- Review moderation
- Admin activity tracking

---

## 👥 User Roles

- **Customer**
  - Register/Login
  - Browse products
  - Manage cart & orders
  - Submit product reviews
  - Update profile
- **Administrator**
  - Full access to system
  - Product and order management
  - User management
  - Analytics dashboard
  - Feedback moderation
  - Activity log tracking

---

## 🔒 Security Features

- 🛡️ **JWT-based Authentication**
- 🔐 **Password Encryption**
- 🚫 **Protected API Endpoints**
- 🎚️ **Role-based Access Control**
