create table customers(
    id int not null ,
    full_name varchar(50) not null,
    timestamp timestamp not null,
    delivery_address text not null,
    primary key (id)
    );

select * from customers;

create table orders(
    code int not null ,
    customer_id int not null ,
    total_sum double precision check ( total_sum > 0) not null ,
    is_paid boolean not null ,
    primary key (code),
    foreign key (customer_id) references customers
);


select * from orders;

create table products(
    id varchar not null ,
    name varchar unique not null ,
    description text,
    price double precision not null check ( price > 0 ),
    primary key (id)

);
select * from products;

create table order_items(
    order_code int not null ,
    product_id int not null ,
    quantity int not null check ( quantity > 0 ),
    primary key (order_code, product_id),
    foreign key (order_code) references orders,
    foreign key (product_id) references products
);