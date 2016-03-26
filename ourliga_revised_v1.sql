/*
CREATEd		3/14/2016
Modified	3/25/2016
Project		OurLiga
Model		
Company		OurLiga
Author		Quijote, Galendez, Diana
VersiON		
Database	mySQL 5 
*/

DROP DATABASE IF EXISTS ourliga;
CREATE DATABASE ourliga;
USE ourliga;


DROP TABLE IF EXISTS gamedetails;
DROP TABLE IF EXISTS coach;
DROP TABLE IF EXISTS bracket;
DROP TABLE IF EXISTS league;
DROP TABLE IF EXISTS players_stats;
DROP TABLE IF EXISTS venue;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS user;


CREATE TABLE user (
	user_id INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(50) NOT NULL,
	password VARCHAR(50) NOT NULL,
 PRIMARY KEY (user_id)) ENGINE = InnoDB;

CREATE TABLE team (
	team_id INT NOT NULL AUTO_INCREMENT,
	league_id INT NOT NULL,
	bracket_id INT NOT NULL,
	coach_id INT NOT NULL,
	team_desc VARCHAR(200) NOT NULL,
	wins INT NOT NULL,
	losses INT NOT NULL,
 PRIMARY KEY (team_id,league_id,bracket_id)) ENGINE = InnoDB;

CREATE TABLE players (
	players_id INT NOT NULL AUTO_INCREMENT,
	team_id INT NOT NULL,
	players_fname VARCHAR(50) NOT NULL,
	players_mname VARCHAR(50) NOT NULL,
	players_lname VARCHAR(50) NOT NULL,
	positiON CHAR(20) NOT NULL,
	jersey_no INT NOT NULL,
 PRIMARY KEY (players_id,team_id)) ENGINE = InnoDB;

CREATE TABLE game (
	game_id INT NOT NULL AUTO_INCREMENT,
	team_home INT NOT NULL,
	team_away INT NOT NULL,
	venue_id INT NOT NULL,
	date_sched DATE NOT NULL,
	time_sched TIME NOT NULL,
 PRIMARY KEY (game_id,team_home,team_away,venue_id)) ENGINE = InnoDB;

CREATE TABLE venue (
	venue_id INT NOT NULL AUTO_INCREMENT,
	venue_desc VARCHAR(50) NOT NULL,
 PRIMARY KEY (venue_id)) ENGINE = InnoDB;

CREATE TABLE players_stats (
	players_stats_id INT NOT NULL AUTO_INCREMENT,
	game_id INT NOT NULL,
	players_id INT NOT NULL,
	points INT NOT NULL,
	rebounds INT NOT NULL,
	assists INT NOT NULL,
	steals INT NOT NULL,
	blocks INT NOT NULL,
	turnovers INT NOT NULL,
	2pt_made INT NOT NULL,
	2pt_attempts INT NOT NULL,
	3pt_made INT NOT NULL,
	3pt_attempts INT NOT NULL,
	ft_made INT NOT NULL,
	ft_attempts INT NOT NULL,
	fouls INT NOT NULL,
 PRIMARY KEY (players_stats_id,game_id,players_id)) ENGINE = InnoDB;

CREATE TABLE league (
	league_id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	league_desc VARCHAR(50) NOT NULL,
 PRIMARY KEY (league_id)) ENGINE = InnoDB;

CREATE TABLE bracket (
	bracket_id INT NOT NULL AUTO_INCREMENT,
	bracket_desc VARCHAR(50) NOT NULL,
 PRIMARY KEY (bracket_id)) ENGINE = InnoDB;

CREATE TABLE coach (
	coach_id INT NOT NULL AUTO_INCREMENT,
	coach_fname VARCHAR(50) NOT NULL,
	coach_mname VARCHAR(50) NOT NULL,
	coach_lname VARCHAR(50) NOT NULL,
 PRIMARY KEY (coach_id)) ENGINE = InnoDB;

CREATE TABLE gamedetails (
	gamedetails_id INT NOT NULL AUTO_INCREMENT,
	game_id INT NOT NULL,
	first_quarter_score_home INT NOT NULL,
	first_quarter_score_away INT NOT NULL,
	secONd_quarter_score_home INT NOT NULL,
	secONd_quarter_score_away INT NOT NULL,
	third_quarter_score_home INT NOT NULL,
	third_quarter_score_away INT NOT NULL,
	fourth_quarter_score_home INT NOT NULL,
	fourth_quarter_score_away INT NOT NULL,
	final_score_home INT NOT NULL,
	final_score_away INT NOT NULL,
	winner VARCHAR(50) NOT NULL,
	loser VARCHAR(50) NOT NULL,
 PRIMARY KEY (gamedetails_id,game_id)) ENGINE = InnoDB;


ALTER TABLE game ADD FOREIGN KEY (team_away) REFERENCES team (team_id) ON DELETE  restrict ON UPDATE  restrict;
ALTER TABLE game ADD FOREIGN KEY (team_home) REFERENCES team (team_id) ON DELETE  restrict ON UPDATE  restrict;



