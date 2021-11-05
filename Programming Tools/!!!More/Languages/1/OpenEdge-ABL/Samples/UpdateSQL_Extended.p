FOR EACH customer WHERE customer.custno = 14 EXCLUSIVE-LOCK:
    ASSIGN customer.salesman = 'Fred'.
END.

