CREATE DATABASE PROJECTMANAGER;

drop table tasks;
drop table parent_tasks;
drop table projects;
drop table users;

CREATE TABLE tasks (
  task_id bigint(10) NOT NULL AUTO_INCREMENT,
  task_name varchar(50) DEFAULT NULL,
  parent_task_id bigint(10) DEFAULT NULL,
  employee_id varchar(6) NOT NULL,
  start_date varchar(10) DEFAULT NULL,
  end_date varchar(10) DEFAULT NULL,
  priority varchar(2) DEFAULT NULL,
  status varchar(1) DEFAULT NULL,
  project_id bigint(10) NOT NULL,
  PRIMARY KEY (task_id),
  KEY FK_TASKS_PT (parent_task_id),
  KEY FK_TASKS_EI (employee_id),
  KEY FK_TASKS_PI (project_id),
  CONSTRAINT FK_TASKS_EI FOREIGN KEY (employee_id) REFERENCES users (employee_id),
  CONSTRAINT FK_TASKS_PI FOREIGN KEY (project_id) REFERENCES projects (project_id),
  CONSTRAINT FK_TASKS_PT FOREIGN KEY (parent_task_id) REFERENCES parent_tasks (parent_task_id)
)

CREATE TABLE projects (
  project_id bigint(10) NOT NULL AUTO_INCREMENT,
  project_name varchar(50) DEFAULT NULL,
  start_date varchar(10) DEFAULT NULL,
  end_date varchar(10) DEFAULT NULL,
  priority varchar(2) DEFAULT NULL,
  status varchar(15) DEFAULT NULL,
  manager_id varchar(6) NOT NULL,
  PRIMARY KEY (project_id),
  KEY FK_PROJECTS_MANAGER_ID (manager_id),
  CONSTRAINT FK_PROJECTS_MANAGER_ID FOREIGN KEY (manager_id) REFERENCES users (employee_id)
)


CREATE TABLE parent_tasks (
  parent_task_id bigint(10) NOT NULL AUTO_INCREMENT,
  parent_task_name varchar(50) DEFAULT NULL,
  project_id bigint(10) NOT NULL,
  PRIMARY KEY (parent_task_id),
  KEY FK_PARENT_TASKS (project_id),
  CONSTRAINT FK_PARENT_TASKS FOREIGN KEY (project_id) REFERENCES projects (project_id)
)


CREATE TABLE users (
  employee_id varchar(6) NOT NULL,
  first_name varchar(50) DEFAULT NULL,
  last_name varchar(50) DEFAULT NULL,
  status varchar(1) DEFAULT NULL,
  PRIMARY KEY (employee_id)
)
