# Smart Bank - Banking Management System

A simple web-based banking application built with **Spring MVC**, **Hibernate**, and **MySQL** for learning purposes.

## Features

### Admin Features
- Login with hardcoded credentials (`admin`/`admin123`)
- Create new customer accounts
- View and approve/reject loan applications
- Auto-generate account numbers and temporary passwords

### Customer Features
- Login with account number and password
- First-time login requires password reset
- OTP-based verification (sent via email)
- View account balance and dashboard
- Fund transfer between accounts
- View mini statement (last 10 transactions)
- Filter statements by month/year
- Download transaction statement as CSV
- Apply for loans (Home, Education, Personal)
- View loan status

## Technologies Used

- **Backend:** Spring MVC 6.1.3, Spring Data JPA, Hibernate 6.4.4
- **Database:** MySQL 8.x
- **View:** JSP with JSTL
- **Build Tool:** Maven
- **Java Version:** 17
- **Server:** Jakarta Servlet 6.0 (Tomcat 10+)

## Project Structure

```
smart-bank/
├── src/main/java/com/bank/
│   ├── config/          # Spring configuration classes
│   ├── controller/      # MVC controllers
│   ├── entity/          # JPA entities
│   ├── repository/      # Data access layer
│   ├── service/         # Business logic layer
│   └── util/            # Utility classes
├── src/main/webapp/
│   ├── WEB-INF/views/   # JSP views
│   └── index.jsp        # Landing page
└── pom.xml              # Maven dependencies
```

## Database Setup

### Option 1: Automatic (Hibernate)
1. Create MySQL database:
```sql
CREATE DATABASE smart_bank;
```

2. Update database credentials in `RootConfig.java`:
```java
ds.setUrl("jdbc:mysql://localhost:3306/smart_bank");
ds.setUsername("root");
ds.setPassword("your-password");
```

3. Tables will be created automatically by Hibernate (hbm2ddl.auto = update)

### Option 2: Manual (Recommended)
1. Run the provided SQL script:
```bash
mysql -u root -p < database-schema.sql
```

2. This will:
   - Create the database `smart_bank`
   - Create all required tables with indexes
   - Insert sample data (optional)

3. Update credentials in `RootConfig.java` as shown above

**Tables Created:**
- `customers` - Store customer account details
- `transactions` - Store all fund transfer records
- `loans` - Store loan applications
- `otp_details` - Store OTP for verification

## Email Configuration

Update email credentials in `MailConfig.java`:
```java
sender.setUsername("your-email@gmail.com");
sender.setPassword("your-app-password");
```

**Note:** For Gmail, use an [App Password](https://support.google.com/accounts/answer/185833) instead of your regular password.

## Running the Application

1. **Build the project:**
```bash
mvn clean install
```

2. **Deploy to Tomcat 10+** (supports Jakarta EE 9+)

3. **Access the application:**
- **Home Page:** `http://localhost:8080/smart-bank/`
- Admin Login: `http://localhost:8080/smart-bank/admin/login`
- Customer Login: `http://localhost:8080/smart-bank/customer/login`

## Default Credentials

**Admin:**
- Username: `admin`
- Password: `admin123`

**Customer:**
- Created by admin, credentials sent via email

## Key Validations

### Customer Creation
- Email format validation
- Mobile number must be 10 digits
- Duplicate email/mobile check

### Fund Transfer
- Minimum transfer: ₹1
- Cannot transfer to same account
- Insufficient balance check
- Receiver account must be active

### Loan Application
- Minimum loan amount: ₹10,000
- Maximum amounts:
  - Home Loan: ₹50,00,000 (8.5% interest)
  - Education Loan: ₹10,00,000 (6.5% interest)
  - Personal Loan: ₹5,00,000 (12% interest)
- Tenure: 6 months to 360 months (30 years)

### Password Requirements
- Minimum 4 characters
- Must be reset after first login with temporary password

### OTP
- 6-digit random number
- Valid for 5 minutes
- Deleted after validation

## Transaction Logic

- Each transfer creates **one transaction record**
- Transaction type is determined dynamically when viewing:
  - **DEBIT** if `fromAccount` matches logged-in account
  - **CREDIT** if `toAccount` matches logged-in account

## Session Management

- Admin session: `ADMIN_LOGGED_IN`
- Customer session: `CUSTOMER_LOGGED_IN`, `LOGGED_IN_ACC`
- OTP verification: `OTP_ACC`
- Password reset: `RESET_ACC`

## Important Notes

1. **Security:** Passwords are stored as plain text (for learning purposes only)
2. **Email:** Requires valid SMTP configuration to send OTPs
3. **Transactions:** Uses `@Transactional` for data consistency
4. **Error Handling:** Returns user-friendly error messages

## Future Enhancements (Optional)

- Password encryption (BCrypt)
- Profile management
- Loan EMI calculator
- Transaction search and advanced filters
- Account deactivation
- Admin analytics dashboard

## License

This is a learning project for educational purposes.
