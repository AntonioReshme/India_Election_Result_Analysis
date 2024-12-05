# India Election Result Analysis 2024 SQL Project

![Screenshot 2024-12-05 143644](https://github.com/user-attachments/assets/de91f998-da98-4a7c-8ea0-eaca99cb949b)


## Project Overview

This project focuses on analyzing the results of the 2024 General Elections in India. It uses SQL queries to manage and analyze data related to constituencies, candidates, political parties, and election outcomes. The goal is to perform detailed analysis and generate insights, such as the total number of seats won by alliances, distribution of votes, and comparison of results across states.

## Objectives

The objective of this project is to conduct an in-depth analysis of the election results to uncover significant insights and trends. Key areas of exploration include:

📊 Distribution of leading parties across constituencies.

🏅 Margin of victory in different constituencies.

📈 Comparison between leading and trailing parties.

📢 Status of election results.

## Project Structure

### 1. Database Setup

- **Database Creation**:The project starts by creating a database named india_election_result_analysis_db.

- **Table Creation**: A table named constituencywise_details, constituencywise_results, partywise_results, states and statewise_results are created to store the data.

create table constituencywise_details(

no int primary key,

candidate varchar(100),

party varchar(100),

EVM_votes int,

postal_votes int,

total_votes int,

percentage_of_votes float,

constituency_id varchar(50));


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

foreign key(constituency_id)references constituencywise_details(constituency_id));


drop table constituencywise_results

create table partywise_results(

party varchar(50),

won int,

party_id int);

drop table partywise_results

create table states(

stae_id varchar(10),

state varchar(100));

drop table partywise_results

create table statewise_results(

constituency varchar(100),

const_no int,

parliament_constituency varchar(100),

leading_candidate varchar(100),

trailing_candidate varchar(100),

margin int);

### 3. Data Analysis  and Findings

**1. Total seats?**

select

count(distinct parliament_constituency)as total_seats

from constituencywise_results

**2. what are the total no of seats available for elections in each state?**

select s.state, count(distinct cr.parliament_constituency)as total_seats

from constituencywise_results as cr

join statewise_results as sr

on sr.parliament_constituency=cr.parliament_constituency

join states as s

on s.state_id=sr.state_id

group by 1

order by 2 desc

**3. Total seats won by NDA alliance?**

select

sum(case when party in (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				        'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				        'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')then(won)
                
                else 0
   
        end) as NDA_total_seats_won

from partywise_results 

**4. Seats won by NDA alliance parties?**

select party, won

from partywise_results

where party in(
				        'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				        'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
			        	'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')

order by 2 desc

**5. Total seats won by indian national developmental inclusive alliance(india) alliance?**

select

sum(case when party in (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'

)then (won)

else 0

end)as india_total_seats_won

from partywise_results

**6. Seats won by india alliance parties?**

select party, won

from partywise_results

where party in(
			        	'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')

order by 2 desc

**7. Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER?**

alter table partywise_results

add column party_alliance varchar(50)

**I.N.D.I.A Allianz**

update partywise_results

set party_alliance = 'I.N.D.I.A'

where party in (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK');

**NDA Alliance**

update partywise_results

set party_alliance = 'NDA'

where party in (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM');
    
**OTHERs**

update partywise_results

set party_alliance = 'Others'

where party_alliance is null;

**9. Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?**

select  pr.party_alliance, count(cr.constituency_id) as seats_Won

from constituencywise_results as cr

join partywise_results as pr 

on cr.party_id =pr.party_id

join statewise_results as sr

on sr.parliament_constituency=cr.parliament_constituency

join states as s

on s.state_id=sr.state_id

group by 1

order by 2 desc;

**9. Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?**

select cr.winning_candidate,  pr.party, pr.party_alliance, cr.total_votes, cr.margin, cr.constituency_name, s.state

from constituencywise_results as cr

join partywise_results as pr

on cr.party_id = pr.party_id

join statewise_results as sr 

on cr.parliament_constituency = sr.parliament_constituency

join states as s

on sr.state_id = s.state_id

where s.state = 'Uttar Pradesh' and cr.constituency_name = 'AMETHI';

**10. What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?**

select cd.Candidate, cd.Party, cd.EVM_Votes, cd.Postal_Votes, cd.Total_Votes, cr.Constituency_Name

from constituencywise_details as cd

join constituencywise_results as cr

on cd.constituency_id = cr.constituency_id

where cr.constituency_name = 'MATHURA'

order by 5 desc;

**11. Which parties won the most seats in a State, and how many seats did each party win?**

select pr.party, count(cr.constituency_id) as seats_won

from constituencywise_results as cr

join partywise_results as pr 

on cr.party_id = pr.party_id

join statewise_results as sr 

on cr.parliament_constituency = sr.parliament_constituency

join states as s 

on sr.state_id = s.state_id

where s.state = 'Andhra Pradesh'

group by 1

order by 2 desc;

**12. What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024?**

select  s.state as state_name,

sum(case when pr.party_alliance = 'NDA' then 1 else 0 end) as NDA_seats_won,

sum(case when pr.party_alliance = 'I.N.D.I.A' then 1 else 0 end) as INDIA_seats_won,

sum(case when pr.party_alliance = 'Others' then 1 else 0 end) as Others_seats_won

from constituencywise_results as cr

join partywise_results as pr 

on cr.party_id = pr.party_id

join statewise_results as sr 

on cr.parliament_constituency=sr.parliament_constituency

join states as s

on sr.state_id = s.state_id

where pr.party_alliance in('NDA','I.N.D.I.A','Others')

group by 1

order by 1;


**13. Which candidate received the highest number of EVM votes in each constituency (Top 10)?**

select cr.constituency_name, cd.constituency_id, cd.candidate, cd.evm_votes

from constituencywise_details as cd

join constituencywise_results as cr

on cd.constituency_id = cr.constituency_id

order by 4 desc

limit 10


**14. Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?**

with ranked_candidates as(

select  cd.constituency_id, cd.candidate, cd.party, cd.evm_votes, cd.postal_votes, cd.total_votes, rank()over(partition by cd.constituency_id order by cd.total_votes desc) as rank

from constituencywise_details as cd

join constituencywise_results as cr

on cd.constituency_id = cr.constituency_id

join statewise_results as sr 

on cr.parliament_constituency = sr.parliament_constituency

join states as s

on sr.state_id = s.state_id

where s.state = 'Maharashtra')

select cr.constituency_name,

max(case when rc.rank = 1 then rc.candidate end) as winning_candidate,

max(case when rc.rank = 2 then rc.candidate end) as runnerup_candidate

from ranked_candidates as rc

join constituencywise_results as cr

on rc.constituency_id= cr.constituency_id

group by 1

order by 1;

**15. For the state of Maharashtra, what are the total number of seats, total number of candidates, total number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal votes?**

select count(distinct cr.constituency_id) as total_seats, count(distinct cd.candidate) as total_candidates, count(distinct pr.party) as total_parties, sum(cd.evm_votes + cd.postal_votes) as total_votes, sum(cd.evm_votes) as total_evm_votes, sum(cd.postal_votes) as total_postal_votes

from constituencywise_results as cr

join constituencywise_details as cd

on cr.constituency_id = cd.constituency_id

join statewise_results as sr

on cr.parliament_constituency = sr.parliament_constituency

join states as s

on sr.state_id = s.state_id

join partywise_results as pr 

on cr.party_id = pr.party_id

where s.state = 'Maharashtra'

## Author - Antonio Reshme

This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!


