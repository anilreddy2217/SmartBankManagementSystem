package com.bank.service;

import com.bank.entity.Customer;
import com.bank.repository.CustomerRepository;
import com.bank.util.AccountUtil;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {

    private final CustomerRepository customerRepository;
    private final EmailService emailService;

    public CustomerService(CustomerRepository customerRepository,
                           EmailService emailService) {
        this.customerRepository = customerRepository;
        this.emailService = emailService;
    }


    public String createCustomer(String fullName, String email, String mobile) {

        // Basic validations
        if (fullName == null || fullName.isBlank())
            return "Full name is required";

        if (email == null || email.isBlank())
            return "Email is required";
        
        // Email format validation
        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"))
            return "Invalid email format";

        if (mobile == null || mobile.isBlank())
            return "Mobile number is required";
        
        // Mobile format validation (10 digits)
        if (!mobile.matches("^[0-9]{10}$"))
            return "Mobile number must be 10 digits";

        if (customerRepository.existsByEmail(email))
            return "Email already exists";

        if (customerRepository.existsByMobile(mobile))
            return "Mobile already exists";

        // Create customer
        Customer customer = new Customer();
        customer.setFullName(fullName);
        customer.setEmail(email);
        customer.setMobile(mobile);

        customer.setAccountNumber(AccountUtil.generateAccountNumber());
        customer.setTempPassword(AccountUtil.generateTempPassword());

        customer.setPassword(""); // not set yet
        customer.setTempPasswordActive(true);
        customer.setActive(true);
        customer.setBalance(0.0);

        customerRepository.save(customer);
        String subject = "Your Smart Bank Account Details";

        String body =
                "Dear " + customer.getFullName() + ",\n\n" +
                "Your Smart Bank account has been created successfully.\n\n" +
                "Account Number: " + customer.getAccountNumber() + "\n" +
                "Temporary Password: " + customer.getTempPassword() + "\n\n" +
                "Please login and reset your password immediately.\n\n" +
                "Regards,\nSmart Bank";

        emailService.sendMail(
                customer.getEmail(),
                subject,
                body
        );

        

        return "SUCCESS : Account created. Account No = "
                + customer.getAccountNumber()
                + " | Temp Password = "
                + customer.getTempPassword();
    }
}
