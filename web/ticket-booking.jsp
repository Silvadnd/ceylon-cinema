 <%@page import="java.time.LocalDate" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Ticket Booking</title>
  <link rel="stylesheet" type="text/css" href="assets/css/style-starter.css">
  <link rel="stylesheet" href="https://npmcdn.com/flickity@2/dist/flickity.css">
  <link rel="stylesheet" type="text/css" href="assets/css/progress.css">
  <link rel="stylesheet" type="text/css" href="assets/css/ticket-booking.css">
  <link rel="stylesheet" type="text/css" href="assets/css/e-ticket.css">
  <link rel="stylesheet" type="text/css" href="assets/css/payment.css" />
  <link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700" rel="stylesheet">
</head>

<%
    // Calculate dates dynamically
    LocalDate today = LocalDate.now();
    DateTimeFormatter dateNumFormatter = DateTimeFormatter.ofPattern("dd");
    DateTimeFormatter dayFormatter = DateTimeFormatter.ofPattern("EEEE");
    
    // Prepare date arrays
    String[] dateNums = new String[7];
    String[] dateDays = new String[7];
    String[] fullDates = new String[7];
    
    for (int i = 0; i < 7; i++) {
        LocalDate currentDate = today.plusDays(i);
        dateNums[i] = currentDate.format(dateNumFormatter);
        dateDays[i] = i == 0 ? "Today" : 
                      i == 1 ? "Tomorrow" : 
                      currentDate.format(dayFormatter);
        fullDates[i] = currentDate.format(DateTimeFormatter.ofPattern("MM/dd/yyyy"));
    }
%>

