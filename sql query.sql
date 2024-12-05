--create database India Election Result

create table constituencywise_details(
no int primary key,
candidate varchar(100),
party varchar(100),
EVM_votes int,
postal_votes int,
total_votes int,
percentage_of_votes float,
constituency_id varchar(50)
);
drop table constituencywise_details

create table constituencywise_results(
no int,
parliament_constituency varchar(100) primary key,
constituency_name varchar(100),
winning_candidate varchar(150),	
total_votes int,
margin int,
constituency_id varchar(100),	
party_id int,
foreign key(constituency_id)references constituencywise_details(constituency_id)
);

drop table constituencywise_results