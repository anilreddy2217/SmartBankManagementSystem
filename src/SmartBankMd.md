Smart Bank Management System - Rebuild Tasks Specification
Overview
This specification breaks down the complete rebuild of the Smart Bank Management System into sequential, modular teaching tasks. Each task is atomic, taking approximately 10-15 minutes to code during live instruction.

Technology Stack:

Backend: Spring MVC 6.1.3, Spring Data JPA, Hibernate 6.4.4
Database: MySQL 8.x
View Layer: JSP with JSTL
Build Tool: Maven
Java Version: 17
Server: Jakarta Servlet 6.0 (Tomcat 10+)
Phase 1: Project Setup & Core Configuration
Task 1.1: Create Maven Project Structure
Objective: Initialize the Maven web application project with proper folder structure and basic POM configuration.
Teaching Notes:
Explain Maven project structure (src/main/java, src/main/webapp, src/main/resources)
Discuss WAR packaging vs JAR packaging for web applications
Introduction to Maven dependency management
Files to create/modify:
pom.xml
Folder structure: src/main/java, src/main/webapp, src/main/resources
Step-by-Step Implementation Strategy:
Create basic Maven POM with groupId: com.bank, artifactId: smart-bank
Set packaging to war
Configure Java 17 compiler plugin
Set properties for Java version (17)
Create standard Maven folder structure
Verification Checklist:
Run mvn clean compile successfully
Verify folder structure is created
No Maven errors in console
Task 1.2: Add Spring MVC Dependencies
Objective: Configure Spring MVC 6.x dependencies in POM for Jakarta EE 9+ support.
Teaching Notes:
Explain Spring MVC architecture (DispatcherServlet, Controllers, ViewResolver)
Discuss Jakarta EE namespace change from javax.* to jakarta.*
Importance of version compatibility (Spring 6 requires Java 17+)
Files to create/modify:
pom.xml
Step-by-Step Implementation Strategy:
Add Spring MVC dependency (version 6.1.3)
Add Jakarta Servlet API (version 6.0.0, scope: provided)
Add JSP and JSTL dependencies for Jakarta
Set <spring.version> property for consistency
Verification Checklist:
Run mvn dependency:tree to verify Spring dependencies
Check for no dependency conflicts
Maven build succeeds
Task 1.3: Add Hibernate & JPA Dependencies
Objective: Configure Hibernate 6.x and Spring ORM dependencies for database persistence.
Teaching Notes:
Explain JPA as specification vs Hibernate as implementation
Discuss ORM concept and benefits
Introduction to Spring Data JPA simplification
Files to create/modify:
pom.xml
Step-by-Step Implementation Strategy:
Add Hibernate Core dependency (version 6.4.4)
Add Jakarta Persistence API (version 3.1.0)
Add Spring ORM and Spring TX dependencies
Add Spring Data JPA (version 3.2.1)
Add MySQL Connector (version 8.3.0)
Verification Checklist:
Run mvn dependency:resolve successfully
Verify Hibernate and JPA jars are downloaded
No version conflicts reported
Task 1.4: Add Email Support Dependencies
Objective: Configure Spring Mail support for sending OTP and account creation emails.
Teaching Notes:
Explain JavaMail API and Spring's abstraction layer
Discuss SMTP protocol basics
Gmail App Password requirement for security
Files to create/modify:
pom.xml
Step-by-Step Implementation Strategy:
Add Spring Context Support dependency (version 6.1.5)
Add Eclipse Angus Mail (Jakarta Mail implementation, version 2.0.2)
Explain why Jakarta Mail replaces javax.mail
Verification Checklist:
Maven build completes successfully
All mail-related dependencies resolved
No transitive dependency issues
Task 1.5: Create Package Structure
Objective: Create the standard multi-layer package structure for the application.
Teaching Notes:
Explain layered architecture (Controller → Service → Repository → Entity)
Discuss separation of concerns principle
Package naming conventions in Java
Files to create/modify:
Create packages under src/main/java/com/bank/:
config - Spring configuration classes
controller - MVC controllers
entity - JPA entities
repository - Data access layer
service - Business logic layer
util - Helper utility classes
Step-by-Step Implementation Strategy:
Create base package: com.bank
Create sub-packages for each layer
Add placeholder .gitkeep or empty package-info.java if needed
Verification Checklist:
All 6 packages visible in IDE
Package structure follows naming conventions
No compilation errors
Task 1.6: Configure MySQL Database Connection
Objective: Create RootConfig.java with DataSource and EntityManagerFactory configuration.
Teaching Notes:
Explain Spring Java Config vs XML configuration
Discuss DataSource concept and connection pooling
Introduction to EntityManagerFactory and JPA setup
Files to create/modify:
RootConfig.java
Step-by-Step Implementation Strategy:
Create @Configuration class RootConfig
Add @EnableJpaRepositories(basePackages = "com.bank.repository")
Add @EnableTransactionManagement
Create @Bean method for DataSource (DriverManagerDataSource)
Configure MySQL URL: jdbc:mysql://localhost:3306/smart_bank
Set username and password (make them configurable)
Create @Bean for LocalContainerEntityManagerFactoryBean
Configure Hibernate properties (dialect, hbm2ddl.auto=update, show_sql, naming strategy)
Create @Bean for JpaTransactionManager
Verification Checklist:
Class compiles without errors
All Spring annotations present
DataSource configuration is readable
Task 1.7: Configure Spring MVC Web Layer
Objective: Create WebMvcConfig.java to configure view resolvers and component scanning.
Teaching Notes:
Explain ViewResolver role in Spring MVC
Discuss @EnableWebMvc annotation
Component scanning for auto-detection of controllers
Files to create/modify:
WebMvcConfig.java
Step-by-Step Implementation Strategy:
Create @Configuration class WebMvcConfig
Add @EnableWebMvc annotation
Add @ComponentScan("com.bank") for auto-detection
Implement WebMvcConfigurer interface
Override configureViewResolvers() method
Configure JSP view resolver with prefix /WEB-INF/views/ and suffix .jsp
Verification Checklist:
Class compiles successfully
ViewResolver configuration is correct
Component scan package is appropriate
Task 1.8: Create Web Initializer (Replace web.xml)
Objective: Create BankWebInitializer.java to bootstrap Spring MVC without web.xml.
Teaching Notes:
Explain Servlet 3.0+ programmatic configuration
Discuss DispatcherServlet role and mapping
Root vs Servlet application context hierarchy
Files to create/modify:
BankWebInitializer.java
Step-by-Step Implementation Strategy:
Create class extending AbstractAnnotationConfigDispatcherServletInitializer
Override getRootConfigClasses() → return RootConfig.class
Override getServletConfigClasses() → return WebMvcConfig.class
Override getServletMappings() → return new String[]{"/"}
Verification Checklist:
Class compiles without errors
Proper inheritance hierarchy
All three methods overridden correctly
Task 1.9: Configure Email Service
Objective: Create MailConfig.java with JavaMailSender configuration for Gmail SMTP.
Teaching Notes:
Explain SMTP server configuration
Discuss email authentication and security
Gmail App Password vs regular password
Files to create/modify:
MailConfig.java
Step-by-Step Implementation Strategy:
Create @Configuration class MailConfig
Create @Bean method for JavaMailSender
Use JavaMailSenderImpl implementation
Set host: smtp.gmail.com, port: 587
Configure username and password (use placeholders)
Set mail properties: protocol=smtp, auth=true, starttls.enable=true
Verification Checklist:
Class compiles successfully
SMTP configuration is correct
Properties are properly set
Task 1.10: Create Database Schema
Objective: Create MySQL database and tables for the application.
Teaching Notes:
Explain database schema design
Discuss indexing for performance
Introduction to referential integrity
Files to create/modify:
Database schema.sql (in project root)
Step-by-Step Implementation Strategy:
Create database: smart_bank
Create customers table with columns: id, full_name, email, mobile, account_number, password, temp_password, temp_password_active, active, balance
Create transactions table: id, from_account, to_account, amount, type, transaction_date
Create loans table: id, account_number, loan_type, amount, tenure_months, interest_rate, status, applied_date
Create otp_details table: id, account_number, otp, expiry_time
Add appropriate indexes and constraints
Verification Checklist:
Run SQL script in MySQL successfully
All 4 tables created
Verify schema with DESCRIBE commands
Indexes are created
Phase 2: Database Layer & Domain Entities
Task 2.1: Create Customer Entity
Objective: Build the Customer JPA entity class with all required fields and annotations.
Teaching Notes:
Explain JPA annotations (@Entity, @Table, @Id, @GeneratedValue, @Column)
Discuss entity vs table mapping
Primary key generation strategies
Files to create/modify:
Customer.java
Step-by-Step Implementation Strategy:
Create Customer class with @Entity and @Table(name = "customers")
Add fields: id (Long), fullName, email, mobile, accountNumber, password, tempPassword, tempPasswordActive, active, balance
Add @Id and @GeneratedValue(strategy = IDENTITY) to id field
Add @Column annotations with nullable and unique constraints
Generate getters and setters for all fields
Set default balance = 0.0
Verification Checklist:
Class compiles without errors
All JPA annotations present
Getters and setters for all fields
Run mvn compile successfully
Task 2.2: Create Transaction Entity
Objective: Build the Transaction JPA entity to store fund transfer records.
Teaching Notes:
Explain transaction recording pattern
Discuss LocalDateTime for timestamp handling
Single transaction record for bilateral transfers
Files to create/modify:
Transaction.java
Step-by-Step Implementation Strategy:
Create Transaction class with @Entity annotation
Add @Table(name = "transactions")
Add fields: id (Long), fromAccount (String), toAccount (String), amount (double), type (String), transactionDate (LocalDateTime)
Add appropriate JPA annotations
Generate getters and setters
Verification Checklist:
Class compiles successfully
All fields properly annotated
LocalDateTime imported from java.time package
Task 2.3: Create Loan Entity
Objective: Build the Loan JPA entity for loan application records.
Teaching Notes:
Explain enum-like string fields for loan types and status
Discuss LocalDate for date-only fields
Loan application workflow (PENDING → APPROVED/REJECTED)
Files to create/modify:
Loan.java
Step-by-Step Implementation Strategy:
Create Loan class with JPA annotations
Add fields: id, accountNumber, loanType, amount, tenureMonths, interestRate, status, appliedDate
Add appropriate annotations
Generate getters and setters
Document loan types (HOME, EDUCATION, PERSONAL) and statuses (PENDING, APPROVED, REJECTED)
Verification Checklist:
Class compiles successfully
All fields match database schema
Proper data types used
Task 2.4: Create OTP Entity
Objective: Build the Otp JPA entity for OTP verification records.
Teaching Notes:
Explain time-based OTP validation
Discuss expiry mechanism
Security considerations for OTP storage
Files to create/modify:
Otp.java
Step-by-Step Implementation Strategy:
Create Otp class with JPA annotations
Add @Table(name = "otp_details")
Add fields: id, accountNumber, otp, expiryTime (LocalDateTime)
Add appropriate annotations
Generate getters and setters
Verification Checklist:
Class compiles successfully
Table name correctly mapped to otp_details
LocalDateTime used for expiry
Phase 3: Data Access Layer (Repositories)
Task 3.1: Create CustomerRepository
Objective: Build the repository class for Customer CRUD operations using EntityManager.
Teaching Notes:
Explain @Repository stereotype annotation
Discuss @PersistenceContext for EntityManager injection
Introduction to JPQL (Java Persistence Query Language)
Files to create/modify:
CustomerRepository.java
Step-by-Step Implementation Strategy:
Create CustomerRepository class with @Repository annotation
Inject EntityManager with @PersistenceContext
Create @Transactional method: save(Customer customer) using entityManager.persist()
Create method: existsByEmail(String email) using JPQL COUNT query
Create method: existsByMobile(String mobile) using JPQL COUNT query
Create method: findByAccountNumber(String accountNumber) with try-catch for not found
Verification Checklist:
Class compiles without errors
All JPQL queries are syntactically correct
EntityManager properly injected
Exception handling in findByAccountNumber
Task 3.2: Create TransactionRepository
Objective: Build repository for transaction CRUD and query operations.
Teaching Notes:
Explain complex JPQL queries with OR conditions
Discuss ordering and limiting results
Date filtering in JPQL
Files to create/modify:
TransactionRepository.java
Step-by-Step Implementation Strategy:
Create class with @Repository and inject EntityManager
Create @Transactional save(Transaction tx) method
Create findRecentTransactions(String accountNumber) - get last 10 transactions where account is either sender or receiver
Use JPQL: WHERE t.fromAccount = :acc OR t.toAccount = :acc ORDER BY t.transactionDate DESC
Use setMaxResults(10) for limiting
Create findByAccountAndPeriod(String acc, Integer month, Integer year) for filtered statements
Verification Checklist:
All methods compile successfully
JPQL queries use OR condition correctly
Ordering and limiting work as expected
Month can be null (for yearly filter)
Task 3.3: Create LoanRepository
Objective: Build repository for loan application data access.
Teaching Notes:
Explain filtering by status
Discuss ordering by application date
JPQL query construction patterns
Files to create/modify:
LoanRepository.java
Step-by-Step Implementation Strategy:
Create class with @Repository annotation
Inject EntityManager
Create @Transactional save(Loan loan) method
Create findById(Long id) method
Create findByAccountNumber(String accountNumber) to get customer loans
Create findPendingLoans() - fetch all loans with status = 'PENDING' ordered by appliedDate
Verification Checklist:
Class compiles successfully
Status filtering works correctly
Proper ordering applied
Task 3.4: Create OtpRepository
Objective: Build repository for OTP CRUD and validation operations.
Teaching Notes:
Explain OTP lifecycle (create → validate → delete)
Discuss time-based queries
Bulk delete operations in JPA
Files to create/modify:
OtpRepository.java
Step-by-Step Implementation Strategy:
Create class with @Repository and inject EntityManager
Create @Transactional save(Otp otp) method
Create findByAccountNumber(String accountNumber) method
Create @Transactional deleteByAccountNumber(String accountNumber) using JPQL DELETE query
Create @Transactional deleteExpiredOtps() - remove OTPs where expiryTime < current time
Verification Checklist:
All CRUD operations implemented
Delete queries work correctly
Proper transaction boundaries
Phase 4: Business Logic Layer (Services)
Task 4.1: Create EmailService
Objective: Build service for sending emails using JavaMailSender.
Teaching Notes:
Explain Spring's JavaMailSender abstraction
Discuss SimpleMailMessage for text emails
Error handling in email sending
Files to create/modify:
EmailService.java
Step-by-Step Implementation Strategy:
Create class with @Service annotation
Inject JavaMailSender via constructor
Create method sendMail(String to, String subject, String body)
Create SimpleMailMessage object
Set from address, to, subject, and text
Call mailSender.send(message)
Add try-catch for exception handling
Verification Checklist:
Class compiles successfully
Dependencies properly injected
Exception handling present
Task 4.2: Create AccountUtil Helper Class
Objective: Build utility class for generating account numbers and temporary passwords.
Teaching Notes:
Explain utility class pattern (static methods, no state)
Discuss random number generation
Account number format design (starting with prefix)
Files to create/modify:
AccountUtil.java
Step-by-Step Implementation Strategy:
Create public class AccountUtil (no Spring annotations needed)
Add static Random instance
Create static method generateAccountNumber() - generate 12-digit number starting with "10"
Logic: "10" + (1000000000L + random 10-digit number)
Create static method generateTempPassword() - format: "TMP" + 4-digit random number
Verification Checklist:
Both methods return properly formatted strings
Account number is always 12 digits
Temp password follows TMP#### format
Task 4.3: Create CustomerService
Objective: Build service for customer account creation with validation.
Teaching Notes:
Explain service layer responsibility (business logic + orchestration)
Discuss input validation patterns
Regex for email and mobile validation
Files to create/modify:
CustomerService.java
Step-by-Step Implementation Strategy:
Create class with @Service annotation
Inject CustomerRepository and EmailService via constructor
Create method createCustomer(String fullName, String email, String mobile)
Add validation: null/blank checks
Add regex validation for email format
Add regex validation for mobile (10 digits)
Check duplicate email and mobile using repository
Create Customer object, set all fields
Generate account number and temp password using AccountUtil
Save customer
Send email with account details
Return success message with account number
Verification Checklist:
All validations return proper error messages
Account number and temp password generated correctly
Customer saved to database
Email sent successfully
Task 4.4: Create CustomerLoginService
Objective: Build service for customer login validation and password reset.
Teaching Notes:
Explain authentication flow with temp password
Discuss password reset requirement on first login
Session management concepts
Files to create/modify:
CustomerLoginService.java
Step-by-Step Implementation Strategy:
Create class with @Service and inject CustomerRepository
Create method validateLogin(String accountNumber, String password)
Fetch customer by account number
Validate account exists and is active
Check if tempPasswordActive is true → validate against tempPassword → return "RESET_REQUIRED"
Else validate against permanent password → return "SUCCESS"
Return error message if validation fails
Create @Transactional method resetPassword(String accountNumber, String newPassword)
Validate new password length (minimum 4 characters)
Set password, set tempPasswordActive = false, clear tempPassword
Save and return "SUCCESS"
Verification Checklist:
Login flow handles temp password correctly
Password reset updates all required fields
Proper error messages returned
Transaction boundary on reset
Task 4.5: Create OtpService
Objective: Build service for OTP generation, sending, and validation.
Teaching Notes:
Explain OTP security patterns
Discuss time-based expiry (5 minutes)
Random 6-digit OTP generation
Files to create/modify:
OtpService.java
Step-by-Step Implementation Strategy:
Create class with @Service annotation
Inject OtpRepository, CustomerRepository, and EmailService
Create method generateOtp(String accountNumber)
Delete any existing OTP for this account
Generate 6-digit random OTP (100000 to 999999)
Set expiry time = current time + 5 minutes
Save OTP to database
Fetch customer email and send OTP via email
Create method validateOtp(String accountNumber, String otp)
Fetch OTP record for account
Check if OTP matches and expiryTime > current time
If valid, delete OTP and return true
Return false otherwise
Verification Checklist:
OTP is 6 digits
Expiry time set correctly (5 minutes)
Validation checks both OTP match and expiry
OTP deleted after successful validation
Task 4.6: Create CustomerDashboardService
Objective: Build service to fetch customer dashboard data and transaction statements.
Teaching Notes:
Explain service methods for view data preparation
Discuss transaction filtering logic
Mini statement vs full statement
Files to create/modify:
CustomerDashboardService.java
Step-by-Step Implementation Strategy:
Create class with @Service and inject repositories
Create method getCustomerByAccount(String accountNumber) - simple pass-through to repository
Create method getMiniStatement(String accountNumber) - fetch last 10 transactions
Create method getFilteredStatement(String acc, Integer month, Integer year) - call repository with month/year filter
Return transaction list for controller to process
Verification Checklist:
Methods return correct data
Null handling for not found cases
Filter parameters passed correctly
Task 4.7: Create FundTransferService
Objective: Build service for fund transfer with full validation and transaction management.
Teaching Notes:
Explain @Transactional for ACID properties
Discuss double-entry accounting principles
Rollback on failure scenarios
Files to create/modify:
FundTransferService.java
Step-by-Step Implementation Strategy:
Create class with @Service annotation
Inject CustomerRepository and TransactionRepository
Create @Transactional method transfer(String fromAcc, String toAcc, double amount)
Validate: accounts not null, not same account, amount > 0, amount >= 1
Fetch sender and receiver from repository
Validate both exist, receiver is active
Check sender balance >= amount
Deduct amount from sender balance
Add amount to receiver balance
Save both customers
Create single Transaction record with type="TRANSFER"
Save transaction
Return "SUCCESS" or appropriate error message
Verification Checklist:
All validations return proper error messages
Balance updated correctly for both accounts
Single transaction record created
Transaction rollback on any error
Task 4.8: Create LoanService
Objective: Build service for loan application with amount and tenure validation.
Teaching Notes:
Explain loan business rules (min/max amounts, interest rates)
Discuss loan type determination
Validation patterns for business rules
Files to create/modify:
LoanService.java
Step-by-Step Implementation Strategy:
Create class with @Service and inject LoanRepository
Create method applyLoan(String accountNumber, String loanType, double amount, int tenure)
Validate amount >= 10000 (minimum loan)
Validate tenure between 6 and 360 months
Validate loan type and amount limits:
HOME: max 5000000, rate 8.5%
EDUCATION: max 1000000, rate 6.5%
PERSONAL: max 500000, rate 12%
Create Loan object with status "PENDING" and current date
Save loan
Return success message
Verification Checklist:
All loan type validations work
Interest rate assigned correctly
Loan saved with PENDING status
Applied date set to current date
Task 4.9: Create AdminLoanService
Objective: Build service for admin to view and approve/reject loan applications.
Teaching Notes:
Explain admin workflow for loan approval
Discuss status transitions (PENDING → APPROVED/REJECTED)
Service layer orchestration for admin operations
Files to create/modify:
AdminLoanService.java
Step-by-Step Implementation Strategy:
Create class with @Service and inject LoanRepository
Create method getPendingLoans() - return all loans with PENDING status
Create @Transactional method approveLoan(Long loanId)
Fetch loan by ID
Set status to "APPROVED"
Save loan
Create @Transactional method rejectLoan(Long loanId)
Fetch loan by ID
Set status to "REJECTED"
Save loan
Verification Checklist:
Pending loans fetched correctly
Status update works for approve
Status update works for reject
Transactions committed
Phase 5: Controller & Web Layer
Task 5.1: Create HomeController
Objective: Build simple controller for landing page routing.
Teaching Notes:
Explain @Controller vs @RestController
Discuss request mapping annotations
Forward vs redirect in Spring MVC
Files to create/modify:
HomeController.java
Step-by-Step Implementation Strategy:
Create class with @Controller annotation
Create @GetMapping("/") method returning forward:/index.jsp
Create @GetMapping("/home") method returning same forward
Verification Checklist:
Controller compiles successfully
Mapping paths are correct
Forward syntax correct
Task 5.2: Create AdminController - Login & Dashboard
Objective: Build admin controller for login functionality with session management.
Teaching Notes:
Explain session-based authentication
Discuss hardcoded credentials for learning (security warning)
HttpSession usage in Spring MVC
Files to create/modify:
AdminController.java
Step-by-Step Implementation Strategy:
Create class with @Controller annotation
Define constants: ADMIN_USERNAME = "admin", ADMIN_PASSWORD = "admin123"
Create @GetMapping("/admin/login") returning view "admin-login"
Create @PostMapping("/admin/login") with parameters username, password, HttpSession, Model
Validate credentials match constants
Set session attribute ADMIN_LOGGED_IN = true
Redirect to /admin/dashboard
Create @GetMapping("/admin/dashboard") with session check
If not logged in, redirect to login
Return view "admin-dashboard"
Create @GetMapping("/admin/logout") to invalidate session
Verification Checklist:
Login validation works correctly
Session attribute set on success
Dashboard requires login
Logout clears session
Task 5.3: AdminController - Create Customer
Objective: Add customer creation functionality to admin controller.
Teaching Notes:
Explain form handling with @RequestParam
Discuss Model for passing data to view
Service layer integration
Files to create/modify:
AdminController.java
Step-by-Step Implementation Strategy:
Inject CustomerService via constructor
Create @GetMapping("/admin/create-customer") with session check
Return view "admin-create-customer"
Create @PostMapping("/admin/create-customer") with fullName, email, mobile parameters
Call customerService.createCustomer()
Add result message to Model
Return same view to display message
Verification Checklist:
Form page loads correctly
Customer creation works
Success/error message displayed
Email sent on success
Task 5.4: AdminController - Loan Management
Objective: Add loan approval/rejection functionality to admin controller.
Teaching Notes:
Explain listing data in views using Model
Discuss POST requests for state-changing operations
Redirect after POST pattern
Files to create/modify:
AdminController.java
Step-by-Step Implementation Strategy:
Inject AdminLoanService in constructor
Create @GetMapping("/admin/loans") with session check
Fetch pending loans and add to Model
Return view "admin-loans"
Create @PostMapping("/admin/loan/approve") with loanId parameter
Call adminLoanService.approveLoan(loanId)
Redirect to /admin/loans
Create @PostMapping("/admin/loan/reject") with loanId parameter
Call adminLoanService.rejectLoan(loanId)
Redirect to /admin/loans
Verification Checklist:
Loan list displays correctly
Approve button works
Reject button works
Redirect after action
Task 5.5: Create CustomerController - Login & OTP
Objective: Build customer controller with login and OTP verification flow.
Teaching Notes:
Explain multi-step authentication flow
Discuss session attributes for flow state
OTP security pattern
Files to create/modify:
CustomerController.java
Step-by-Step Implementation Strategy:
Create class with @Controller annotation
Inject CustomerLoginService and OtpService
Create @GetMapping("/customer/login") returning "customer-login"
Create @PostMapping("/customer/login") with accountNumber, password
Call customerLoginService.validateLogin()
If result = "RESET_REQUIRED", set session RESET_ACC and redirect to reset page
If result = "SUCCESS", set session OTP_ACC, generate OTP, redirect to OTP page
Otherwise show error
Create @GetMapping("/customer/otp") returning "customer-otp"
Create @PostMapping("/customer/otp") with otp parameter
Get accountNumber from session OTP_ACC
Validate OTP
If valid, set CUSTOMER_LOGGED_IN = true and LOGGED_IN_ACC, redirect to dashboard
Otherwise show error
Verification Checklist:
Login distinguishes temp vs permanent password
OTP generated and sent
OTP validation works
Session flow correct
Task 5.6: CustomerController - Password Reset
Objective: Add password reset functionality for first-time login.
Teaching Notes:
Explain forced password reset pattern
Discuss session state management across requests
Password validation rules
Files to create/modify:
CustomerController.java
Step-by-Step Implementation Strategy:
Create @GetMapping("/customer/reset-password") returning "reset-password"
Create @PostMapping("/customer/reset-password") with newPassword parameter
Get accountNumber from session RESET_ACC
Call customerLoginService.resetPassword()
If success, remove RESET_ACC from session and redirect to login
Otherwise show error
Verification Checklist:
Reset page accessible only with session
Password updated correctly
Temp password deactivated
Redirect to login after success
Task 5.7: CustomerController - Dashboard
Objective: Build customer dashboard to display account details.
Teaching Notes:
Explain authentication check pattern
Discuss passing entity objects to view
Model attribute usage
Files to create/modify:
CustomerController.java
Step-by-Step Implementation Strategy:
Inject CustomerDashboardService in constructor
Create @GetMapping("/customer/dashboard") with session check
If CUSTOMER_LOGGED_IN not true, redirect to login
Get accountNumber from session LOGGED_IN_ACC
Fetch customer using dashboardService.getCustomerByAccount()
Add customer to Model
Return view "customer-dashboard"
Create @GetMapping("/customer/logout") to invalidate session
Verification Checklist:
Dashboard requires login
Customer data displayed correctly
Logout works
Task 5.8: CustomerController - Fund Transfer
Objective: Add fund transfer functionality with validation feedback.
Teaching Notes:
Explain form submission and validation feedback
Discuss staying on same page vs redirect
Error and success message display
Files to create/modify:
CustomerController.java
Step-by-Step Implementation Strategy:
Inject FundTransferService in constructor
Create @GetMapping("/customer/transfer") with session check
Return view "fund-transfer"
Create @PostMapping("/customer/transfer") with toAccount, amount parameters
Get fromAccount from session
Call fundTransferService.transfer()
Add result message to Model
Return same view "fund-transfer" (not redirect)
Verification Checklist:
Transfer form loads
Validation messages show correctly
Success updates balances
Stays on same page after submit
Task 5.9: CustomerController - Transaction Statement
Objective: Build transaction statement view with filtering and download features.
Teaching Notes:
Explain transaction type calculation (DEBIT/CREDIT based on logged-in account)
Discuss filtering by month/year
CSV file download in Spring MVC
Files to create/modify:
CustomerController.java
Step-by-Step Implementation Strategy:
Create @GetMapping("/customer/statement") with session check
Get accountNumber from session
Fetch mini statement (last 10 transactions)
Loop through transactions and set type to DEBIT if fromAccount matches, else CREDIT
Add to Model and return view "customer-statement"
Create @GetMapping("/customer/statement/filter") with month, year parameters
Call dashboardService.getFilteredStatement()
Apply same DEBIT/CREDIT logic
Add transactions, month, year to Model
Return same view
Create @GetMapping("/customer/statement/download") with month, year, HttpServletResponse
Fetch filtered or mini statement
Set response content type to "text/csv"
Set Content-Disposition header for download
Write CSV header and data with DEBIT/CREDIT logic
Return null to indicate file download
Verification Checklist:
Mini statement shows last 10 transactions
DEBIT/CREDIT calculated correctly
Month/year filter works
CSV download works
Task 5.10: CustomerController - Loan Application
Objective: Add loan application functionality for customers.
Teaching Notes:
Explain loan application form handling
Discuss loan type dropdown values
Validation feedback display
Files to create/modify:
CustomerController.java
Step-by-Step Implementation Strategy:
Inject LoanService in constructor
Create @GetMapping("/customer/loan/apply") with session check
Return view "customer-loan-apply"
Create @PostMapping("/customer/loan/apply") with loanType, amount, tenure parameters
Get accountNumber from session
Call loanService.applyLoan()
Add result message to Model
Return same view
Verification Checklist:
Loan form loads
Loan types available
Validation works
Success message displays
Phase 6: Frontend & UI Components (JSP Views)
Task 6.1: Create Landing Page (index.jsp)
Objective: Build the application landing page with navigation to admin and customer portals.
Teaching Notes:
Explain JSP basics and embedded CSS
Discuss context path in URLs
Basic HTML/CSS for professional look
Files to create/modify:
index.jsp
Step-by-Step Implementation Strategy:
Create JSP with HTML5 doctype
Add embedded CSS for centered card layout
Create heading "Welcome to Smart Bank"
Add two styled links/buttons:
Admin Login → <%=request.getContextPath()%>/admin/login
Customer Login → <%=request.getContextPath()%>/customer/login
Style with gradient background and card design
Verification Checklist:
Page loads at root URL
Both links work correctly
Responsive design looks good
Task 6.2: Create Admin Login Page
Objective: Build admin login form with error display.
Teaching Notes:
Explain JSP form action with context path
Discuss EL (Expression Language) for displaying model attributes
CSRF considerations (not implemented in learning project)
Files to create/modify:
admin-login.jsp
Step-by-Step Implementation Strategy:
Create JSP with form posting to /admin/login
Add input fields for username and password
Add submit button
Display error message if present: ${error}
Style with centered form, card layout
Add link back to home page
Verification Checklist:
Form submits correctly
Error message displays
Success redirects to dashboard
Styling matches theme
Task 6.3: Create Admin Dashboard Page
Objective: Build admin dashboard with navigation menu.
Teaching Notes:
Explain dashboard menu pattern
Discuss navigation between admin sections
Logout functionality
Files to create/modify:
admin-dashboard.jsp
Step-by-Step Implementation Strategy:
Create JSP with welcome message "Welcome Admin"
Create vertical menu with styled links:
Create Customer
Loan Approvals
Logout
Style as card with blue theme
Add hover effects
Verification Checklist:
Dashboard loads after login
All links work
Logout clears session
Task 6.4: Create Admin Customer Creation Form
Objective: Build form for admin to create new customer accounts.
Teaching Notes:
Explain multi-field form handling
Discuss success vs error message display
Form validation feedback
Files to create/modify:
admin-create-customer.jsp
Step-by-Step Implementation Strategy:
Create JSP with form posting to /admin/create-customer
Add input fields: Full Name, Email, Mobile
Add submit button
Display message (success or error): ${message}
Style form with labels and inputs
Add back to dashboard link
Verification Checklist:
Form submits correctly
Validation messages display
Success shows account number
Email sent to customer
Task 6.5: Create Admin Loan Approval Page
Objective: Build page to display pending loans with approve/reject buttons.
Teaching Notes:
Explain JSTL core tags for iteration
Discuss table-based data display
Form submission with hidden loan ID
Files to create/modify:
admin-loans.jsp
Step-by-Step Implementation Strategy:
Add JSTL taglib declaration: <%@ taglib prefix="c" uri="jakarta.tags.core" %>
Create table with headers: Account, Loan Type, Amount, Tenure, Interest Rate, Applied Date, Actions
Use <c:forEach> to iterate over ${loans}
Display loan details in table rows
Add two forms per row: Approve and Reject with hidden loanId input
Style table with borders and padding
Color code approve (green) and reject (red) buttons
Show message if no pending loans
Verification Checklist:
Loan list displays correctly
Approve works and updates status
Reject works and updates status
Table responsive
Task 6.6: Create Customer Login Page
Objective: Build customer login form with account number and password.
Teaching Notes:
Explain customer authentication flow
Discuss account number as username
Error display patterns
Files to create/modify:
customer-login.jsp
Step-by-Step Implementation Strategy:
Create JSP with form posting to /customer/login
Add input fields: Account Number, Password
Add submit button
Display error: ${error}
Style similar to admin login
Add link to home page
Verification Checklist:
Form submits correctly
Temp password triggers reset flow
Permanent password triggers OTP flow
Error messages display
Task 6.7: Create Password Reset Page
Objective: Build password reset form for first-time login.
Teaching Notes:
Explain forced password change flow
Discuss password requirements
Success redirect back to login
Files to create/modify:
reset-password.jsp
Step-by-Step Implementation Strategy:
Create JSP with form posting to /customer/reset-password
Add instruction text about setting new password
Add input field: New Password (type="password")
Add submit button
Display error: ${error}
Style consistently
Verification Checklist:
Form submits correctly
Password validation works (min 4 chars)
Success redirects to login
Can login with new password
Task 6.8: Create OTP Verification Page
Objective: Build OTP input form for two-factor authentication.
Teaching Notes:
Explain OTP verification flow
Discuss time-based expiry
Security considerations
Files to create/modify:
customer-otp.jsp
Step-by-Step Implementation Strategy:
Create JSP with form posting to /customer/otp
Add instruction: "Enter 6-digit OTP sent to your email"
Add input field: OTP (type="text", maxlength="6")
Add submit button
Display error: ${error}
Style with emphasis on security
Verification Checklist:
Form submits correctly
Valid OTP redirects to dashboard
Invalid OTP shows error
Expired OTP shows error
Task 6.9: Create Customer Dashboard Page
Objective: Build customer dashboard displaying account information and navigation menu.
Teaching Notes:
Explain EL for accessing customer object properties
Discuss dashboard information display
Navigation to features
Files to create/modify:
customer-dashboard.jsp
Step-by-Step Implementation Strategy:
Create JSP with welcome message: "Welcome, ${customer.fullName}"
Display account details in styled card:
Account Number: ${customer.accountNumber}
Balance: ₹${customer.balance}
Email: ${customer.email}
Mobile: ${customer.mobile}
Create navigation menu with links:
Fund Transfer
View Statement
Apply for Loan
Logout
Style with cards and buttons
Verification Checklist:
Dashboard loads after successful OTP
Customer data displays correctly
Balance shows with currency symbol
All navigation links work
Task 6.10: Create Fund Transfer Page
Objective: Build fund transfer form with validation feedback.
Teaching Notes:
Explain form handling with same-page feedback
Discuss success vs error styling
Real-time balance considerations
Files to create/modify:
fund-transfer.jsp
Step-by-Step Implementation Strategy:
Create JSP with form posting to /customer/transfer
Add input fields: To Account Number, Amount
Add submit button
Display message: ${message}
Use JSTL to conditionally style message (green for SUCCESS, red for errors)
Add back to dashboard link
Style form professionally
Verification Checklist:
Form submits correctly
Validation errors display properly
Success message shows in green
Balance updates after transfer
Task 6.11: Create Transaction Statement Page
Objective: Build transaction statement with filtering and download options.
Teaching Notes:
Explain JSTL forEach for transaction iteration
Discuss DEBIT/CREDIT display logic
Date formatting in JSP
CSV download link
Files to create/modify:
customer-statement.jsp
Step-by-Step Implementation Strategy:
Add JSTL taglib
Create filter form with dropdowns: Month (1-12), Year
Add Filter button and Download CSV link
Create table with headers: Date, Type, From, To, Amount
Use <c:forEach> to iterate over ${transactions}
Display transaction details
Color code: DEBIT in red, CREDIT in green
Show message if no transactions
Add back to dashboard link
Verification Checklist:
Mini statement shows last 10 transactions
Filter works for month/year
DEBIT shown in red, CREDIT in green
Download CSV works
CSV contains correct data
Task 6.12: Create Loan Application Page
Objective: Build loan application form with loan type selection.
Teaching Notes:
Explain dropdown for loan types
Discuss loan amount and tenure inputs
Validation feedback display
Files to create/modify:
customer-loan-apply.jsp
Step-by-Step Implementation Strategy:
Create JSP with form posting to /customer/loan/apply
Add dropdown for Loan Type: HOME, EDUCATION, PERSONAL
Add input fields: Amount, Tenure (in months)
Add helper text about limits for each loan type
Add submit button
Display message: ${message}
Style form with clear labels
Add back to dashboard link
Verification Checklist:
Form submits correctly
Loan type selection works
Amount validation works
Tenure validation works
Success message displays
Phase 7: Advanced Features & Testing
Task 7.1: Add web.xml Configuration (Optional)
Objective: Create traditional web.xml as alternative to Java config (for learning comparison).
Teaching Notes:
Explain XML vs Java configuration approaches
Discuss which approach is modern (Java config preferred)
Show equivalence between BankWebInitializer and web.xml
Files to create/modify:
web.xml
Step-by-Step Implementation Strategy:
Create web.xml with servlet 6.0 schema
Configure DispatcherServlet with contextConfigLocation
Map servlet to "/"
Configure context parameters
Note: This is optional as BankWebInitializer already handles this
Verification Checklist:
XML is well-formed
Compare with Java config approach
Application still works (or comment out Java config to test XML)
Task 7.2: Enhance Error Handling - Custom Error Pages
Objective: Create custom 404 and 500 error pages for better user experience.
Teaching Notes:
Explain HTTP status codes
Discuss error page configuration
User-friendly error messages
Files to create/modify:
error-404.jsp
error-500.jsp
Update WebMvcConfig.java to register error pages
Step-by-Step Implementation Strategy:
Create 404 JSP with "Page Not Found" message
Create 500 JSP with "Internal Server Error" message
Style both consistently with application theme
Add navigation back to home
Configure error pages in WebMvcConfig or web.xml
Verification Checklist:
404 page displays for invalid URLs
500 page displays for exceptions
Navigation works from error pages
Task 7.3: Add Input Sanitization
Objective: Add XSS prevention by sanitizing user inputs in services.
Teaching Notes:
Explain XSS (Cross-Site Scripting) attacks
Discuss input sanitization vs output encoding
Simple sanitization patterns
Files to create/modify:
Create 
InputSanitizer.java
Update service classes to use sanitizer
Step-by-Step Implementation Strategy:
Create InputSanitizer utility class
Add method to trim and remove HTML tags
Add method to validate numeric inputs
Update CustomerService to sanitize fullName
Update all user input processing
Verification Checklist:
HTML tags removed from inputs
Trimming works correctly
No functionality broken
Task 7.4: Add Transaction History Pagination
Objective: Implement pagination for transaction statements instead of loading all at once.
Teaching Notes:
Explain pagination concept
Discuss LIMIT and OFFSET in queries
Page number calculation
Files to create/modify:
Update TransactionRepository.java
Update CustomerDashboardService.java
Update CustomerController.java
Update customer-statement.jsp
Step-by-Step Implementation Strategy:
Add method in repository: findTransactionsWithPagination(String acc, int page, int size)
Use setFirstResult() and setMaxResults()
Add method to count total transactions
Update service to accept page parameter
Update controller to pass page parameter (default 1)
Update JSP to show page numbers and navigation
Verification Checklist:
First page loads correctly
Next/Previous page navigation works
Page numbers calculated correctly
Performance improved for large datasets
Task 7.5: Add Password Strength Validator
Objective: Enhance password reset with stronger validation rules.
Teaching Notes:
Explain password security best practices
Discuss regex for password patterns
User feedback for password requirements
Files to create/modify:
Create 
PasswordValidator.java
Update CustomerLoginService.java
Update reset-password.jsp
Step-by-Step Implementation Strategy:
Create PasswordValidator utility
Add validation: min 8 characters, at least 1 uppercase, 1 lowercase, 1 digit
Return user-friendly error messages
Update resetPassword() to use validator
Update JSP to show password requirements
Verification Checklist:
Weak passwords rejected
Strong passwords accepted
Clear feedback to user
Requirements visible on page
Task 7.6: Add Account Statement Email Feature
Objective: Allow customers to email their statement to their registered email.
Teaching Notes:
Explain email with attachments (optional)
Discuss formatted email content
Email templates
Files to create/modify:
Update EmailService.java to add sendStatementEmail method
Update CustomerController.java to add email statement endpoint
Update customer-statement.jsp to add email button
Step-by-Step Implementation Strategy:
Add method in EmailService: sendStatementEmail(String email, List<Transaction> txns)
Format transactions as HTML table in email body
Add controller method: @PostMapping("/customer/statement/email")
Fetch transactions and customer email
Call email service
Add "Email Statement" button in JSP
Show success/error feedback
Verification Checklist:
Email button appears
Email sent successfully
Email contains formatted statement
Success message displays
Task 7.7: Add Monthly Balance Summary
Objective: Create a dashboard widget showing monthly credit/debit summary.
Teaching Notes:
Explain aggregation queries in JPA
Discuss SUM function in JPQL
Data visualization concepts
Files to create/modify:
Update TransactionRepository.java
Update CustomerDashboardService.java
Update CustomerController.java
Update customer-dashboard.jsp
Step-by-Step Implementation Strategy:
Add repository method: calculateMonthlySummary(String acc, int month, int year)
Use JPQL SUM queries grouped by type
Return Map with totalCredit and totalDebit
Update service to call repository
Update controller to add summary to Model
Update dashboard JSP to display summary in cards
Verification Checklist:
Summary calculates correctly
Displays current month by default
Credit and debit totals accurate
Styled attractively on dashboard
Task 7.8: Create Unit Tests for Services
Objective: Write JUnit tests for critical service methods.
Teaching Notes:
Explain unit testing principles
Discuss mocking with Mockito
Test-driven development (TDD) introduction
Files to create/modify:
Create 
FundTransferServiceTest.java
Create 
CustomerServiceTest.java
Add JUnit and Mockito dependencies to pom.xml
Step-by-Step Implementation Strategy:
Add JUnit 5 and Mockito dependencies
Create test class for FundTransferService
Mock repositories
Test successful transfer scenario
Test insufficient balance scenario
Test invalid account scenarios
Create test class for CustomerService
Test customer creation with valid data
Test duplicate email validation
Run tests with mvn test
Verification Checklist:
All tests compile
Tests run successfully
Test coverage for main scenarios
Green test results
Task 7.9: Add Integration Test for Login Flow
Objective: Write integration test for complete customer login flow.
Teaching Notes:
Explain integration vs unit tests
Discuss Spring Test framework
MockMvc for testing controllers
Files to create/modify:
Create 
CustomerLoginIntegrationTest.java
Add Spring Test dependency
Step-by-Step Implementation Strategy:
Add spring-test dependency
Create test class with @SpringBootTest (or appropriate Spring test annotations)
Configure MockMvc
Test POST to /customer/login with temp password
Verify redirect to reset page
Test POST to reset password
Test login with new password
Verify OTP generation
Run integration tests
Verification Checklist:
Integration test runs
Full flow tested
Assertions pass
Database changes verified
Task 7.10: Document API Endpoints & Create README
Objective: Create comprehensive documentation for the project.
Teaching Notes:
Explain importance of documentation
Discuss README best practices
API endpoint documentation patterns
Files to create/modify:
Update README.md
Create API_ENDPOINTS.md
Step-by-Step Implementation Strategy:
Update README with comprehensive setup instructions
Document technology stack
Add database setup instructions
Document default credentials
Create API_ENDPOINTS.md
List all admin endpoints with HTTP methods
List all customer endpoints
Document request parameters and responses
Add example requests
Document session attributes
Verification Checklist:
README is clear and complete
Setup instructions work for new users
All endpoints documented
Examples are accurate
Verification & Deployment
Final Verification Checklist
Before considering the project complete, verify:

