
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Printegrity Technologies: Managed Print Services: Order Request</title>

<link rel="stylesheet" type="text/css" href="styles1.css" />
</head>

<body>
<div id="wrapper">
  <div id="header">
<div id="logo"> <a href="home.html"><img src="images/ptLogo.png" alt="Printegrity Tech logo" width="249" height="107" border="0" /></a> </div>

<div id="nav">
  <ul>
  	<li><a href="#">Services</a>
    	<ul>
        	<li><a href="mps.html">Managed Print Services</a></li>
            <li><a href="service.php">Request Service Form</a></li>
            <li><a href="maintenance.html">Maintenance</a></li>
        </ul></li>
    <li><a href="orders.php">Orders</a></li>
    <li><a href="about.html">About</a></li>
    <li><a href="contact.html">Contact</a></li>
  </ul>
  <!--end nav--></div>
 <!--end header--> </div>
 
  <div id="main">
    <div id="fcontent">
      <h1>Orders</h1>
    <p>Please fill out form below. An order confirmation will be sent to you within 2 hours<br />
(business hours 9am-5pm EST). </p>

    <form id="form1" name="form1" method="post" action="forms/orders.php">
<table width="626" border="0" cellpadding="5">
  <tr>
    <td colspan="4"><h3>CONTACT INFORMATION</h3></td>
  </tr>
  <tr>
    <td width="11%" rowspan="12">&nbsp;</td>
    <td width="25%">Organization</td>
    <td colspan="2"><input type="text" name="organization" id="organization" /></td>
  </tr>
  <tr>
    <td>Purchase Order #</td>
    <td colspan="2"><input type="text" name="purchaseorder_no" id="purchaseorder_no" /></td>
  </tr>
  <tr>
    <td>Name</td>
    <td colspan="2"><input type="text" name="name" id="name" /></td>
  </tr>
  <tr>
    <td>Phone</td>
    <td colspan="2"><input type="text" name="phone" id="phone" /></td>
  </tr>
  <tr>
    <td>E-mail</td>
    <td colspan="2"><input type="text" name="email" id="email" /></td>
  </tr>
  <tr>
    <td>Address</td>
    <td colspan="2"><textarea name="address" id="address" cols="45" rows="5"></textarea></td>
  </tr>
  <tr>
    <td><strong>Printer Manufacturer/Model</strong></td>
    <td width="31%"><strong>Cartridge/Part</strong></td>
    <td width="33%"><strong>Quantity</strong></td>
  </tr>
  <tr>
    <td><input type="text" name="model1" id="model1" /></td>
    <td><input type="text" name="product1" id="product1" /></td>
    <td><select name="quantity1" id="quantity1">

                      <option selected="selected">0</option>
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                      <option>5</option>

                      <option>6</option>
                      <option>7</option>
                      <option>8</option>
                      <option>9</option>
                      <option>10</option>
                    </select></td>
  </tr>
  <tr>
    <td><input type="text" name="model2" id="model2" /></td>
    <td><input type="text" name="product2" id="product2" /></td>
    <td><select name="quantity2" id="quantity2">

                      <option selected="selected">0</option>
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                      <option>5</option>

                      <option>6</option>
                      <option>7</option>
                      <option>8</option>
                      <option>9</option>
                      <option>10</option>
                    </select></td>
  </tr>
  <tr>
    <td><input type="text" name="model3" id="model3" /></td>
    <td><input type="text" name="product3" id="product3" /></td>
    <td><select name="quantity3" id="quantity3">

                      <option selected="selected">0</option>
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                      <option>5</option>

                      <option>6</option>
                      <option>7</option>
                      <option>8</option>
                      <option>9</option>
                      <option>10</option>
                    </select></td>
  </tr>
  <tr>
    <td><input type="text" name="model4" id="model4" /></td>
    <td><input type="text" name="product4" id="product4" /></td>
    <td><select name="quantity4" id="quantity4">

                      <option selected="selected">0</option>
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                      <option>5</option>

                      <option>6</option>
                      <option>7</option>
                      <option>8</option>
                      <option>9</option>
                      <option>10</option>
                    </select></td>
  </tr>
  <tr>
    <td><input type="text" name="model5" id="model5" /></td>
    <td><input type="text" name="product5" id="product5" /></td>
    <td><select name="quantity5" id="quantity5">

                      <option selected="selected">0</option>
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                      <option>5</option>

                      <option>6</option>
                      <option>7</option>
                      <option>8</option>
                      <option>9</option>
                      <option>10</option>
                    </select></td>
  </tr>
  <tr>
    <td colspan="2" rowspan="2">&nbsp;</td>
    <td>Standard Shipping (1-3 Days)</td>
    <td><select name="standard_shipping" id="standard_shipping">
      <option>Yes</option>
      <option>No</option>
    </select></td>
  </tr>
  <tr>
    <td>Expedited Shipping (Next Day)</td>
    <td><select name="expd_shipping" id="expd_shipping">
      <option>No</option>
      <option>Yes</option>
    </select></td>
  </tr>
  <tr>
    
    <td colspan="3" style="text-align:center;">	
    <img style="display:block;margin:0 auto;" src="captcha.php" />
    <label>Captcha : </label>
    <input class="input" type="text" name="norobot" style="display:block;margin:0 auto;" /></td>
   	

    <td><input type="submit" name="Submit" id="Submit" value="Submit"/></td>
  </tr>   	
</table>
</form>
 
    <!--end content--></div>
    <br style="clear: both;">
    <!--end main-->
  </div>
  
 <!-- end wrapper --></div>
<div id="footer">© 2011 Printegrity Technologies</div>
</body>
</html>
