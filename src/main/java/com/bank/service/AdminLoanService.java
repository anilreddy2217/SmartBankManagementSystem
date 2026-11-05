package com.bank.service;

import com.bank.entity.Customer;
import com.bank.entity.Loan;
import com.bank.repository.CustomerRepository;
import com.bank.repository.LoanRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AdminLoanService {

    private final LoanRepository loanRepository;
    private final CustomerRepository customerRepository;

    public AdminLoanService(LoanRepository loanRepository,
                            CustomerRepository customerRepository) {
        this.loanRepository = loanRepository;
        this.customerRepository = customerRepository;
    }

    public List<Loan> getPendingLoans() {
        return loanRepository.findByStatus("PENDING");
    }

    @Transactional
    public String approveLoan(Long loanId) {

        if (loanId == null)
            return "Invalid loan ID";

        Loan loan =
                loanRepository.findById(loanId).orElse(null);

        if (loan == null)
            return "Loan not found";

        if (!"PENDING".equals(loan.getStatus()))
            return "Loan already processed";

        Customer customer =
                customerRepository.findByAccountNumber(
                        loan.getAccountNumber()
                );

        if (customer == null)
            return "Customer not found";
        
        // Check if customer account is active
        if (!customer.isActive())
            return "Customer account is not active";

        // 💰 CREDIT LOAN AMOUNT
        customer.setBalance(
                customer.getBalance() + loan.getAmount()
        );

        loan.setStatus("APPROVED");

        customerRepository.save(customer);
        loanRepository.save(loan);

        return "Loan approved successfully";
    }

    @Transactional
    public String rejectLoan(Long loanId) {

        if (loanId == null)
            return "Invalid loan ID";

        Loan loan =
                loanRepository.findById(loanId).orElse(null);

        if (loan == null)
            return "Loan not found";
        
        if (!"PENDING".equals(loan.getStatus()))
            return "Loan already processed";

        loan.setStatus("REJECTED");
        loanRepository.save(loan);

        return "Loan rejected";
    }
}
