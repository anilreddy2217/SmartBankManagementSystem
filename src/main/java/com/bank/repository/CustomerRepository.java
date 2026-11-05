package com.bank.repository;

import com.bank.entity.Customer;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class CustomerRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public void save(Customer customer) {
        entityManager.persist(customer);
    }

    public boolean existsByEmail(String email) {
        Long count = entityManager.createQuery(
                "SELECT COUNT(c) FROM Customer c WHERE c.email = :email",
                Long.class)
                .setParameter("email", email)
                .getSingleResult();

        return count > 0;
    }

    public boolean existsByMobile(String mobile) {
        Long count = entityManager.createQuery(
                "SELECT COUNT(c) FROM Customer c WHERE c.mobile = :mobile",
                Long.class)
                .setParameter("mobile", mobile)
                .getSingleResult();

        return count > 0;
    }
    public Customer findByAccountNumber(String accountNumber) {
        try {
            return entityManager.createQuery(
                    "SELECT c FROM Customer c WHERE c.accountNumber = :acc",
                    Customer.class)
                    .setParameter("acc", accountNumber)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }


}