<body>
  <header id="site-header" class="w3l-header fixed-top">
    <nav class="navbar navbar-expand-lg navbar-light fill px-lg-0 py-0 px-3">
      <div class="container">
        <a class="navbar-brand" href="#index.jsp">
          <img src="assets/images/logo.png" alt="Your logo" title="Your logo" style="height:80px;" />
        </a>

        <div class="mobile-position">
          <nav class="navigation">
            <div class="theme-switch-wrapper">
              <label class="theme-switch" for="checkbox">
                <input type="checkbox" id="checkbox">
                <div class="mode-container">
                  <i class="gg-sun"></i>
                  <i class="gg-moon"></i>
                </div>
              </label>
            </div>
          </nav>
        </div>
      </div>
    </nav>
  </header>

  <div class="container" id="progress-container-id">
    <div class="row">
      <div class="col">
        <div class="px-0 pt-4 pb-0 mt-3 mb-3">
          <form id="form">
            <ul id="progressbar" class="progressbar-class">
              <li class="active" id="step1">Show timing selection</li>
              <li id="step2" class="not_active">Seat Selection</li>
              <li id="step3" class="not_active">Payment</li>
              <li id="step4" class="not_active">E-Ticket</li>
            </ul>
            <br>
            
             <fieldset>
              <div id="screen-select-div">
                <h2>Show time Selection</h2>
                <div class="carousel carousel-nav" data-flickity='{"contain": true, "pageDots": false }'>
                  <% for(int i = 0; i < 7; i++) { %>
                    <div class="carousel-cell" id="<%=(i+1)%>" data-full-date="<%= fullDates[i] %>" onclick="myFunction(<%=(i+1)%>)">
                      <div class="date-numeric"><%= dateNums[i] %></div>
                      <div class="date-day"><%= dateDays[i] %></div>
                    </div>
                  <% } %>
                </div>
                
                <ul class="time-ul">
                  <li class="time-li">
                    <div class="screens">
                      Screen 1
                    </div>
                    <div class="time-btn">
                      <button class="screen-time" type="button">1:05 PM</button>
                      <button class="screen-time" type="button">4:00 PM</button>
                      <button class="screen-time" type="button">9:00 PM</button>
                    </div>
                  </li>
                  <li class="time-li">
                    <div class="screens">
                      Screen 2
                    </div>
                    <div class="time-btn">
                      <button class="screen-time" type="button">3:00 PM</button>
                    </div>
                  </li>
                  <li class="time-li">
                    <div class="screens">
                      Screen 3
                    </div>
                    <div class="time-btn">
                      <button class="screen-time" type="button">9:05 AM</button>
                      <button class="screen-time" type="button">10:00 PM</button>
                    </div>
                  </li>
                  <li class="time-li">
                    <div class="screens">
                      Screen 4
                    </div>
                    <div class="time-btn">
                      <button class="screen-time" type="button">9:05 AM</button>
                      <button class="screen-time" type="button">11:00 AM</button>
                      <button class="screen-time" type="button">3:00 PM</button>
                      <button class="screen-time" type="button">7:00 PM</button>
                      <button class="screen-time" type="button">10:00 PM</button>
                      <button class="screen-time" type="button">11:00 PM</button>
                    </div>
                  </li>
                  <li class="time-li">
                    <div class="screens">
                      Screen 5
                    </div>
                    <div class="time-btn">
                      <button class="screen-time" type="button">9:05 AM</button>
                      <button class="screen-time" type="button">12:00 PM</button>
                      <button class="screen-time" type="button">1:00 PM</button>
                      <button class="screen-time" type="button">3:00 PM</button>
                    </div>
                  </li>
                </ul>
              </div>
              <input id="screen-next-btn" type="button" name="next-step" class="next-step" value="Continue Booking" disabled />
            </fieldset>
            
       
            <!-- Remaining fieldsets remain the same as in the original code -->
            <fieldset>
                
              <div>
                <iframe id="seat-sel-iframe"
                  style="box-shadow: 0 14px 12px 0 var(--theme-border), 0 10px 50px 0 var(--theme-border); width: 800px; height: 550px; display: block; margin-left: auto; margin-right: auto;"
                  src="seat_selection/seat_sel.jsp"></iframe>
              </div>
              <br>
              <input type="button" name="previous-step" class="next-step" value="Back to Home" onclick="location.href='index.jsp';" />
              
              <style>
                  .next-step1{
                       display: none !important;
                  }
              </style>
              <input type="button" name="next-step" class="next-step1" value="Proceed to Payment" />
              
            </fieldset>
            
            <!--
            <fieldset>
              <!-- Payment Page - Original Code 
              <div id="payment_div">
                <div class="payment-row">
                  <div class="col-75">
                    <div class="payment-container">
                      <div class="payment-row">
                        <div class="col-50">
                          <h3 id="payment-h3">Payment</h3>
                          <div class="payment-row payment">
                            <div class="col-50 payment">
                              <label for="card" class="method card">
                                <div class="icon-container">
                                  <i class="fa fa-cc-visa" style="color: navy"></i>
                                  <i class="fa fa-cc-amex" style="color: blue"></i>
                                  <i class="fa fa-cc-mastercard" style="color: red"></i>
                                  <i class="fa fa-cc-discover" style="color: orange"></i>
                                </div>
                                <div class="radio-input">
                                  <input type="radio" id="card" />
                                  <span id="credit-card-price">Pay LKR with credit card</span>
                                </div>
                              </label>
                            </div>
                            <div class="col-50 payment">
                              <label for="paypal" class="method paypal">
                                <div class="icon-container">
                                  <i class="fa fa-paypal" style="color: navy"></i>
                                </div>
                                <div class="radio-input">
                                  <input id="paypal" type="radio" checked>
                                  <span id="paypal-price">Pay $ with PayPal</span>
                                </div>
                              </label>
                            </div>
                          </div>
                           <div class="payment-row">
                            <div class="col-50">
                              <label for="cname">Cardholder's Name</label>
                              <input type="text" id="cname" name="cardname" placeholder="Firstname Lastname" required />
                            </div>
                            <div class="col-50">
                              <label for="ccnum">Credit card number</label>
                              <input type="text" id="ccnum" name="cardnumber" placeholder="xxxx-xxxx-xxxx-xxxx"
                                required />
                            </div>
                          </div>
                          <div class="payment-row">
                            <div class="col-50">
                              <label for="expmonth">Exp Month</label>
                              <input type="text" id="expmonth" name="expmonth" placeholder="September" required />
                            </div>
                            <div class="col-50">
                              <div class="payment-row">
                                <div class="col-50">
                                  <label for="expyear">Exp Year</label>
                                  <input type="text" id="expyear" name="expyear" placeholder="yyyy" required />
                                </div>
                                <div class="col-50">
                                  <label for="cvv">CVV</label>
                                  <input type="text" id="cvv" name="cvv" placeholder="xxx" required />
                                </div>
                              </div>
                            </div>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <input type="button" name="next-step" class="next-step pay-btn" value="Confirm Payment" />
              <input type="button" name="previous-step" class="cancel-pay-btn" value="Cancel Payment"
                onclick="location.href='index.jsp';" />
            </fieldset>
            
            <fieldset>
              <h2>E-Ticket</h2>
              <div class="ticket-body">
                <div class="ticket">
                  <div class="holes-top"></div>
                  <div class="title">
                    <p class="cinema">MyShowz Entertainment</p>
                    <p class="movie-title" id="movie-name-ticket">Movie Name</p>
                  </div>
                  <div class="poster">
                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/25240/only-god-forgives.jpg"
                      alt="Movie: Only God Forgives" />
                  </div>
                  <div class="info">
                    <table class="info-table ticket-table">
                      <tr>
                        <th>SCREEN</th>
                        <th>ROW</th>
                        <th>SEAT</th>
                      </tr>
                      <tr>
                        <td class="bigger" id="screen-ticket">18</td>
                        <td class="bigger" id="row-ticket">H</td>
                        <td class="bigger" id="seat-ticket">24</td>
                      </tr>
                    </table>
                    <table class="info-table ticket-table">
                      <tr>
                        <th>PRICE</th>
                        <th>DATE</th>
                        <th>TIME</th>
                      </tr>
                      <tr>
                        <td id="price-ticket">RS.12.00</td>
                        <td id="date-ticket"><%= today.format(DateTimeFormatter.ofPattern("MM/dd/yy")) %></td>
                        <td id="time-ticket">19:30</td>
                      </tr>
                    </table>
                  </div>
                  <div class="holes-lower"></div>
                  <input type="button" name="previous-step" class="home-page-btn" value="Browse to Home Page"
                    onclick="location.href='index.jsp';" />
                </div>
              </div>
            </fieldset>
