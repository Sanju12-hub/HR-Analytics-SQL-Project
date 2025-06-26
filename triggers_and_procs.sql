ALTER TABLE performance_reviews
ADD Extra_bonus DECIMAL(10,2);

DELIMITER //
CREATE TRIGGER prevent_future_review_date
BEFORE INSERT ON performance_reviews
FOR EACH ROW
BEGIN
  IF NEW.review_date > CURDATE() THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Cannot insert a review with a future review_date.';
  END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Extra_bonus()
BEGIN
  UPDATE performance_reviews
  SET Extra_bonus = CASE
      WHEN rating > 4.5 THEN 10.00
      WHEN rating > 3.5 THEN 5.00
      ELSE NULL
    END,
    bonus_amount = CASE
      WHEN rating > 4.5 THEN bonus_amount * 1.10
      WHEN rating > 3.5 THEN bonus_amount * 0.55
      ELSE bonus_amount
    END;
END //
DELIMITER ;
