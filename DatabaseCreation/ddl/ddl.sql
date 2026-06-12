
<!DOCTYPE html>
<html lang="en">   <head>
    <!-- # block head (placeholder in theme.html) -->
        <!-- # block head (content inherited from layout.html) -->
    <title>
ddl.sql on DatabaseCreation – Attachment          – camper

    </title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!--[if IE]><script>
        if (/^#__msie303:/.test(window.location.hash))
        window.location.replace(window.location.hash.replace(/^#__msie303:/, '#'));
        </script><![endif]-->

    <link rel="start"  href="/projects/camper/wiki" />
    <link rel="search"  href="/projects/camper/search" />
    <link rel="help"  href="/projects/camper/wiki/TracGuide" />
    <link rel="stylesheet"  href="/projects/camper/chrome/common/css/trac.css" type="text/css" />
    <link rel="stylesheet"  href="/projects/camper/chrome/common/css/code.css" type="text/css" />
    <link rel="stylesheet"  href="/projects/camper/chrome/wikiautocomplete/css/jquery.textcomplete.css" type="text/css" />
    <link rel="icon"  href="/projects/camper/chrome/common/trac.ico" type="image/x-icon" />
    <link rel="up"  href="/projects/camper/wiki/DatabaseCreation" title="DatabaseCreation" />
    <link rel="alternate"  href="/projects/camper/raw-attachment/wiki/DatabaseCreation/ddl.sql" title="Original Format" type="text/x-sql; charset=utf-8" />
    <noscript>
      <style>
        .trac-noscript { display: none !important }
      </style>     </noscript>
    <link type="application/opensearchdescription+xml" rel="search"
          href="/projects/camper/search/opensearch"
          title="Search camper"/>
    <script>
      var wikiautocomplete={"strategies":[{"cache":true,"index":2,"match":"^(\\s*\\{{3}#!)(.*)(?!\\n)$","match_flags":"m","name":"processor","replace_prefix":"$1"},{"cache":false,"index":2,"match":"(\\b(?:raw-)?attachment:|\\[\\[Image\\()(\\S*)$","name":"attachment","quote_whitespace":true,"replace_prefix":"$1"},{"cache":true,"index":2,"match":"(^|[^[])\\[(\\w*)$","name":"linkresolvers","replace_end":"]","replace_prefix":"$1[","replace_suffix":":"},{"cache":false,"index":2,"match":"((?:^|[^{])#|\\bticket:|\\bbug:|\\bissue:)(\\d*)$","name":"ticket","replace_prefix":"$1","template_prefix":"#"},{"cache":true,"index":1,"match":"\\bwiki:(\\S*)$","name":"wikipage","quote_whitespace":true,"replace_prefix":"wiki:"},{"cache":true,"index":1,"match":"\\[\\[(\\w*)(?:\\(([^)]*))?$","name":"macro","replace_end":")]]","replace_prefix":"[[","replace_suffix":"($2"},{"cache":false,"index":2,"match":"\\b(source:|browser:|repos:|log:|export:)([^@\\s]*(?:@\\S*)?)$","name":"source","replace_prefix":"$1"},{"cache":true,"index":1,"match":"\\bmilestone:(\\S*)$","name":"milestone","quote_whitespace":true,"replace_prefix":"milestone:"},{"cache":true,"index":2,"match":"(^|[^{])\\{(\\d*)$","name":"report","replace_end":"}","replace_prefix":"$1{","template_prefix":"{","template_suffix":"}"},{"cache":true,"index":1,"match":"\\breport:(\\d*)$","name":"report","replace_prefix":"report:","template_prefix":"{","template_suffix":"}"}],"url":"/projects/camper/wikiautocomplete"};
    </script>
    <script src="/projects/camper/chrome/common/js/jquery.js"></script>
    <script src="/projects/camper/chrome/common/js/babel.js"></script>
    <script src="/projects/camper/chrome/common/js/trac.js"></script>
    <script src="/projects/camper/chrome/common/js/search.js"></script>
    <script src="/projects/camper/chrome/common/js/folding.js"></script>
    <script src="/projects/camper/chrome/wikiautocomplete/js/jquery.textcomplete.min.js"></script>
    <script src="/projects/camper/chrome/wikiautocomplete/js/wikiautocomplete.js"></script>
    <script>
      jQuery(function($) {
        $(".trac-autofocus").focus();
        $(".trac-target-new").attr("target", "_blank");
        if ($.ui) { /* is jquery-ui added? */
          $(".trac-datepicker:not([readonly])")
            .prop("autocomplete", "off").datepicker();
          // Input current date when today is pressed.
          var _goToToday = $.datepicker._gotoToday;
          $.datepicker._gotoToday = function(id) {
            _goToToday.call(this, id);
            this._selectDate(id)
          };
          $(".trac-datetimepicker:not([readonly])")
            .prop("autocomplete", "off").datetimepicker();
        }
        $(".trac-disable").disableSubmit(".trac-disable-determinant");
        setTimeout(function() { $(".trac-scroll").scrollToTop() }, 1);
        $(".trac-disable-on-submit").disableOnSubmit();
      });
    </script>
    <!--   # include 'site_head.html' (layout.html) -->
    <!--   end of site_head.html -->
    <!-- # endblock head (content inherited from layout.html) -->

    <script>
      jQuery(function($) {
        $('#preview table.code').enableCollapsibleColumns(
          $('#preview table.code thead th.content'));
      });
    </script>
    <!-- # endblock head (placeholder in theme.html) -->
  </head> 
  <body>
    <!-- # block body (content inherited from theme.html) -->
    <!--   # include 'site_header.html' (theme.html) -->
    <!--   end of site_header.html -->

    <div id="banner">
      <div id="header">
        <a id="logo"
           href="/projects/camper">
          <img  alt="camper" height="53" src="/projects/camper/chrome/../raw-attachment/wiki/WikiStart/logo.png" /></a>


      </div>
      <form id="search" action="/projects/camper/search" method="get">
        <div>
          <label for="proj-search">Search:</label>
          <input type="text" id="proj-search" name="q" size="18"
                  value="" />
          <input type="submit" value="Search" />
        </div>
      </form>
          <div id="metanav" class="nav">
      <ul><li  class="first">Logged in as: 231012</li><li ><a href="/projects/camper/logout">Logout</a></li><li ><a href="/projects/camper/prefs">Preferences</a></li><li ><a href="/projects/camper/wiki/TracGuide">Help/Guide</a></li><li  class="last"><a href="/projects/camper/about">About Trac</a></li></ul>
    </div>

    </div>
        <div id="mainnav" class="nav">
      <ul><li  class="active first"><a href="/projects/camper/wiki">Wiki</a></li><li ><a href="/projects/camper/timeline">Timeline</a></li><li ><a href="/projects/camper/roadmap">Roadmap</a></li><li ><a href="/projects/camper/report">View Tickets</a></li><li ><a href="/projects/camper/newticket">New Ticket</a></li><li ><a href="/projects/camper/search">Search</a></li><li  class="last"><a href="/projects/camper/admin">Admin</a></li></ul>
    </div>


    <div id="main"
         >
      <div id="ctxtnav" class="nav">
        <h2>Context Navigation</h2>
        <ul>
          <li  class="first last"><a href="/projects/camper/wiki/DatabaseCreation">Back to DatabaseCreation</a></li>
        </ul>
        <hr />
      </div>

      

      

      <!-- # block content (placeholder in theme.html) -->
    <div id="content" class="attachment">

      <h1><a href="/projects/camper/wiki/DatabaseCreation">DatabaseCreation</a>:
        ddl.sql</h1>
      <table id="info">
        <tr>
          <th scope="col">
File ddl.sql,             <span title="14014 bytes">13.7 KB</span>
 (added by <span class="trac-author-user">231012</span>, <a class="timeline" href="/projects/camper/timeline?from=2026-06-12T20%3A13%3A52%2B02%3A00&amp;precision=second" title="See timeline at 06/12/26 20:13:52">4 hours ago</a>)          </th>
        </tr>
        <tr>
          <td class="message searchable">
            
          </td>
        </tr>
      </table>

      <div id="preview" class="searchable">

<table class="code"><thead><tr><th class="lineno" title="Line numbers">Line</th><th class="content"> </th></tr></thead><tbody><tr><th id="L1"><a href="#L1">1</a></th><td>-- 1. User
</td></tr><tr><th id="L2"><a href="#L2">2</a></th><td>CREATE TABLE "User" (
</td></tr><tr><th id="L3"><a href="#L3">3</a></th><td>    user_id SERIAL PRIMARY KEY,
</td></tr><tr><th id="L4"><a href="#L4">4</a></th><td>    name VARCHAR(255) NOT NULL DEFAULT 'Unknown',
</td></tr><tr><th id="L5"><a href="#L5">5</a></th><td>    surname VARCHAR(255) NOT NULL DEFAULT 'Unknown',
</td></tr><tr><th id="L6"><a href="#L6">6</a></th><td>    email VARCHAR(255) UNIQUE,
</td></tr><tr><th id="L7"><a href="#L7">7</a></th><td>    telephone_num VARCHAR(20),
</td></tr><tr><th id="L8"><a href="#L8">8</a></th><td>    date_registration DATE,
</td></tr><tr><th id="L9"><a href="#L9">9</a></th><td>    type VARCHAR(10) NOT NULL,
</td></tr><tr><th id="L10"><a href="#L10">10</a></th><td>    ssn varchar(13) NOT NULL UNIQUE,
</td></tr><tr><th id="L11"><a href="#L11">11</a></th><td>    CHECK (length(trim(name)) &gt; 0 AND length(trim(surname)) &gt; 0),
</td></tr><tr><th id="L12"><a href="#L12">12</a></th><td>    CHECK (type IN ('guest', 'host')),
</td></tr><tr><th id="L13"><a href="#L13">13</a></th><td>    CHECK (date_registration &lt;= CURRENT_DATE),
</td></tr><tr><th id="L14"><a href="#L14">14</a></th><td>    CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
</td></tr><tr><th id="L15"><a href="#L15">15</a></th><td>);
</td></tr><tr><th id="L16"><a href="#L16">16</a></th><td>
</td></tr><tr><th id="L17"><a href="#L17">17</a></th><td>-- 2. Guest
</td></tr><tr><th id="L18"><a href="#L18">18</a></th><td>CREATE TABLE Guest (
</td></tr><tr><th id="L19"><a href="#L19">19</a></th><td>    UseruserId int4 PRIMARY KEY,
</td></tr><tr><th id="L20"><a href="#L20">20</a></th><td>    num_reservations int4 NOT NULL DEFAULT 0,
</td></tr><tr><th id="L21"><a href="#L21">21</a></th><td>    preference_type VARCHAR(100) NOT NULL,
</td></tr><tr><th id="L22"><a href="#L22">22</a></th><td>    FOREIGN KEY (UseruserId) REFERENCES "User"(user_id) ON DELETE CASCADE,
</td></tr><tr><th id="L23"><a href="#L23">23</a></th><td>    CHECK (num_reservations &gt;= 0)
</td></tr><tr><th id="L24"><a href="#L24">24</a></th><td>);
</td></tr><tr><th id="L25"><a href="#L25">25</a></th><td>
</td></tr><tr><th id="L26"><a href="#L26">26</a></th><td>-- 3. Host
</td></tr><tr><th id="L27"><a href="#L27">27</a></th><td>CREATE TABLE Host (
</td></tr><tr><th id="L28"><a href="#L28">28</a></th><td>    UseruserId int4 PRIMARY KEY,
</td></tr><tr><th id="L29"><a href="#L29">29</a></th><td>    IBAN VARCHAR(34) NOT NULL,
</td></tr><tr><th id="L30"><a href="#L30">30</a></th><td>    average_score int4,
</td></tr><tr><th id="L31"><a href="#L31">31</a></th><td>    is_verified VARCHAR(3) NOT NULL DEFAULT 'no',
</td></tr><tr><th id="L32"><a href="#L32">32</a></th><td>    FOREIGN KEY (UseruserId) REFERENCES "User"(user_id) ON DELETE CASCADE,
</td></tr><tr><th id="L33"><a href="#L33">33</a></th><td>    CHECK (is_verified IN ('yes', 'no')),
</td></tr><tr><th id="L34"><a href="#L34">34</a></th><td>    CHECK (average_score BETWEEN 1 AND 5 OR average_score IS NULL),
</td></tr><tr><th id="L35"><a href="#L35">35</a></th><td>    CHECK (IBAN ~ '^[A-Z]{2}[0-9]{2}[A-Z0-9]{11,30}$')
</td></tr><tr><th id="L36"><a href="#L36">36</a></th><td>);
</td></tr><tr><th id="L37"><a href="#L37">37</a></th><td>
</td></tr><tr><th id="L38"><a href="#L38">38</a></th><td>-- 4. CampType
</td></tr><tr><th id="L39"><a href="#L39">39</a></th><td>CREATE TABLE CampType (
</td></tr><tr><th id="L40"><a href="#L40">40</a></th><td>    typeId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L41"><a href="#L41">41</a></th><td>    type_name VARCHAR(100) NOT NULL UNIQUE,
</td></tr><tr><th id="L42"><a href="#L42">42</a></th><td>    description VARCHAR(255)
</td></tr><tr><th id="L43"><a href="#L43">43</a></th><td>);
</td></tr><tr><th id="L44"><a href="#L44">44</a></th><td>
</td></tr><tr><th id="L45"><a href="#L45">45</a></th><td>-- 5. CampLocation
</td></tr><tr><th id="L46"><a href="#L46">46</a></th><td>CREATE TABLE CampLocation (
</td></tr><tr><th id="L47"><a href="#L47">47</a></th><td>    campLocationId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L48"><a href="#L48">48</a></th><td>    CampTypetypeId int4 NOT NULL,
</td></tr><tr><th id="L49"><a href="#L49">49</a></th><td>    name VARCHAR(255) NOT NULL,
</td></tr><tr><th id="L50"><a href="#L50">50</a></th><td>    description varchar(255),
</td></tr><tr><th id="L51"><a href="#L51">51</a></th><td>    type VARCHAR(20) NOT NULL,
</td></tr><tr><th id="L52"><a href="#L52">52</a></th><td>    max_guests int4 NOT NULL,
</td></tr><tr><th id="L53"><a href="#L53">53</a></th><td>    min_nights_stay int4 NOT NULL,
</td></tr><tr><th id="L54"><a href="#L54">54</a></th><td>    status VARCHAR(20) NOT NULL DEFAULT 'active',
</td></tr><tr><th id="L55"><a href="#L55">55</a></th><td>    season VARCHAR(20) NOT NULL,
</td></tr><tr><th id="L56"><a href="#L56">56</a></th><td>    opening_date DATE NOT NULL,
</td></tr><tr><th id="L57"><a href="#L57">57</a></th><td>    closing_date DATE NOT NULL,
</td></tr><tr><th id="L58"><a href="#L58">58</a></th><td>    FOREIGN KEY (CampTypetypeId) REFERENCES CampType(typeId) ON DELETE CASCADE,
</td></tr><tr><th id="L59"><a href="#L59">59</a></th><td>    CHECK (closing_date &gt; opening_date),
</td></tr><tr><th id="L60"><a href="#L60">60</a></th><td>    CHECK (max_guests &gt; 0),
</td></tr><tr><th id="L61"><a href="#L61">61</a></th><td>    CHECK (min_nights_stay &gt; 0),
</td></tr><tr><th id="L62"><a href="#L62">62</a></th><td>    CHECK (status IN ('active', 'inactive', 'closed')),
</td></tr><tr><th id="L63"><a href="#L63">63</a></th><td>    CHECK (season IN ('spring', 'summer', 'autumn', 'winter', 'all')),
</td></tr><tr><th id="L64"><a href="#L64">64</a></th><td>    CHECK (type IN ('tent', 'cabin', 'bungalow')),
</td></tr><tr><th id="L65"><a href="#L65">65</a></th><td>    CHECK (length(trim(name)) &gt; 0)
</td></tr><tr><th id="L66"><a href="#L66">66</a></th><td>);
</td></tr><tr><th id="L67"><a href="#L67">67</a></th><td>
</td></tr><tr><th id="L68"><a href="#L68">68</a></th><td>-- 6. Promotion
</td></tr><tr><th id="L69"><a href="#L69">69</a></th><td>CREATE TABLE Promotion (
</td></tr><tr><th id="L70"><a href="#L70">70</a></th><td>    promotionId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L71"><a href="#L71">71</a></th><td>    HostUserUserId int4 NOT NULL,
</td></tr><tr><th id="L72"><a href="#L72">72</a></th><td>    promo_code VARCHAR(50) NOT NULL UNIQUE,
</td></tr><tr><th id="L73"><a href="#L73">73</a></th><td>    discount_percent int4 NOT NULL DEFAULT 0,
</td></tr><tr><th id="L74"><a href="#L74">74</a></th><td>    discount_amount NUMERIC(10,2) NOT NULL DEFAULT 0,
</td></tr><tr><th id="L75"><a href="#L75">75</a></th><td>    valid_from DATE NOT NULL,
</td></tr><tr><th id="L76"><a href="#L76">76</a></th><td>    valid_to DATE NOT NULL,
</td></tr><tr><th id="L77"><a href="#L77">77</a></th><td>    description varchar(255),
</td></tr><tr><th id="L78"><a href="#L78">78</a></th><td>    FOREIGN KEY (HostUserUserId) REFERENCES Host(UseruserId) ON DELETE CASCADE,
</td></tr><tr><th id="L79"><a href="#L79">79</a></th><td>        CHECK (valid_to &gt;= valid_from),
</td></tr><tr><th id="L80"><a href="#L80">80</a></th><td>    CHECK (
</td></tr><tr><th id="L81"><a href="#L81">81</a></th><td>        (discount_percent&gt;0 AND discount_amount = 0)
</td></tr><tr><th id="L82"><a href="#L82">82</a></th><td>        OR
</td></tr><tr><th id="L83"><a href="#L83">83</a></th><td>        (discount_amount&gt;0 AND discount_percent = 0)
</td></tr><tr><th id="L84"><a href="#L84">84</a></th><td>    ),
</td></tr><tr><th id="L85"><a href="#L85">85</a></th><td>    CHECK (discount_percent BETWEEN 0 AND 100),
</td></tr><tr><th id="L86"><a href="#L86">86</a></th><td>    CHECK (discount_amount &gt;= 0)
</td></tr><tr><th id="L87"><a href="#L87">87</a></th><td>);
</td></tr><tr><th id="L88"><a href="#L88">88</a></th><td>
</td></tr><tr><th id="L89"><a href="#L89">89</a></th><td>CREATE EXTENSION IF NOT EXISTS btree_gist;
</td></tr><tr><th id="L90"><a href="#L90">90</a></th><td>-- 7. Reservation
</td></tr><tr><th id="L91"><a href="#L91">91</a></th><td>CREATE TABLE Reservation (
</td></tr><tr><th id="L92"><a href="#L92">92</a></th><td>    reservationId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L93"><a href="#L93">93</a></th><td>    GuestUseruserId int4,
</td></tr><tr><th id="L94"><a href="#L94">94</a></th><td>    PromotionpromotionId int4,
</td></tr><tr><th id="L95"><a href="#L95">95</a></th><td>    CampLocationcamplocationId int4 NOT NULL,
</td></tr><tr><th id="L96"><a href="#L96">96</a></th><td>    number_of_guests int4 NOT NULL,
</td></tr><tr><th id="L97"><a href="#L97">97</a></th><td>    reservation_status VARCHAR(20) NOT NULL DEFAULT 'pending',
</td></tr><tr><th id="L98"><a href="#L98">98</a></th><td>    check_in_date DATE NOT NULL,
</td></tr><tr><th id="L99"><a href="#L99">99</a></th><td>    check_out_date DATE NOT NULL,
</td></tr><tr><th id="L100"><a href="#L100">100</a></th><td>    created_at DATE NOT NULL DEFAULT CURRENT_DATE,
</td></tr><tr><th id="L101"><a href="#L101">101</a></th><td>    total_price NUMERIC(12,2) NOT NULL,
</td></tr><tr><th id="L102"><a href="#L102">102</a></th><td>    FOREIGN KEY (GuestUseruserId) REFERENCES Guest(UseruserId) ON DELETE SET NULL,
</td></tr><tr><th id="L103"><a href="#L103">103</a></th><td>    FOREIGN KEY (PromotionpromotionId) REFERENCES Promotion(promotionId) ON DELETE SET NULL,
</td></tr><tr><th id="L104"><a href="#L104">104</a></th><td>    FOREIGN KEY (CampLocationcamplocationId) REFERENCES CampLocation(campLocationId) ON DELETE RESTRICT,
</td></tr><tr><th id="L105"><a href="#L105">105</a></th><td>    CHECK (number_of_guests &gt; 0),
</td></tr><tr><th id="L106"><a href="#L106">106</a></th><td>    CHECK (total_price &gt;= 0),
</td></tr><tr><th id="L107"><a href="#L107">107</a></th><td>    CHECK (reservation_status IN ('pending', 'confirmed', 'cancelled', 'completed')),
</td></tr><tr><th id="L108"><a href="#L108">108</a></th><td>    CHECK (check_out_date &gt; check_in_date),
</td></tr><tr><th id="L109"><a href="#L109">109</a></th><td>    CHECK (created_at &lt;= check_in_date),
</td></tr><tr><th id="L110"><a href="#L110">110</a></th><td>    EXCLUDE USING gist (
</td></tr><tr><th id="L111"><a href="#L111">111</a></th><td>        CampLocationcamplocationId WITH =,
</td></tr><tr><th id="L112"><a href="#L112">112</a></th><td>        daterange(check_in_date, check_out_date, '[]') WITH &amp;&amp;
</td></tr><tr><th id="L113"><a href="#L113">113</a></th><td>    )
</td></tr><tr><th id="L114"><a href="#L114">114</a></th><td>);
</td></tr><tr><th id="L115"><a href="#L115">115</a></th><td>
</td></tr><tr><th id="L116"><a href="#L116">116</a></th><td>-- 8. Payment
</td></tr><tr><th id="L117"><a href="#L117">117</a></th><td>CREATE TABLE Payment (
</td></tr><tr><th id="L118"><a href="#L118">118</a></th><td>    paymentId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L119"><a href="#L119">119</a></th><td>    ReservationreservationId int4 NOT NULL,
</td></tr><tr><th id="L120"><a href="#L120">120</a></th><td>    amount NUMERIC(12,2) NOT NULL,
</td></tr><tr><th id="L121"><a href="#L121">121</a></th><td>    payment_method VARCHAR(20) NOT NULL,
</td></tr><tr><th id="L122"><a href="#L122">122</a></th><td>    payment_date DATE NOT NULL,
</td></tr><tr><th id="L123"><a href="#L123">123</a></th><td>    transaction_reference VARCHAR(50),
</td></tr><tr><th id="L124"><a href="#L124">124</a></th><td>    payment_status VARCHAR(30) NOT NULL,
</td></tr><tr><th id="L125"><a href="#L125">125</a></th><td>    FOREIGN KEY (ReservationreservationId) REFERENCES Reservation(reservationId) ON DELETE RESTRICT,
</td></tr><tr><th id="L126"><a href="#L126">126</a></th><td>    CHECK (amount &gt; 0),
</td></tr><tr><th id="L127"><a href="#L127">127</a></th><td>    CHECK (payment_method IN ('online','cash')),
</td></tr><tr><th id="L128"><a href="#L128">128</a></th><td>    CHECK (payment_status IN ('pending','completed','failed','refunded','partially_refunded')),
</td></tr><tr><th id="L129"><a href="#L129">129</a></th><td>    CHECK (payment_date &lt;= CURRENT_DATE)
</td></tr><tr><th id="L130"><a href="#L130">130</a></th><td>);
</td></tr><tr><th id="L131"><a href="#L131">131</a></th><td>
</td></tr><tr><th id="L132"><a href="#L132">132</a></th><td>-- 9. ReservationStatus
</td></tr><tr><th id="L133"><a href="#L133">133</a></th><td>CREATE TABLE ReservationStatus (
</td></tr><tr><th id="L134"><a href="#L134">134</a></th><td>    statusReservationId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L135"><a href="#L135">135</a></th><td>    ReservationreservationId int4 NOT NULL,
</td></tr><tr><th id="L136"><a href="#L136">136</a></th><td>    refund_amount NUMERIC(12,2) NOT NULL DEFAULT 0,
</td></tr><tr><th id="L137"><a href="#L137">137</a></th><td>    cancellation_date DATE,
</td></tr><tr><th id="L138"><a href="#L138">138</a></th><td>    FOREIGN KEY (ReservationreservationId) REFERENCES Reservation(reservationId) ON DELETE RESTRICT,
</td></tr><tr><th id="L139"><a href="#L139">139</a></th><td>    CHECK (refund_amount &gt;= 0),
</td></tr><tr><th id="L140"><a href="#L140">140</a></th><td>    CHECK (cancellation_date IS NULL OR cancellation_date &lt;= CURRENT_DATE)
</td></tr><tr><th id="L141"><a href="#L141">141</a></th><td>);
</td></tr><tr><th id="L142"><a href="#L142">142</a></th><td>
</td></tr><tr><th id="L143"><a href="#L143">143</a></th><td>-- 10. Activity
</td></tr><tr><th id="L144"><a href="#L144">144</a></th><td>CREATE TABLE Activity (
</td></tr><tr><th id="L145"><a href="#L145">145</a></th><td>    activity_id SERIAL PRIMARY KEY,
</td></tr><tr><th id="L146"><a href="#L146">146</a></th><td>    location_id int4 NOT NULL,
</td></tr><tr><th id="L147"><a href="#L147">147</a></th><td>    name VARCHAR(255) NOT NULL,
</td></tr><tr><th id="L148"><a href="#L148">148</a></th><td>    description varchar(255),
</td></tr><tr><th id="L149"><a href="#L149">149</a></th><td>    price_per_person int4 NOT NULL,
</td></tr><tr><th id="L150"><a href="#L150">150</a></th><td>    max_participants int4 NOT NULL,
</td></tr><tr><th id="L151"><a href="#L151">151</a></th><td>    duration_hours int4 NOT NULL,
</td></tr><tr><th id="L152"><a href="#L152">152</a></th><td>    difficulty_level int4,
</td></tr><tr><th id="L153"><a href="#L153">153</a></th><td>    equipment_provided varchar(255),
</td></tr><tr><th id="L154"><a href="#L154">154</a></th><td>    CHECK (price_per_person &gt;= 0),
</td></tr><tr><th id="L155"><a href="#L155">155</a></th><td>    CHECK (max_participants &gt; 0),
</td></tr><tr><th id="L156"><a href="#L156">156</a></th><td>    CHECK (duration_hours &gt; 0),
</td></tr><tr><th id="L157"><a href="#L157">157</a></th><td>    CHECK (difficulty_level BETWEEN 1 AND 5 OR difficulty_level IS NULL)
</td></tr><tr><th id="L158"><a href="#L158">158</a></th><td>);
</td></tr><tr><th id="L159"><a href="#L159">159</a></th><td>
</td></tr><tr><th id="L160"><a href="#L160">160</a></th><td>-- 11. ReservationActivity
</td></tr><tr><th id="L161"><a href="#L161">161</a></th><td>CREATE TABLE ReservationActivity (
</td></tr><tr><th id="L162"><a href="#L162">162</a></th><td>    ReservationActivityId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L163"><a href="#L163">163</a></th><td>    Activityactivity_id int4 NOT NULL,
</td></tr><tr><th id="L164"><a href="#L164">164</a></th><td>    ReservationreservationId int4 NOT NULL,
</td></tr><tr><th id="L165"><a href="#L165">165</a></th><td>    number_of_participants int4 NOT NULL,
</td></tr><tr><th id="L166"><a href="#L166">166</a></th><td>    total_price_for_activity NUMERIC(12,2) NOT NULL,
</td></tr><tr><th id="L167"><a href="#L167">167</a></th><td>    status VARCHAR(20),
</td></tr><tr><th id="L168"><a href="#L168">168</a></th><td>    booking_date DATE NOT NULL,
</td></tr><tr><th id="L169"><a href="#L169">169</a></th><td>    FOREIGN KEY (Activityactivity_id) REFERENCES Activity(activity_id) ON DELETE RESTRICT,
</td></tr><tr><th id="L170"><a href="#L170">170</a></th><td>    FOREIGN KEY (ReservationreservationId) REFERENCES Reservation(reservationId) ON DELETE RESTRICT,
</td></tr><tr><th id="L171"><a href="#L171">171</a></th><td>    CHECK (number_of_participants &gt; 0),
</td></tr><tr><th id="L172"><a href="#L172">172</a></th><td>    CHECK (status IN ('booked','completed','cancelled')),
</td></tr><tr><th id="L173"><a href="#L173">173</a></th><td>    CHECK (booking_date &lt;= CURRENT_DATE)
</td></tr><tr><th id="L174"><a href="#L174">174</a></th><td>);
</td></tr><tr><th id="L175"><a href="#L175">175</a></th><td>
</td></tr><tr><th id="L176"><a href="#L176">176</a></th><td>-- 12. ActivityReview
</td></tr><tr><th id="L177"><a href="#L177">177</a></th><td>CREATE TABLE ActivityReview (
</td></tr><tr><th id="L178"><a href="#L178">178</a></th><td>    activityReviewId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L179"><a href="#L179">179</a></th><td>    GuestUseruserId int4,
</td></tr><tr><th id="L180"><a href="#L180">180</a></th><td>    Activityactivity_id int4 NOT NULL,
</td></tr><tr><th id="L181"><a href="#L181">181</a></th><td>    rating int4 NOT NULL,
</td></tr><tr><th id="L182"><a href="#L182">182</a></th><td>    comment varchar(255),
</td></tr><tr><th id="L183"><a href="#L183">183</a></th><td>    review_date DATE NOT NULL DEFAULT CURRENT_DATE,
</td></tr><tr><th id="L184"><a href="#L184">184</a></th><td>    FOREIGN KEY (GuestUseruserId) REFERENCES Guest(UseruserId) ON DELETE SET NULL,
</td></tr><tr><th id="L185"><a href="#L185">185</a></th><td>    FOREIGN KEY (Activityactivity_id) REFERENCES Activity(activity_id) ON DELETE CASCADE,
</td></tr><tr><th id="L186"><a href="#L186">186</a></th><td>    CHECK (rating BETWEEN 1 AND 5),
</td></tr><tr><th id="L187"><a href="#L187">187</a></th><td>    CHECK (review_date &lt;= CURRENT_DATE)
</td></tr><tr><th id="L188"><a href="#L188">188</a></th><td>);
</td></tr><tr><th id="L189"><a href="#L189">189</a></th><td>
</td></tr><tr><th id="L190"><a href="#L190">190</a></th><td>-- 13. Review
</td></tr><tr><th id="L191"><a href="#L191">191</a></th><td>CREATE TABLE Review (
</td></tr><tr><th id="L192"><a href="#L192">192</a></th><td>    reviewId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L193"><a href="#L193">193</a></th><td>    CampLocationcampLocationId int4 NOT NULL,
</td></tr><tr><th id="L194"><a href="#L194">194</a></th><td>    GuestUseruserId int4,
</td></tr><tr><th id="L195"><a href="#L195">195</a></th><td>    review_date DATE NOT NULL DEFAULT CURRENT_DATE,
</td></tr><tr><th id="L196"><a href="#L196">196</a></th><td>    comment varchar(255),
</td></tr><tr><th id="L197"><a href="#L197">197</a></th><td>    rating int4,
</td></tr><tr><th id="L198"><a href="#L198">198</a></th><td>    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE CASCADE,
</td></tr><tr><th id="L199"><a href="#L199">199</a></th><td>    FOREIGN KEY (GuestUseruserId) REFERENCES Guest(UseruserId) ON DELETE SET NULL,
</td></tr><tr><th id="L200"><a href="#L200">200</a></th><td>    CHECK (rating BETWEEN 1 AND 5),
</td></tr><tr><th id="L201"><a href="#L201">201</a></th><td>    CHECK (review_date &lt;= CURRENT_DATE)
</td></tr><tr><th id="L202"><a href="#L202">202</a></th><td>);
</td></tr><tr><th id="L203"><a href="#L203">203</a></th><td>
</td></tr><tr><th id="L204"><a href="#L204">204</a></th><td>-- 14. EquipmentType
</td></tr><tr><th id="L205"><a href="#L205">205</a></th><td>CREATE TABLE EquipmentType (
</td></tr><tr><th id="L206"><a href="#L206">206</a></th><td>    EquipmentTypeId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L207"><a href="#L207">207</a></th><td>    type_name VARCHAR(100) NOT NULL UNIQUE,
</td></tr><tr><th id="L208"><a href="#L208">208</a></th><td>    description VARCHAR(255)
</td></tr><tr><th id="L209"><a href="#L209">209</a></th><td>);
</td></tr><tr><th id="L210"><a href="#L210">210</a></th><td>
</td></tr><tr><th id="L211"><a href="#L211">211</a></th><td>-- 15. Equipment
</td></tr><tr><th id="L212"><a href="#L212">212</a></th><td>CREATE TABLE Equipment (
</td></tr><tr><th id="L213"><a href="#L213">213</a></th><td>    equipmentId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L214"><a href="#L214">214</a></th><td>    EquipmentTypeEquipmentTypeId int4 NOT NULL,
</td></tr><tr><th id="L215"><a href="#L215">215</a></th><td>    CampLocationcampLocationId int4,
</td></tr><tr><th id="L216"><a href="#L216">216</a></th><td>    name VARCHAR(255) NOT NULL,
</td></tr><tr><th id="L217"><a href="#L217">217</a></th><td>    description varchar(255),
</td></tr><tr><th id="L218"><a href="#L218">218</a></th><td>    total_quantity int4 NOT NULL,
</td></tr><tr><th id="L219"><a href="#L219">219</a></th><td>    available_quantity int4 NOT NULL,
</td></tr><tr><th id="L220"><a href="#L220">220</a></th><td>    rental_price_per_day NUMERIC(10,2) NOT NULL,
</td></tr><tr><th id="L221"><a href="#L221">221</a></th><td>    deposit_amount NUMERIC(10,2) NOT NULL DEFAULT 0,
</td></tr><tr><th id="L222"><a href="#L222">222</a></th><td>    condition_status VARCHAR(20),
</td></tr><tr><th id="L223"><a href="#L223">223</a></th><td>    is_available VARCHAR(3) NOT NULL DEFAULT 'yes',
</td></tr><tr><th id="L224"><a href="#L224">224</a></th><td>    FOREIGN KEY (EquipmentTypeEquipmentTypeId) REFERENCES EquipmentType(EquipmentTypeId) ON DELETE CASCADE,
</td></tr><tr><th id="L225"><a href="#L225">225</a></th><td>    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE SET NULL,
</td></tr><tr><th id="L226"><a href="#L226">226</a></th><td>    CHECK (available_quantity &lt;= total_quantity),
</td></tr><tr><th id="L227"><a href="#L227">227</a></th><td>    CHECK (total_quantity &gt; 0 AND available_quantity &gt;= 0),
</td></tr><tr><th id="L228"><a href="#L228">228</a></th><td>    CHECK (condition_status IN ('new','good','fair','poor','under_repair')),
</td></tr><tr><th id="L229"><a href="#L229">229</a></th><td>    CHECK (is_available IN ('yes','no')),
</td></tr><tr><th id="L230"><a href="#L230">230</a></th><td>    CHECK (deposit_amount &gt;= 0)
</td></tr><tr><th id="L231"><a href="#L231">231</a></th><td>);
</td></tr><tr><th id="L232"><a href="#L232">232</a></th><td>
</td></tr><tr><th id="L233"><a href="#L233">233</a></th><td>-- 16. EquipmentRental
</td></tr><tr><th id="L234"><a href="#L234">234</a></th><td>CREATE TABLE EquipmentRental (
</td></tr><tr><th id="L235"><a href="#L235">235</a></th><td>    equipmentRentalId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L236"><a href="#L236">236</a></th><td>    EquipmentequipmentId int4 NOT NULL DEFAULT 0,
</td></tr><tr><th id="L237"><a href="#L237">237</a></th><td>    ReservationreservationId int4,
</td></tr><tr><th id="L238"><a href="#L238">238</a></th><td>    quantity int4 NOT NULL,
</td></tr><tr><th id="L239"><a href="#L239">239</a></th><td>    start_date DATE NOT NULL,
</td></tr><tr><th id="L240"><a href="#L240">240</a></th><td>    end_date DATE NOT NULL,
</td></tr><tr><th id="L241"><a href="#L241">241</a></th><td>    total_price NUMERIC(12,2) NOT NULL,
</td></tr><tr><th id="L242"><a href="#L242">242</a></th><td>    deposit_paid NUMERIC(12,2) NOT NULL,
</td></tr><tr><th id="L243"><a href="#L243">243</a></th><td>    status VARCHAR(20) NOT NULL ,
</td></tr><tr><th id="L244"><a href="#L244">244</a></th><td>    FOREIGN KEY (EquipmentequipmentId) REFERENCES Equipment(equipmentId) ON DELETE SET DEFAULT,
</td></tr><tr><th id="L245"><a href="#L245">245</a></th><td>    FOREIGN KEY (ReservationreservationId) REFERENCES Reservation(reservationId) ON DELETE RESTRICT,
</td></tr><tr><th id="L246"><a href="#L246">246</a></th><td>    CHECK (quantity &gt; 0),
</td></tr><tr><th id="L247"><a href="#L247">247</a></th><td>    CHECK (end_date &gt; start_date),
</td></tr><tr><th id="L248"><a href="#L248">248</a></th><td>    CHECK (status IN ('active','returned','overdue','cancelled','damaged')),
</td></tr><tr><th id="L249"><a href="#L249">249</a></th><td>    CHECK (deposit_paid &gt;= 0),
</td></tr><tr><th id="L250"><a href="#L250">250</a></th><td>    CHECK (total_price &gt;= 0)
</td></tr><tr><th id="L251"><a href="#L251">251</a></th><td>);
</td></tr><tr><th id="L252"><a href="#L252">252</a></th><td>
</td></tr><tr><th id="L253"><a href="#L253">253</a></th><td>-- 17. Service
</td></tr><tr><th id="L254"><a href="#L254">254</a></th><td>CREATE TABLE Service (
</td></tr><tr><th id="L255"><a href="#L255">255</a></th><td>    serviceId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L256"><a href="#L256">256</a></th><td>    service_name VARCHAR(100) NOT NULL,
</td></tr><tr><th id="L257"><a href="#L257">257</a></th><td>    description varchar(255),
</td></tr><tr><th id="L258"><a href="#L258">258</a></th><td>    additional_fee NUMERIC(10,2) NOT NULL
</td></tr><tr><th id="L259"><a href="#L259">259</a></th><td>);
</td></tr><tr><th id="L260"><a href="#L260">260</a></th><td>
</td></tr><tr><th id="L261"><a href="#L261">261</a></th><td>-- 18. Availability
</td></tr><tr><th id="L262"><a href="#L262">262</a></th><td>CREATE TABLE Availability (
</td></tr><tr><th id="L263"><a href="#L263">263</a></th><td>    availabilityId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L264"><a href="#L264">264</a></th><td>    available_from_date DATE NOT NULL,
</td></tr><tr><th id="L265"><a href="#L265">265</a></th><td>    available_to_date DATE NOT NULL,
</td></tr><tr><th id="L266"><a href="#L266">266</a></th><td>    status VARCHAR(20) NOT NULL,
</td></tr><tr><th id="L267"><a href="#L267">267</a></th><td>    CHECK (available_to_date &gt;= available_from_date)
</td></tr><tr><th id="L268"><a href="#L268">268</a></th><td>);
</td></tr><tr><th id="L269"><a href="#L269">269</a></th><td>
</td></tr><tr><th id="L270"><a href="#L270">270</a></th><td>-- 19. EmergencyContact
</td></tr><tr><th id="L271"><a href="#L271">271</a></th><td>CREATE TABLE EmergencyContact (
</td></tr><tr><th id="L272"><a href="#L272">272</a></th><td>    emergencyContactId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L273"><a href="#L273">273</a></th><td>    CampLocationcampLocationId int4 NOT NULL,
</td></tr><tr><th id="L274"><a href="#L274">274</a></th><td>    contact_name VARCHAR(255) NOT NULL,
</td></tr><tr><th id="L275"><a href="#L275">275</a></th><td>    phone_number VARCHAR(20) NOT NULL,
</td></tr><tr><th id="L276"><a href="#L276">276</a></th><td>    created_at DATE NOT NULL,
</td></tr><tr><th id="L277"><a href="#L277">277</a></th><td>    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE CASCADE
</td></tr><tr><th id="L278"><a href="#L278">278</a></th><td>);
</td></tr><tr><th id="L279"><a href="#L279">279</a></th><td>
</td></tr><tr><th id="L280"><a href="#L280">280</a></th><td>-- 20. PriceHistory
</td></tr><tr><th id="L281"><a href="#L281">281</a></th><td>CREATE TABLE PriceHistory (
</td></tr><tr><th id="L282"><a href="#L282">282</a></th><td>    priceHistoryId SERIAL PRIMARY KEY,
</td></tr><tr><th id="L283"><a href="#L283">283</a></th><td>    CampLocationcampLocationId int4,
</td></tr><tr><th id="L284"><a href="#L284">284</a></th><td>    price_per_night NUMERIC(12,2) NOT NULL,
</td></tr><tr><th id="L285"><a href="#L285">285</a></th><td>    date_from DATE NOT NULL,
</td></tr><tr><th id="L286"><a href="#L286">286</a></th><td>    date_to DATE NOT NULL,
</td></tr><tr><th id="L287"><a href="#L287">287</a></th><td>    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE SET NULL,
</td></tr><tr><th id="L288"><a href="#L288">288</a></th><td>    CHECK (date_to &gt;= date_from),
</td></tr><tr><th id="L289"><a href="#L289">289</a></th><td>    CHECK (price_per_night&gt;=0)
</td></tr><tr><th id="L290"><a href="#L290">290</a></th><td>);
</td></tr><tr><th id="L291"><a href="#L291">291</a></th><td>
</td></tr><tr><th id="L292"><a href="#L292">292</a></th><td>-- 21. Message
</td></tr><tr><th id="L293"><a href="#L293">293</a></th><td>CREATE TABLE "Message" (
</td></tr><tr><th id="L294"><a href="#L294">294</a></th><td>    messageId SERIAL NOT NULL,
</td></tr><tr><th id="L295"><a href="#L295">295</a></th><td>    UseruserId int4 NOT NULL DEFAULT 0,
</td></tr><tr><th id="L296"><a href="#L296">296</a></th><td>    senderId int4 NOT NULL,
</td></tr><tr><th id="L297"><a href="#L297">297</a></th><td>    receiverId int4 NOT NULL,
</td></tr><tr><th id="L298"><a href="#L298">298</a></th><td>    content varchar(1500) NOT NULL,
</td></tr><tr><th id="L299"><a href="#L299">299</a></th><td>    sent_time time(7) NOT NULL,
</td></tr><tr><th id="L300"><a href="#L300">300</a></th><td>    PRIMARY KEY (messageId),
</td></tr><tr><th id="L301"><a href="#L301">301</a></th><td>    FOREIGN KEY (UseruserId) REFERENCES "User"(user_id) ON DELETE SET DEFAULT,
</td></tr><tr><th id="L302"><a href="#L302">302</a></th><td>    CHECK (senderId != receiverId),
</td></tr><tr><th id="L303"><a href="#L303">303</a></th><td>    CHECK (length(trim(content)) &gt; 0)
</td></tr><tr><th id="L304"><a href="#L304">304</a></th><td>);
</td></tr><tr><th id="L305"><a href="#L305">305</a></th><td>
</td></tr><tr><th id="L306"><a href="#L306">306</a></th><td>
</td></tr><tr><th id="L307"><a href="#L307">307</a></th><td>-- 22. CampLocation - Host
</td></tr><tr><th id="L308"><a href="#L308">308</a></th><td>CREATE TABLE Host_Host (
</td></tr><tr><th id="L309"><a href="#L309">309</a></th><td>    CampLocationcampLocationId int4 NOT NULL,
</td></tr><tr><th id="L310"><a href="#L310">310</a></th><td>    HostUseruserid int4 NOT NULL,
</td></tr><tr><th id="L311"><a href="#L311">311</a></th><td>    PRIMARY KEY (CampLocationcampLocationId, HostUseruserid),
</td></tr><tr><th id="L312"><a href="#L312">312</a></th><td>    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE CASCADE,
</td></tr><tr><th id="L313"><a href="#L313">313</a></th><td>    FOREIGN KEY (HostUseruserid) REFERENCES Host(UseruserId) ON DELETE CASCADE
</td></tr><tr><th id="L314"><a href="#L314">314</a></th><td>);
</td></tr><tr><th id="L315"><a href="#L315">315</a></th><td>
</td></tr><tr><th id="L316"><a href="#L316">316</a></th><td>-- 23. CampLocation - Service
</td></tr><tr><th id="L317"><a href="#L317">317</a></th><td>CREATE TABLE camp_location_service (
</td></tr><tr><th id="L318"><a href="#L318">318</a></th><td>    ServiceserviceId int4 NOT NULL,
</td></tr><tr><th id="L319"><a href="#L319">319</a></th><td>    CampLocationcampLocationId int4 NOT NULL,
</td></tr><tr><th id="L320"><a href="#L320">320</a></th><td>    PRIMARY KEY (ServiceserviceId, CampLocationcampLocationId),
</td></tr><tr><th id="L321"><a href="#L321">321</a></th><td>    FOREIGN KEY (ServiceserviceId) REFERENCES Service(serviceId) ON DELETE CASCADE,
</td></tr><tr><th id="L322"><a href="#L322">322</a></th><td>    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE CASCADE
</td></tr><tr><th id="L323"><a href="#L323">323</a></th><td>);
</td></tr><tr><th id="L324"><a href="#L324">324</a></th><td>
</td></tr><tr><th id="L325"><a href="#L325">325</a></th><td>-- 24. Activity - CampLocation
</td></tr><tr><th id="L326"><a href="#L326">326</a></th><td>CREATE TABLE Activity_Activity (
</td></tr><tr><th id="L327"><a href="#L327">327</a></th><td>    Activityactivity_id2 int4 NOT NULL,
</td></tr><tr><th id="L328"><a href="#L328">328</a></th><td>    CampLocationcampLocationId int4 NOT NULL,
</td></tr><tr><th id="L329"><a href="#L329">329</a></th><td>    PRIMARY KEY (Activityactivity_id2, CampLocationcampLocationId),
</td></tr><tr><th id="L330"><a href="#L330">330</a></th><td>    FOREIGN KEY (Activityactivity_id2) REFERENCES Activity(activity_id) ON DELETE CASCADE,
</td></tr><tr><th id="L331"><a href="#L331">331</a></th><td>    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE CASCADE
</td></tr><tr><th id="L332"><a href="#L332">332</a></th><td>);
</td></tr><tr><th id="L333"><a href="#L333">333</a></th><td>
</td></tr><tr><th id="L334"><a href="#L334">334</a></th><td>-- 25. Guest Favorites
</td></tr><tr><th id="L335"><a href="#L335">335</a></th><td>CREATE TABLE Favorites (
</td></tr><tr><th id="L336"><a href="#L336">336</a></th><td>    favorite_id SERIAL PRIMARY KEY,
</td></tr><tr><th id="L337"><a href="#L337">337</a></th><td>    locationId int4 NOT NULL,
</td></tr><tr><th id="L338"><a href="#L338">338</a></th><td>    date_added DATE NOT NULL DEFAULT CURRENT_DATE
</td></tr><tr><th id="L339"><a href="#L339">339</a></th><td>
</td></tr><tr><th id="L340"><a href="#L340">340</a></th><td>);
</td></tr><tr><th id="L341"><a href="#L341">341</a></th><td>
</td></tr><tr><th id="L342"><a href="#L342">342</a></th><td>-- 26. Favorites_Guest_saves (old style - kept for compatibility if needed)
</td></tr><tr><th id="L343"><a href="#L343">343</a></th><td>CREATE TABLE Favorites_Guest_saves (
</td></tr><tr><th id="L344"><a href="#L344">344</a></th><td>    FavoritesfavoriteId int4 NOT NULL,
</td></tr><tr><th id="L345"><a href="#L345">345</a></th><td>    GuestUseruserId int4 NOT NULL,
</td></tr><tr><th id="L346"><a href="#L346">346</a></th><td>    PRIMARY KEY (FavoritesfavoriteId, GuestUseruserId),
</td></tr><tr><th id="L347"><a href="#L347">347</a></th><td>    FOREIGN KEY (FavoritesfavoriteId) REFERENCES Favorites(favorite_id) ON DELETE CASCADE,
</td></tr><tr><th id="L348"><a href="#L348">348</a></th><td>    FOREIGN KEY (GuestUseruserId) REFERENCES Guest(UseruserId) ON DELETE CASCADE
</td></tr><tr><th id="L349"><a href="#L349">349</a></th><td>);
</td></tr><tr><th id="L350"><a href="#L350">350</a></th><td>
</td></tr><tr><th id="L351"><a href="#L351">351</a></th><td>-- 27. User_Message_receiver
</td></tr><tr><th id="L352"><a href="#L352">352</a></th><td>CREATE TABLE user_message_receiver (
</td></tr><tr><th id="L353"><a href="#L353">353</a></th><td>    UseruserId int4 NOT NULL,
</td></tr><tr><th id="L354"><a href="#L354">354</a></th><td>    MessagemessageId int4 NOT NULL,
</td></tr><tr><th id="L355"><a href="#L355">355</a></th><td>    PRIMARY KEY (UseruserId, MessagemessageId),
</td></tr><tr><th id="L356"><a href="#L356">356</a></th><td>    FOREIGN KEY (UseruserId) REFERENCES "User"(user_id) ON DELETE CASCADE,
</td></tr><tr><th id="L357"><a href="#L357">357</a></th><td>    FOREIGN KEY (MessagemessageId) REFERENCES "Message"(messageId) ON DELETE CASCADE
</td></tr><tr><th id="L358"><a href="#L358">358</a></th><td>);
</td></tr><tr><th id="L359"><a href="#L359">359</a></th><td>
</td></tr><tr><th id="L360"><a href="#L360">360</a></th><td>
</td></tr><tr><th id="L361"><a href="#L361">361</a></th><td>--28.Availability_CampLocation_has
</td></tr><tr><th id="L362"><a href="#L362">362</a></th><td>CREATE TABLE Availability_CampLocation_has (
</td></tr><tr><th id="L363"><a href="#L363">363</a></th><td>    AvailabilityavailabilityId int4 NOT NULL,
</td></tr><tr><th id="L364"><a href="#L364">364</a></th><td>    CampLocationcampLocationId int4 NOT NULL,
</td></tr><tr><th id="L365"><a href="#L365">365</a></th><td>    PRIMARY KEY (AvailabilityavailabilityId, CampLocationcampLocationId),
</td></tr><tr><th id="L366"><a href="#L366">366</a></th><td>    FOREIGN KEY (AvailabilityavailabilityId) REFERENCES Availability(availabilityId) ON DELETE CASCADE,
</td></tr><tr><th id="L367"><a href="#L367">367</a></th><td>    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE CASCADE
</td></tr><tr><th id="L368"><a href="#L368">368</a></th><td>);
</td></tr><tr><th id="L369"><a href="#L369">369</a></th><td>
</td></tr><tr><th id="L370"><a href="#L370">370</a></th><td>ALTER TABLE "User"
</td></tr><tr><th id="L371"><a href="#L371">371</a></th><td>ADD CONSTRAINT ssn_length_check
</td></tr><tr><th id="L372"><a href="#L372">372</a></th><td>CHECK (length(ssn) = 13);
</td></tr><tr><th id="L373"><a href="#L373">373</a></th><td>
</td></tr><tr><th id="L374"><a href="#L374">374</a></th><td>ALTER TABLE Favorites
</td></tr><tr><th id="L375"><a href="#L375">375</a></th><td>ADD CONSTRAINT fk_favorites_camp
</td></tr><tr><th id="L376"><a href="#L376">376</a></th><td>FOREIGN KEY (locationId)
</td></tr><tr><th id="L377"><a href="#L377">377</a></th><td>REFERENCES CampLocation(campLocationId)
</td></tr><tr><th id="L378"><a href="#L378">378</a></th><td>ON DELETE CASCADE;</td></tr></tbody></table>

      </div>
      <div class="buttons">
        <form method="get" action="/projects/camper/attachment/wiki/DatabaseCreation/ddl.sql">
          <div id="delete">             <input type="hidden" name="action" value="delete" />
            <input type="submit" value="Delete attachment" />
          </div>
        </form>
      </div>
    </div>
        <!-- # block content (content inherited from layout.html) -->
    <script type="text/javascript">
      jQuery("body").addClass("trac-has-js");
    </script>
    <div id="altlinks">
      <h3>Download in other formats:</h3>
      <ul>
        <li class="first last">
          <a rel="nofollow" href="/projects/camper/raw-attachment/wiki/DatabaseCreation/ddl.sql"
              class="">
            Original Format</a>
        </li>
      </ul>
    </div>
    <!-- # endblock content (content inherited from layout.html) -->

      <!-- # endblock content (placeholder in theme.html) -->
    </div>

    <div id="footer"><hr/>
      <a id="tracpowered" href="https://trac.edgewall.org/"
         ><img src="/projects/camper/chrome/common/trac_logo_mini.png" height="30"
               width="107" alt="Trac Powered"/></a>
      <p class="left">
Powered by         <a href="/projects/camper/about"><strong>Trac 1.6</strong></a>
        <br />
 By         <a href="http://www.edgewall.org/">Edgewall Software</a>
.      </p>
      <p class="right">Visit the Trac open source project at<br /><a href="https://trac.edgewall.org/">https://trac.edgewall.org/</a></p>
    </div>
    <!--   # include 'site_footer.html' (theme.html) -->
    <!--   end of site_footer.html -->
    <!-- # endblock body (content inherited from theme.html) -->
  </body> </html>