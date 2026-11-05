package com.bank.service;

import com.bank.entity.Loan;
import com.bank.repository.LoanRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class LoanService {

    private final LoanRepository loanRepository;

    public LoanService(LoanRepository loanRepository) {
        this.loanRepository = loanRepository;
    }

    public String applyLoan(String accNo, String loanType, double amount, int tenure) {

        if (accNo == null || accNo.isBlank())
            return "Account number is required";

        if (loanType == null || loanType.isBlank())
            return "Loan type is required";

        if (amount <= 0)
            return "Loan amount must be greater than zero";
        
        // Minimum loan amount
        if (amount < 10000)
            return "Minimum loan amount is ₹10,000";
        
        // Maximum loan amount based on type
        double maxAmount = switch (loanType) {
            case "HOME" -> 5000000; // 50 lakhs
            case "EDUCATION" -> 1000000; // 10 lakhs
            case "PERSONAL" -> 500000; // 5 lakhs
            default -> 0;
        };
        
        if (maxAmount == 0)
            return "Invalid loan type. Choose: HOME, EDUCATION, or PERSONAL";
        
        if (amount > maxAmount)
            return "Maximum loan amount for " + loanType + " is ₹" + maxAmount;

        if (tenure <= 0)
            return "Tenure must be greater than zero";
        
        // Tenure validation (months)
        if (tenure < 6)
            return "Minimum tenure is 6 months";
        
        if (tenure > 360)
            return "Maximum tenure is 360 months (30 years)";

        Loan loan = new Loan();
        loan.setAccountNumber(accNo);
        loan.setLoanType(loanType);
        loan.setAmount(amount);
        loan.setTenureMonths(tenure);
        loan.setInterestRate(getInterestRate(loanType));
        loan.setStatus("PENDING");
        loan.setAppliedDate(LocalDate.now());

        loanRepository.save(loan);

        return "Loan applied successfully. Your application is under review.";
    }

    public List<Loan> getLoans(String accNo) {
        return loanRepository.findByAccountNumber(accNo);
    }

    private double getInterestRate(String loanType) {
        return switch (loanType) {
            case "HOME" -> 8.5;
            case "EDUCATION" -> 6.5;
            default -> 12.0;
        };
    }
}
