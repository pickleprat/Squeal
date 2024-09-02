LOAD DATA  
LOCAL INFILE '/home/kyojinprat/Desktop/sql/datasets/amazon/amazon.csv'
INTO TABLE orders 	
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS; 