Database:

 All tables created with correct schema
 Indexes added for performance
 Sample data can be inserted
Backend:

 All entities mapped correctly
 All repositories function properly
 All services have business logic implemented
 All controllers handle requests correctly
 Email service configured and working
Frontend:

 All JSP pages render correctly
 Forms submit properly
 Error messages display
 Success messages display
 Navigation works throughout application
 Styling is consistent
Functional Flows:

 Admin can login
 Admin can create customers
 Admin can approve/reject loans
 Customer receives email with credentials
 Customer can login with temp password
 Customer must reset password
 Customer receives OTP
 Customer can verify OTP
 Customer can view dashboard
 Customer can transfer funds
 Customer can view statements
 Customer can filter statements
 Customer can download CSV
 Customer can apply for loans
 Customer can logout
Build & Deployment:

 mvn clean compile succeeds
 mvn package creates WAR file
 WAR deploys to Tomcat 10+
 Application accessible at configured URL
 No console errors
Teaching Tips
For Live Sessions:
Start with Theory (2-3 minutes per task):

Explain the concept before coding
Show diagrams where helpful
Relate to real-world scenarios
Code Together (7-10 minutes per task):

Type code while explaining
Use meaningful variable names
Add comments for clarity
Explain each annotation
Test Immediately (2-3 minutes per task):

