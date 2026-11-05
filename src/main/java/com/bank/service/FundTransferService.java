package com.bank.service;

import com.bank.entity.Customer;
import com.bank.entity.Transaction;
import com.bank.repository.CustomerRepository;
import com.bank.repository.TransactionRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class FundTransferService {

    private final CustomerRepository customerRepository;
    private final TransactionRepository transactionRepository;

    public FundTransferService(CustomerRepository customerRepository,
                               TransactionRepository transactionRepository) {
        this.customerRepository = customerRepository;
        this.transactionRepository = transactionRepository;
    }

    @Transactional
    public String transfer(String fromAcc, String toAcc, double amount) {

        // Validation checks
        if (fromAcc == null || toAcc == null)
            return "Invalid account numbers";

        if (fromAcc.equals(toAcc))
            return "Cannot transfer to same account";

        if (amount <= 0)
            return "Amount must be greater than zero";
        
        // Minimum transfer amount check
        if (amount < 1)
            return "Minimum transfer amount is ₹1";

        Customer sender =
                customerRepository.findByAccountNumber(fromAcc);

        if (sender == null)
            return "Sender account not found";

        Customer receiver =
                customerRepository.findByAccountNumber(toAcc);

        if (receiver == null)
            return "Receiver account not found";
        
        // Check if receiver account is active
        if (!receiver.isActive())
            return "Receiver account is not active";

        if (sender.getBalance() < amount)
            return "Insufficient balance";

        // 🔻 Debit sender
        sender.setBalance(sender.getBalance() - amount);

        // 🔺 Credit receiver
        receiver.setBalance(receiver.getBalance() + amount);

        customerRepository.save(sender);
        customerRepository.save(receiver);

        // ✅ SAVE ONLY ONE TRANSACTION
        Transaction tx = new Transaction();
        tx.setFromAccount(fromAcc);
        tx.setToAccount(toAcc);
        tx.setAmount(amount);
        tx.setType("TRANSFER");
        tx.setTransactionDate(LocalDateTime.now());

        transactionRepository.save(tx);

        return "SUCCESS";
    }

    public List<Transaction> getTransactions(String account) {
        return transactionRepository.findRecentTransactions(account);
    }
    
}

