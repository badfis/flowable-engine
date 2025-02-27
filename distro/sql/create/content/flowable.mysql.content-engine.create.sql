
CREATE TABLE ACT_CO_DATABASECHANGELOGLOCK (ID INT NOT NULL, `LOCKED` BIT(1) NOT NULL, LOCKGRANTED datetime NULL, LOCKEDBY VARCHAR(255) NULL, CONSTRAINT PK_ACT_CO_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

DELETE FROM ACT_CO_DATABASECHANGELOGLOCK;

INSERT INTO ACT_CO_DATABASECHANGELOGLOCK (ID, `LOCKED`) VALUES (1, 0);

UPDATE ACT_CO_DATABASECHANGELOGLOCK SET `LOCKED` = 1, LOCKEDBY = '192.168.68.111 (192.168.68.111)', LOCKGRANTED = '2021-11-11 15:51:12.741' WHERE ID = 1 AND `LOCKED` = 0;

CREATE TABLE ACT_CO_DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, `DESCRIPTION` VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL, DEPLOYMENT_ID VARCHAR(10) NULL);

CREATE TABLE ACT_CO_CONTENT_ITEM (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NOT NULL, MIME_TYPE_ VARCHAR(255) NULL, TASK_ID_ VARCHAR(255) NULL, PROC_INST_ID_ VARCHAR(255) NULL, CONTENT_STORE_ID_ VARCHAR(255) NULL, CONTENT_STORE_NAME_ VARCHAR(255) NULL, FIELD_ VARCHAR(400) NULL, CONTENT_AVAILABLE_ BIT(1) DEFAULT 0 NULL, CREATED_ timestamp(6) NULL, CREATED_BY_ VARCHAR(255) NULL, LAST_MODIFIED_ timestamp(6) NULL, LAST_MODIFIED_BY_ VARCHAR(255) NULL, CONTENT_SIZE_ BIGINT DEFAULT 0 NULL, TENANT_ID_ VARCHAR(255) NULL, CONSTRAINT PK_ACT_CO_CONTENT_ITEM PRIMARY KEY (ID_));

CREATE INDEX idx_contitem_taskid ON ACT_CO_CONTENT_ITEM(TASK_ID_);

CREATE INDEX idx_contitem_procid ON ACT_CO_CONTENT_ITEM(PROC_INST_ID_);

INSERT INTO ACT_CO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'activiti', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', NOW(), 1, '8:7644d7165cfe799200a2abdd3419e8b6', 'createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM', '', 'EXECUTED', NULL, NULL, '4.3.5', '6642272805');

ALTER TABLE ACT_CO_CONTENT_ITEM ADD SCOPE_ID_ VARCHAR(255) NULL, ADD SCOPE_TYPE_ VARCHAR(255) NULL;

CREATE INDEX idx_contitem_scope ON ACT_CO_CONTENT_ITEM(SCOPE_ID_, SCOPE_TYPE_);

INSERT INTO ACT_CO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', NOW(), 2, '8:fe7b11ac7dbbf9c43006b23bbab60bab', 'addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM', '', 'EXECUTED', NULL, NULL, '4.3.5', '6642272805');

UPDATE ACT_CO_DATABASECHANGELOGLOCK SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