-->


          </form>
        </div>
      </div>
    </div>
  </div>

<script>
    let prevId = "1";
    let selectedMovieTime = "";
    let selectedScreen = "";
    let selectedDate = "";
    let selectedFullDate = "";

    window.onload = function () {
      document.getElementById("screen-next-btn").disabled = true;

      // Add event listeners to all screen time buttons
      document.querySelectorAll('.time-btn .screen-time').forEach(button => {
        button.addEventListener('click', function() {
          // Remove active state from all buttons
          document.querySelectorAll('.time-btn .screen-time').forEach(btn => {
            btn.classList.remove('active-time');
          });

          // Add active state to clicked button
          this.classList.add('active-time');

          const time = this.textContent.trim();
          const screen = this.closest('.time-li').querySelector('.screens').textContent.trim();
          
          // Enable continue button
          document.getElementById("screen-next-btn").disabled = false;
          
          // Store selected time and screen
          selectedMovieTime = time;
          selectedScreen = screen;
        });
      });
    }

    function myFunction(id) {
      // Remove background from previous selected date
      document.getElementById(prevId).style.background = "rgb(243, 235, 235)";
      
      // Set background for selected date
      const selectedCell = document.getElementById(id);
      selectedCell.style.background = "#df0e62";
      
      // Store selected date
      selectedDate = selectedCell.querySelector('.date-day').textContent;
      selectedFullDate = selectedCell.getAttribute('data-full-date');
      
      prevId = id;
    }

    // Modify event listener to update iframe with selected parameters
    document.getElementById('screen-next-btn').addEventListener('click', function() {
      // Prepare data to pass to iframe
      const seatSelectionUrl = new URL('seat_selection/seat_sel.jsp', window.location.href);
      seatSelectionUrl.searchParams.set('date', selectedDate);
      seatSelectionUrl.searchParams.set('fullDate', selectedFullDate);
      seatSelectionUrl.searchParams.set('time', selectedMovieTime);
      seatSelectionUrl.searchParams.set('screen', selectedScreen);

      // Update iframe source with parameters
      document.getElementById('seat-sel-iframe').src = seatSelectionUrl.toString();
    });
    
    document.querySelector('input[name="previous-step"]').addEventListener('click', function() {
    window.location.href = 'index.jsp';
});
  </script>

  <script src="https://npmcdn.com/flickity@2/dist/flickity.pkgd.js"></script>
  <script type="text/javascript" src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
  <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
  <script src="assets/js/theme-change.js"></script>
  <script type="text/javascript" src="assets/js/ticket-booking.js"></script>
</body>
</html>