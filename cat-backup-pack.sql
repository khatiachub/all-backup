prompt PL/SQL Developer Export User Objects for user KHATIA@ORCL
prompt Created by xatia on Saturday, March 22, 2025
set define off
spool cat-backup-pack.log

prompt
prompt Creating table ADMIN_QUESTIONS
prompt ==============================
prompt
create table KHATIA.ADMIN_QUESTIONS
(
  id       NUMBER generated always as identity,
  question VARCHAR2(500),
  answer   VARCHAR2(500),
  required NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.ADMIN_QUESTIONS
  add constraint PK_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CATEGORIES
prompt =========================
prompt
create table KHATIA.CATEGORIES
(
  category_name VARCHAR2(100),
  id            NUMBER generated always as identity
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.CATEGORIES
  add constraint PK_CATEGORIES_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CATEGORY_1ST_CHILD
prompt =================================
prompt
create table KHATIA.CATEGORY_1ST_CHILD
(
  id               NUMBER generated always as identity,
  category_id      NUMBER,
  first_child_name VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.CATEGORY_1ST_CHILD
  add constraint PK_CATEGORY_CHILD_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.CATEGORY_1ST_CHILD
  add constraint FK_CATEGORY_ID foreign key (CATEGORY_ID)
  references KHATIA.CATEGORIES (ID);

prompt
prompt Creating table CATEGORIES_PRODUCT
prompt =================================
prompt
create table KHATIA.CATEGORIES_PRODUCT
(
  product_name VARCHAR2(200),
  price        NUMBER,
  id           NUMBER generated always as identity,
  category_id  NUMBER,
  contact      NUMBER,
  image_path   VARCHAR2(4000),
  vaucher      NUMBER,
  sale         NUMBER,
  title        VARCHAR2(500),
  location     VARCHAR2(100),
  guests       VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.CATEGORIES_PRODUCT
  add constraint PK_3ST_CHILD_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.CATEGORIES_PRODUCT
  add constraint FK_CATEGORYY_ID foreign key (CATEGORY_ID)
  references KHATIA.CATEGORY_1ST_CHILD (ID);

prompt
prompt Creating table KHATIA_ROLES
prompt ===========================
prompt
create table KHATIA.KHATIA_ROLES
(
  id   NUMBER generated always as identity,
  role VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.KHATIA_ROLES
  add constraint PK_ROLE_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REGISTER
prompt =======================
prompt
create table KHATIA.REGISTER
(
  name     VARCHAR2(100),
  lastname VARCHAR2(100),
  email    VARCHAR2(100),
  password VARCHAR2(100),
  id       NUMBER generated always as identity,
  role_id  NUMBER,
  mobile   NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.REGISTER
  add constraint PK_REG_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.REGISTER
  add constraint FK_RL_ID foreign key (ROLE_ID)
  references KHATIA.KHATIA_ROLES (ID);

prompt
prompt Creating table BASKET
prompt =====================
prompt
create table KHATIA.BASKET
(
  id         NUMBER generated always as identity,
  product_id NUMBER,
  user_id    NUMBER,
  quantity   NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.BASKET
  add constraint PK_BASKET_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.BASKET
  add constraint FK_PRODUCT_ID foreign key (PRODUCT_ID)
  references KHATIA.CATEGORIES_PRODUCT (ID);
alter table KHATIA.BASKET
  add constraint FK_USERS_ID foreign key (USER_ID)
  references KHATIA.REGISTER (ID);

prompt
prompt Creating table CART
prompt ===================
prompt
create table KHATIA.CART
(
  quantity   NUMBER,
  sum_price  NUMBER,
  id         NUMBER generated always as identity,
  product_id NUMBER,
  user_id    NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.CART
  add constraint PK_PR_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.CART
  add constraint FK_USER_ID foreign key (USER_ID)
  references KHATIA.REGISTER (ID);

prompt
prompt Creating table CLIENTS
prompt ======================
prompt
create table KHATIA.CLIENTS
(
  id          NUMBER generated always as identity,
  name        VARCHAR2(100),
  address     VARCHAR2(100),
  create_date DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.CLIENTS
  add constraint PK_CLIENT_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table EMPLOYEES
prompt ========================
prompt
create table KHATIA.EMPLOYEES
(
  id       NUMBER generated always as identity,
  employee VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.EMPLOYEES
  add constraint PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table GUEST_NUMBER
prompt ===========================
prompt
create table KHATIA.GUEST_NUMBER
(
  id           NUMBER generated always as identity,
  guest_number VARCHAR2(100),
  category_id  NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.GUEST_NUMBER
  add constraint PK_GUEST_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.GUEST_NUMBER
  add constraint FK_CATE_ID foreign key (CATEGORY_ID)
  references KHATIA.CATEGORIES (ID);

prompt
prompt Creating table TASK_PRODUCTS
prompt ============================
prompt
create table KHATIA.TASK_PRODUCTS
(
  product VARCHAR2(100),
  price   NUMBER,
  id      NUMBER generated always as identity
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.TASK_PRODUCTS
  add constraint PK_PRO_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table INVENTORIES
prompt ==========================
prompt
create table KHATIA.INVENTORIES
(
  id          NUMBER generated always as identity,
  product_id  NUMBER,
  balance     NUMBER,
  create_date DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.INVENTORIES
  add constraint PK_INV_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.INVENTORIES
  add constraint FK_PROD_ID foreign key (PRODUCT_ID)
  references KHATIA.TASK_PRODUCTS (ID);

prompt
prompt Creating table KHATIA_COMPANY
prompt =============================
prompt
create table KHATIA.KHATIA_COMPANY
(
  company_name VARCHAR2(100),
  address      VARCHAR2(100),
  email        VARCHAR2(100),
  mobile       NUMBER,
  name         VARCHAR2(100),
  lastname     VARCHAR2(100),
  username     VARCHAR2(100),
  password     VARCHAR2(100),
  id           NUMBER generated always as identity,
  role_id      NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.KHATIA_COMPANY
  add constraint PK_COMPANY_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table KHATIA_QUEST_ADMIN
prompt =================================
prompt
create table KHATIA.KHATIA_QUEST_ADMIN
(
  name     VARCHAR2(100),
  username VARCHAR2(100),
  password VARCHAR2(100),
  id       NUMBER generated always as identity
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.KHATIA_QUEST_ADMIN
  add constraint PK_ADMIN_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table KHATIA_USERS
prompt ===========================
prompt
create table KHATIA.KHATIA_USERS
(
  name         VARCHAR2(100),
  lastname     VARCHAR2(100),
  username     VARCHAR2(100),
  mobile       NUMBER,
  password     VARCHAR2(100),
  id           NUMBER generated always as identity,
  role_id      NUMBER,
  warehouse_id NUMBER,
  company_id   NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.KHATIA_USERS
  add constraint PK_USER_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table KHATIA_WAREHOUSE
prompt ===============================
prompt
create table KHATIA.KHATIA_WAREHOUSE
(
  id         NUMBER generated always as identity,
  warehouse  VARCHAR2(100),
  company_id NUMBER,
  address    VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.KHATIA_WAREHOUSE
  add constraint PK_WAREHOUS_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.KHATIA_WAREHOUSE
  add constraint FK_COMPANY_ID foreign key (COMPANY_ID)
  references KHATIA.KHATIA_COMPANY (ID);

prompt
prompt Creating table KHATIA_WAREHOUSE_EXCHANGES
prompt =========================================
prompt
create table KHATIA.KHATIA_WAREHOUSE_EXCHANGES
(
  barcode        VARCHAR2(50),
  product_name   VARCHAR2(100),
  quantity       NUMBER,
  entry_date     VARCHAR2(20),
  exit_date      VARCHAR2(20),
  operator_id    NUMBER,
  id             NUMBER generated always as identity,
  warehouse_name VARCHAR2(100),
  unit           VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.KHATIA_WAREHOUSE_EXCHANGES
  add constraint PK_EXCH_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.KHATIA_WAREHOUSE_EXCHANGES
  add constraint FK_OPERATOR_ID foreign key (OPERATOR_ID)
  references KHATIA.KHATIA_USERS (ID);

prompt
prompt Creating table LOCATION
prompt =======================
prompt
create table KHATIA.LOCATION
(
  location    VARCHAR2(100),
  id          NUMBER generated always as identity,
  category_id NUMBER,
  maincat_id  NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.LOCATION
  add constraint PK_LOC_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.LOCATION
  add constraint FK_CATEG_ID foreign key (CATEGORY_ID)
  references KHATIA.CATEGORY_1ST_CHILD (ID);
alter table KHATIA.LOCATION
  add constraint FK_MAIN_CAT_ID foreign key (MAINCAT_ID)
  references KHATIA.CATEGORIES (ID);

prompt
prompt Creating table ORDERS
prompt =====================
prompt
create table KHATIA.ORDERS
(
  id          NUMBER generated always as identity,
  cart_id     NUMBER,
  address     VARCHAR2(100),
  total_price NUMBER,
  user_id     NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table KHATIA.ORDERS
  add constraint PK_ORD_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table KHATIA.ORDERS
  add constraint FK_CART_ID foreign key (CART_ID)
  references KHATIA.CART (ID);
alter table KHATIA.ORDERS
  add constraint FK_US_ID foreign key (USER_ID)
  references KHATIA.REGISTER (ID);

prompt
prompt Creating table PRODUCT_DETAILS
prompt ==============================
prompt
create table KHATIA.PRODUCT_DETAILS
(
  id            NUMBER generated always as identity,
  description   VARCHAR2(4000),
  product_id    NUMBER,
  offerin       VARCHAR2(4000),
  pricein       VARCHAR2(4000),
  menu          VARCHAR2(4000),
  womenzone     VARCHAR2(4000),
  menzone       VARCHAR2(4000),
  clinicconcept VARCHAR2(4000),
  addinfo       VARCHAR2(4000),
  athotel       VARCHAR2(4000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.PRODUCT_DETAILS
  add constraint PK_DETAILS_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.PRODUCT_DETAILS
  add constraint PRODUCT_ID foreign key (PRODUCT_ID)
  references KHATIA.CATEGORIES_PRODUCT (ID);

prompt
prompt Creating table RELATED_TYPES
prompt ============================
prompt
create table KHATIA.RELATED_TYPES
(
  type VARCHAR2(100),
  id   NUMBER generated always as identity
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table KHATIA.RELATED_TYPES
  add constraint PK_TYPE_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ROLES
prompt ====================
prompt
create table KHATIA.ROLES
(
  role VARCHAR2(100),
  id   NUMBER generated always as identity
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.ROLES
  add constraint PK_ROLL_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STATUS
prompt =====================
prompt
create table KHATIA.STATUS
(
  id     NUMBER generated always as identity,
  status VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.STATUS
  add constraint PK_STATUS_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TASKS
prompt ====================
prompt
create table KHATIA.TASKS
(
  id          NUMBER generated always as identity,
  task        VARCHAR2(100),
  employee_id NUMBER,
  status_id   NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.TASKS
  add constraint PK_TASK_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.TASKS
  add constraint FK_EMPLOYEE_ID foreign key (EMPLOYEE_ID)
  references KHATIA.EMPLOYEES (ID);
alter table KHATIA.TASKS
  add constraint FK_STATUS_ID foreign key (STATUS_ID)
  references KHATIA.STATUS (ID);

prompt
prompt Creating table TASK_EMPLOYEES
prompt =============================
prompt
create table KHATIA.TASK_EMPLOYEES
(
  id       NUMBER generated always as identity,
  name     VARCHAR2(100),
  lastname VARCHAR2(100),
  age      NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.TASK_EMPLOYEES
  add constraint PK_EMPLOYEE_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TASK_STATUS
prompt ==========================
prompt
create table KHATIA.TASK_STATUS
(
  id     NUMBER generated always as identity,
  status VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.TASK_STATUS
  add constraint PK_STAT_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TASK_ORDERS
prompt ==========================
prompt
create table KHATIA.TASK_ORDERS
(
  id          NUMBER generated always as identity,
  client_id   NUMBER,
  quantity    NUMBER,
  order_date  DATE,
  status_id   NUMBER default 1,
  employee_id NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.TASK_ORDERS
  add constraint PK_OR_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.TASK_ORDERS
  add constraint FK_CLIENT_ID foreign key (CLIENT_ID)
  references KHATIA.CLIENTS (ID);
alter table KHATIA.TASK_ORDERS
  add constraint FK_EMPLOYE_ID foreign key (EMPLOYEE_ID)
  references KHATIA.TASK_EMPLOYEES (ID);
alter table KHATIA.TASK_ORDERS
  add constraint FK_STATU_ID foreign key (STATUS_ID)
  references KHATIA.TASK_STATUS (ID);

prompt
prompt Creating table TASK_ORDER_DETAILS
prompt =================================
prompt
create table KHATIA.TASK_ORDER_DETAILS
(
  id         NUMBER generated always as identity,
  order_id   NUMBER,
  product_id NUMBER,
  quantity   NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.TASK_ORDER_DETAILS
  add constraint PK_ORDD_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.TASK_ORDER_DETAILS
  add constraint FK_ORDD_ID foreign key (ORDER_ID)
  references KHATIA.TASK_ORDERS (ID);
alter table KHATIA.TASK_ORDER_DETAILS
  add constraint FK_PRO_ID foreign key (PRODUCT_ID)
  references KHATIA.TASK_PRODUCTS (ID);

prompt
prompt Creating table USERS
prompt ====================
prompt
create table KHATIA.USERS
(
  fullname VARCHAR2(100),
  email    VARCHAR2(100),
  mobile   NUMBER,
  id       NUMBER generated always as identity,
  password VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.USERS
  add constraint PK_USERS_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USER_ANSWERS
prompt ===========================
prompt
create table KHATIA.USER_ANSWERS
(
  id          NUMBER generated always as identity,
  question_id NUMBER,
  fullname    VARCHAR2(100),
  answer      VARCHAR2(500)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.USER_ANSWERS
  add constraint PK_QU_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KHATIA.USER_ANSWERS
  add constraint FK_QUESTION_ID foreign key (QUESTION_ID)
  references KHATIA.ADMIN_QUESTIONS (ID);

prompt
prompt Creating view TASKS_VIEW
prompt ========================
prompt
create or replace force view khatia.tasks_view as
select c.name, count(*) as cnt
  from clients c
 inner join task_orders o
    on c.id = o.client_id
 group by c.name;

prompt
prompt Creating package PKG_ADD_QUESTIONS_ADMIN
prompt ========================================
prompt
create or replace package khatia.pkg_add_questions_admin is

  procedure proc_add_questions(p_question varchar2,
                               p_answer   varchar2,
                               p_required number);
  procedure proc_add_answers(p_json clob);
  PROCEDURE proc_get_answers(p_id number, p_user_curs OUT SYS_REFCURSOR);
  PROCEDURE proc_get_users(p_user_curs OUT SYS_REFCURSOR);
  PROCEDURE proc_update_question(p_id       IN NUMBER,
                                 p_question IN VARCHAR2,
                                 p_answer   IN VARCHAR2,
                                 p_required IN number);
  PROCEDURE proc_get_questions(p_user_curs OUT SYS_REFCURSOR);
  PROCEDURE proc_get_question(p_id number, p_quest_curs OUT SYS_REFCURSOR);
  PROCEDURE proc_register_admin(p_name     IN VARCHAR2,
                                p_username IN VARCHAR2,
                                p_password IN VARCHAR2);
  PROCEDURE proc_login_admin(p_username  IN VARCHAR2,
                             p_user_curs OUT SYS_REFCURSOR);
  PROCEDURE proc_get_user_info(p_username  IN VARCHAR2,
                               p_user_curs OUT SYS_REFCURSOR);
end pkg_add_questions_admin;
/

prompt
prompt Creating package PKG_CATEGORIES_OPERATIONS
prompt ==========================================
prompt
create or replace package khatia.pkg_categories_operations is
  PROCEDURE proc_user_roles(p_role varchar2);
  procedure proc_add_categories(p_category_name varchar2);
  procedure proc_add_1st_child(p_first_child_name varchar2,
                               p_category_id      number);
  PROCEDURE proc_add_product(p_product_name  NVARCHAR2,
                             p_category_id   NUMBER,
                             p_price         NUMBER,
                             p_contact       NUMBER,
                             p_json          CLOB,
                             p_vaucher       NUMBER,
                             p_sale          NUMBER,
                             p_title         NVARCHAR2,
                             p_location      VARCHAR2,
                             p_guests        VARCHAR2,
                             p_description   VARCHAR2,
                             p_offerin       VARCHAR2,
                             p_pricein       NUMBER,
                             p_menu          VARCHAR2,
                             p_womenzon      VARCHAR2,
                             p_menzone       VARCHAR2,
                             p_clinicconcept VARCHAR2,
                             p_addinfo       VARCHAR2,
                             p_athotel       varchar2);

  procedure proc_get_all_categories(p_category_curs OUT SYS_REFCURSOR);
  procedure proc_get_filtered_categories(p_category_id   number,
                                         p_category_name varchar2,
                                         p_category_curs OUT SYS_REFCURSOR);
  procedure proc_get_1stchild_categories(p_category_id   number,
                                         p_category_curs OUT SYS_REFCURSOR);
  procedure proc_get_all_products(p_id            number,
                                  p_category_curs OUT SYS_REFCURSOR);

  procedure proc_addto_cart(p_user_id number, p_product_id number);
  procedure proc_get_cart(p_user_id number, p_cart_curs OUT SYS_REFCURSOR);
  procedure proc_add_user(p_name     varchar2,
                          p_lastname varchar2,
                          p_email    varchar2,
                          p_password varchar2,
                          p_mobile   number,
                          p_role_id  IN NUMBER);

  procedure proc_add_order(p_json    CLOB,
                           p_address varchar2,
                           p_user_id number);
  PROCEDURE proc_login_user(p_email     IN VARCHAR2,
                            p_user_curs OUT SYS_REFCURSOR);
  PROCEDURE proc_get_user_info(p_email     IN VARCHAR2,
                               p_user_curs OUT SYS_REFCURSOR);
  PROCEDURE proc_get_locations(p_maincat_id  number,
                               p_category_id number,
                               
                               p_loc_curs OUT SYS_REFCURSOR);
  PROCEDURE proc_get_guestnumber(p_guest_curs  OUT SYS_REFCURSOR,
                                 p_category_id number);
  procedure proc_add_locations(p_category_id number,
                               p_maincat_id  number,
                               p_location    varchar2);
  procedure proc_add_to_basket(p_product_id number,
                               p_user_id    number,
                               p_quantity   number);
  procedure proc_get_basket(p_user_id     number,
                            p_basket_curs OUT SYS_REFCURSOR);
  procedure proc_delete_from_cart(p_user_id number, p_product_id number);
  procedure proc_update_basket(p_user_id    number,
                               p_product_id number,
                               p_quantity   number);
  procedure proc_add_guest_number(p_guest_number varchar2,
                                  p_category_id  number);
  procedure proc_get_products(p_product_curs OUT SYS_REFCURSOR);
  procedure proc_get_searched_products(p_product_name varchar2,
                                       p_product_curs OUT SYS_REFCURSOR);
  procedure proc_get_user(p_user_id number, p_user_curs OUT SYS_REFCURSOR);
  procedure proc_update_user(p_user_id  number,
                             p_name     varchar2,
                             p_lastname varchar2,
                             p_email    varchar2,
                             p_mobile   varchar2);
end pkg_categories_operations;
/

prompt
prompt Creating package PKG_COMPANY_OPERATIONS
prompt =======================================
prompt
create or replace package khatia.pkg_company_operations is
  procedure proc_register_company(p_company_name IN VARCHAR2,
                                  p_address      IN VARCHAR2,
                                  p_mobile       IN NUMBER,
                                  p_password     IN VARCHAR2,
                                  p_name         IN VARCHAR2,
                                  p_lastname     IN VARCHAR2,
                                  p_username     IN VARCHAR2,
                                  p_email        IN VARCHAR2,
                                  p_role_id      IN NUMBER);
  procedure proc_register_warehouse(p_warehouse  varchar2,
                                    p_company_id number);
end pkg_company_operations;
/

prompt
prompt Creating package PKG_EMPLOYEES
prompt ==============================
prompt
create or replace package khatia.pkg_employees is
  procedure proc_update_status(p_id number);
  procedure proc_add_status(p_status varchar2);
  procedure proc_add_task(p_task varchar2);
  procedure proc_employee(p_employee varchar2);
  procedure proc_get_tasks(p_task_curs OUT SYS_REFCURSOR);
end pkg_employees;
/

prompt
prompt Creating package PKG_TASKS_ORDERS
prompt =================================
prompt
create or replace package khatia.pkg_tasks_orders is

  procedure proc_add_order(p_client_id     number,
                           p_json_id       CLOB,
                           p_json_quantity CLOB,
                           p_order_date    date);
  procedure proc_get_order(p_order_curs OUT SYS_REFCURSOR);
  procedure proc_add_inventories(p_product_id  number,
                                 p_balance     number,
                                 p_create_date date);
  procedure proc_get_order_details(p_order_curs         OUT SYS_REFCURSOR,
                                   p_min_date_curs      OUT SYS_REFCURSOR,
                                   p_max_date_curs      OUT SYS_REFCURSOR,
                                   p_total_price_curs   OUT SYS_REFCURSOR,
                                   p_between_dates_curs OUT SYS_REFCURSOR,
                                   p_avg_curs           OUT SYS_REFCURSOR);
  procedure proc_get_balance(p_balance_curs OUT SYS_REFCURSOR,
                             p_status_curs  OUT SYS_REFCURSOR);
  procedure proc_employee_order(p_employee_id number,
                                p_order_id    number,
                                p_status_id   number);
  procedure proc_get_emp_order(p_order_cur      out sys_refcursor,
                               p_non_order_curs out sys_refcursor);
end pkg_tasks_orders;
/

prompt
prompt Creating package PKG_USERS_OPERATIONS
prompt =====================================
prompt
create or replace package khatia.pkg_users_operations is

  PROCEDURE proc_register_user(p_name         IN VARCHAR2,
                               p_lastname     IN VARCHAR2,
                               p_username     IN VARCHAR2,
                               p_mobile       IN NUMBER,
                               p_password     IN VARCHAR2,
                               p_role_id      IN NUMBER,
                               p_company_id   IN NUMBER,
                               p_warehouse_id IN NUMBER DEFAULT NULL);
  PROCEDURE proc_user_roles(p_role varchar2);

  PROCEDURE proc_login_user(p_username  IN VARCHAR2,
                            p_user_curs OUT SYS_REFCURSOR);
  PROCEDURE proc_get_users(p_id in number, p_user_curs OUT SYS_REFCURSOR);
  PROCEDURE proc_update_user(p_id       IN NUMBER,
                             p_name     IN VARCHAR2,
                             p_lastname IN VARCHAR2,
                             p_username IN VARCHAR2,
                             p_mobile   IN NUMBER,
                             p_role_id  IN VARCHAR2);
  PROCEDURE proc_get_user_info(p_username  IN VARCHAR2,
                               p_user_curs OUT SYS_REFCURSOR);
end pkg_users_operations;
/

prompt
prompt Creating package PKG_WAREHOUSE_PRODUCT_MANAGMENT
prompt ================================================
prompt
create or replace package khatia.pkg_warehouse_product_managment is
  procedure proc_entry_products(p_barcode        varchar2,
                                p_product_name   varchar2,
                                p_quantity       number,
                                p_entry_date     varchar2,
                                p_operator_id    number,
                                p_warehouse_name varchar2);
  procedure proc_exit_products(p_barcode      varchar2,
                               p_product_name varchar2,
                               
                               p_quantity       number,
                               p_exit_date      varchar2,
                               p_operator_id    number,
                               p_warehouse_name varchar2,
                               p_unit           varchar2);

  procedure proc_get_all_entry_products(p_company_id   number,
                                        p_product_curs OUT SYS_REFCURSOR);
  procedure proc_get_entry_product(p_id           number,
                                   p_product_curs OUT SYS_REFCURSOR);
  procedure proc_update_entry_product(p_barcode      varchar2,
                                      p_product_name varchar2,
                                      p_quantity     number,
                                      p_entry_date   varchar2,
                                      p_id           varchar2);
  procedure proc_get_all_exit_products(p_company_id   number,
                                       p_product_curs out sys_refcursor);
  procedure proc_get_exit_product(p_id           number,
                                  p_product_curs out sys_refcursor);
  procedure proc_update_exit_product(p_barcode      varchar2,
                                     p_product_name varchar2,
                                     p_quantity     number,
                                     p_exit_date    varchar2,
                                     p_id           varchar2,
                                     p_unit         varchar2);
  procedure proc_get_current_balance_forall(p_company_id   number,
                                            p_balance_curs OUT SYS_REFCURSOR);
  procedure proc_get_current_balance(p_id           number,
                                     p_balance_curs OUT SYS_REFCURSOR);

  procedure proc_add_warehouse(p_warehouse  varchar2,
                               p_company_id number,
                               p_address    varchar2);
  procedure proc_get_warehouses(p_company_id     number,
                                p_warehouse_curs out sys_refcursor);
  procedure proc_update_warehouses(p_id        number,
                                   p_warehouse varchar2,
                                   p_address   varchar2);
  procedure proc_get_company_warehouse(p_id             number,
                                       p_warehouse_curs out sys_refcursor);
end pkg_warehouse_product_managment;
/

prompt
prompt Creating type LOCATIONIDSTYPE
prompt =============================
prompt
CREATE OR REPLACE TYPE KHATIA.LocationIdsType IS TABLE OF NUMBER;
/

prompt
prompt Creating procedure TEST_PROC_ADD_ORDER
prompt ======================================
prompt
CREATE OR REPLACE PROCEDURE KHATIA.test_proc_add_order AS
  l_json CLOB;
BEGIN
  -- JSON array of product IDs
  l_json := '[1,2]';

  -- Call proc_add_order with test values.
  pkg_tasks_orders.proc_add_order(
    p_client_id   => 1,       -- Sample client ID
    p_json        => l_json,   -- JSON array containing product IDs
    p_quantity    => 5,        -- Sample quantity
    p_total_price => 100,      -- Sample total price
    p_order_date  => TO_DATE('25-03-2025', 'DD-MM-YYYY')   -- Current date as order date
  );
  
  COMMIT;  -- In case proc_add_order does not commit internally

 
END test_proc_add_order;
/

prompt
prompt Creating package body PKG_ADD_QUESTIONS_ADMIN
prompt =============================================
prompt
create or replace package body khatia.pkg_add_questions_admin is

  procedure proc_add_questions(p_question varchar2,
                               p_answer   varchar2,
                               p_required number) as
  begin
    insert into admin_questions
      (question, answer, required)
    values
      (p_question, p_answer, p_required);
  end proc_add_questions;

  procedure proc_add_answers(p_json clob) as
    cursor v_add_questions_curs is
      select *
        from json_table(p_json,
                        '$[*]'
                        columns(question_id number path '$.question_id',
                                fullname varchar2 path '$.fullname',
                                answer varchar2 path '$.answer'));
  begin
    for answer in v_add_questions_curs loop
      insert into user_answers
        (question_id, fullname, answer)
      values
        (answer.question_id, answer.fullname, answer.answer);
    end loop;
  end;

  PROCEDURE proc_get_users(p_user_curs OUT SYS_REFCURSOR) as
  begin
    open p_user_curs for
      select u.fullname, u.id from user_answers u;
  end proc_get_users;
  PROCEDURE proc_get_question(p_id number, p_quest_curs OUT SYS_REFCURSOR) as
  begin
    open p_quest_curs for
      select q.question, q.id, q.answer, q.required
        from admin_questions q
       where p_id = q.id;
  end proc_get_question;

  PROCEDURE proc_get_questions(p_user_curs OUT SYS_REFCURSOR) as
  begin
    open p_user_curs for
      select u.id, u.question, u.answer, u.required from admin_questions u;
  end proc_get_questions;

  PROCEDURE proc_get_answers(p_id number, p_user_curs OUT SYS_REFCURSOR) as
  begin
    open p_user_curs for
      select u.fullname, a.question, u.answer
        from user_answers u
       inner join admin_questions a
          on a.id = u.question_id
       where u.id = p_id;
  end proc_get_answers;

  PROCEDURE proc_update_question(p_id       IN NUMBER,
                                 p_question IN VARCHAR2,
                                 p_answer   IN VARCHAR2,
                                 p_required IN number) IS
  BEGIN
    UPDATE admin_questions
       SET question = p_question, answer = p_answer, required = p_required
     WHERE id = p_id;
  END proc_update_question;

  PROCEDURE proc_register_admin(p_name     IN VARCHAR2,
                                p_username IN VARCHAR2,
                                p_password IN VARCHAR2) IS
    v_count NUMBER;
  begin
    SELECT COUNT(*)
      INTO v_count
      FROM khatia_quest_admin
     WHERE username = p_username;
    IF v_count > 0 THEN
      RAISE_APPLICATION_ERROR(-20001,
                              'User with the same username or mobile already exists.');
    ELSE
      INSERT INTO khatia_quest_admin
        (name, username, password)
      VALUES
        (p_name, p_username, p_password);
    end if;
  end proc_register_admin;

  PROCEDURE proc_login_admin(p_username  IN VARCHAR2,
                             p_user_curs OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN p_user_curs FOR
      SELECT u.password
        FROM khatia_quest_admin u
       WHERE u.username = p_username;
  END proc_login_admin;

  PROCEDURE proc_get_user_info(p_username  IN VARCHAR2,
                               p_user_curs OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN p_user_curs FOR
      SELECT u.username, u.name
        FROM khatia_quest_admin u
       WHERE u.username = p_username;
  END proc_get_user_info;
end pkg_add_questions_admin;
/

prompt
prompt Creating package body PKG_CATEGORIES_OPERATIONS
prompt ===============================================
prompt
create or replace package body khatia.pkg_categories_operations is

  PROCEDURE proc_user_roles(p_role varchar2) as
  begin
    insert into roles (role) values (p_role);
  end proc_user_roles;
  procedure proc_add_categories(p_category_name varchar2) as
  begin
    insert into categories (category_name) values (p_category_name);
  end proc_add_categories;

  procedure proc_add_1st_child(p_first_child_name varchar2,
                               p_category_id      number) as
  begin
    insert into category_1st_child
      (first_child_name, category_id)
    values
      (p_first_child_name, p_category_id);
  end proc_add_1st_child;
  PROCEDURE proc_add_product(p_product_name  NVARCHAR2,
                             p_category_id   NUMBER,
                             p_price         NUMBER,
                             p_contact       NUMBER,
                             p_json          CLOB,
                             p_vaucher       NUMBER,
                             p_sale          NUMBER,
                             p_title         NVARCHAR2,
                             p_location      VARCHAR2,
                             p_guests        VARCHAR2,
                             p_description   VARCHAR2,
                             p_offerin       VARCHAR2,
                             p_pricein       NUMBER,
                             p_menu          VARCHAR2,
                             p_womenzon      VARCHAR2,
                             p_menzone       VARCHAR2,
                             p_clinicconcept VARCHAR2,
                             p_addinfo       VARCHAR2,
                             p_athotel       varchar2) AS
    l_all_images CLOB;
    v_product_id NUMBER;
  BEGIN
    SELECT JSON_ARRAYAGG(image_path)
      INTO l_all_images
      FROM JSON_TABLE(p_json,
                      '$[*]' COLUMNS(image_path VARCHAR2(4000) PATH '$'));
  
    INSERT INTO categories_product
      (product_name,
       category_id,
       price,
       contact,
       image_path,
       vaucher,
       sale,
       title,
       location,
       guests)
    VALUES
      (p_product_name,
       p_category_id,
       p_price,
       p_contact,
       l_all_images,
       p_vaucher,
       p_sale,
       p_title,
       p_location,
       p_guests)
    RETURNING id INTO v_product_id;
  
    INSERT INTO product_details
      (description,
       product_id,
       offerin,
       pricein,
       menu,
       womenzone,
       menzone,
       clinicconcept,
       addinfo,
       athotel)
    VALUES
      (p_description,
       v_product_id,
       p_offerin,
       p_pricein,
       p_menu,
       p_womenzon,
       p_menzone,
       p_clinicconcept,
       p_addinfo,
       p_athotel);
  
    COMMIT;
  END proc_add_product;

  procedure proc_get_all_categories(p_category_curs OUT SYS_REFCURSOR) as
  begin
    open p_category_curs for
      select c.id, c.category_name from categories c;
  end proc_get_all_categories;
  procedure proc_get_1stchild_categories(p_category_id   number,
                                         p_category_curs OUT SYS_REFCURSOR) as
  begin
    open p_category_curs for
      select ca.id as cat_id, ca.category_name, c.first_child_name, c.id
        from categories ca
       inner join category_1st_child c
          on ca.id = c.category_id
       where p_category_id = ca.id;
  end proc_get_1stchild_categories;
  procedure proc_get_filtered_categories(p_category_id   number,
                                         p_category_name varchar2,
                                         p_category_curs OUT SYS_REFCURSOR) as
  begin
    open p_category_curs for
      select c.category_name,
             f.first_child_name,
             p.title,
             p.category_id,
             c.id as main_category_id,
             p.product_name,
             p.price,
             p.image_path,
             p.location,
             p.guests,
             p.id,
             p.sale,
             (p.price - (p.price / 100) * p.sale + p.vaucher) as current_price
        from categories c
       inner join category_1st_child f
          on c.id = f.category_id
       inner join categories_product p
          on f.id = p.category_id
       where p_category_id = c.id
         and p_category_name = c.category_name;
  end proc_get_filtered_categories;

  PROCEDURE proc_get_all_products(p_id            NUMBER,
                                  p_category_curs OUT SYS_REFCURSOR) AS
  BEGIN
    OPEN p_category_curs FOR
      SELECT c.product_name,
             c.id,
             c.category_id,
             c.title,
             c.price,
             LISTAGG(c.image_path, ',') WITHIN GROUP(ORDER BY c.id) AS image_path,
             c.contact,
             c.vaucher,
             c.sale,
             (c.price - (c.price / 100) * c.sale + c.vaucher) as current_price,
             d.description,
             d.offerin,
             d.pricein,
             d.menu,
             d.womenzone,
             d.menzone,
             d.clinicconcept,
             d.addinfo,
             d.athotel
        FROM categories_product c
       INNER JOIN category_1st_child t
          ON c.category_id = t.id
       right join product_details d
          on d.product_id = c.id
       WHERE c.id = p_id
       GROUP BY c.product_name,
                c.id,
                c.category_id,
                c.title,
                c.price,
                c.contact,
                c.vaucher,
                c.sale,
                d.description,
                d.offerin,
                d.pricein,
                d.menu,
                d.womenzone,
                d.menzone,
                d.clinicconcept,
                d.addinfo,
                d.athotel;
  END proc_get_all_products;

  procedure proc_addto_cart(p_user_id number, p_product_id number) as
    v_product_price     NUMBER;
    v_existing_quantity NUMBER;
  begin
    SELECT price
      INTO v_product_price
      FROM categories_product
     WHERE id = p_product_id;
  
    SELECT COUNT(*)
      INTO v_existing_quantity
      FROM cart
     WHERE product_id = p_product_id;
  
    IF v_existing_quantity > 0 THEN
      UPDATE cart
         SET quantity  = NVL(quantity, 0) + 1,
             sum_price = sum_price + v_product_price
       WHERE product_id = p_product_id;
    ELSE
      INSERT INTO cart
        (user_id, product_id, quantity, sum_price)
      VALUES
        (p_user_id, p_product_id, 1, v_product_price);
    END IF;
  end proc_addto_cart;

  procedure proc_get_cart(p_user_id number, p_cart_curs OUT SYS_REFCURSOR) as
  begin
    open p_cart_curs for
      select p.title,
             p.price,
             p.image_path,
             c.quantity,
             c.sum_price,
             (SELECT SUM(c1.sum_price)
                FROM cart c1
               WHERE c1.user_id = p_user_id) AS total_price,
             (SELECT SUM(c2.quantity)
                FROM cart c2
               WHERE c2.user_id = p_user_id) AS total_quantity
        from categories_product p
       inner join cart c
          on c.product_id = p.id
       inner join register r
          on c.user_id = r.id
       where p_user_id = c.user_id;
  end proc_get_cart;

  procedure proc_add_user(p_name     varchar2,
                          p_lastname varchar2,
                          p_email    varchar2,
                          p_password varchar2,
                          p_mobile   number,
                          p_role_id  IN NUMBER) as
    v_count NUMBER;
  begin
    SELECT COUNT(*) INTO v_count FROM register WHERE email = p_email;
  
    IF v_count > 0 THEN
      RAISE_APPLICATION_ERROR(-20001,
                              'User with the same username or mobile already exists.');
    else
      insert into register
        (name, lastname, email, password, mobile, role_id)
      values
        (p_name, p_lastname, p_email, p_password, p_mobile, p_role_id);
    end if;
  end proc_add_user;

  procedure proc_add_order(p_json    CLOB,
                           p_address varchar2,
                           p_user_id number) as
    v_product_price NUMBER;
    CURSOR v_add_orders_curs IS
      SELECT *
        FROM JSON_TABLE(p_json, '$[*]' COLUMNS(cart_id NUMBER PATH '$'));
  begin
    FOR order_item IN v_add_orders_curs LOOP
      SELECT sum_price
        INTO v_product_price
        FROM cart
       WHERE id = order_item.cart_id
         and user_id = p_user_id;
      INSERT INTO orders
        (cart_id, address, total_price, user_id)
      VALUES
        (order_item.cart_id, p_address, v_product_price, p_user_id);
    END LOOP;
  end proc_add_order;

  PROCEDURE proc_login_user(p_email     IN VARCHAR2,
                            p_user_curs OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN p_user_curs FOR
      SELECT u.password
        FROM register u
       INNER JOIN roles r
          ON u.role_id = r.id
       WHERE u.email = p_email;
  END proc_login_user;

  PROCEDURE proc_get_user_info(p_email     IN VARCHAR2,
                               p_user_curs OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN p_user_curs FOR
      SELECT u.email, u.id, r.role
        FROM register u
       INNER JOIN roles r
          ON u.role_id = r.id
       WHERE u.email = p_email;
  END proc_get_user_info;

  PROCEDURE proc_get_locations(p_maincat_id  number,
                               p_category_id number,
                               p_loc_curs    OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN p_loc_curs FOR
      SELECT lo.location, lo.id
        FROM location lo
       INNER JOIN category_1st_child r
          ON lo.category_id = r.id
       inner join categories ca
          on ca.id = lo.maincat_id
       WHERE (p_category_id IS NULL OR lo.category_id = p_category_id)
         and p_maincat_id = lo.maincat_id;
  END proc_get_locations;

  PROCEDURE proc_get_guestnumber(p_guest_curs  OUT SYS_REFCURSOR,
                                 p_category_id number) IS
  BEGIN
    OPEN p_guest_curs FOR
      SELECT g.guest_number, g.id
        FROM guest_number g
       where g.category_id = p_category_id;
  END proc_get_guestnumber;

  procedure proc_add_locations(p_category_id number,
                               p_maincat_id  number,
                               p_location    varchar2) as
  
  begin
    insert into location
      (category_id, maincat_id, location)
    values
      (p_category_id, p_maincat_id, p_location);
  end proc_add_locations;

  procedure proc_add_to_basket(p_product_id number,
                               p_user_id    number,
                               p_quantity   number) as
  begin
    insert into basket
      (product_id, user_id, quantity)
    values
      (p_product_id, p_user_id, p_quantity);
  end proc_add_to_basket;
  procedure proc_get_basket(p_user_id     number,
                            p_basket_curs OUT SYS_REFCURSOR) as
  begin
    open p_basket_curs for
      select b.id,
             p.id as product_id,
             p.image_path,
             p.title,
             p.product_name,
             (p.vaucher) as vaucher_price,
             sum(b.quantity) over() as total_quantity,
             b.quantity as vaucher_quantity,
             sum(b.quantity * p.vaucher) over() as total_price,
             (p.price -
             ((p.price / 100) * p.sale) +
             p.vaucher) as current_price,
             (p.price) as starting_price
        from categories_product p
       inner join basket b
          on p.id = b.product_id
       where p_user_id = b.user_id;
    --group by p.image_path, p.title, p.product_name, (p.vaucher * b.quantity);
  end proc_get_basket;
  procedure proc_delete_from_cart(p_user_id number, p_product_id number) as
  begin
    delete from basket b
     where p_user_id = b.user_id
       and p_product_id = b.id;
  end proc_delete_from_cart;
  procedure proc_update_basket(p_user_id    number,
                               p_product_id number,
                               p_quantity   number) as
  begin
    update basket b
       set b.quantity = p_quantity
     where p_product_id = b.id
       and p_user_id = b.user_id;
  end proc_update_basket;

  procedure proc_add_guest_number(p_guest_number varchar2,
                                  p_category_id  number) as
  begin
    insert into guest_number
      (guest_number, category_id)
    values
      (p_guest_number, p_category_id);
  end proc_add_guest_number;
  procedure proc_get_products(p_product_curs OUT SYS_REFCURSOR) as
  begin
    open p_product_curs for
      select c.category_name,
             f.first_child_name,
             t.title,
             t.product_name,
             t.price,
             t.image_path,
             t.location,
             t.guests,
             t.id,
             t.sale,
             (t.price - (t.price / 100) * t.sale + t.vaucher) as current_price
        from categories c
       inner join category_1st_child f
          on c.id = f.category_id
       inner join categories_product t
          on f.id = t.category_id;
  end proc_get_products;

  procedure proc_get_searched_products(p_product_name varchar2,
                                       p_product_curs OUT SYS_REFCURSOR) as
  begin
    open p_product_curs for
      select c.category_name,
             f.first_child_name,
             p.title,
             p.category_id,
             c.id as main_category_id,
             p.product_name,
             p.price,
             p.image_path,
             p.location,
             p.guests,
             p.id,
             p.sale,
             (p.price - (p.price / 100) * p.sale + p.vaucher) as current_price
        from categories c
       inner join category_1st_child f
          on c.id = f.category_id
       inner join categories_product p
          on f.id = p.category_id
       WHERE p.title LIKE '%' || p_product_name || '%';
  end proc_get_searched_products;
  procedure proc_get_user(p_user_id number, p_user_curs OUT SYS_REFCURSOR) as
  begin
    open p_user_curs for
      select r.id, r.name, r.lastname, r.email, r.mobile, r.role_id
        from register r
       where p_user_id = r.id;
  end proc_get_user;

  procedure proc_delete_user(p_user_id number) as
  begin
    delete from register r where r.id = p_user_id;
  end proc_delete_user;
  procedure proc_update_user(p_user_id  number,
                             p_name     varchar2,
                             p_lastname varchar2,
                             p_email    varchar2,
                             p_mobile   varchar2) as
  begin
    update register
       set name     = p_name,
           lastname = p_lastname,
           email    = p_email,
           mobile   = p_mobile
     where id = p_user_id;
  end proc_update_user;
end pkg_categories_operations;
/

prompt
prompt Creating package body PKG_COMPANY_OPERATIONS
prompt ============================================
prompt
create or replace package body khatia.pkg_company_operations is

  procedure proc_register_company(p_company_name IN VARCHAR2,
                                  p_address      IN VARCHAR2,
                                  p_mobile       IN NUMBER,
                                  p_password     IN VARCHAR2,
                                  p_name         IN VARCHAR2,
                                  p_lastname     IN VARCHAR2,
                                  p_username     IN VARCHAR2,
                                  p_email        IN VARCHAR2,
                                  p_role_id      IN NUMBER) IS
    v_count NUMBER;
  begin
    SELECT COUNT(*)
      INTO v_count
      FROM khatia_company
     WHERE username = p_username
        OR email = p_email;
  
    IF v_count > 0 THEN
      RAISE_APPLICATION_ERROR(-20001,
                              'User with the same username or mobile already exists.');
    ELSE
      insert into khatia_company
        (company_name,
         address,
         mobile,
         password,
         name,
         lastname,
         username,
         email,
         role_id)
      values
        (p_company_name,
         p_address,
         p_mobile,
         p_password,
         p_name,
         p_lastname,
         p_username,
         p_email,
         p_role_id);
    end if;
  end proc_register_company;

  procedure proc_register_warehouse(p_warehouse  varchar2,
                                    p_company_id number) as
  begin
    insert into khatia_warehouse
      (warehouse, company_id)
    values
      (p_warehouse, p_company_id);
  end proc_register_warehouse;
end pkg_company_operations;
/

prompt
prompt Creating package body PKG_EMPLOYEES
prompt ===================================
prompt
create or replace package body khatia.pkg_employees is

  procedure proc_add_status(p_status varchar2) as
  begin
    insert into status (status) values (p_status);
  end proc_add_status;

  procedure proc_update_status(p_id number) as
  begin
      UPDATE tasks SET status_id = 2 WHERE id = p_id;
    end proc_update_status;
    procedure proc_add_task(p_task varchar2) as 
      v_emp number;
    begin
      begin
      SELECT employee_id
        into v_emp
        FROM tasks t
       WHERE employee_id NOT IN
             (SELECT employee_id FROM tasks WHERE status_id = 1)
       FETCH FIRST 1 ROW ONLY;
    exception
      WHEN NO_DATA_FOUND THEN
      
        SELECT employee_id
          into v_emp
          FROM tasks t
         WHERE t.status_id = 1
           AND employee_id IN
               (SELECT employee_id
                  FROM tasks
                 GROUP BY employee_id
                HAVING COUNT(*) = (SELECT MIN(cnt)
                                    FROM (SELECT COUNT(*) cnt
                                            FROM tasks
                                           GROUP BY employee_id)))
         FETCH FIRST 1 ROW ONLY;
    end;
    insert into tasks
      (task, employee_id, status_id)
    values
      (p_task, v_emp, 1);
  end proc_add_task;

  procedure proc_employee(p_employee varchar2) as
  begin
    insert into employees (employee) values (p_employee);
  end proc_employee;

  procedure proc_get_tasks(p_task_curs OUT SYS_REFCURSOR) as
  begin
    open p_task_curs for
      select employee_id, count(*) as cnt
        from tasks t
       where t.status_id = 1
       group by employee_id;
  end proc_get_tasks;
end pkg_employees;
/

prompt
prompt Creating package body PKG_TASKS_ORDERS
prompt ======================================
prompt
create or replace package body khatia.pkg_tasks_orders is

  PROCEDURE proc_add_order(p_client_id     NUMBER,
                           p_json_id       CLOB,
                           p_json_quantity CLOB,
                           p_order_date    DATE) AS
    v_order_id NUMBER;
  
  BEGIN
    INSERT INTO task_orders
      (client_id, order_date)
    VALUES
      (p_client_id, p_order_date)
    RETURNING id INTO v_order_id;
  
    FOR product_rec IN (
        SELECT jt_id.product_id, jt_qty.quantity
        FROM json_table(p_json_id, '$[*]' 
                        COLUMNS(
                            row_number FOR ORDINALITY, -- Generate row numbers for pairing
                            product_id NUMBER PATH '$'
                        )) jt_id
        JOIN json_table(p_json_quantity, '$[*]' 
                        COLUMNS(
                            row_number FOR ORDINALITY, -- Generate row numbers for pairing
                            quantity NUMBER PATH '$'
                        )) jt_qty
        ON jt_id.row_number = jt_qty.row_number -- Pair based on row numbers
    ) LOOP
      INSERT INTO task_order_details
        (order_id, product_id, quantity)
      VALUES
        (v_order_id, product_rec.product_id, product_rec.quantity);
    END LOOP;
  END proc_add_order;

  procedure proc_get_order(p_order_curs OUT SYS_REFCURSOR) as
  begin
    open p_order_curs for
      select o.id,
             c.name,
             o.quantity,
             JSON_ARRAYAGG(d.product_id) AS product_id
        from task_orders o
        left join clients c
          on o.client_id = c.id
       right join task_order_details d
          on d.order_id = o.id
       GROUP BY o.id, c.name, o.quantity;
  end proc_get_order;

  procedure proc_add_inventories(p_product_id  number,
                                 p_balance     number,
                                 p_create_date date) as
  begin
    insert into inventories
      (product_id, balance, create_date)
    values
      (p_product_id, p_balance, p_create_date);
  end proc_add_inventories;

  procedure proc_get_order_details(p_order_curs         OUT SYS_REFCURSOR,
                                   p_min_date_curs      OUT SYS_REFCURSOR,
                                   p_max_date_curs      OUT SYS_REFCURSOR,
                                   p_total_price_curs   OUT SYS_REFCURSOR,
                                   p_between_dates_curs OUT SYS_REFCURSOR,
                                   p_avg_curs           OUT SYS_REFCURSOR) as
  begin
    open p_order_curs for
      select c.name, count(*) as cnt
        from clients c
       inner join task_orders o
          on c.id = o.client_id
       group by c.name;
    open p_min_date_curs for
      select o.id, o.order_date, c.name
        from task_orders o
       inner join clients c
          on o.client_id = c.id
       WHERE o.order_date = (SELECT MIN(order_date) FROM task_orders);
    open p_max_date_curs for
      select o.id, o.order_date, c.name
        from task_orders o
       inner join clients c
          on o.client_id = c.id
       WHERE o.order_date = (SELECT max(order_date) FROM task_orders);
  
    open p_total_price_curs for
      select o.id, (sum(d.quantity * p.price)) as total
        from task_orders o
       inner join task_order_details d
          on o.id = d.order_id
       inner join task_products p
          on p.id = d.product_id
          group by o.id;
          
    open p_between_dates_curs for
      select c.name, o.id, o.order_date
        from task_orders o
        left join clients c
          on o.client_id = c.id
       WHERE o.order_date BETWEEN TO_DATE('11-02-2025', 'DD-MM-YYYY') AND
             TO_DATE('26-10-2025', 'DD-MM-YYYY');
  
    open p_avg_curs for
      select (sum(d.quantity * p.price) / count(*)) as avg_amount
        from task_orders o
       inner join task_order_details d
          on d.order_id = o.id
       inner join task_products p
          on d.product_id = p.id;
  end proc_get_order_details;

  procedure proc_get_balance(p_balance_curs OUT SYS_REFCURSOR,
                             p_status_curs  OUT SYS_REFCURSOR) as
  begin
    open p_balance_curs for
      select p.product,
             (i.balance - COALESCE(SUM(d.quantity), 0)) AS current_balance
        from task_products p
       inner join inventories i
          on i.product_id = p.id
       inner join task_order_details d
          on d.product_id = p.id
       inner join task_orders o
          on o.id = d.order_id
       GROUP BY p.product, i.balance;
  
    open p_status_curs for
      select c.name, p.product, s.status
        from clients c
       inner join task_orders o
          on o.client_id = c.id
       inner join task_order_details d
          on d.order_id = o.id
       inner join task_products p
          on d.product_id = p.id
       inner join task_status s
          on o.status_id = s.id;
  end proc_get_balance;

  procedure proc_employee_order(p_employee_id number,
                                p_order_id    number,
                                p_status_id   number) as
  begin
    update task_orders
       set status_id = p_status_id, employee_id = p_employee_id
     where p_order_id = id;
  
  end proc_employee_order;

  procedure proc_get_emp_order(p_order_cur      out sys_refcursor,
                               p_non_order_curs out sys_refcursor) as
  begin
    open p_order_cur for
      select e.name, count(*) as cnt
        from task_employees e
       inner join task_orders o
          on e.id = o.employee_id
       group by e.name;
  
    open p_non_order_curs for
      select e.name
        from task_employees e
       where e.id not in (select o.employee_id from task_orders o);
  end proc_get_emp_order;
end pkg_tasks_orders;
/

prompt
prompt Creating package body PKG_USERS_OPERATIONS
prompt ==========================================
prompt
create or replace package body khatia.pkg_users_operations is

  PROCEDURE proc_register_user(p_name         IN VARCHAR2,
                               p_lastname     IN VARCHAR2,
                               p_username     IN VARCHAR2,
                               p_mobile       IN NUMBER,
                               p_password     IN VARCHAR2,
                               p_role_id      IN NUMBER,
                               p_company_id   IN NUMBER,
                               p_warehouse_id IN NUMBER DEFAULT NULL) IS
    v_count NUMBER;
  BEGIN
    SELECT COUNT(*)
      INTO v_count
      FROM khatia_users
     WHERE username = p_username
        OR mobile = p_mobile;
  
    IF v_count > 0 THEN
      RAISE_APPLICATION_ERROR(-20001,
                              'User with the same username or mobile already exists.');
    ELSE
      INSERT INTO khatia_users
        (name,
         lastname,
         username,
         mobile,
         password,
         role_id,
         company_id,
         warehouse_id)
      VALUES
        (p_name,
         p_lastname,
         p_username,
         p_mobile,
         p_password,
         p_role_id,
         p_company_id,
         p_warehouse_id);
    END IF;
  END proc_register_user;

  PROCEDURE proc_user_roles(p_role varchar2) as
  begin
    insert into khatia_roles (role) values (p_role);
  end proc_user_roles;

  PROCEDURE proc_login_user(p_username  IN VARCHAR2,
                            p_user_curs OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN p_user_curs FOR
      SELECT u.password
        FROM khatia_users u
       INNER JOIN khatia_roles r
          ON u.role_id = r.id
       WHERE u.username = p_username
      
      UNION ALL
      
      SELECT c.password
        FROM khatia_company c
       INNER JOIN khatia_roles r
          ON c.role_id = r.id
       WHERE c.username = p_username;
  END proc_login_user;

  PROCEDURE proc_get_user_info(p_username  IN VARCHAR2,
                               p_user_curs OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN p_user_curs FOR
      SELECT u.username, u.id, r.role
        FROM khatia_users u
       INNER JOIN khatia_roles r
          ON u.role_id = r.id
       WHERE u.username = p_username
      UNION ALL
      SELECT c.username, c.id, r.role
        FROM khatia_company c
       INNER JOIN khatia_roles r
          ON c.role_id = r.id
       WHERE c.username = p_username;
  END proc_get_user_info;

  PROCEDURE proc_get_users(p_id in number, p_user_curs OUT SYS_REFCURSOR) as
  begin
    open p_user_curs for
      select u.name, u.lastname, u.username, u.mobile, u.id, r.role
        from khatia_users u
       inner join khatia_roles r
          on r.id = u.role_id
       where u.company_id = p_id;
  end proc_get_users;

  PROCEDURE proc_update_user(p_id       IN NUMBER,
                             p_name     IN VARCHAR2,
                             p_lastname IN VARCHAR2,
                             p_username IN VARCHAR2,
                             p_mobile   IN NUMBER,
                             p_role_id  IN VARCHAR2) IS
  BEGIN
    UPDATE khatia_users
       SET name     = p_name,
           lastname = p_lastname,
           username = p_username,
           mobile   = p_mobile,
           role_id  = p_role_id
     WHERE id = p_id;
  END proc_update_user;

end pkg_users_operations;
/

prompt
prompt Creating package body PKG_WAREHOUSE_PRODUCT_MANAGMENT
prompt =====================================================
prompt
create or replace package body khatia.pkg_warehouse_product_managment is
  procedure proc_entry_products(p_barcode        varchar2,
                                p_product_name   varchar2,
                                p_quantity       number,
                                p_entry_date     varchar2,
                                p_operator_id    number,
                                p_warehouse_name varchar2) as
    v_count number;
  
  begin
    select count(*)
      into v_count
      from khatia_warehouse_exchanges
     where barcode = p_barcode
       and product_name != p_product_name;
  
    if v_count > 0 then
      RAISE_APPLICATION_ERROR(-20001,
                              'A product with this barcode already exists.');
    else
      insert into khatia_warehouse_exchanges
        (barcode,
         product_name,
         quantity,
         entry_date,
         operator_id,
         warehouse_name)
      values
        (p_barcode,
         p_product_name,
         p_quantity,
         TO_DATE(p_entry_date, 'DD-Mon-YYYY'),
         p_operator_id,
         p_warehouse_name);
    end if;
  end proc_entry_products;

  procedure proc_get_all_entry_products(p_company_id   number,
                                        p_product_curs OUT SYS_REFCURSOR) as
  begin
    open p_product_curs for
      select w.barcode,
             w.product_name,
             w.quantity,
             w.entry_date,
             u.name,
             u.lastname,
             w.warehouse_name
        from khatia_warehouse_exchanges w
       inner join khatia_users u
          on u.id = w.operator_id
       where exit_date is null
         and p_company_id = u.company_id;
  end proc_get_all_entry_products;

  procedure proc_get_entry_product(p_id           number,
                                   p_product_curs OUT SYS_REFCURSOR) as
  begin
    open p_product_curs for
      select w.id,
             w.barcode,
             w.product_name,
             w.quantity,
             w.entry_date,
             u.name,
             u.lastname,
             w.warehouse_name
        from khatia_warehouse_exchanges w
       inner join khatia_users u
          on u.id = w.operator_id
       where w.exit_date is null
         and p_id = u.warehouse_id;
  end proc_get_entry_product;

  procedure proc_update_entry_product(p_barcode      varchar2,
                                      p_product_name varchar2,
                                      p_quantity     number,
                                      p_entry_date   varchar2,
                                      p_id           varchar2) is
  begin
    update khatia_warehouse_exchanges
       set barcode      = p_barcode,
           product_name = p_product_name,
           quantity     = p_quantity,
           entry_date   = p_entry_date
     where id = p_id;
  end proc_update_entry_product;

  procedure proc_exit_products(p_barcode        varchar2,
                               p_product_name   varchar2,
                               p_quantity       number,
                               p_exit_date      varchar2,
                               p_operator_id    number,
                               p_warehouse_name varchar2,
                               p_unit           varchar2) as
    v_available_quantity number;
  begin
    select SUM(case
                 when e.entry_date is not null and e.exit_date is null then
                  e.quantity
                 when e.exit_date is not null then
                  -e.quantity
                 else
                  0
               end) AS current_balance
      into v_available_quantity
      from khatia_warehouse_exchanges e
     where e.barcode = p_barcode
       and e.warehouse_name = p_warehouse_name
     group by e.barcode, e.product_name, e.warehouse_name;
  
    if NVL(v_available_quantity, 0) >= p_quantity then
      insert into khatia_warehouse_exchanges
        (barcode,
         product_name,
         quantity,
         exit_date,
         operator_id,
         warehouse_name,
         unit)
      values
        (p_barcode,
         p_product_name,
         p_quantity,
         TO_DATE(p_exit_date, 'DD-Mon-YYYY'),
         p_operator_id,
         p_warehouse_name,
         p_unit);
    else
      RAISE_APPLICATION_ERROR(-20001,
                              'Not enough quantity available for exit.');
    end if;
  end proc_exit_products;

  procedure proc_get_all_exit_products(p_company_id   number,
                                       p_product_curs OUT SYS_REFCURSOR) as
  begin
    open p_product_curs for
      select w.barcode,
             w.product_name,
             w.quantity,
             w.exit_date,
             u.name,
             u.lastname,
             w.warehouse_name
        from khatia_warehouse_exchanges w
       inner join khatia_users u
          on u.id = w.operator_id
       where exit_date is not null
         and p_company_id = u.company_id;
  end proc_get_all_exit_products;

  procedure proc_get_exit_product(p_id           number,
                                  p_product_curs OUT SYS_REFCURSOR) as
  begin
    open p_product_curs for
      select w.id,
             w.barcode,
             w.product_name,
             w.quantity,
             w.exit_date,
             u.name,
             u.lastname,
             w.warehouse_name
        from khatia_warehouse_exchanges w
       inner join khatia_users u
          on u.id = w.operator_id
       where w.exit_date is not null
         and p_id = u.warehouse_id;
  end proc_get_exit_product;

  procedure proc_update_exit_product(p_barcode      varchar2,
                                     p_product_name varchar2,
                                     p_quantity     number,
                                     p_exit_date    varchar2,
                                     p_id           varchar2,
                                     p_unit         varchar2) is
  begin
    update khatia_warehouse_exchanges
       set barcode      = p_barcode,
           product_name = p_product_name,
           quantity     = p_quantity,
           exit_date    = p_exit_date,
           unit         = p_unit
     where id = p_id;
  end proc_update_exit_product;

  PROCEDURE proc_get_current_balance_forall(p_company_id   NUMBER,
                                            p_balance_curs OUT SYS_REFCURSOR) AS
  BEGIN
    OPEN p_balance_curs FOR
      WITH product_name_cte AS
       (SELECT w.barcode,
               MIN(w.product_name) KEEP(DENSE_RANK FIRST ORDER BY w.entry_date DESC NULLS LAST) AS product_name -- Choose product_name where entry_date is not null
          FROM khatia_warehouse_exchanges w
         WHERE w.entry_date IS NOT NULL
         GROUP BY w.barcode)
      SELECT w.barcode,
             pnc.product_name,
             SUM(CASE
                   WHEN w.entry_date IS NOT NULL AND w.exit_date IS NULL THEN
                    w.quantity
                   WHEN w.exit_date IS NOT NULL THEN
                    -w.quantity
                   ELSE
                    0
                 END) AS current_balance,
             w.warehouse_name
        FROM khatia_warehouse_exchanges w
       INNER JOIN khatia_users u
          ON w.operator_id = u.id
        LEFT JOIN product_name_cte pnc
          ON w.barcode = pnc.barcode
       WHERE p_company_id = u.company_id
       GROUP BY w.barcode, pnc.product_name, w.warehouse_name;
  END proc_get_current_balance_forall;

  PROCEDURE proc_get_current_balance(p_id           NUMBER,
                                     p_balance_curs OUT SYS_REFCURSOR) AS
  BEGIN
    OPEN p_balance_curs FOR
      WITH product_name_cte AS
       (SELECT w.barcode,
               MIN(w.product_name) KEEP(DENSE_RANK FIRST ORDER BY w.entry_date DESC NULLS LAST) AS product_name
          FROM khatia_warehouse_exchanges w
         WHERE w.entry_date IS NOT NULL
         GROUP BY w.barcode)
      SELECT w.barcode,
             pnc.product_name,
             u.name,
             u.lastname,
             w.warehouse_name,
             SUM(CASE
                   WHEN w.entry_date IS NOT NULL AND w.exit_date IS NULL THEN
                    w.quantity
                   WHEN w.exit_date IS NOT NULL THEN
                    -w.quantity
                   ELSE
                    0
                 END) AS current_balance
        FROM khatia_warehouse_exchanges w
       INNER JOIN khatia_users u
          ON u.id = w.operator_id
        LEFT JOIN product_name_cte pnc
          ON w.barcode = pnc.barcode
       WHERE p_id = u.warehouse_id
       GROUP BY w.barcode,
                pnc.product_name,
                u.name,
                u.lastname,
                w.warehouse_name;
  END proc_get_current_balance;

  procedure proc_add_warehouse(p_warehouse  varchar2,
                               p_company_id number,
                               p_address    varchar2) as
  begin
    insert into khatia_warehouse
      (warehouse, company_id, address)
    values
      (p_warehouse, p_company_id, p_address);
  end proc_add_warehouse;

  procedure proc_get_warehouses(p_company_id     number,
                                p_warehouse_curs out sys_refcursor) as
  begin
    open p_warehouse_curs for
      select w.id, w.warehouse, w.address
        from khatia_warehouse w
       where p_company_id = w.company_id;
  end proc_get_warehouses;

  procedure proc_update_warehouses(p_id        number,
                                   p_warehouse varchar2,
                                   p_address   varchar2) as
  begin
    update khatia_warehouse
       set warehouse = p_warehouse, address = p_address
     where id = p_id;
  end proc_update_warehouses;

  procedure proc_get_company_warehouse(p_id             number,
                                       p_warehouse_curs out sys_refcursor) as
  begin
    open p_warehouse_curs for
      select u.company_id, w.warehouse, u.warehouse_id
        from khatia_users u
        left join khatia_warehouse w
          on u.warehouse_id = w.id
       where p_id = u.id
         and (u.warehouse_id is null or u.warehouse_id = w.id);
  end proc_get_company_warehouse;
end pkg_warehouse_product_managment;
/

prompt
prompt Creating type body LOCATIONIDTYPE
prompt =================================
prompt
create or replace type body khatia.locationIdType is
  
  -- Member procedures and functions
  member procedure <ProcedureName>(<Parameter> <Datatype>) is
  begin
    <Statements>;
  end;
  
end;
/


prompt Done
spool off
set define on
