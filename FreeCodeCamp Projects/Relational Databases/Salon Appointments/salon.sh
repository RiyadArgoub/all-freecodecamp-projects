#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
MAIN_MENU() {
echo -e "\nWelcome to the salon, here are our services:"
SERVICE_NAME=$($PSQL "SELECT service_id,name FROM services")
MAIN_MENU_LIST
}
MAIN_MENU_LIST () {
echo "$SERVICE_NAME" | while read SERVICE_ID BAR NAME
do
  echo "$SERVICE_ID) $NAME"
done
read SERVICE_ID_SELECTED
case $SERVICE_ID_SELECTED in
1) MAIN_MENU_2 ;;
2) MAIN_MENU_2 ;;
3) MAIN_MENU_2 ;;
*) MAIN_MENU_LIST ;;
esac

}
MAIN_MENU_2() {
echo -e "\nEnter your phone number:"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
  echo -e "\nNo name has this phone number, enter your name:"
  read CUSTOMER_NAME
  INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
fi
echo -e "\nEnter a time in the format HH:MM :"
read SERVICE_TIME
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
SERVICE_NAME_BY_ID=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
if [[ $INSERT_APPOINTMENT = "INSERT 0 1" ]]
then
echo -e "I have put you down for a$SERVICE_NAME_BY_ID at $SERVICE_TIME, $CUSTOMER_NAME."
fi

}

MAIN_MENU