<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Seat Booking</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<script src="js/jquery-1.11.0.min.js"></script>
	<script src="js/jquery.seat-charts.js"></script>
	<style>
		.booking-actions {
			display: flex;
			justify-content: space-between;
			margin-top: 15px;
		}

		#proceed-to-payment, #cancel-selection {
			padding: 10px 15px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			transition: background-color 0.3s ease;
		}

		#proceed-to-payment {
			background-color: #4CAF50;
			color: white;
		}

		#cancel-selection {
			background-color: #f44336;
			color: white;
                                                      margin-right: 20px;
		}

		#proceed-to-payment:hover, #cancel-selection:hover {
			opacity: 0.9;
		}

		#proceed-to-payment:disabled, #cancel-selection:disabled {
			background-color: #cccccc;
			cursor: not-allowed;
		}
	</style>
</head>

<body>
<%
    // Retrieve parameters from the URL
    String selectedDate = request.getParameter("date") != null ? request.getParameter("date") : "Not Selected";
    String selectedTime = request.getParameter("time") != null ? request.getParameter("time") : "Not Selected";
    String selectedScreen = request.getParameter("screen") != null ? request.getParameter("screen") : "Not Selected";
%>

<div class="content">
	<h2>Seat Booking</h2>
	<div class="main">
		<div class="demo">
			<div id="seat-map">
				<div class="front">SCREEN</div>					
			</div>
			<div class="booking-details">
				<ul class="book-left">
					<li>Movie </li>
					<li>Date</li>
					<li>Time</li>
					<li>Tickets</li>
					<li>Total</li>
					<li>Selected Seats</li>
				</ul>
				<ul class="book-right">
					<li>: Mulan</li>
					<li>: <%= selectedDate %></li>
					<li>: <%= selectedTime %></li>
					<li>: <span id="counter">0</span></li>
					<li>: <b><i>$ </i><span id="total">0</span></b></li>
				</ul>
				<div class="clear"></div>
				<ul id="selected-seats" class="scrollbar scrollbar1"></ul>
			
				<div id="legend"></div>
				
				<div class="booking-actions">
					<!-- New Proceed to Payment and Cancel Buttons -->
					<button id="cancel-selection">Cancel</button>
					<button id="proceed-to-payment" disabled>Proceed to Payment</button>
				</div>
			</div>

			<script type="text/javascript">
				var price = 4; //price
				var selectedSeats = []; // Array to store selected seats

				$(document).ready(function () {
					var $cart = $('#selected-seats'), //Sitting Area
						$counter = $('#counter'), //Votes
						$total = $('#total'), //Total money
						$proceedButton = $('#proceed-to-payment'), //Proceed to Payment button
						$cancelButton = $('#cancel-selection'); //Cancel button

					var sc = $('#seat-map').seatCharts({
						map: [ //Seating chart
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'__________',
							'aaaaaaaa__',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'__aaaaaa__'
						],
						naming: {
							top: false,
							getLabel: function (character, row, column) {
								return column;
							}
						},
						legend: { //Definition legend
							node: $('#legend'),
							items: [
								['a', 'available', 'Available'],
								['a', 'unavailable', 'Sold'],
								['a', 'selected', 'Selected']
							]
						},
						click: function () { //Click event
							if (this.status() == 'available') { //optional seat
								$('<li>R-' + (this.settings.row + 1) + '	S-' + this.settings.label + '</li>')
									.attr('id', 'cart-item-' + this.settings.id)
									.data('seatId', this.settings.id)
									.appendTo($cart);

								// Track selected seats
								selectedSeats.push('R-' + (this.settings.row + 1) + ' S-' + this.settings.label);

								$counter.text(sc.find('selected').length + 1);
								$total.text(recalculateTotal(sc) + price);

								// Show proceed to payment button when seats are selected
								$proceedButton.prop('disabled', false);

								return 'selected';
							} else if (this.status() == 'selected') { //Checked
								//Update Number
								$counter.text(sc.find('selected').length - 1);
								//update totalnum
								$total.text(recalculateTotal(sc) - price);

								// Remove seat from selected seats array
								var seatToRemove = 'R-' + (this.settings.row + 1) + ' S-' + this.settings.label;
								selectedSeats = selectedSeats.filter(seat => seat !== seatToRemove);

								//Delete reservation
								$('#cart-item-' + this.settings.id).remove();

								// Disable proceed to payment button if no seats selected
								if (sc.find('selected').length === 0) {
									$proceedButton.prop('disabled', true);
								}

								//optional
								return 'available';
							} else if (this.status() == 'unavailable') { //sold
								return 'unavailable';
							} else {
								return this.style();
							}
						}
					});
					//sold seat
					sc.get(['1_2', '4_4', '4_5', '6_6', '6_7', '8_5', '8_6', '8_7', '8_8', '10_1', '10_2']).status(
						'unavailable');

					// Event listener for Proceed to Payment button
					$proceedButton.on('click', function() {
						// Construct URL with all necessary parameters
						var paymentUrl = '../payment.jsp?' + 
							'date=<%= selectedDate %>&' + 
							'time=<%= selectedTime %>&' + 
							'screen=<%= selectedScreen %>&' + 
							'seats=' + encodeURIComponent(selectedSeats.join(','));
						
						// Redirect to payment page
						window.location.href = paymentUrl;
					});

					// Event listener for Cancel button
					$cancelButton.on('click', function() {
						// Deselect all selected seats
						sc.find('selected').each(function() {
							this.status('available');
						});

						// Clear selected seats array and booking details
						selectedSeats = [];
						$cart.empty();
						$counter.text('0');
						$total.text('0');
						$proceedButton.prop('disabled', true);
					});
				});
				//sum total money
				function recalculateTotal(sc) {
					var total = 0;
					sc.find('selected').each(function () {
						total += price;
					});

					return total;
				}
			</script>
		</div>
	</div>
	<script type="text/javascript" src="js/theme-change-seat-sel.js"></script>
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>