Run the application after each task
Show the feature working
Debug any issues together
Encourage questions
Between Phases:

Take short breaks
Recap what was built
Preview next phase
Address questions
Common Student Questions:

"Why Spring over plain servlets?" → Less boilerplate, better structure
"Why JPA over JDBC?" → Object-oriented, less SQL code
"Why JSP if it's old?" → Good for learning, shows MVC clearly
"Is this production-ready?" → No, needs security enhancements
Project Statistics
Total Tasks: 70+ atomic tasks
Estimated Total Time: 15-20 hours of live coding
Lines of Code: ~3000-3500 LOC
Number of Classes: 25+
Number of JSP Pages: 12
Number of Database Tables: 4
Number of Features: 15+
Next Steps After Completion
Security Enhancements:

Add BCrypt password encryption
Implement Spring Security
Add CSRF protection
Implement role-based access control
Modern Frontend:

Replace JSP with React/Angular
Create REST API
Add Swagger documentation
Advanced Features:

Account deactivation
Profile management
Loan EMI calculator
Admin analytics dashboard
SMS OTP instead of email
DevOps:

Add Docker containerization
Create CI/CD pipeline
Deploy to cloud (AWS/Azure)
Add monitoring and logging
End of Tasks Specification

Would you like me to create this as a file in your project? Let me know if you'd like any modifications or additions to the task breakdown!