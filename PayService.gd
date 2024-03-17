extends Node

# Matches BillingClient.ConnectionState in the Play Billing Library
enum ConnectionState {
	DISCONNECTED, # not yet connected to billing service or was already closed
	CONNECTING, # currently in process of connecting to billing service
	CONNECTED, # currently connected to billing service
	CLOSED, # already closed and shouldn't be used again
}

# Matches Purchase.PurchaseState in the Play Billing Library
enum PurchaseState {
	UNSPECIFIED,
	PURCHASED,
	PENDING,
}

var payment: JNISingleton;

func _ready():
	if Engine.has_singleton("GodotGooglePlayBilling"):
		payment = Engine.get_singleton("GodotGooglePlayBilling")
		# These are all signals supported by the API
		# You can drop some of these based on your needs
		payment.connected.connect(_on_connected) # No params
		payment.disconnected.connect(_on_disconnected) # No params
		payment.billing_resume.connect(_on_billing_resume) # No params
		payment.connect_error.connect(_on_connect_error) # Response ID (int), Debug message (string)
		payment.query_purchases_response.connect(_on_query_purchases_response) # Purchases (Dictionary[])
		payment.purchase_error.connect(_on_purchase_error) # Response ID (int), Debug message (string)
		payment.sku_details_query_completed.connect(_on_product_details_query_completed) # Products (Dictionary[])
		payment.sku_details_query_error.connect(_on_product_details_query_error) # Response ID (int), Debug message (string), Queried SKUs (string[])
		payment.price_change_acknowledged.connect(_on_price_acknowledged) # Response ID (int)
		payment.purchases_updated.connect(_on_purchases_updated) # Purchases (Dictionary[])
		payment.purchase_acknowledged.connect(_on_purchase_acknowledged) # Purchase token (string)
		payment.purchase_acknowledgement_error.connect(_on_purchase_acknowledgement_error) # Response ID (int), Debug message (string), Purchase token (string)
		payment.purchase_consumed.connect(_on_purchase_consumed) # Purchase token (string)
		payment.purchase_consumption_error.connect(_on_purchase_consumption_error) # Response ID (int), Debug message (string), Purchase token (string)

		payment.startConnection()
	else:
		print("Android IAP support is not enabled. Make sure you have enabled 'Gradle Build' and the GodotGooglePlayBilling plugin in your Android export settings! IAP will not work.")

#The payment flow will send a purchases_updated signal on success or a purchase_error signal on failure
func purchase(shop_item_id: String):
	print("Trying to buy"+ shop_item_id)
	payment.purchase(shop_item_id);

func _on_billing_resume():
	if payment.getConnectionState() == ConnectionState.CONNECTED:
		_query_purchases()

func _on_purchases_updated(purchases):
	for purchase in purchases:
		_process_purchase(purchase)

func _on_purchase_error(response_id, error_message):
	print("purchase_error id:", response_id, " message: ", error_message);

func _on_disconnected():
	print("_on_disconnected");

func _on_connect_error():
	print("_on_connect_error");

func _on_price_acknowledged():
	print("_on_price_acknowledged");

func _on_purchase_acknowledged():
	print("_on_purchase_acknowledged");

func _on_purchase_acknowledgement_error():
	print("_on_purchase_acknowledgement_error");

func _on_purchase_consumed():
	print("_on_purchase_consumed");

func _on_purchase_consumption_error():
	print("_on_purchase_consumption_error");

func _process_purchase(purchase):
	print("_process_purchase");
	print(purchase);

func _on_connected():
	payment.querySkuDetails(Diamonds.Diamonds.keys(), "inapp") # "subs" for subscriptions

func _on_product_details_query_completed(product_details):
	for available_product in product_details:
		print(available_product)

func _on_product_details_query_error(response_id, error_message, products_queried):
	print("on_product_details_query_error id:", response_id, " message: ",
			error_message, " products: ", products_queried)

func _query_purchases():
	payment.queryPurchases("inapp") # Or "subs" for subscriptions

func _on_query_purchases_response(query_result):
	if query_result.status == OK:
		for purchase in query_result.purchases:
			_process_purchase(purchase)
	else:
		print("queryPurchases failed, response code: ",
				query_result.response_code,
				" debug message: ", query_result.debug_message)

