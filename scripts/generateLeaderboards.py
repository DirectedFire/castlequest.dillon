import psycopg2

con = psycopg2.connect(
    host='localhost',
    database='castlequest',
    user='castlequest',
    password='HudenBurger23')

#Hey I have no idea how you made your leaderboards!
#But update them using SQL!

#leaderboards are selected by xp totals and will update every night at midnight.