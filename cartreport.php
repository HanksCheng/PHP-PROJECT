<?php 
require_once("connMysql.php");
if(isset($_POST["customername"]) && ($_POST["customername"]!="")){
	//cart begin
	require_once("mycart.php");
	session_start();
	$cart =& $_SESSION['cart']; // set cart value to Session
	if(!is_object($cart)) $cart = new myCart();
	//cart over	
	//add new pruduct to cart 
	$sql_query = "INSERT INTO orders (total ,deliverfee ,grandtotal ,customername ,customeremail ,customeraddress ,customerphone ,paytype) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	$stmt = $db_link->prepare($sql_query);
	$stmt->bind_param("iiisssss", $cart->total, $cart->deliverfee, $cart->grandtotal, $_POST["customername"], $_POST["customeremail"], $_POST["customeraddress"], $_POST["customerphone"], $_POST["paytype"]);
	$stmt->execute();
	//get new order id
	$o_pid = $stmt->insert_id;
	$stmt->close();
	//add new product id
	if($cart->itemcount > 0) {
		foreach($cart->get_contents() as $item) {
			$sql_query="INSERT INTO orderdetail (orderid ,productid ,productname ,unitprice ,quantity) VALUES (?, ?, ?, ?, ?)";
			$stmt = $db_link->prepare($sql_query);
			$stmt->bind_param("iisii", $o_pid, $item['id'], $item['info'], $item['price'], $item['qty']);
			$stmt->execute();
			$stmt->close();
		}
	}
}	
?>
<script language="javascript">
alert("感謝您的購買，我們將儘快進行處理。");
window.location.href="index.php";
</script>