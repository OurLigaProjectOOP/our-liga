/*
Created		3/14/2016
Modified		3/23/2016
Project		our-liga - Online Basketball League Creator
Model		
Company		our-liga
Author		our-liga (Galendez, Quijote, Diana)
Version		
Database		mySQL 5 
*/

DROP DATABASE IF EXISTS ourliga;
CREATE DATABASE ourliga;

USE ourliga;

DROP TABLE IF EXISTS coach;
DROP TABLE IF EXISTS bracket;
DROP TABLE IF EXISTS league;
DROP TABLE IF EXISTS players_stats;
DROP TABLE IF EXISTS scores;
DROP TABLE IF EXISTS venue;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS user;


CREATE TABLE user (
	user_id INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(20) NOT NULL,
	password VARCHAR(20) NOT NULL,
 PRIMARY KEY (user_id)) ENGINE = InnoDB;

CREATE TABLE team (
	team_id INT NOT NULL,
	league_id INT NOT NULL,
	bracket_id CHAR(20) NOT NULL,
	coach_id INT NOT NULL,
	description VARCHAR(50) NOT NULL,
	wins INT NOT NULL,
	loss INT NOT NULL,
 PRIMARY KEY (team_id,league_id)) ENGINE = InnoDB;

CREATE TABLE players (
	players_id INT NOT NULL AUTO_INCREMENT,
	team_id INT NOT NULL,
	players_fname CHAR(20) NOT NULL,
	players_lname CHAR(20) NOT NULL,
	jersey_no INT NOT NULL,
 PRIMARY KEY (players_id,team_id)) ENGINE = InnoDB;

CREATE TABLE game (
	game_id INT NOT NULL AUTO_INCREMENT,
	team_id INT NOT NULL,
	venue_id INT NOT NULL,
	date_sched DATE NOT NULL,
	time_sched TIME NOT NULL,
 PRIMARY KEY (game_id,team_id,venue_id)) ENGINE = InnoDB;

CREATE TABLE venue (
	venue_id INT NOT NULL AUTO_INCREMENT,
	description CHAR(20) NOT NULL,
 PRIMARY KEY (venue_id)) ENGINE = MyISAM;

CREATE TABLE scores (
	scores_id INT NOT NULL AUTO_INCREMENT,
	game_id INT NOT NULL,
	score INT NOT NULL,
	result Char(20) NOT NULL,
 PRIMARY KEY (scores_id,game_id)) ENGINE = InnoDB;

CREATE TABLE players_stats (
	players_stats_id INT NOT NULL AUTO_INCREMENT,
	game_id INT NOT NULL,
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
 PRIMARY KEY (players_stats_id,game_id)) ENGINE = InnoDB;

CREATE TABLE league (
	league_id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	description INT NOT NULL,
 PRIMARY KEY (league_id,user_id)) ENGINE = InnoDB;

CREATE TABLE bracket (
	bracket_id INT NOT NULL AUTO_INCREMENT,
	description CHAR(20) NOT NULL,
 PRIMARY KEY (bracket_id)) ENGINE = InnoDB;

CREATE TABLE coach (
	coach_id INT NOT NULL AUTO_INCREMENT,
	coach_fname CHAR(20) NOT NULL,
	coach_lname CHAR(20) NOT NULL,
 PRIMARY KEY (coach_id)) ENGINE = InnoDB;


