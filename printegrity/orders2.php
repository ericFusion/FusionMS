<?	
  $organization = $_REQUEST['organization'] ;
  $purchaseorder_no = $_REQUEST['purchaseorder_no'] ;
  $name = $_REQUEST['name'] ;
  $phone = $_REQUEST['phone'] ;
  $email = $_REQUEST['email'] ;
  $address = $_REQUEST['address'] ;
  $model1 = $_REQUEST['model1'] ;
  $product1 = $_REQUEST['product1'] ;
  $quantity1 = $_REQUEST['quantity1'] ;
  $model2 = $_REQUEST['model2'] ;
  $product2 = $_REQUEST['product2'] ;
  $quantity2 = $_REQUEST['quantity2'] ;
  $model3 = $_REQUEST['model3'] ;
  $product3 = $_REQUEST['product3'] ;
  $quantity3 = $_REQUEST['quantity3'] ;
  $model4 = $_REQUEST['model4'] ;
  $product4 = $_REQUEST['product4'] ;
  $quantity4 = $_REQUEST['quantity4'] ;
  $model5 = $_REQUEST['model5'] ;
  $product5 = $_REQUEST['product5'] ;
  $quantity5 = $_REQUEST['quantity5'] ;
  $shipping1 = $_REQUEST['standard_shipping'] ;
  $shipping2 = $_REQUEST['expd_shipping'] ;
  $question = $_POST['question'];


	$message = "Organization: $organization\nPURCHASE ORDER #: $po\nNAME: $contact\nPHONE: $phone\nEMAIL: $email\nADDRESS: $address\nMODEL: $model1\nPRODUCT: $product1\nQUANTITY: $quantity1\nMODEL: $model2\nPRODUCT: $product2\nQUANTITY: $quantity2\nMODEL: $model3\nPRODUCT: $product3\nQUANTITY: $quantity3\nMODEL: $model4\nPRODUCT: $product4\nQUANTITY: $quantity4\nMODEL: $model5\nPRODUCT: $product5\nQUANTITY: $quantity5\nSTANDARD SHIPPING: $standard_shipping\nEXPEDITED SHIPPING: $expd_shipping\n";	

	if ($question == "PRINT") {
		  mail( "info@printegrityusa.com, orders@printegritytech.com", "Order Request From: $organization",

    $message, "From: $email" );
	
			header( "Location: http://www.printegrityusa.com/ordersubmit.html" );
			
	}
	else{
		
		header( "Location: http://www.printegrityusa.com/captchaerror.html" );
	}

		

?>